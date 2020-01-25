import cocotb
from cocotb.triggers import RisingEdge, FallingEdge, Edge
from cocotb.clock import Clock

CLK_PERIOD_BASE = 10

@cocotb.test()
def test_a(dut):

    dut.clk <= 0
    
    cocotb.fork(Clock(dut.clk, 10, 'ns').start())

    for _ in range(20):
        yield RisingEdge(dut.clk)
        val = dut.x.value.integer

@cocotb.test()
def test_b(dut):

    dut.clk <= 0
    
    cocotb.fork(Clock(dut.clk, 10, 'ns').start())

    yield RisingEdge(dut.clk)

    for _ in range(20):
        yield RisingEdge(dut.clk)
        val = dut.x.value.integer