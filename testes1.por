programa
{
	inclua biblioteca Matematica --> mt
	inclua biblioteca Texto --> tx
	inclua biblioteca Tipos --> ty
	inclua biblioteca Calendario --> cad
	inclua biblioteca Util --> ut
	funcao inicio()
	{
		real valor = 254.46, valorFinal = mt.arredondar(2.401,2), preco[5] = {42.43,1.11,2.47,022.47,13.5}
		inteiro codigo[5] = {123,456,978,564,321}, codigoCliente = ut.sorteia(1000, 2000),minuto = cad.minuto_atual()
		logico formato_12h = falso
		cadeia nome[5] = {"arroz","batata","macarrão","feijão","cappucino"}, minutoCad,data

		se(minuto < 10){
			minutoCad = "0"+ty.inteiro_para_cadeia(minuto, 10)
		}senao{
			minutoCad = ty.inteiro_para_cadeia(minuto,10)
		}
		data = ty.inteiro_para_cadeia(cad.dia_mes_atual(),10) +"/"+  cad.mes_atual() +"/"+ cad.ano_atual() +" - "+ 
		cad.hora_atual(formato_12h) +":"+ minutoCad
		
		escreva("	     PADOCA PÃO QUENTE LTDA.\nQuadra 1005 Sul Alameda 23 - Plano Diretor Sul"
			+ "\n77.018-530 Palmas-TO\nCNPJ: 15.688.333/0001-22\nIE: 776537563\nIM: ISENTO"
			+"\n================================================"
			+"\nCÓDIGO: "+codigoCliente+"\nDATA E HORA: "+ data 
			+"\n================================================"
			+"\n	      CUPOM SEM VALOR FISCAL"
			+"\n================================================"
			+"\n| ITEM | CÓDIGO | DESCRIÇÃO..........|  VALOR  |")
			para(inteiro i = 0; i < 5; i++){
				se(tx.numero_caracteres(nome[i])< 4){
					se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) <4){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"            |"+preco[i]+"0|")//13
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) ==4){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"            |"+preco[i]+"|")//13
					}
				}senao se(tx.numero_caracteres(nome[i]) < 5){
					se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 4){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"               |     "+preco[i]+"0|")//14
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 5){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"               |  "+preco[i]+"0|")//14
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 6){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"               |    "+preco[i]+"|")//14
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 7){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"               |   "+preco[i]+"|")//14
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 8){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"               |  "+preco[i]+"|")//14
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 9){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"               | "+preco[i]+"|")//14
					}
				}senao se(tx.numero_caracteres(nome[i])< 6){//arroz
					se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 4){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"              |     "+preco[i]+"0|")//13
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 5){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"              |  "+preco[i]+"0|")//13
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 6){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"              |    "+preco[i]+"|")//13
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 7){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"              |   "+preco[i]+"|")//13
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 8){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"              |  "+preco[i]+"|")//13
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 9){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"              | "+preco[i]+"|")//13
					}
				}senao se(tx.numero_caracteres(nome[i])< 7){//batata
					se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 4){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"             |     "+preco[i]+"0|")//12
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 5){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"             |     "+preco[i]+"|")//12
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 6){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"             |    "+preco[i]+"|")//12
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 7){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"             |   "+preco[i]+"|")//12
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 8){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"             |  "+preco[i]+"|")//12
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 9){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"             | "+preco[i]+"|")//12
					}
				}
				senao se(tx.numero_caracteres(nome[i])< 8){
					se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 4){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"            |     "+preco[i]+"0|")//11
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 5){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"            |     "+preco[i]+"|")//11
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 6){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"            |    "+preco[i]+"|")//11
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 7){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"            |   "+preco[i]+"|")//11
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 8){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"            |  "+preco[i]+"|")//11
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 9){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"            | "+preco[i]+"|")//11
					}
				}senao se(tx.numero_caracteres(nome[i])< 9){//macarrão
					se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 4){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"           |     "+preco[i]+"0|")//10
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 5){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"           |     "+preco[i]+"|")//10
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 6){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"           |    "+preco[i]+"|")//10
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 7){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"           |   "+preco[i]+"|")//10
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 8){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"           |  "+preco[i]+"|")//10
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 9){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"           | "+preco[i]+"|")//10
					}
				}senao se(tx.numero_caracteres(nome[i])< 10){
					se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 4){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"          |     "+preco[i]+"0|")//9
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 5){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"          |     "+preco[i]+"|")//9
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 6){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"          |    "+preco[i]+"|")//9
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 7){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"          |   "+preco[i]+"|")//9
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 8){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"          |  "+preco[i]+"|")//9
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 9){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"          | "+preco[i]+"|")//9
					}
				}senao se(tx.numero_caracteres(nome[i])< 11){
					se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 4){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"         |     "+preco[i]+"0|")//8
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 5){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"         |     "+preco[i]+"|")//8
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 6){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"         |    "+preco[i]+"|")//8
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 7){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"         |   "+preco[i]+"|")//8
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 8){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"         |  "+preco[i]+"|")//8
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 9){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"         | "+preco[i]+"|")//8
					}
				}senao se(tx.numero_caracteres(nome[i])< 12){
					se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 4){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"        |     "+preco[i]+"0|")//7
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 5){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"        |     "+preco[i]+"|")//7
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 6){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"        |    "+preco[i]+"|")//7
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 7){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"        |   "+preco[i]+"|")//7
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 8){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"        |  "+preco[i]+"|")//7
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 9){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"        | "+preco[i]+"|")//7
					}
				}senao se(tx.numero_caracteres(nome[i])< 13){
					se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 4){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"       |     "+preco[i]+"0|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 5){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"       |     "+preco[i]+"|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 6){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"       |    "+preco[i]+"|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 7){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"       |   "+preco[i]+"|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 8){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"       |  "+preco[i]+"|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 9){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"       | "+preco[i]+"|")//6
					}
				}
				senao se(tx.numero_caracteres(nome[i])< 14){
					se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 4){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"      |     "+preco[i]+"0|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 5){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"      |     "+preco[i]+"|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 6){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"      |    "+preco[i]+"|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 7){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"      |   "+preco[i]+"|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 8){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"      |  "+preco[i]+"|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 9){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"      | "+preco[i]+"|")//6
					}
				}senao se(tx.numero_caracteres(nome[i])< 15){
					se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 4){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"     |     "+preco[i]+"0|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 5){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"     |     "+preco[i]+"|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 6){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"     |    "+preco[i]+"|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 7){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"     |   "+preco[i]+"|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 8){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"     |  "+preco[i]+"|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 9){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"     | "+preco[i]+"|")//6
					}
				}senao se(tx.numero_caracteres(nome[i])< 16){
					se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 4){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"    |     "+preco[i]+"0|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 5){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"    |     "+preco[i]+"|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 6){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"    |    "+preco[i]+"|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 7){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"    |   "+preco[i]+"|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 8){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"    |  "+preco[i]+"|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 9){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"    | "+preco[i]+"|")//6
					}
				}senao se(tx.numero_caracteres(nome[i])< 17){
					se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 4){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"   |     "+preco[i]+"0|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 5){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"   |     "+preco[i]+"|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 6){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"   |    "+preco[i]+"|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 7){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"   |   "+preco[i]+"|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 8){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"   |  "+preco[i]+"|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 9){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"   | "+preco[i]+"|")//6
					}
				}senao se(tx.numero_caracteres(nome[i])< 18){
					se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 4){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"  |     "+preco[i]+"0|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 5){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"  |     "+preco[i]+"|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 6){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"  |    "+preco[i]+"|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 7){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"  |   "+preco[i]+"|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 8){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"  |  "+preco[i]+"|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 9){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"  | "+preco[i]+"|")//6
					}
				}senao se(tx.numero_caracteres(nome[i])< 19){
					se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 4){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+" |     "+preco[i]+"0|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 5){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+" |     "+preco[i]+"|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 6){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+" |    "+preco[i]+"|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 7){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+" |   "+preco[i]+"|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 8){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+" |  "+preco[i]+"|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 9){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+" | "+preco[i]+"|")//6
					}
				}senao se(tx.numero_caracteres(nome[i])< 20){
					se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 4){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"|     "+preco[i]+"0|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 5){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"|     "+preco[i]+"|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 6){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"|    "+preco[i]+"|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 7){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"|   "+preco[i]+"|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 8){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"|  "+preco[i]+"|")//6
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(preco[i])) < 9){
						escreva("\n|   "+(i+1)+"  |  "+codigo[i]+" 	| "+nome[i]+"| "+preco[i]+"|")//6
					}
				}
				
			}
			escreva("\n================================================")
			se(tx.numero_caracteres(ty.real_para_cadeia(valor)) < 4){
					escreva("\n|TOTAL                                 R$  "+valor+"0|")
			}senao se(tx.numero_caracteres(ty.real_para_cadeia(valor)) < 5){
				escreva("\n|TOTAL                                 R$  "+valor+"|")
			}senao se(tx.numero_caracteres(ty.real_para_cadeia(valor)) < 6){
				escreva("\n|TOTAL                                 R$ "+valor+"|")
			}senao se(tx.numero_caracteres(ty.real_para_cadeia(valor)) < 7){
				escreva("\n|TOTAL                                R$ "+valor+"|")
			}senao se(tx.numero_caracteres(ty.real_para_cadeia(valor)) < 8){
				escreva("\n|TOTAL                               R$ "+valor+"|")
			}senao se(tx.numero_caracteres(ty.real_para_cadeia(valor)) < 9){
				escreva("\n|TOTAL                              R$ "+valor+"|")
			}

			se(tx.numero_caracteres(ty.real_para_cadeia(valorFinal)) < 4){
					escreva("\n|FORMA DE PAGAMENTO                    R$  "+valorFinal+"0|")
			}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorFinal)) < 5){
				escreva("\n|FORMA DE PAGAMENTO                    R$  "+valorFinal+"|")
			}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorFinal)) < 6){
				escreva("\n|FORMA DE PAGAMENTO                   R$  "+valorFinal+"|")
			}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorFinal)) < 7){
				escreva("\n|FORMA DE PAGAMENTO                  R$  "+valorFinal+"|")
			}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorFinal)) < 8){
				escreva("\n|FORMA DE PAGAMENTO                 R$  "+valorFinal+"|")
			}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorFinal)) < 9){
				escreva("\n|FORMA DE PAGAMENTO                R$  "+valorFinal+"|")
			}
			escreva("\n================================================"
			+"\n|Impostos:		                       |"
			+"\n|Imposto é roubo!                              |"
			+"\n|		                               |"
			+"\n|		                               |"
			+"\n================================================"
			+"\n         VÁ PELA SOMBRA E VOLTE SEMPRE!!         \n")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1077; 
 * @DOBRAMENTO-CODIGO = [31, 70, 76, 267, 271, 275];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */