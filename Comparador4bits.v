//Camila Pereira da Silva
//projeto comparador de 1 bit
//24/04/2025

module comparadorde1bit(A, B, habilita, igual, maior, menor);
	input A, B, habilita;
	output igual, maior, menor;

	assign igual = (A~^B) & habilita;
	assign menor = (~A & B) & habilita;
	assign maior = (A & ~B) & habilita;

endmodule

//Camila Pereira da Silva
//projeto comparador de 4 bits
//08/05/2025

module comparador4bits (A,B,Ig,Ma,Me);
input [3:0] A,B;
output  Ig, Ma, Me;
//criando variaveis intermediarias

wire[3:0] aux_ig, aux_ma, aux_me;

//module comparadorde1bit(A,B,habilita, igual, maior, menor);

comparadorde1bit ZERO (A[3], B[3], 1'b1, aux_ig[3], aux_ma[3], aux_me[3]);
comparadorde1bit UM (A[2], B[2], aux_ig[3], aux_ig[2], aux_ma[2], aux_me[2]);
comparadorde1bit DOIS (A[1], B[1], aux_ig[2], aux_ig[1], aux_ma[1], aux_me[1]);
comparadorde1bit TRES (A[0], B[0], aux_ig[1], aux_ig[0], aux_ma[0], aux_me[0]);

//arrumando as saidas 
assign Ig = &aux_ig;// aux_ig[3] & aux_ig[2] & aux_ig[1] & aux_ig[0];
assign Ma = |aux_ma;
assign Me = |aux_me;
// | ou
endmodule

//Camila Pereira da Silva
//TOP comparador
//08/05/2025

module TOPcomparador (SW, LEDR);
input [17:0] SW;
output [17:0] LEDR;

// module comparador4bits (A,B,Ig,Ma,Me);
	comparador4bits CAIO(SW[17:14], SW[3:0], LEDR[10], LEDR[17], LEDR[0]);
endmodule

