//Camila Pereira da Silva
//projeto somador de 1 bit
//15/05/2025

module somador1bit(A, B, TE, S, TS);
	input A, B, TE;
	output S,TS;

	assign TS = (~A & B & TE) | (A & ~B & TE) | (A & B & ~TE) | (A & B & TE);
	assign S = (~A & ~B & TE) | (~A & B & ~TE) | (A & ~B & ~TE) | (A & B & TE);

endmodule

//Camila Pereira da Silva
//projeto somador de 4 bits
//15/05/2025

module somador4bits(A1, B1, TE1, S1, TS1);
	input [3:0] A1, B1;   //vetor dois números de 4 bits
	input TE1;      
	output [3:0] S1;      //vetor resultado da soma de 4 bits
   output TS1;  
	
	wire carry0para1, carry1para2, carry2para3;
   
	//somador1bit(A, B, TE, S, TS);
	
	somador1bit s0 (A1[0], B1[0], TE1, S1[0], carry0para1);
	somador1bit s1 (A1[1], B1[1], carry0para1, S1[1], carry1para2);
	somador1bit s2 (A1[2], B1[2], carry1para2, S1[2], carry2para3);
	somador1bit s3 (A1[3], B1[3], carry2para3, S1[3], TS1);
	

endmodule

// Camila Pereira da Silva 
// 22/05/2025
// decodificador BCD
module decodificador_bcd(A, B, C, D, a, b, c, d, e, f, g);
    input A,B,C,D;
    output a, b, c, d, e, f, g;


assign a = (~A&~B&~C&D) | (~A&B&~C&~D);
assign b = (~A&B&~C&D) | (~A&B&C&~D);
assign c = (~A&~B&C&~D);
assign d = (~A&~B&~C&D) | (~A&B&~C&~D) | (~A&B&C&D);
assign e = (~A&D) | (~B&~C&D) | (~A&B&~C);
assign f = (~A&C&D) | (~A&~B&D) | (~A&~B&C);
assign g = (~A&~B&~C) | (~A&B&C&D);

endmodule

// Camila Pereira da Silva 
// 30/05/2025
// decodificador + somador 
module Topsomador_display(SW, HEX1, HEX0);
   input [17:0] SW;
   output [6:0] HEX1;
   output [6:0] HEX0;
	
   wire [3:0] S;
   wire TS;

   wire [4:0] resultado;
   wire [3:0] dezena;
   wire [3:0] unidade;

   somador4bits topsomador(SW[17:14], SW[3:0], SW[10], S, TS);

   assign resultado = {TS, S};

   assign dezena = resultado / 10;
   assign unidade = resultado % 10;

   decodificador_bcd deco1(dezena[3], dezena[2], dezena[1], dezena[0], HEX1[0], HEX1[1], HEX1[2], HEX1[3], HEX1[4], HEX1[5], HEX1[6]);

   decodificador_bcd deco0(unidade[3], unidade[2], unidade[1], unidade[0], HEX0[0], HEX0[1], HEX0[2], HEX0[3], HEX0[4], HEX0[5], HEX0[6]);

   endmodule
