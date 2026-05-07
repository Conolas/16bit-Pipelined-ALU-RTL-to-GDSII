`timescale 1ns / 1ps

module ALU(
    input clk,
    input rst,
    input [15:0] A,
    input [15:0] B,
    input [3:0] opcode,
    input valid_in,

    output reg [15:0] result,
    output reg zero,
    output reg carry,
    output reg overflow,
    output reg negative,
    output reg valid_out
);

    // =========================================
    // Stage 1 Pipeline Registers
    // =========================================
    reg [15:0] A_reg;
    reg [15:0] B_reg;
    reg [3:0] opcode_reg;
    reg valid_stage1;

    // =========================================
    // ALU Internal Signals
    // =========================================
    reg [15:0] alu_result;
    reg alu_zero;
    reg alu_carry;
    reg alu_overflow;
    reg alu_negative;

    // =========================================
    // Stage 2 Pipeline Registers
    // =========================================
    reg [15:0] result_reg;
    reg zero_reg;
    reg carry_reg;
    reg overflow_reg;
    reg negative_reg;
    reg valid_stage2;

    // =========================================
    // Stage 1 Input Register
    // =========================================
    always @(posedge clk)
    begin
        if(rst)
        begin
            A_reg <= 16'd0;
            B_reg <= 16'd0;
            opcode_reg <= 4'd0;
            valid_stage1 <= 1'b0;
        end
        else
        begin
            A_reg <= A;
            B_reg <= B;
            opcode_reg <= opcode;
            valid_stage1 <= valid_in;
        end
    end

    // =========================================
    // Combinational ALU Logic
    // =========================================
    always @(*)
    begin

        // Default Values
        alu_result = 16'd0;
        alu_zero = 1'b0;
        alu_carry = 1'b0;
        alu_overflow = 1'b0;
        alu_negative = 1'b0;

        case(opcode_reg)

            // ADD
            4'd0:
            begin
                {alu_carry, alu_result} = A_reg + B_reg;

                alu_overflow =
                (A_reg[15] == B_reg[15]) &&
                (A_reg[15] != alu_result[15]);
            end

            // SUB
            4'd1:
            begin
                {alu_carry, alu_result} = A_reg - B_reg;

                alu_overflow =
                (A_reg[15] != B_reg[15]) &&
                (A_reg[15] != alu_result[15]);
            end

            // MUL
            4'd2:
            begin
                alu_result = A_reg * B_reg;
                alu_overflow = 1'b0;
            end

            // DIV
            4'd3:
            begin
                if(B_reg != 16'd0)
                    alu_result = A_reg / B_reg;
                else
                    alu_result = 16'd0;

                alu_overflow = 1'b0;
            end

            // AND
            4'd4:
            begin
                alu_result = A_reg & B_reg;
                alu_overflow = 1'b0;
            end

            // OR
            4'd5:
            begin
                alu_result = A_reg | B_reg;
                alu_overflow = 1'b0;
            end

            // XOR
            4'd6:
            begin
                alu_result = A_reg ^ B_reg;
                alu_overflow = 1'b0;
            end

            // NOT
            4'd7:
            begin
                alu_result = ~A_reg;
                alu_overflow = 1'b0;
            end

            // SHIFT LEFT
            4'd8:
            begin
                alu_result = A_reg << 1;
                alu_overflow = 1'b0;
            end

            // SHIFT RIGHT
            4'd9:
            begin
                alu_result = A_reg >> 1;
                alu_overflow = 1'b0;
            end

            // COMPARE EQUAL
            4'd10:
            begin
                alu_result = (A_reg == B_reg);
                alu_overflow = 1'b0;
            end

            // COMPARE GREATER
            4'd11:
            begin
                alu_result = (A_reg > B_reg);
                alu_overflow = 1'b0;
            end

            default:
            begin
                alu_result = 16'd0;
                alu_overflow = 1'b0;
            end

        endcase

        // Common Flag Logic
        alu_zero = (alu_result == 16'd0);
        alu_negative = alu_result[15];

    end

    // =========================================
    // Stage 2 Output Register
    // =========================================
    always @(posedge clk)
    begin

        if(rst)
        begin
            result_reg <= 16'd0;
            zero_reg <= 1'b0;
            carry_reg <= 1'b0;
            overflow_reg <= 1'b0;
            negative_reg <= 1'b0;
            valid_stage2 <= 1'b0;
        end

        else
        begin
            result_reg <= alu_result;
            zero_reg <= alu_zero;
            carry_reg <= alu_carry;
            overflow_reg <= alu_overflow;
            negative_reg <= alu_negative;
            valid_stage2 <= valid_stage1;
        end

    end

    // =========================================
    // Output Assignments
    // =========================================
    always @(*)
    begin
        result = result_reg;
        zero = zero_reg;
        carry = carry_reg;
        overflow = overflow_reg;
        negative = negative_reg;
        valid_out = valid_stage2;
    end

endmodule