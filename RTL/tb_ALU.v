`timescale 1ns / 1ps

module tb_ALU;

    // Inputs
    reg clk;
    reg rst;
    reg [15:0] A;
    reg [15:0] B;
    reg [3:0] opcode;
    reg valid_in;

    // Outputs
    wire [15:0] result;
    wire zero;
    wire carry;
    wire overflow;
    wire negative;
    wire valid_out;

    // DUT
    ALU uut (
        .clk(clk),
        .rst(rst),
        .A(A),
        .B(B),
        .opcode(opcode),
        .valid_in(valid_in),
        .result(result),
        .zero(zero),
        .carry(carry),
        .overflow(overflow),
        .negative(negative),
        .valid_out(valid_out)
    );

    // =========================================
    // Clock Generation
    // =========================================
    always #5 clk = ~clk;

    // =========================================
    // Test Sequence
    // =========================================
    initial
    begin

        // Initial Values
        clk = 0;
        rst = 1;
        A = 0;
        B = 0;
        opcode = 0;
        valid_in = 0;

        // Reset
        #20;
        rst = 0;

        // ADD
        #10;
        A = 16'd20;
        B = 16'd10;
        opcode = 4'd0;
        valid_in = 1;

        // SUB
        #10;
        A = 16'd50;
        B = 16'd15;
        opcode = 4'd1;

        // MUL
        #10;
        A = 16'd12;
        B = 16'd4;
        opcode = 4'd2;

        // DIV
        #10;
        A = 16'd100;
        B = 16'd5;
        opcode = 4'd3;

        // DIVIDE BY ZERO
        #10;
        A = 16'd100;
        B = 16'd0;
        opcode = 4'd3;

        // AND
        #10;
        A = 16'b1010101010101010;
        B = 16'b1111000011110000;
        opcode = 4'd4;

        // OR
        #10;
        opcode = 4'd5;

        // XOR
        #10;
        opcode = 4'd6;

        // NOT
        #10;
        opcode = 4'd7;

        // SHIFT LEFT
        #10;
        A = 16'd8;
        opcode = 4'd8;

        // SHIFT RIGHT
        #10;
        A = 16'd32;
        opcode = 4'd9;

        // COMPARE EQUAL
        #10;
        A = 16'd25;
        B = 16'd25;
        opcode = 4'd10;

        // COMPARE GREATER
        #10;
        A = 16'd40;
        B = 16'd10;
        opcode = 4'd11;

        // OVERFLOW TEST
        #10;
        A = 16'd32760;
        B = 16'd10;
        opcode = 4'd0;

        // Disable valid signal
        #20;
        valid_in = 0;

        // End Simulation
        #100;
        $stop;

    end

    // =========================================
    // Monitor
    // =========================================
    initial
    begin
        $monitor(
        "TIME=%0t | A=%d | B=%d | OPCODE=%d | RESULT=%d | CARRY=%b | OVERFLOW=%b | ZERO=%b | NEGATIVE=%b | VALID=%b",
        $time,
        A,
        B,
        opcode,
        result,
        carry,
        overflow,
        zero,
        negative,
        valid_out
        );
    end

endmodule