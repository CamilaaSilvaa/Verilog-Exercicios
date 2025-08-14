// Camila Pereira da Silva
// Projeto farol sinalizador 
// 10/04/2025

module projetofarol (F,P,C,S);
input F,P,C;
output S;
//EXPRESSÃO BOOLEANA
assign S = (F & ~P & ~C) | (F & ~P & C) |  (F & P & ~C);

endmodule
