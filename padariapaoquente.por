programa
{
	//	Inclusão de bibliotecas necessárias.
	inclua biblioteca Arquivos --> arc
	inclua biblioteca Tipos --> ty
	inclua biblioteca Texto --> tx
	inclua biblioteca Util --> ut

	//	Variáveis globais usadas para a programação e manipulação do programa.
	inteiro menuOption = 0, estoqueProduto[5], contador = 1, quantidadeOperacoes = 0, codigoProduto[5], archiveCode, 
	archiveStock, archiveName, archiveValue, archiveCost, textCode, textStock
	caracter continuar = 's'
	cadeia nomeProduto[5], textArchive
	real valorProduto[5], custoProduto[5], textValue, textCost

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
			//	Cadastro de produtos
			caso 1:
				limpa()
				printHeader()
				printLine()
				escreva("|       CADASTRO DE PRODUTOS      |\n")
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
						se(continuar == 'n' ou continuar == 'N'){
							pare
						}
					}
				}enquanto(continuar != 'n')
				arc.fechar_arquivo(archiveCode)
				arc.fechar_arquivo(archiveName)
				arc.fechar_arquivo(archiveStock)
				arc.fechar_arquivo(archiveValue)
				arc.fechar_arquivo(archiveCost)
				limpa()
				inicio()
			pare
			caso 2:
				limpa()
				printHeader()
				printLine()
				escreva("|         VENDA DE PRODUTOS       |\n")
				printLine()
				archiveCode = arc.abrir_arquivo(codeDB,arc.MODO_LEITURA)
				archiveName = arc.abrir_arquivo(nameDB,arc.MODO_LEITURA)
				archiveStock = arc.abrir_arquivo(stockDB,arc.MODO_LEITURA)
				archiveValue = arc.abrir_arquivo(valueDB,arc.MODO_LEITURA)
				archiveCost = arc.abrir_arquivo(costDB,arc.MODO_LEITURA)
				
				faca{
					para(inteiro i = 0; i < ut.numero_elementos(codigoProduto); i++){
						textArchive = arc.ler_linha(archiveCode)
						se (ty.cadeia_e_inteiro(textArchive, 10) == verdadeiro){
							textCode = ty.cadeia_para_inteiro(textArchive, 10)
							codigoProduto[i] = textCode
						}
						textArchive = arc.ler_linha(archiveName)
						nomeProduto[i] = textArchive
						textArchive = arc.ler_linha(archiveStock)
						se (ty.cadeia_e_inteiro(textArchive, 10) == verdadeiro){
							textStock = ty.cadeia_para_inteiro(textArchive, 10)
							estoqueProduto[i] = textStock
						}
						textArchive = arc.ler_linha(archiveValue)
						se (ty.cadeia_e_real(textArchive) == verdadeiro){
							textValue = ty.cadeia_para_real(textArchive)
							valorProduto[i] = textValue
						}
						textArchive = arc.ler_linha(archiveCost)
						se (ty.cadeia_e_real(textArchive) == verdadeiro){
							textCost = ty.cadeia_para_real(textArchive)
							custoProduto[i] = textCost
						}
					contador++
					}
					para(inteiro i = 0; i< quantidadeOperacoes; i++){
						escreva(codigoProduto[i],"|")
						escreva("\n")
						escreva(nomeProduto[i],"|")
						escreva("\n")
						escreva(estoqueProduto[i],"|")
						escreva("\n")
						escreva(valorProduto[i],"|")
						escreva("\n")
						escreva(custoProduto[i],"|")
					}
					/*se(codigoProduto[0] == 0){
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
						se(continuar == 'n' ou continuar == 'N'){
							pare
						}*/
				}enquanto(continuar != 'n')
			pare
		}
	}

	//	Função para imprimir HEADER DO SISTEMA (DESIGN)
	funcao vazio printHeader(){
		escreva(" _________________________________\n")
		escreva("|         Padoca PÃO QUENTE       |\n")
	}

	//	Função para imprimir linha (DESIGN)
	funcao vazio printLine(){
		escreva(" ---------------------------------\n")
	}

	//	Função que mostra o menu para o usuário e retorna a opção selecionada do mesmo. (DESIGN E INTERAÇÃO)
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

	//	Função de verificação de continuidade do usuário.
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
 * @POSICAO-CURSOR = 3976; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {estoqueProduto, 10, 25, 14}-{quantidadeOperacoes, 10, 58, 19}-{codigoProduto, 10, 83, 13}-{nomeProduto, 13, 8, 11}-{valorProduto, 14, 6, 12}-{custoProduto, 14, 23, 12};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */