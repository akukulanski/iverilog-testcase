
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


Now...... if I change the logic from:
```verilog
reg x;

always @* begin
    x = 1'h0;
    casez (y )
      1'h0:
          x = 1'h1;
      1'h1:
          x = 1'h0;
    endcase
end
```

To: (equivalent!)
```verilog
wire x;

assign x = (y == 1'h0) ?
           1'h1 : 1'h0;
```

It works and both test PASS with **both versions**.
