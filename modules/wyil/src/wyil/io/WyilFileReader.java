// Copyright (c) 2011, David J. Pearce (djp@ecs.vuw.ac.nz)
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//    * Redistributions of source code must retain the above copyright
//      notice, this list of conditions and the following disclaimer.
//    * Redistributions in binary form must reproduce the above copyright
//      notice, this list of conditions and the following disclaimer in the
//      documentation and/or other materials provided with the distribution.
//    * Neither the name of the <organization> nor the
//      names of its contributors may be used to endorse or promote products
//      derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL DAVID J. PEARCE BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

package wyil.io;

import java.io.*;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.*;

import wycc.lang.NameID;
import wycc.util.Pair;
import wycc.util.Triple;
import wyfs.io.BinaryInputStream;
import wyfs.lang.Path;
import wyfs.util.Trie;
import wyil.lang.*;
import wyil.util.AttributedCodeBlock;

/**
 * Read a binary WYIL file from a byte stream and convert into the corresponding
 * WyilFile object.
 *
 * @author David J. Pearce
 *
 */
public final class WyilFileReader {
	private static final char[] magic = { 'W', 'Y', 'I', 'L', 'F', 'I', 'L',
			'E' };

	private final BinaryInputStream input;
	private String[] stringPool;
	private Path.ID[] pathPool;
	private NameID[] namePool;
	private Constant[] constantPool;
	private Type[] typePool;

	public WyilFileReader(String filename) throws IOException {
		this.input = new BinaryInputStream(new FileInputStream(filename));
	}

	public WyilFileReader(InputStream input) throws IOException {
		this.input = new BinaryInputStream(input);
	}

	public void close() throws IOException {
		input.close();
	}

	public WyilFile read() throws IOException {

		for (int i = 0; i != 8; ++i) {
			char c = (char) input.read_u8();
			if (magic[i] != c) {
				throw new IllegalArgumentException("invalid magic number");
			}
		}

		// head blocker
		int kind = input.read_uv();
		int size = input.read_uv();
		input.pad_u8();

		if (kind != WyilFileWriter.BLOCK_Header) {
			throw new IllegalArgumentException("header block must come first");
		}

		int majorVersion = input.read_uv();
		int minorVersion = input.read_uv();

		int stringPoolCount = input.read_uv();
		int pathPoolCount = input.read_uv();
		int namePoolCount = input.read_uv();
		int typePoolCount = input.read_uv();
		int constantPoolCount = input.read_uv();

		int numBlocks = input.read_uv();

		readStringPool(stringPoolCount);
		readPathPool(pathPoolCount);
		readNamePool(namePoolCount);
		readTypePool(typePoolCount);
		readConstantPool(constantPoolCount);

		input.pad_u8();

		return readModule();
	}

	private void readStringPool(int count) throws IOException {
		final String[] myStringPool = new String[count];

		for (int i = 0; i != count; ++i) {
			int length = input.read_uv();
			try {
				byte[] data = new byte[length];
				input.read(data);
				String str = new String(data, 0, length, "UTF-8");
				myStringPool[i] = str;
			} catch (UnsupportedEncodingException e) {
				throw new RuntimeException("UTF-8 Charset not supported?");
			}
		}
		stringPool = myStringPool;
	}

	private void readPathPool(int count) throws IOException {
		final Path.ID[] myPathPool = new Path.ID[count];
		myPathPool[0] = Trie.ROOT;

		for (int i = 1; i != count; ++i) {
			int parent = input.read_uv();
			int stringIndex = input.read_uv();
			Path.ID id;
			id = myPathPool[parent];
			id = id.append(stringPool[stringIndex]);
			myPathPool[i] = id;
		}
		pathPool = myPathPool;
	}

	private void readNamePool(int count) throws IOException {
		final NameID[] myNamePool = new NameID[count];

		for (int i = 0; i != count; ++i) {
			// int kind = input.read_uv();
			int pathIndex = input.read_uv();
			int nameIndex = input.read_uv();
			Path.ID id = pathPool[pathIndex];
			String name = stringPool[nameIndex];
			myNamePool[i] = new NameID(id, name);
		}

		namePool = myNamePool;
	}

	private void readConstantPool(int count) throws IOException {
		final Constant[] myConstantPool = new Constant[count];

		for (int i = 0; i != count; ++i) {
			int code = input.read_uv();
			Constant constant;

			switch (code) {
			case WyilFileWriter.CONSTANT_Null:
				constant = Constant.V_NULL;
				break;
			case WyilFileWriter.CONSTANT_False:
				constant = Constant.V_BOOL(false);
				break;
			case WyilFileWriter.CONSTANT_True:
				constant = Constant.V_BOOL(true);
				break;
			case WyilFileWriter.CONSTANT_Byte: {
				byte val = (byte) input.read_u8();
				constant = Constant.V_BYTE(val);
				break;
			}
			case WyilFileWriter.CONSTANT_Int: {
				int len = input.read_uv();
				byte[] bytes = new byte[len];
				input.read(bytes);
				BigInteger bi = new BigInteger(bytes);
				constant = Constant.V_INTEGER(bi);
				break;
			}
			case WyilFileWriter.CONSTANT_List: {
				int len = input.read_uv();
				ArrayList<Constant> values = new ArrayList<Constant>();
				for (int j = 0; j != len; ++j) {
					int index = input.read_uv();
					values.add(myConstantPool[index]);
				}
				constant = Constant.V_ARRAY(values);
				break;
			}
			case WyilFileWriter.CONSTANT_Record: {
				int len = input.read_uv();
				HashMap<String, Constant> tvs = new HashMap<String, Constant>();
				for (int j = 0; j != len; ++j) {
					int fieldIndex = input.read_uv();
					int constantIndex = input.read_uv();
					String str = stringPool[fieldIndex];
					tvs.put(str, myConstantPool[constantIndex]);
				}
				constant = Constant.V_RECORD(tvs);
				break;
			}
			case WyilFileWriter.CONSTANT_Function:
			case WyilFileWriter.CONSTANT_Method: {
				int typeIndex = input.read_uv();
				int nameIndex = input.read_uv();
				Type.FunctionOrMethod t = (Type.FunctionOrMethod) typePool[typeIndex];
				NameID name = namePool[nameIndex];
				constant = Constant.V_LAMBDA(name, t);
				break;
			}
			default:
				throw new RuntimeException(
						"Unknown constant encountered in WhileyDefine: " + code);
			}
			myConstantPool[i] = constant;
		}

		constantPool = myConstantPool;
	}

	private void readTypePool(int count) throws IOException {
		final Type[] myTypePool = new Type[count];
		Type.BinaryReader bin = new Type.BinaryReader(input);
		for (int i = 0; i != count; ++i) {
			Type t = bin.readType();
			myTypePool[i] = t;
		}

		typePool = myTypePool;
	}

	private WyilFile readModule() throws IOException {
		int kind = input.read_uv(); // block identifier
		int size = input.read_uv();
		input.pad_u8();

		int pathIdx = input.read_uv();
		int modifiers = input.read_uv(); // unused
		int numBlocks = input.read_uv();

		input.pad_u8();

		List<WyilFile.Block> declarations = new ArrayList<WyilFile.Block>();
		for (int i = 0; i != numBlocks; ++i) {
			declarations.add(readModuleBlock());
		}

		return new WyilFile(pathPool[pathIdx], "unknown.whiley", declarations);
	}

	private WyilFile.Block readModuleBlock() throws IOException {
		int kind = input.read_uv();
		int size = input.read_uv();
		input.pad_u8();

		switch (kind) {
		case WyilFileWriter.BLOCK_Constant:
			return readConstantBlock();
		case WyilFileWriter.BLOCK_Type:
			return readTypeBlock();
		case WyilFileWriter.BLOCK_Function:
			return readFunctionBlock();
		case WyilFileWriter.BLOCK_Method:
			return readMethodBlock();
		default:
			throw new RuntimeException("unknown module block encountered ("
					+ kind + ")");
		}
	}

	private WyilFile.Constant readConstantBlock() throws IOException {
		int nameIdx = input.read_uv();
		// System.out.println("=== CONSTANT " + stringPool.get(nameIdx));
		int modifiers = input.read_uv();
		int constantIdx = input.read_uv();
		int nBlocks = input.read_uv(); // unused

		input.pad_u8();
		return new WyilFile.Constant(generateModifiers(modifiers),
				stringPool[nameIdx], constantPool[constantIdx]);
	}

	private WyilFile.Type readTypeBlock() throws IOException {
		int nameIdx = input.read_uv();
		// System.out.println("=== TYPE " + stringPool.get(nameIdx));
		int modifiers = input.read_uv();
		int typeIdx = input.read_uv();
		int nBlocks = input.read_uv();

		input.pad_u8();

		AttributedCodeBlock invariant = null;
		for (int i = 0; i != nBlocks; ++i) {
			int kind = input.read_uv();
			int size = input.read_uv();
			input.pad_u8();
			switch (kind) {
			case WyilFileWriter.BLOCK_Constraint:
				invariant = readAttributedCodeBlock(1);
				break;
			default:
				throw new RuntimeException("Unknown type block encountered");
			}
		}

		return new WyilFile.Type(generateModifiers(modifiers),
				stringPool[nameIdx], typePool[typeIdx], invariant);
	}

	private WyilFile.FunctionOrMethod readFunctionBlock()
			throws IOException {
		int nameIdx = input.read_uv();
		int modifiers = input.read_uv();
		int typeIdx = input.read_uv();

		input.pad_u8();

		Type.Function type = (Type.Function) typePool[typeIdx];

		Triple<List<AttributedCodeBlock>, List<AttributedCodeBlock>, AttributedCodeBlock> bodies = readFunctionOrMethodBlocks(type);

		return new WyilFile.FunctionOrMethod(generateModifiers(modifiers),
				stringPool[nameIdx], type, bodies.third(), bodies.first(),
				bodies.second());
	}

	private WyilFile.FunctionOrMethod readMethodBlock() throws IOException {
		int nameIdx = input.read_uv();
		// System.out.println("=== METHOD " + stringPool[nameIdx]);
		int modifiers = input.read_uv();
		int typeIdx = input.read_uv();

		input.pad_u8();

		Type.Method type = (Type.Method) typePool[typeIdx];

		Triple<List<AttributedCodeBlock>, List<AttributedCodeBlock>, AttributedCodeBlock> bodies = readFunctionOrMethodBlocks(type);

		return new WyilFile.FunctionOrMethod(generateModifiers(modifiers),
				stringPool[nameIdx], type, bodies.third(), bodies.first(),
				bodies.second());
	}

	private Collection<Modifier> generateModifiers(int modifiers) {
		ArrayList<Modifier> mods = new ArrayList<Modifier>();

		// first, protection modifiers
		switch (modifiers & WyilFileWriter.MODIFIER_PROTECTION_MASK) {
		case WyilFileWriter.MODIFIER_Public:
			mods.add(Modifier.PUBLIC);
			break;
		case WyilFileWriter.MODIFIER_Private:
			mods.add(Modifier.PRIVATE);
			break;
		default:
			throw new RuntimeException("Unknown modifier");
		}

		// second, mangle modifiers
		switch (modifiers & WyilFileWriter.MODIFIER_MANGLE_MASK) {
		case WyilFileWriter.MODIFIER_Native:
			mods.add(Modifier.NATIVE);
			break;
		case WyilFileWriter.MODIFIER_Export:
			mods.add(Modifier.EXPORT);
			break;
		}

		return mods;
	}

	private Triple<List<AttributedCodeBlock>, List<AttributedCodeBlock>, AttributedCodeBlock> readFunctionOrMethodBlocks(
			Type.FunctionOrMethod type) throws IOException {
		ArrayList<AttributedCodeBlock> requires = new ArrayList<>();
		ArrayList<AttributedCodeBlock> ensures = new ArrayList<>();
		AttributedCodeBlock body = null;
		int numInputs = type.params().size();
		int nBlocks = input.read_uv();

		input.pad_u8();

		for (int i = 0; i != nBlocks; ++i) {
			int kind = input.read_uv();
			int size = input.read_uv();
			input.pad_u8();

			switch (kind) {
			case WyilFileWriter.BLOCK_Precondition:
				requires.add(readAttributedCodeBlock(numInputs));
				break;
			case WyilFileWriter.BLOCK_Postcondition:
				ensures.add(readAttributedCodeBlock(numInputs + 1));
				break;
			case WyilFileWriter.BLOCK_Body:
				body = readAttributedCodeBlock(numInputs);
				break;
			default:
				throw new RuntimeException("Unknown case block encountered");
			}
		}

		return new Triple(requires, ensures, body);
	}

	private AttributedCodeBlock readAttributedCodeBlock(int numInputs)
			throws IOException {
		int nCodes = input.read_uv();
		HashMap<Integer, Codes.Label> labels = new HashMap<Integer, Codes.Label>();
		ArrayList<Code> bytecodes = readCodeBlock(0, nCodes, labels);
		insertLabels(0,bytecodes,labels);

		input.pad_u8(); // necessary

		return new AttributedCodeBlock(bytecodes);
	}

	/**
	 * This function is responsible for inserting labels into the correct
	 * positions within arbitrarily nested code blocks. Every label is given an
	 * offset within the flat bytecode array, as stored on disk. The challenge
	 * here is that, having loaded it from disk, the bytecode array is nested
	 * rather than flat. This is because certain bytecodes contain blocks of
	 * nested bytecodes (e.g. loop bytecode). Therefore, we need to track the
	 * offset within the flat bytecode array against that of the now nested
	 * bytecode structure.
	 *
	 * @param offset
	 *            The current offset within the flat bytecode array.
	 * @param bytecodes
	 *            The list of bytecodes we are inserting into.
	 * @param labels
	 *            The map of offsets to labels being inserted.
	 * @return
	 */
	private int insertLabels(int offset, ArrayList<Code> bytecodes,
			HashMap<Integer, Codes.Label> labels) {
		for (int i = 0; i != bytecodes.size(); ++i) {
			Code bytecode = bytecodes.get(i);

			// First, check whether there is a label to insert
			Codes.Label label = labels.get(offset++);
			if (label != null) { bytecodes.add(i++, label); }

			// Second, check whether we have a nested block which needs to be
			// explored.
			if (bytecode instanceof Code.Compound) {
				Code.Compound block = (Code.Compound) bytecode;
				// At this point, we must clone the given bytecode
				ArrayList<Code> blkBytecodes = new ArrayList<Code>(block.bytecodes());
				offset = 1 + insertLabels(offset, blkBytecodes, labels);
				bytecodes.set(i,updateBytecodes(block,blkBytecodes));
			}
		}

		// Finally, check whether or not there is a label at the end of this
		// block.
		Codes.Label label = labels.get(offset);
		if (label != null) { bytecodes.add(bytecodes.size(), label); }

		// Done
		return offset;
	}

	/**
	 * This method reconstructs a given compound bytecode with a new list of
	 * bytecodes representing its body.
	 *
	 * @param compound
	 *            The compound bytecode being updated.
	 * @param bytecodes
	 *            The list of new bytecodes representing its body. This list may
	 *            be identical to its current body.
	 * @return
	 */
	private Code.Compound updateBytecodes(Code.Compound compound, ArrayList<Code> bytecodes) {
		if (compound instanceof Codes.Quantify) {
			Codes.Quantify l = (Codes.Quantify) compound;
			return Codes.Quantify(l.startOperand, l.endOperand, l.indexOperand,
					l.modifiedOperands, bytecodes);
		} else if(compound instanceof Codes.Loop) {
			Codes.Loop l = (Codes.Loop) compound;
			return Codes.Loop(l.modifiedOperands, bytecodes);
		} else if(compound instanceof Codes.Invariant) {
			return Codes.Invariant(bytecodes);
		} else if(compound instanceof Codes.Assert) {
			return Codes.Assert(bytecodes);
		} else if(compound instanceof Codes.Assume) {
			return Codes.Assume(bytecodes);
		} else {
			throw new IllegalArgumentException("Unknown compound bytecode encountered: " + compound.getClass().getName());
		}
	}

	/**
	 * Read all bytecodes between two given offsets.
	 *
	 * @param offset
	 *            Starting offset to read from
	 * @param count
	 *            Count of bytecodes to read
	 * @param labels
	 * @return
	 */
	public ArrayList<Code> readCodeBlock(int offset, int count,
			HashMap<Integer, Codes.Label> labels) throws IOException {
		ArrayList<Code> bytecodes = new ArrayList<Code>();
		for (int i = 0; i < count; ++i) {
			Code code = readCode(offset, labels);
			bytecodes.add(code);
			offset = offset + sizeof(code);
		}
		return bytecodes;
	}

	/**
	 * Return the "size" of this bytecode. That is, number of bytecodes in the
	 * binary format it represents. In most cases, each bytecode in the binary
	 * format corresponds to exactly one in the object representation. However,
	 * in the case of compound bytecodes (e.g. loop, forall, etc) then it
	 * represents one plus the number contained within the block itself.
	 *
	 * @param code
	 * @return
	 */
	public static int sizeof(Code code) {
		if(code instanceof Codes.Label) {
			// Observe, this case is not possible in WyilFileReader, but is
			// possible in WyilFileWriter (where this function is also called
			// from).
			return 0;
		} else if (code instanceof Code.Unit) {
			return 1;
		} else {
			Code.Compound compound = (Code.Compound) code;
			// The size of a compound includes 1 for the header bytecode, and 1
			// for the virtual bytecode appearing at the block end.
			int size = 2;
			for (int i = 0; i != compound.size(); ++i) {
				size += sizeof(compound.get(i));
			}
			return size;
		}
	}

	private Code readCode(int offset, HashMap<Integer, Codes.Label> labels)
			throws IOException {
		int opcode = input.read_u8();
		boolean wideBase = false;
		boolean wideRest = false;

		// deal with wide bytecodes first
		switch (opcode) {
		case Code.OPCODE_wide:
			opcode = input.read_u8();
			wideBase = true;
			break;
		case Code.OPCODE_widerest:
			opcode = input.read_u8();
			wideRest = true;
			break;
		case Code.OPCODE_widewide:
			opcode = input.read_u8();
			wideBase = true;
			wideRest = true;
			break;
		}

		int fmt = (opcode & Code.FMT_MASK);

		switch (fmt) {
		case Code.FMT_NARYOP:
			return readNaryOp(opcode, wideBase, wideRest, offset, labels);
		case Code.FMT_EMPTY:
		case Code.FMT_UNARYOP:
		case Code.FMT_BINARYOP:
		case Code.FMT_UNARYASSIGN:
		case Code.FMT_BINARYASSIGN:
		case Code.FMT_NARYASSIGN:
			return readNaryAssign(opcode, wideBase, wideRest, offset, labels);				
		case Code.FMT_OTHER:
			return readOther(opcode, wideBase, wideRest, offset, labels);
		default:
			throw new RuntimeException("unknown opcode encountered (" + opcode
					+ ")");
		}
	}

	private Code readNaryOp(int opcode, boolean wideBase, boolean wideRest,
			int offset, HashMap<Integer, Codes.Label> labels)
			throws IOException {
		int nOperands = readBase(wideBase);
		int[] operands = new int[nOperands];
		for (int i = 0; i != nOperands; ++i) {
			operands[i] = readBase(wideBase);
		}

		// Special case which doesn't have a type.
		if (opcode == Code.OPCODE_loop) {			
			int count = readRest(wideRest);
			ArrayList<Code> bytecodes = readCodeBlock(offset + 1, count, labels);
			return Codes.Loop(operands, bytecodes);
		} else if(opcode == Code.OPCODE_quantify) {
			int count = readRest(wideRest);
			int indexOperand = operands[0];
			int startOperand = operands[1];
			int endOperand = operands[2];
			operands = Arrays.copyOfRange(operands, 3, operands.length);
			ArrayList<Code> bytecodes = readCodeBlock(offset + 1, count, labels);			
			return Codes.Quantify(startOperand, endOperand, indexOperand,
					operands, bytecodes);
		}

		throw new RuntimeException("unknown opcode encountered (" + opcode
				+ ")");
	}

	private Code readNaryAssign(int opcode, boolean wideBase, boolean wideRest, int offset,
			HashMap<Integer, Codes.Label> labels) throws IOException {
		int nTargets = readBase(wideBase);
		int nOperands = readBase(wideBase);
		int nTypes = readBase(wideBase);		
		int[] targets = new int[nTargets];
		int[] operands = new int[nOperands];
		Type[] types = new Type[nTypes];		
		for (int i = 0; i != nTargets; ++i) {
			targets[i] = readBase(wideBase);
		}		
		for (int i = 0; i != nOperands; ++i) {
			operands[i] = readBase(wideBase);
		}				
		for (int i = 0; i != nTypes; ++i) {
			int typeIndex = readBase(wideBase); 
			types[i] = typePool[typeIndex];
		}
		switch (opcode) {
		case Code.OPCODE_return:
			return Codes.Return(types, operands);
		case Code.OPCODE_indirectinvokefn:
		case Code.OPCODE_indirectinvokemd: {			
			if (!(types[0] instanceof Type.FunctionOrMethod)) {
				throw new RuntimeException("expected function or method type");
			}
			int operand = operands[0];
			operands = Arrays.copyOfRange(operands, 1, operands.length);
			return Codes.IndirectInvoke((Type.FunctionOrMethod) types[0], targets,
					operand, operands);
		}
		case Code.OPCODE_invokefn:
		case Code.OPCODE_invokemd: { 
			if (!(types[0] instanceof Type.FunctionOrMethod)) {
				throw new RuntimeException("expected function or method type");
			}
			int nameIdx = readRest(wideRest);
			NameID nid = namePool[nameIdx];
			return Codes.Invoke((Type.FunctionOrMethod) types[0], targets, operands,
					nid);
		}
		case Code.OPCODE_lambdafn:
		case Code.OPCODE_lambdamd: {
			if (!(types[0] instanceof Type.FunctionOrMethod)) {
				throw new RuntimeException("expected function or method type");
			} else if(targets.length != 1) {
				throw new RuntimeException("expected exactly one target");
			}			
			int nameIdx = readRest(wideRest);
			NameID nid = namePool[nameIdx];
			for(int i=0;i!=operands.length;++i) {
				operands[i] -= 1;
			}
			return Codes.Lambda((Type.FunctionOrMethod) types[0], targets[0], operands,
					nid);
		}
		case Code.OPCODE_newrecord: {
			if (!(types[0] instanceof Type.Record)) {
				throw new RuntimeException("expected record type");
			} else if(targets.length != 1) {
				throw new RuntimeException("expected exactly one target");
			}
			return Codes.NewRecord((Type.Record) types[0], targets[0], operands);
		}
		case Code.OPCODE_newlist: {
			if (!(types[0] instanceof Type.Array)) {
				throw new RuntimeException("expected array type");
			} else if(targets.length != 1) {
				throw new RuntimeException("expected exactly one target");
			}
			return Codes.NewArray((Type.Array) types[0], targets[0], operands);
		}
		// Unary assignables
		case Code.OPCODE_convert: {
			int i = readRest(wideRest);
			Type t = typePool[i];
			return Codes.Convert(types[0], targets[0], operands[0], t);
		}
		case Code.OPCODE_assign:
			return Codes.Assign(types[0], targets[0], operands[0]);
		case Code.OPCODE_dereference: {
			if (!(types[0] instanceof Type.Reference)) {
				throw new RuntimeException("expected reference type");
			}
			return Codes.Dereference((Type.Reference) types[0], targets[0], operands[0]);
		}
		case Code.OPCODE_fieldload: {
			if (!(types[0] instanceof Type.EffectiveRecord)) {
				throw new RuntimeException("expected record type");
			}
			int i = readRest(wideRest);
			String field = stringPool[i];
			return Codes.FieldLoad((Type.EffectiveRecord) types[0], targets[0],
					operands[0], field);
		}
		case Code.OPCODE_invert:
			return Codes.Invert(types[0], targets[0], operands[0]);
		case Code.OPCODE_newobject: {
			if (!(types[0] instanceof Type.Reference)) {
				throw new RuntimeException("expected reference type");
			}
			return Codes.NewObject((Type.Reference) types[0], targets[0], operands[0]);
		}
		case Code.OPCODE_lengthof: {
			if (!(types[0] instanceof Type.EffectiveArray)) {
				throw new RuntimeException("expected collection type");
			}
			return Codes.LengthOf((Type.EffectiveArray) types[0], targets[0], operands[0]);
		}
		case Code.OPCODE_move:
			return Codes.Move(types[0], targets[0], operands[0]);
		case Code.OPCODE_neg:
			return Codes.UnaryOperator(types[0], targets[0], operands[0], Codes.UnaryOperatorKind.NEG);
		case Code.OPCODE_not: {
			if (!(types[0] instanceof Type.Bool)) {
				throw new RuntimeException("expected bool type");
			}
			return Codes.Not(targets[0], operands[0]);
		}
		// Binary Assignables
		case Code.OPCODE_indexof: {
			if (!(types[0] instanceof Type.EffectiveArray)) {
				throw new RuntimeException("expecting indexible type");
			}
			return Codes.IndexOf((Type.EffectiveArray) types[0], targets[0], operands[0], operands[1]);
		}
		case Code.OPCODE_listgen: {
			if (!(types[0] instanceof Type.Array)) {
				throw new RuntimeException("expecting list type");
			}
			return Codes.ArrayGenerator((Type.Array) types[0], targets[0], operands[0], operands[1]);
		}
		case Code.OPCODE_add:
		case Code.OPCODE_sub:
		case Code.OPCODE_mul:
		case Code.OPCODE_div:
		case Code.OPCODE_rem:
		case Code.OPCODE_bitwiseor:
		case Code.OPCODE_bitwisexor:
		case Code.OPCODE_bitwiseand:
		case Code.OPCODE_lshr:
		case Code.OPCODE_rshr: {
			Codes.BinaryOperatorKind kind = Codes.BinaryOperatorKind.values()[opcode - Code.OPCODE_add];
			return Codes.BinaryOperator(types[0], targets[0], operands[0], operands[1], kind);
		}
		case Code.OPCODE_const: {			
			int idx = readRest(wideRest);
			Constant c = constantPool[idx];
			return Codes.Const(targets[0], c);
		}
		// Unary operations
		case Code.OPCODE_debug:
			return Codes.Debug(operands[0]);
		case Code.OPCODE_ifis: {
			int resultIdx = readRest(wideRest);
			Type result = typePool[resultIdx];
			int target = readTarget(wideRest, offset);
			Codes.Label l = findLabel(target, labels);
			return Codes.IfIs(types[0], operands[0], result, l.label);
		}
		case Code.OPCODE_switch: {
			ArrayList<Pair<Constant, String>> cases = new ArrayList<Pair<Constant, String>>();
			int target = readTarget(wideRest, offset);
			Codes.Label defaultLabel = findLabel(target, labels);
			int nCases = readRest(wideRest);
			for (int i = 0; i != nCases; ++i) {
				int constIdx = readRest(wideRest);
				Constant constant = constantPool[constIdx];
				target = readTarget(wideRest, offset);
				Codes.Label l = findLabel(target, labels);
				cases.add(new Pair<Constant, String>(constant, l.label));
			}
			return Codes.Switch(types[0], operands[0], defaultLabel.label, cases);
		}
		// Binary operators
		case Code.OPCODE_ifeq:
		case Code.OPCODE_ifne:
		case Code.OPCODE_iflt:
		case Code.OPCODE_ifle:
		case Code.OPCODE_ifgt:
		case Code.OPCODE_ifge:
		case Code.OPCODE_ifel:
		case Code.OPCODE_ifss:
		case Code.OPCODE_ifse: {
			int target = readTarget(wideRest, offset);
			Codes.Label l = findLabel(target, labels);
			Codes.Comparator cop = Codes.Comparator.values()[opcode - Code.OPCODE_ifeq];
			return Codes.If(types[0], operands[0], operands[1], cop, l.label);
		}
		// Empty bytecodes
		case Code.OPCODE_fail: {
			return Codes.Fail();
		}
		case Code.OPCODE_goto: {
			int target = readTarget(wideRest, offset);
			Codes.Label lab = findLabel(target, labels);
			return Codes.Goto(lab.label);
		}
		case Code.OPCODE_nop:
			return Codes.Nop;
		}		
		throw new RuntimeException("unknown opcode encountered (" + opcode
				+ ")");
	}

	private Code readOther(int opcode, boolean wideBase, boolean wideRest,
			int offset, HashMap<Integer, Codes.Label> labels)
			throws IOException {
		switch (opcode) {
		case Code.OPCODE_update: {			
			int nTargets = readBase(wideBase);
			int nOperands = readBase(wideBase);
			int nTypes = readBase(wideBase);			
			int[] targets = new int[nTargets];
			int[] operands = new int[nOperands-1];
			Type[] types = new Type[nTypes];			
			for (int i = 0; i != targets.length; ++i) {
				targets[i] = readBase(wideBase);
			}
			for (int i = 0; i != operands.length; ++i) {
				operands[i] = readBase(wideBase);
			}
			int operand = readBase(wideBase);
			for (int i = 0; i != types.length; ++i) {
				types[i] = typePool[readBase(wideBase)];
			}			
			Type afterType = typePool[readRest(wideRest)];
			int nFields = readRest(wideRest);
			ArrayList<String> fields = new ArrayList<String>();
			for (int i = 0; i != nFields; ++i) {
				String field = stringPool[readRest(wideRest)];
				fields.add(field);
			}
			return Codes.Update(types[0], targets[0], operands, operand,
					afterType, fields);
		}
		case Code.OPCODE_assertblock: {
			int count = readRest(wideRest);
			ArrayList<Code> bytecodes = readCodeBlock(offset + 1, count, labels);
			return Codes.Assert(bytecodes);
		}
		case Code.OPCODE_assumeblock: {
			int count = readRest(wideRest);
			ArrayList<Code> bytecodes = readCodeBlock(offset + 1, count, labels);
			return Codes.Assume(bytecodes);
		}
		case Code.OPCODE_invariantblock: {
			int count = readRest(wideRest);
			ArrayList<Code> bytecodes = readCodeBlock(offset + 1, count, labels);
			return Codes.Invariant(bytecodes);
		}
		}
		throw new RuntimeException("unknown opcode encountered (" + opcode
				+ ")");
	}

	private int readBase(boolean wide) throws IOException {
		if (wide) {
			return input.read_uv();
		} else {
			return input.read_un(4);
		}
	}

	private int readRest(boolean wide) throws IOException {
		if (wide) {
			return input.read_uv();
		} else {
			return input.read_u8();
		}
	}

	private int readTarget(boolean wide, int offset) throws IOException {
		if (wide) {
			return input.read_uv();
		} else {
			return (input.read_u8() + offset) - 128;
		}
	}

	private static int labelCount = 0;

	private static Codes.Label findLabel(int target,
			HashMap<Integer, Codes.Label> labels) {
		Codes.Label label = labels.get(target);
		if (label == null) {
			label = Codes.Label("label" + labelCount++);
			labels.put(target, label);
		}
		return label;
	}
}
