module control_unit(
    input [3:0] opcode,

    output reg [3:0] alu_op,
    output reg reg_write,
    output reg mem_read,
    output reg mem_write
);

always @(*)
begin

    alu_op    = 4'b0000;
    reg_write = 0;
    mem_read  = 0;
    mem_write = 0;

    case(opcode)

        4'b0000: begin // ADD
            alu_op    = 4'b0000;
            reg_write = 1;
        end

        4'b0001: begin // SUB
            alu_op    = 4'b0001;
            reg_write = 1;
        end

        4'b0010: begin // AND
            alu_op    = 4'b0010;
            reg_write = 1;
        end

        4'b0011: begin // OR
            alu_op    = 4'b0011;
            reg_write = 1;
        end

        4'b0100: begin // LOAD
            mem_read  = 1;
            reg_write = 1;
        end

        4'b0101: begin // STORE
            mem_write = 1;
        end

    endcase

end

endmodule

module alu(
    input [7:0] a,
    input [7:0] b,
    input [3:0] opcode,
    output reg [7:0] result
);

always @(*)
begin
    case(opcode)
        4'b0000: result = a + b;
        4'b0001: result = a - b;
        4'b0010: result = a & b;
        4'b0011: result = a | b;
        default: result = 0;
    endcase
end

endmodule

module register_file(
    input clk,
    input we,
    input [1:0] write_addr,
    input [7:0] write_data,
    input [1:0] read_addr1,
    input [1:0] read_addr2,
    output [7:0] read_data1,
    output [7:0] read_data2
);

reg [7:0] regs[0:3];

always @(posedge clk)
begin
    if(we)
        regs[write_addr] <= write_data;
end

assign read_data1 = regs[read_addr1];
assign read_data2 = regs[read_addr2];

endmodule

module decoder(
    input [7:0] instruction,
    output [3:0] opcode,
    output [1:0] rd,
    output [1:0] rs
);

assign opcode = instruction[7:4];
assign rd     = instruction[3:2];
assign rs     = instruction[1:0];

endmodule
