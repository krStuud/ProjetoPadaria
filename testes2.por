programa
{	
	inclua biblioteca Calendario --> cad
	inclua biblioteca Tipos --> ty
	
	funcao inicio()
	{
		cadeia dia, dia_e_hora,horas
		logico formato_12h = falso
		escreva("OBTENDO DATAS E HORAS\n")
		dia = ty.inteiro_para_cadeia(cad.dia_mes_atual(),10) +"/"+ cad.mes_atual()+"/"+cad.ano_atual()
		horas = cad.hora_atual(formato_12h) +":"+cad.minuto_atual()
		dia_e_hora = dia +" - "+horas
		escreva(dia_e_hora)
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 429; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */