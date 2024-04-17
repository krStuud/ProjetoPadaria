programa
{
	//	Inclusão de bibliotecas necessárias.
	inclua biblioteca Arquivos --> arc
	inclua biblioteca Tipos --> ty
	inclua biblioteca Texto --> tx
	inclua biblioteca Util --> ut

	//	Variáveis globais usadas para a manipulação e alocação "permanente" de dados.
	inteiro estoqueProduto[5], codigoProduto[5]
	cadeia nomeProduto[5]
	real valorProduto[5], custoProduto[5]
	
	
	//	Variáveis globais usadas para a manipulação e alocação temporária de dados.
	inteiro menuOption = 0, estoque, codigo = 0,  contador = 1, quantidadeOperacoes = 0, archiveCode,
	archiveStock, archiveName, archiveValue, archiveCost, salesArchive, textCode, textStock, codigoV, estoqueV,
	codeClientlientDirectory,nameClientlientDirectory,valueClientlientDirectory
	caracter continuar = 's', makeSale = 's', newSale = 's'
	real textValue, textCost, valor, custo, valorV, CustoV
	cadeia textArchive, nome
	
	//	Contantes que contem os caminhos dos bancos de dados.
	const cadeia codeDB = "C:/Users/Aluno/Documents/aluno1/ProjetoPadaria/database/productCodeDB.txt"
	const cadeia nameDB = "C:/Users/Aluno/Documents/aluno1/ProjetoPadaria/database/productNameDB.txt"
	const cadeia stockDB = "C:/Users/Aluno/Documents/aluno1/ProjetoPadaria/database/productStockDB.txt"
	const cadeia valueDB = "C:/Users/Aluno/Documents/aluno1/ProjetoPadaria/database/productValueDB.txt"
	const cadeia costDB = "C:/Users/Aluno/Documents/aluno1/ProjetoPadaria/database/productCostDB.txt"
	const cadeia salesArc = "C:/Users/Aluno/Documents/aluno1/ProjetoPadaria/database/salesArchive.txt"
	const cadeia codeSale = "C:/Users/Aluno/Documents/aluno1/ProjetoPadaria/database/saleDB/codeProductsSale.txt"
	const cadeia productSale = "C:/Users/Aluno/Documents/aluno1/ProjetoPadaria/database/saleDB/productsSale.txt"
	const cadeia valueSale = "C:/Users/Aluno/Documents/aluno1/ProjetoPadaria/database/saleDB/valueProductsSale.txt"
	
	/*const cadeia codeDB = "D:/documents/senai/ProjetoPadaria/database/productCodeDB.txt"
	const cadeia nameDB = "D:/documents/senai/ProjetoPadaria/database/productNameDB.txt"
	const cadeia stockDB = "D:/documents/senai/ProjetoPadaria/database/productStockDB.txt"
	const cadeia valueDB = "D:/documents/senai/ProjetoPadaria/database/productValueDB.txt"
	const cadeia costDB = "D:/documents/senai/ProjetoPadaria/database/productCostDB.txt"*/
	

	//	Função principal do programa.
	funcao inicio()
	{
		menuOption = mainMenu(menuOption)
		escolha (menuOption){
			//	Cadastro de produtos
			caso 1:
				limpa()
				archiveCode = arc.abrir_arquivo(codeDB,arc.MODO_ACRESCENTAR)
				archiveName = arc.abrir_arquivo(nameDB,arc.MODO_ACRESCENTAR)
				archiveStock = arc.abrir_arquivo(stockDB,arc.MODO_ACRESCENTAR)
				archiveValue = arc.abrir_arquivo(valueDB,arc.MODO_ACRESCENTAR)
				archiveCost = arc.abrir_arquivo(costDB,arc.MODO_ACRESCENTAR)
				faca{
					se(codigo == 0){
						print_code_request_option()
							leia(codigo)
						textArchive = ty.inteiro_para_cadeia(codigo,10)
						arc.escrever_linha(textArchive, archiveCode)
					}senao{
						codigo++
						textArchive = ty.inteiro_para_cadeia(codigo,10)
						arc.escrever_linha(textArchive, archiveCode)
					}
					limpa()
					print_name_request_option()
						leia(nome)
					textArchive = nome
					arc.escrever_linha(textArchive, archiveName)
					limpa()
					print_stock_request_option()
						leia(estoque)
					textArchive = ty.inteiro_para_cadeia(estoque,10)
					arc.escrever_linha(textArchive, archiveStock)
					limpa()
					print_value_request_option()
						leia(valor)
					textArchive = ty.real_para_cadeia(valor)
					arc.escrever_linha(textArchive, archiveValue)
					limpa()
					print_cost_request_option()
						leia(custo)
					textArchive = ty.real_para_cadeia(custo)
					arc.escrever_linha(textArchive, archiveCost)
					continuar = continuityCheck(continuar)
					quantidadeOperacoes++
					contador++
					limpa()
					print_header()
					print_line()
					/*se(continuar == 'n' ou continuar == 'N'){
						pare
					}*/
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
				print_sales_screen()
				archiveCode = arc.abrir_arquivo(codeDB,arc.MODO_LEITURA)
				archiveName = arc.abrir_arquivo(nameDB,arc.MODO_LEITURA)
				archiveStock = arc.abrir_arquivo(stockDB,arc.MODO_LEITURA)
				archiveValue = arc.abrir_arquivo(valueDB,arc.MODO_LEITURA)
				archiveCost = arc.abrir_arquivo(costDB,arc.MODO_LEITURA)
				
				contador = ut.numero_elementos(codigoProduto)
				quantidadeOperacoes = 0
				para(inteiro i = 0; i < contador; i++){
					textArchive = arc.ler_linha(archiveCode)
					se (ty.cadeia_e_inteiro(textArchive, 10) == verdadeiro){
						textCode = ty.cadeia_para_inteiro(textArchive, 10)
						codigoProduto[i] = textCode
						quantidadeOperacoes++
					}senao{
						pare
					}
					inteiro numCaracteres = tx.numero_caracteres(textArchive)
					textArchive = arc.ler_linha(archiveName)
					se(numCaracteres>0){
						nomeProduto[i] = textArchive
					}
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
				}
				faca{
					print_products()
					escreva("| Informe o código do produto desejado   |\n")
					print_line_4_options()
					escreva(": ")
					faca{
						leia(codigoV)
						escreva("Deseja finalizar venda(S/N)? ")
							leia(makeSale)
					}enquanto(makeSale != 'n' e makeSale != 'N')
					escreva("Deseja realizar nova venda(S/N)? ")
						leia(makeSale)
					limpa()
				}enquanto(newSale != 'n' e newSale != 'N')
			pare
		}
	}
	
	//	Função para imprimir HEADER DO SISTEMA (DESIGN)
	funcao vazio print_header(){
		escreva(" _________________________________\n")
		escreva("|         Padoca PÃO QUENTE       |\n")
	}

	funcao vazio print_header_functions_screen(){
		escreva(" ________________________________________\n")
		escreva("|            Padoca PÃO QUENTE           |\n")
	}

	//	Função para imprimir linha (DESIGN)
	funcao vazio print_line(){
		escreva(" ---------------------------------\n")
	}

	//	Função para imprimir linha nas opções de interações (DESIGN)
	funcao vazio print_line_4_options(){
		escreva(" ----------------------------------------\n")
	}

	//	Função para imprimir a tela de cadastro dos produtos (DESIGN)
	funcao vazio print_resgistration_screen(){
		print_header_functions_screen()
		print_line_4_options()
		escreva("|          CADASTRO DE PRODUTOS          |\n")
		print_line_4_options()
	}

	//	Função para imprimir a tela de venda dos produtos (DESIGN)
	funcao vazio print_sales_screen(){
		print_header_functions_screen()
		print_line_4_options()
		escreva("|           VENDA DE PRODUTOS            |\n")
		print_line_4_options()
	}

	funcao vazio print_products(){
		print_line_4_options()
		escreva("| Item | Código | Descrição|             |\n")
		print_line_4_options()
		para(inteiro i = 0; i< quantidadeOperacoes; i++){
			escreva("|  ",(i+1),"   |   ",codigoProduto[i],"  | ")
			escreva(nomeProduto[i])
			escreva("\n")
		}
		print_line_4_options()
	}
	
	funcao vazio print_code_request_option(){
		print_resgistration_screen()
		print_line_4_options()
		escreva("|      Informe o código do produto       |\n")
		print_line_4_options()
		escreva("| OBS: código iniciado com 0, serão      |"
		+"\n| validados somente números subsequentes | \n")
		print_line_4_options()
		escreva(": ")
	}

	funcao vazio print_name_request_option(){
		print_resgistration_screen()
		print_line_4_options()
		escreva("|         Informe o nome do produto      | \n")
		print_line_4_options()
		escreva(": ")
	}
	
	funcao vazio print_stock_request_option(){
		print_resgistration_screen()
		print_line_4_options()
		escreva("|      Informe a quantidade P/ estoque   | \n")
		print_line_4_options()
		escreva(": ")
	}
	
	funcao vazio print_value_request_option(){
		print_resgistration_screen()
		print_line_4_options()
		escreva("|         Informe o valor do produto     | \n")
		print_line_4_options()
		escreva("R$ ")
	}
	
	funcao vazio print_cost_request_option(){
		print_resgistration_screen()
		print_line_4_options()
		escreva("|        Informe o custo do produto      | \n")
		print_line_4_options()
		escreva("R$ ")
	}
	
	//	Função que mostra o menu para o usuário e retorna a opção selecionada do mesmo. (DESIGN E INTERAÇÃO)
	funcao inteiro mainMenu(inteiro menuOption){
		print_header()
		print_line()
		escreva("| Escolha a opção desejada abaixo |")
		escreva("\n")
		print_line()
		escreva(" [1]- Cadastrar Produto \n [2]- Realizar Venda \n [3]- Relatório Atual \n [4]- Fechamento de Caixa")
		escreva("\n: ")
			leia(menuOption)
		enquanto(menuOption <1 ou menuOption >4){
			limpa()
			print_header()
			print_line()
			escreva("| OPÇÃO INVÁLIDA!                 |\n")
			escreva("| Escolha uma opção válida abaixo |")
			escreva("\n")
			print_line()
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
 * @POSICAO-CURSOR = 5901; 
 * @DOBRAMENTO-CODIGO = [162, 167, 173, 178, 183, 191, 198, 210, 221, 229, 237, 245, 254, 280];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */