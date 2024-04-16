programa
{
	inteiro menuOption = 0, estoqueProduto[5], contador = 1, quantidadeOperacoes = 0, codigoProduto[5]
	caracter continuar = 's'
	cadeia nomeProduto[5]
	real valorProduto[5], custoProduto[5]
	
	funcao inicio()
	{
		menuOption = mainMenu(menuOption)
		escolha (menuOption){
			caso 1:
				limpa()
				printHeader()
				printLine()
				faca{
					para(inteiro i = 0; i < contador; i++){
						se(codigoProduto[0] == 0){
							escreva("Informe o código do produto: ")
							escreva("\nOBS: código iniciado com 0, serão\nvalidados somente números subsequentes\n: ")
								leia(codigoProduto[i])
						}senao{
							codigoProduto[i]= codigoProduto[i-1] + 1
						}
						escreva("\nInforme o nome do produto: ")
							leia(nomeProduto[i])
						escreva("\nInforme o estoque do produto: ")
							leia(estoqueProduto[i])
						escreva("\nInforme o valor de venda do produto: R$ ")
							leia(valorProduto[i])
						escreva("\nInforme o custo de produção do produto: R$ ")
							leia(custoProduto[i])
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
 * @POSICAO-CURSOR = 1054; 
 * @DOBRAMENTO-CODIGO = [55, 60, 64, 89];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {estoqueProduto, 3, 25, 14}-{contador, 3, 44, 8}-{codigoProduto, 3, 83, 13}-{continuar, 4, 10, 9}-{nomeProduto, 5, 8, 11}-{valorProduto, 6, 6, 12}-{custoProduto, 6, 23, 12};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */