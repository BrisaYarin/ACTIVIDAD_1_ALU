`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2026 07:32:26 PM
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module alu(
//Declaración de entradas y salidas
    input  logic [3:0] A,B,
    input  logic [2:0] operation,
    output logic [3:0] out_put,
    output logic carry,borrow,overflow,zero,negative
);
//Guardar 5to bit 
    logic [4:0] temp;
//Lógica de la ALU
always_comb begin

    //valores iniciales de las banderas
    carry    =1'b0;
    borrow   =1'b0;
    overflow =1'b0;
    zero     =1'b0;
    negative =1'b0;

    case (operation)
        // Suma
        3'b000: begin
        temp = {1'b0, A} + {1'b0, B};
        out_put = temp[3:0];
        carry = temp[4];
        overflow =(~(A[3]^B[3]))&(out_put[3]^A[3]);
        end
        // Resta 
        3'b001: begin
        out_put=A-B;
        borrow =(A<B);
        overflow=(A[3]^B[3])&(out_put[3]^A[3]);
        end
        //AND
        3'b010:begin
        out_put=A&B;
        end
        //OR
        3'b011:begin
        out_put=A|B;
        end
        //XOR
        3'b100:begin
        out_put=A^B;
        end
        // NOT de A
        3'b101:begin
        out_put=~A;
        end
        //Desplazamiento lógico a la izquierda
        3'b110:begin
        out_put=A<<1;
        end
        //Desplazamiento lógico a la derecha
        3'b111:begin
        out_put=A>>1;
        end
        endcase
        //Zero
        zero=(out_put==4'b0000);
        //Negative
        negative = out_put[3];
        end
endmodule
