programa
{
	//	Inclusão de bibliotecas necessárias.
	inclua biblioteca Arquivos --> arc
	inclua biblioteca Tipos --> ty

	//	Variáveis globais usadas para a programação e manipulação do programa.
	inteiro menuOption = 0, estoqueProduto[5], contador = 1, quantidadeOperacoes = 0, codigoProduto[5], archiveCode, 
	archiveStock, archiveName, archiveValue, archiveCost
	caracter continuar = 's'
	cadeia nomeProduto[5], textArchive
	real valorProduto[5], custoProduto[5]

	//	Contantes que contem os caminhos dos bancos de dados.
	const cadeia codeDB = "C:/Users/Aluno/Documents/aluno1/ProjetoPadaria/database/productCodeDB.txt"
	const cadeia nameDB = "C:/Users/Aluno/Documents/aluno1/ProjetoPadaria/database/productNameDB.txt"
	const cadeia stockDB = "C:/Users/Aluno/Documents/aluno1/ProjetoPadaria/database/productStockDB.txt"
	const cadeia valueDB = "C:/Users/Aluno/Documents/aluno1/ProjetoPadaria/database/productValueDB.txt"
	const cadeia costDB = "C:/Users/Aluno/Documents/aluno1/ProjetoPadaria/database/productCostDB.txt"
	

	//	Função principal do programa.
	funcao inicio()
	{
		menuOption = mainMenu(menuOption)
		escolha (menuOption){
			caso 1:
				limpa()
				printHeader()
				printLine()
				archiveCode = arc.abrir_arquivo(codeDB,arc.MODO_ACRESCENTAR)
				archiveName = arc.abrir_arquivo(nameDB,arc.MODO_ACRESCENTAR)
				archiveStock = arc.abrir_arquivo(stockDB,arc.MODO_ACRESCENTAR)
				archiveValue = arc.abrir_arquivo(valueDB,arc.MODO_ACRESCENTAR)
				archiveCost = arc.abrir_arquivo(costDB,arc.MODO_ACRESCENTAR)
				faca{
					para(inteiro i = 0; i < contador; i++){
						se(codigoProduto[0] == 0){
							escreva("Informe o código do produto: ")
							escreva("\nOBS: código iniciado com 0, serão\nvalidados somente números subsequentes\n: ")
								leia(codigoProduto[i])
							textArchive = ty.inteiro_para_cadeia(codigoProduto[i],10)
							arc.escrever_linha(textArchive, archiveCode)
						}senao{
							codigoProduto[i]= codigoProduto[i-1] + 1
							textArchive = ty.inteiro_para_cadeia(codigoProduto[i],10)
							arc.escrever_linha(textArchive, archiveCode)
						}
						escreva("\nInforme o nome do produto: ")
							leia(nomeProduto[i])
							textArchive = nomeProduto[i]
							arc.escrever_linha(textArchive, archiveName)
						escreva("\nInforme o estoque do produto: ")
							leia(estoqueProduto[i])
							textArchive = ty.inteiro_para_cadeia(estoqueProduto[i],10)
							arc.escrever_linha(textArchive, archiveStock)
						escreva("\nInforme o valor de venda do produto: R$ ")
							leia(valorProduto[i])
							textArchive = ty.real_para_cadeia(valorProduto[i])
							arc.escrever_linha(textArchive, archiveValue)
						escreva("\nInforme o custo de produção do produto: R$ ")
							leia(custoProduto[i])
							textArchive = ty.real_para_cadeia(custoProduto[i])
							arc.escrever_linha(textArchive, archiveCost)
						continuar = continuityCheck(continuar)
						quantidadeOperacoes++
						contador++
						limpa()
						printHeader()
						printLine()
						se(continuar == 'n'){
							pare
						}
					}
				}enquanto(continuar != 'n')
				limpa()	
			pare
		}
		para(inteiro i = 0; i< quantidadeOperacoes; i++){
				escreva(codigoProduto[i],"\n")
				escreva(nomeProduto[i],"\n")
				escreva(estoqueProduto[i],"\n")
				escreva(valorProduto[i],"\n")
				escreva(custoProduto[i],"\n")
			}
	}

	funcao vazio printHeader(){
		escreva(" _________________________________\n")
		escreva("|         Padoca PÃO QUENTE       |\n")
	}

	funcao vazio printLine(){
		escreva(" ---------------------------------\n")
	}
	
	funcao inteiro mainMenu(inteiro menuOption){
		printHeader()
		printLine()
		escreva("| Escolha a opção desejada abaixo |")
		escreva("\n")
		printLine()
		escreva(" [1]- Cadastrar Produto \n [2]- Realizar Venda \n [3]- Relatório Atual \n [4]- Fechamento de Caixa")
		escreva("\n: ")
			leia(menuOption)
		enquanto(menuOption <1 ou menuOption >4){
			limpa()
			printHeader()
			printLine()
			escreva("| OPÇÃO INVÁLIDA!                 |\n")
			escreva("| Escolha uma opção válida abaixo |")
			escreva("\n")
			printLine()
			escreva(" [1]- Cadastrar Produto \n [2]- Realizar Venda \n [3]- Relatório Atual \n [4]- Fechamento de Caixa")
			escreva("\n: ")
				leia(menuOption)
		}

		retorne menuOption
	}

	funcao caracter continuityCheck(caracter continue){
		escreva("Deseja cadastrar um novo produto (S/N)? ")
			leia(continue)
		retorne continue
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2808; 
 * @DOBRAMENTO-CODIGO = [87, 92, 96, 121];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {estoqueProduto, 8, 25, 14}-{contador, 8, 44, 8}-{codigoProduto, 8, 83, 13}-{continuar, 10, 10, 9}-{nomeProduto, 11, 8, 11}-{valorProduto, 12, 6, 12}-{custoProduto, 12, 23, 12};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */