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
	inteiro arraySize = ut.numero_elementos(codigoProduto)/*	Variável auxiliar 
					que guarda o tamanho do vetor*/
	
	//	Variáveis globais usadas para a manipulação e alocação temporária de dados.
	inteiro menuOption = 0, estoque, codigo = 0,  contador = 1, quantidadeOperacoes = 0, archiveCode,
	archiveStock, archiveName, archiveValue, archiveCost, salesArchive, textCode, textStock, codigoV, estoqueV,
	codeClientlientDirectory,nameClientlientDirectory,valueClientlientDirectory, salesMade = 0, numCaracteres,
	clientValue = 1
				
	caracter continuar = 's', makeSale = 'n', newSale = 's'
	real textValue, textCost, valor, custo, valorVendaRealizada = 0.0, CustoV
	cadeia textArchive, nome, clientName = "", salesInformation = "", salesHour = ""
	
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
	const cadeia salesDBDirectory = "C:/Users/Aluno/Documents/aluno1/ProjetoPadaria/database/saleDB/"
	
	/*const cadeia codeDB = "D:/documents/senai/ProjetoPadaria/database/productCodeDB.txt"
	const cadeia nameDB = "D:/documents/senai/ProjetoPadaria/database/productNameDB.txt"
	const cadeia stockDB = "D:/documents/senai/ProjetoPadaria/database/productStockDB.txt"
	const cadeia valueDB = "D:/documents/senai/ProjetoPadaria/database/productValueDB.txt"
	const cadeia costDB = "D:/documents/senai/ProjetoPadaria/database/productCostDB.txt"
	const cadeia codeSale = "D:/documents/senai/ProjetoPadaria/database/saleDB/codeProductsSale.txt"
	const cadeia nameSale = "D:/documents/senai/ProjetoPadaria/database/saleDB/ProductsSale.txt"
	const cadeia valueSale = "D:/documents/senai/ProjetoPadaria/database/saleDB/valueProductsSale.txt"*/

	
	

	//	Função principal do programa.
	funcao inicio()
	{
		menuOption = mainMenu(menuOption)
		escolha (menuOption){
			//	Cadastro de produtos
			caso 1:
				limpa()
				//	Inicialização dos diretórios dos BD
				/*archiveCode = arc.abrir_arquivo(codeDB,arc.MODO_ACRESCENTAR)
				archiveName = arc.abrir_arquivo(nameDB,arc.MODO_ACRESCENTAR)*/
				archiveStock = arc.abrir_arquivo(stockDB,arc.MODO_ACRESCENTAR)
				archiveValue = arc.abrir_arquivo(valueDB,arc.MODO_ACRESCENTAR)
				archiveCost = arc.abrir_arquivo(costDB,arc.MODO_ACRESCENTAR)
				
				archiveCode = arc.abrir_arquivo(codeDB,arc.MODO_LEITURA)
				archiveName = arc.abrir_arquivo(nameDB, arc.MODO_LEITURA)

				//	Laço para armazenar os dados existentes no BD, em um vetor (TEMPORARIAMENTE)
				para(inteiro i = 0; i < arraySize; i++){
					textArchive = arc.ler_linha(archiveCode)
					se (ty.cadeia_e_inteiro(textArchive, 10) == verdadeiro){
						textCode = ty.cadeia_para_inteiro(textArchive, 10)
						codigoProduto[i] = textCode
					}senao{
						pare
					}
				}

				//	Laço para armazenar os dados existentes no BD, em um vetor (TEMPORARIAMENTE)
				para(inteiro i = 0; i < arraySize; i++){
					textArchive = arc.ler_linha(archiveName)
					nomeProduto[i] = textArchive
				}
				arc.fechar_arquivo(archiveName)	
				arc.fechar_arquivo(archiveCode)

				//	*SISTEMA DE CADASTRO DOS PRODUTOS*
				faca{
					se(codigo == 0){ //	Condicional que testa a existência de um código inicial
						print_code_request_option()
							leia(codigo)
						//	Laço de verificação de existência do código informado pelo usuário no BD
						para(inteiro i = 0; i < arraySize; i++){
							se(codigoProduto[i] == codigo){
								escreva("Este código já se encontra cadastrado,"
								+ "informe um novo código\n: ")
									leia(codigo)
								i--
							}
						}

						//	Inserção do código no BD
						archiveCode = arc.abrir_arquivo(codeDB,arc.MODO_ACRESCENTAR)
						textArchive = ty.inteiro_para_cadeia(codigo,10)
						arc.escrever_linha(textArchive, archiveCode)
						arc.fechar_arquivo(archiveCode)
					}senao{
						//	Inserção do código no BD
						archiveCode = arc.abrir_arquivo(codeDB,arc.MODO_ACRESCENTAR)
						codigo++
						textArchive = ty.inteiro_para_cadeia(codigo,10)
						arc.escrever_linha(textArchive, archiveCode)
						arc.fechar_arquivo(archiveCode)
					}
					limpa()
					
					print_name_request_option()
						leia(nome)
					//	Laço de verificação de existência do produtoo informado pelo usuário no BD
					para(inteiro i = 0; i < arraySize; i++){
						se(nomeProduto[i] == nome){
							escreva("Este produto já existe no sistema,"
							+ "informe um novo produto\n: ")
								leia(nome)
							i--
						}
					}
					//	Inserção do produto no BD
					archiveName = arc.abrir_arquivo(nameDB, arc.MODO_ACRESCENTAR)
					arc.escrever_linha(nome, archiveCode)
					arc.fechar_arquivo(archiveName)
					limpa()

					//	Inserção da quantidade no BD
					print_stock_request_option()
						leia(estoque)
					textArchive = ty.inteiro_para_cadeia(estoque,10)
					arc.escrever_linha(textArchive, archiveStock)
					limpa()

					//	Inserção do valor no BD
					print_value_request_option()
						leia(valor)
					textArchive = ty.real_para_cadeia(valor)
					arc.escrever_linha(textArchive, archiveValue)
					limpa()

					//	Inserção do custo no BD
					print_cost_request_option()
						leia(custo)
					textArchive = ty.real_para_cadeia(custo)
					arc.escrever_linha(textArchive, archiveCost)

					//	Função que verifica se o usuário quer realizar um novo cadastro
					continuar = continuityCheck(continuar)
					limpa()
				}enquanto(continuar != 'n' e continuar != 'N') //	Condição do laço do sistema de cadastro
				//	Fechando os BD
				arc.fechar_arquivo(archiveStock)
				arc.fechar_arquivo(archiveValue)
				arc.fechar_arquivo(archiveCost)
				limpa()
				//	Função de retorno ao menu principal
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
				quantidadeOperacoes = 0
				contador = 0
				para(inteiro i = 0; i < arraySize; i++){
					textArchive = arc.ler_linha(archiveCode)
					se (ty.cadeia_e_inteiro(textArchive, 10) == verdadeiro){
						textCode = ty.cadeia_para_inteiro(textArchive, 10)
						codigoProduto[i] = textCode
						quantidadeOperacoes++
						contador++
					}senao{
						pare
					}
					numCaracteres = tx.numero_caracteres(textArchive)
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
					faca{
					clientName = salesDBDirectory + "Cliente" + clientValue
					arc.criar_pasta(clientName)
					salesInformation = clientName + "/salesInformation.txt"
					salesArchive = arc.abrir_arquivo(salesInformation, arc.MODO_ESCRITA)
					arc.escrever_linha("informação aqui", salesArchive)
					arc.fechar_arquivo(salesArchive)
					print_products()
					escreva("| Informe o código do produto desejado   |\n")
					print_line_4_options()
					escreva(": ")
						leia(codigoV)

						salesSum(valorVendaRealizada)
						
						para(inteiro j = 0; j < salesMade; j++){
							escreva("\n| Produto | ")
							escreva(nomeProduto[j]," | ")
							escreva("\n| Valor | ")
							escreva(valorProduto[j]," |")
							escreva(valorVendaRealizada)
						}
						escreva("\n")
						print_line_4_options()
						escreva("|      Deseja finalizar venda(S/N)?      | \n")
						print_line_4_options()
						escreva(": ")
							leia(makeSale)
						limpa()
					}enquanto(makeSale != 's' e makeSale != 'S')
					escreva("| Deseja realizar nova venda(S/N)? ")
						leia(newSale)
					valorVendaRealizada = 0.0
					clientValue++
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

	// Função para imprimir produtos vendidos (DESIGN)
	funcao vazio print_products(){
		print_line_4_options()
		escreva("| Item | Código | Descrição|             |\n")
		print_line_4_options()
		para(inteiro i = 0; i< contador; i++){
			escreva("|  ",(i+1),"   |   ",codigoProduto[i],"  | ")
			escreva(nomeProduto[i])
			escreva("\n")
		}
		print_line_4_options()
	}

	// Função para imprimir a opção de requisição do código (DESIGN)
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

	// Função para imprimir a opção de requisição do nome do produto (DESIGN)
	funcao vazio print_name_request_option(){
		print_resgistration_screen()
		print_line_4_options()
		escreva("|         Informe o nome do produto      | \n")
		print_line_4_options()
		escreva(": ")
	}

	// Função para imprimir a opção de requisição do estoque do produto (DESIGN)
	funcao vazio print_stock_request_option(){
		print_resgistration_screen()
		print_line_4_options()
		escreva("|      Informe a quantidade P/ estoque   | \n")
		print_line_4_options()
		escreva(": ")
	}

	// Função para imprimir a opção de requisição do valor do produto (DESIGN)
	funcao vazio print_value_request_option(){
		print_resgistration_screen()
		print_line_4_options()
		escreva("|         Informe o valor do produto     | \n")
		print_line_4_options()
		escreva("R$ ")
	}

	// Função para imprimir a opção de requisição do custo do produto (DESIGN)
	funcao vazio print_cost_request_option(){
		print_resgistration_screen()
		print_line_4_options()
		escreva("|        Informe o custo do produto      | \n")
		print_line_4_options()
		escreva("R$ ")
	}

	funcao vazio print_tax_coupon(){
		escreva("	     PADOCA PÃO QUENTE LTDA.\nQuadra 1005 Sul Alameda 23 - Plano Diretor Sul"
			+ "\n77.018-530 Palmas-TO\nCNPJ: 15.688.333/0001-22\nIE: 776537563\nIM: ISENTO"
			+"\n================================================="
			+"\nCÓDIGO: VARCÓDIGO\nDATA E HORA: VARDATA-HORA"
			+"\n================================================="
			+"\n	         CUPOM SEM VALOR FISCAL"
			+"\n ================================================"
			+"\n| ITEM | CÓDIGO | DESCRIÇÃO 		| VALOR |"
			+"\n|  I++ |  VARCODIGO 	|	VA		|	|"
			+"\n ================================================"
			+"\n|TOTAL R$                                 254.46|"
			+"\n|FORMA DE PAGAMENTO                    VALOR REAL"
			+"\n ==============================================="
			+"\n|Impostos:		                        |"
			+"\n|Imposto é roubo!                               |"
			+"\n|		                                |"
			+"\n|		                                |"
			+"\n ==============================================="
			+"\n          VÁ PELA SOMBRA E VOLTE SEMPRE!!         \n")
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

	//	Função que gerencia o valor total da venda e a quantidade de item vendida
	funcao real salesSum(real totalValueSales){
		para(inteiro i = 0; i < arraySize; i++){
			se(codigoProduto[i]==codigoV){
				valor = valorProduto[i]
				valorVendaRealizada+=valorProduto[i]
				salesMade++
			}
		}
		retorne totalValueSales
	}
	
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 13093; 
 * @DOBRAMENTO-CODIGO = [248, 253, 259, 269, 277, 285, 298, 310, 319, 328, 368, 394, 401];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {nomeProduto, 11, 8, 11}-{valorProduto, 12, 6, 12}-{salesMade, 19, 78, 9}-{valorVendaRealizada, 23, 41, 19};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */