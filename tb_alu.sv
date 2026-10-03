`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2026 09:27:22 AM
// Design Name: 
// Module Name: tb_alu
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


module tb_alu;
//Declaración de señales
    logic [3:0]A, B;
    logic [2:0]operation;
    logic [3:0]out_put;
    logic carry,borrow,overflow,zero,negative;
    
    alu test(
   
    .A(A),.B(B),.operation(operation),.out_put(out_put),.carry(carry),.borrow(borrow),.overflow(overflow),.zero(zero),.negative(negative)
    );
 // Pruebas
    initial begin
    //Suma
    operation=3'b000;
    A=4'b0011;
    B=4'b0010;
    #10;
    
    //Suma con carry
    operation=3'b000;
    A=4'b1111;
    B=4'b0001;
    #10;
        
    //Suma con overflow
    operation=3'b000;
    A=4'b0111;
    B=4'b0001;
    #10; 
    
    //Resta    
    operation=3'b001;
    A=4'b0110;
    B=4'b0010;
    #10; 
    //Resta con borrow
    operation=3'b001;
    A=4'b0011;
    B=4'b0101;
    #10; 
    
    //Resta con overflow
    operation=3'b001;
    A=4'b0111;
    B=4'b1111;
    #10;
    
    //AND
    operation=3'b010;
    A=4'b1100;
    B=4'b1010;
    #10;
    
    //OR
    operation=3'b011;
    A=4'b1100;
    B=4'b1010;
    #10;
    //xOR
    operation=3'b100;
    A=4'b1100;
    B=4'b1010;
    #10;
    
    //NOT de A
    operation=3'b101;
    A=4'b1010;
    B=4'b0000;
    #10;
    //Desplazamineto lógico a la izquierda
    operation=3'b110;
    A=4'b0101;
    B=4'b0000;
    #10;
    //Desplazamineto lógico a la derecha
    operation=3'b111;
    A=4'b1010;
    B=4'b0000;
    #10;
    $stop;
end
endmodule
