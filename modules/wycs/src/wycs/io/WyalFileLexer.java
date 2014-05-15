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

package wycs.io;

import java.io.*;

import wycc.io.AbstractLexer;
import wycc.io.Token;

public class WyalFileLexer extends AbstractLexer {		
	
	public WyalFileLexer(InputStream instream) throws IOException {
		super(lexingRules,new InputStreamReader(instream,"UTF-8"));		
	}
	
	public static final java.lang.String[] keywords = {
		"import",
		"assert",
		"function",
		"define",
		"where",
		"null",
		"true",
		"false",
		"any",
		"int",
		"bool",
		"real",
		"string",		
		"void",
		"forall",
		"exists",
		"some",		
		"in",
		"as",
		"case",
		"not"
	};
	
	public static final java.lang.String[] operators = {
		"<==>",
		"==>",
		"&&",
		"||",
		"..",
		"==",
		"=>",
		">=",
		"<=",
		"!=",
		"++",
		":=",
		".",
		",",
		"+",
		"-",
		"*",
		"/",
		"%",
		"!",
		"=",
		"&",
		"|",
		":",
		";",
		"(",
		")",
		"<",
		">",
		"{",
		"}",
		"[",
		"]",
		Token.sUC_FORALL,
		Token.sUC_EXISTS,
		Token.sUC_EMPTYSET,
		Token.sUC_SUBSET,
		Token.sUC_SUBSETEQ,
		Token.sUC_SUPSET,
		Token.sUC_SUPSETEQ,
		Token.sUC_SETUNION,
		Token.sUC_SETINTERSECTION,
		Token.sUC_LESSEQUALS,
		Token.sUC_GREATEREQUALS,
		Token.sUC_ELEMENTOF,
		Token.sUC_LOGICALAND,
		Token.sUC_LOGICALOR	
	};
	
	private static final Rule[] lexingRules = {
		new LineCommentRule("//"),
		new BlockCommentRule("/*","*/"),
		new KeywordRule(keywords),
		new OperatorRule(operators),
		new IdentifierRule(),
		new WhitespaceRule(),
		new StringRule(),
		new DecimalRule()
	};
}
