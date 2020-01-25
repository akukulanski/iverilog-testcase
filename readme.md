
## Testcase for Icarus Verilog bug from version 10.2

* HDL file: `top.v`

* Test file: `test/test.py`

* Build dockers for v10.1 and v10.2: `make build-dockers`

* Run test with IVerilog 10.1: `make run-10.1`
    test_a PASSES
    test_b PASSES

* Run test with IVerilog 10.2: `make run-10.2`
    test_a FAILS
    test_b PASSES


*test_a*:

Start to read inmediately after first RisingEdge. In v10.2 the output value `x` is undefined.


*test_b*:

Start to read after two RisingEdges. Works.


