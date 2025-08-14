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
// 22/05/2025
// decodificador BCD
module decodificador(SW, HEX0);

	input [17:0] SW;
	output[6:0] HEX0;
	
	//module decodificador_bcd(A, B, C, D, a, b, c, d, e, f, g);
	decodificador_bcd decodi(SW[17], SW[16], SW[15], SW[14], HEX0[0], HEX0[1], HEX0[2], HEX0[3], HEX0[4], HEX0[5],HEX0[6]);
	
endmodule
