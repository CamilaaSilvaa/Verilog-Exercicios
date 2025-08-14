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

//Camila Pereira da Silva
//projeto TOP COMPARADOR
//15/05/2025

//1 bit ficou assim
//input [17:0] SW;
//output [17:0] LEDR;
//somador1bit etapa1(SW[17], SW[0], SW[10], LEDR[1], LEDR[0]);
module SomadorNbits (SW, LEDR);
    input [17:0] SW;
    output [4:0] LEDR; // 4 bits de soma + 1 bit carry 
	 
     //module somador4bits(A1, B1, TE1, S1, TS1);
	  
	  somador4bits topcompara(SW[17:14], SW[3:0], SW[10], LEDR[3:0], LEDR[4]); //SO PODE 4 
	
	
endmodule

