module testbench;

reg clk;
reg we;

reg [1:0] write_addr;
reg [7:0] write_data;

reg [7:0] instruction;

wire [3:0] opcode;
wire [1:0] rd;
wire [1:0] rs;

wire [3:0] alu_op;
wire reg_write;
wire mem_read;
wire mem_write;

wire [7:0] read_data1;
wire [7:0] read_data2;

wire [7:0] alu_result;


// Decoder
decoder dec(
    .instruction(instruction),
    .opcode(opcode),
    .rd(rd),
    .rs(rs)
);


// Control Unit
control_unit cu(
    .opcode(opcode),
    .alu_op(alu_op),
    .reg_write(reg_write),
    .mem_read(mem_read),
    .mem_write(mem_write)
);


// Register File
register_file rf(
    .clk(clk),
    .we(we),
    .write_addr(write_addr),
    .write_data(write_data),

    .read_addr1(rd),
    .read_addr2(rs),

    .read_data1(read_data1),
    .read_data2(read_data2)
);


// ALU
alu myalu(
    .a(read_data1),
    .b(read_data2),
    .opcode(alu_op),
    .result(alu_result)
);


// Clock
always #5 clk = ~clk;


initial
begin

    clk = 0;
    we = 1;

    // Load R1 = 25
    write_addr = 2'b01;
    write_data = 8'd25;
    #10;

    // Load R2 = 40
    write_addr = 2'b10;
    write_data = 8'd40;
    #10;

    // Stop writing
    we = 0;

    // ADD R1,R2
    instruction = 8'b00000110;

    #10;

    $display("Instruction = %b", instruction);
    $display("Opcode      = %b", opcode);
    $display("Rd          = %b", rd);
    $display("Rs          = %b", rs);

    $display("R1 Value    = %d", read_data1);
    $display("R2 Value    = %d", read_data2);

    $display("ALU Op      = %b", alu_op);
    $display("Result      = %d", alu_result);

    $finish;

end

endmodule
