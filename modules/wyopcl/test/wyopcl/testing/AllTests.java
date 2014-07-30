package wyopcl.testing;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

import wyopcl.testing.testcase.A.*;
import wyopcl.testing.testcase.B.*;
import wyopcl.testing.testcase.C.*;
import wyopcl.testing.testcase.D.*;
import wyopcl.testing.testcase.E.*;
import wyopcl.testing.testcase.F.*;
import wyopcl.testing.testcase.H.*;
import wyopcl.testing.testcase.I.*;
import wyopcl.testing.testcase.L.*;
import wyopcl.testing.testcase.M.*;
import wyopcl.testing.testcase.N.*;
import wyopcl.testing.testcase.O.*;
import wyopcl.testing.testcase.P.*;
import wyopcl.testing.testcase.Q.*;
import wyopcl.testing.testcase.R.*;
import wyopcl.testing.testcase.S.*;
import wyopcl.testing.testcase.T.*;
import wyopcl.testing.testcase.U.*;
import wyopcl.testing.testcase.V.*;
import wyopcl.testing.testcase.W.*;


@RunWith(Suite.class)
@SuiteClasses({
	//A
	AccessTestCase.class,
	AssumeTestCase.class,
	//B
	BoolTestCase.class,
	ByteTestCase.class,
	//C
	CastTestCase.class,
	CharTestCase.class,
	CoercionTestCase.class,
	ComplexTestCase.class,
	ConstantTestCase.class,
	ConstrainedTestCase.class,
	ContractiveTestCase.class,
	//D
	DecimalAssignmentTestCase.class,
	DefineTestCase.class,
	DictionaryTestCase.class,
	DoWhileTestCase.class,
	//E
	EffectiveListTestCase.class,
	EnsuresTestCase.class,
	//F
	ForTestCase.class,
	FunctionTestCase.class,
	//H
	HexAssignTestCase.class,
	//I
	IfElseTestCase.class,
	ImportTestCase.class,
	IntersectionTestCase.class,
	IntTestCase.class,
	//L
	LambdaTestCase.class,
	LengthOfTestCase.class,
	ListTestCase.class,
	//M
	MessageTestCase.class,
	MethodTestCase.class,
	//N
	NegationTestCase.class,
	//O
	OpenRecordTestCase.class,
	//P
	PrintTestCase.class,
	ProcessTestCase.class,
	//Q
	QuantifiersTestCase.class,
	//R
	RangeTestCase.class,
	RealTestCase.class,
	RecordTestCase.class,
	RecursiveTestCase.class,
	ReferenceTestCase.class,
	RemainderTestCase.class,
	RequiresTestCase.class,
	ResolutionTestCase.class,
	//S
	SetTestCase.class,
	SingleLineCommentTestCase.class,
	SkipTestCase.class,
	StringTestCase.class,
	SubTypeTestCase.class,
	SwitchTestCase.class,
	SyntaxTestCase.class,
	//T
	TryCatchTestCase.class,
	TupleTestCase.class,
	TypeEqualsTestCase.class,
	//U
	UnionTestCase.class,
	UpdateTestCase.class,
	//V
	VarTestCase.class,
	//W
	WhileTestCase.class
})
public class AllTests {

}
