import whiley.lang.System
/* The example is referred to the below paper
@inproceedings{ermedahl2007loop,
  title={Loop bound analysis based on a combination of program slicing, abstract interpretation, and invariant analysis},
  author={Ermedahl, Andreas and Sandberg, Christer and Gustafsson, Jan and Bygde, Stefan and Lisper, Bj{\"o}rn},
  booktitle={OASIcs-OpenAccess Series in Informatics},
  volume={6},
  year={2007},
  organization={Schloss Dagstuhl-Leibniz-Zentrum f{\"u}r Informatik}
}
*/
function foo(int INPUT) -> int
requires INPUT <= 1000000:
    int i=0
    int OUTPUT=0
    while i<INPUT where i >=0:
        // Increment by 2
        OUTPUT = OUTPUT + 2
        i = i + 1
    return OUTPUT
    
method main(System.Console sys):
    int input = 10
    input = 20 // input = [10 ... 20]
    int a = foo(input)
    sys.out.println(a)
    assert a == 40

