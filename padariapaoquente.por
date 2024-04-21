programa
{
	//	Inclusao de bibliotecas necessarias.
	inclua biblioteca Arquivos --> arc
	inclua biblioteca Calendario --> cad
	inclua biblioteca Matematica --> math
	inclua biblioteca Tipos --> ty
	inclua biblioteca Texto --> tx
	inclua biblioteca Util --> utl

	//	Variaveis globais usadas para a manipulacao e alocacao "permanente" de dados.
	inteiro estoqueProduto[9999], codigoProduto[9999],
	arraySize = utl.numero_elementos(codigoProduto)/*	Variavel auxiliar 
					que guarda o tamanho do vetor*/
	cadeia nomeProduto[9999]
	real valorProduto[9999], custoProduto[9999]
	
	//	Variaveis globais usadas para a manipulacao e alocação temporária de dados.
	cadeia textArchive, nome, clientName = "", salesInformation = "", taxReceipt = "", saleSummary[5], saleSummaryText = ""
	inteiro menuOption = 0, estoque, codigo = 0,  contador = 1, quantidadeOperacoes = 0, archiveCode,
	archiveStock, archiveName, archiveValue, archiveCost, salesArchive, textCode, textStock, codigoVenda, estoqueVenda = 0,
	codeClientlientDirectory,nameClientlientDirectory,valueClientlientDirectory, salesMade = 0, numCaracteres, clientCode = 0,
	contadorAuxiliar = 1,retiradaEstoque = 0,taxArchive
	real textValue, textCost, valor, custo, valorVendaRealizada = 0.0, CustoV
	
	/*	Variaveis globais de auxilio na obtencao de dados e gerenciamento de estruturas de dados
	(data, tempo, geracao de codigos aleatorios,loops, etc...)*/
	cadeia  salesDate = "", minuteCad, identificationFile = "", metodoPagamentoTexto = ""
	caracter continuar = 's', makeSale = 'n', newSale = 's'
	inteiro codeDrawV = 0, minute, idFile, metodoPagamento=0, productAdded = 1
	logico formato_12h = falso
	
	
	//	Contantes que contem os caminhos dos bancos de dados.
	/*const cadeia codeDB = "C:/Users/Aluno/Documents/aluno1/ProjetoPadaria/database/productCodeDB.txt"
	const cadeia nameDB = "C:/Users/Aluno/Documents/aluno1/ProjetoPadaria/database/productNameDB.txt"
	const cadeia stockDB = "C:/Users/Aluno/Documents/aluno1/ProjetoPadaria/database/productStockDB.txt"
	const cadeia valueDB = "C:/Users/Aluno/Documents/aluno1/ProjetoPadaria/database/productValueDB.txt"
	const cadeia costDB = "C:/Users/Aluno/Documents/aluno1/ProjetoPadaria/database/productCostDB.txt"
	const cadeia salesArc = "C:/Users/Aluno/Documents/aluno1/ProjetoPadaria/database/salesArchive.txt"
	const cadeia codeSale = "C:/Users/Aluno/Documents/aluno1/ProjetoPadaria/database/saleDB/codeProductsSale.txt"
	const cadeia productSale = "C:/Users/Aluno/Documents/aluno1/ProjetoPadaria/database/saleDB/productsSale.txt"
	const cadeia valueSale = "C:/Users/Aluno/Documents/aluno1/ProjetoPadaria/database/saleDB/valueProductsSale.txt"
	const cadeia salesDBDirectory = "C:/Users/Aluno/Documents/aluno1/ProjetoPadaria/database/saleDB/"*/
	
	const cadeia codeDB = "D:/documents/senai/ProjetoPadaria/database/productCodeDB.txt"
	const cadeia nameDB = "D:/documents/senai/ProjetoPadaria/database/productNameDB.txt"
	const cadeia stockDB = "D:/documents/senai/ProjetoPadaria/database/productStockDB.txt"
	const cadeia valueDB = "D:/documents/senai/ProjetoPadaria/database/productValueDB.txt"
	const cadeia costDB = "D:/documents/senai/ProjetoPadaria/database/productCostDB.txt"
	const cadeia codeSale = "D:/documents/senai/ProjetoPadaria/database/saleDB/codeProductsSale.txt"
	const cadeia nameSale = "D:/documents/senai/ProjetoPadaria/database/saleDB/ProductsSale.txt"
	const cadeia valueSale = "D:/documents/senai/ProjetoPadaria/database/saleDB/valueProductsSale.txt"
	const cadeia salesDBDirectory = "D:/documents/senai/ProjetoPadaria/database/saleDB/"

	
	

	//	Funcao principal do programa.
	funcao inicio()
	{
		menuOption = mainMenu(menuOption)
		escolha (menuOption){
			//	Cadastro de produtos
			caso 1:
				limpa()
				//	Inicializacao dos diretorios dos BD
				archiveStock = arc.abrir_arquivo(stockDB,arc.MODO_ACRESCENTAR)
				archiveValue = arc.abrir_arquivo(valueDB,arc.MODO_ACRESCENTAR)
				archiveCost = arc.abrir_arquivo(costDB,arc.MODO_ACRESCENTAR)
				
				archiveCode = arc.abrir_arquivo(codeDB,arc.MODO_LEITURA)
				archiveName = arc.abrir_arquivo(nameDB, arc.MODO_LEITURA)

				//	Laco para armazenar os dados existentes no BD, em um vetor (TEMPORARIAMENTE)
				para(inteiro i = 0; i < arraySize; i++){
					textArchive = arc.ler_linha(archiveCode)
					se (ty.cadeia_e_inteiro(textArchive, 10) == verdadeiro){
						textCode = ty.cadeia_para_inteiro(textArchive, 10)
						codigoProduto[i] = textCode
					}senao{
						pare
					}
				}

				//	Laco para armazenar os dados existentes no BD, em um vetor (TEMPORARIAMENTE)
				para(inteiro i = 0; i < arraySize; i++){
					textArchive = arc.ler_linha(archiveName)
					nomeProduto[i] = textArchive
				}
				arc.fechar_arquivo(archiveName)	
				arc.fechar_arquivo(archiveCode)

				//	*SISTEMA DE CADASTRO DOS PRODUTOS*
				faca{
					se(codigo == 0){ //	Condicional que testa a existencia de um codigo inicial
						print_code_request_option()
							leia(codigo)
						//	Lacao de verificacao de existencia do codigo informado pelo usuário no BD
						para(inteiro i = 0; i < arraySize; i++){
							se(codigoProduto[i] == codigo){
								escreva("Este código já｡ se encontra cadastrado,"
								+ "informe um novo código\n: ")
									leia(codigo)
								i--
							}
						}

						//	Insercao do codigo no BD
						archiveCode = arc.abrir_arquivo(codeDB,arc.MODO_ACRESCENTAR)
						textArchive = ty.inteiro_para_cadeia(codigo,10)
						arc.escrever_linha(textArchive, archiveCode)
						arc.fechar_arquivo(archiveCode)
					}senao{
						//	Insercao do codigo no BD
						archiveCode = arc.abrir_arquivo(codeDB,arc.MODO_ACRESCENTAR)
						codigo++
						textArchive = ty.inteiro_para_cadeia(codigo,10)
						arc.escrever_linha(textArchive, archiveCode)
						arc.fechar_arquivo(archiveCode)
					}
					limpa()
					
					print_name_request_option()
						leia(nome)
					//	Laﾃｧo de verificacao de existencia do produto informado pelo usuario no BD
					para(inteiro i = 0; i < arraySize; i++){
						se(nomeProduto[i] == nome){
							escreva("Este produto já existe no sistema,"
							+ "informe um novo produto\n: ")
								leia(nome)
							i--
						}
					}
					//	Insercao do produto no BD
					archiveName = arc.abrir_arquivo(nameDB, arc.MODO_ACRESCENTAR)
					arc.escrever_linha(nome, archiveCode)
					arc.fechar_arquivo(archiveName)
					limpa()

					//	Insercao da quantidade no BD
					print_stock_request_option()
						leia(estoque)
					textArchive = ty.inteiro_para_cadeia(estoque,10)
					arc.escrever_linha(textArchive, archiveStock)
					limpa()

					//	Insercao do valor no BD
					print_value_request_option()
						leia(valor)
					textArchive = ty.real_para_cadeia(valor)
					arc.escrever_linha(textArchive, archiveValue)
					limpa()

					//	Insercao do custo no BD
					print_cost_request_option()
						leia(custo)
					textArchive = ty.real_para_cadeia(custo)
					arc.escrever_linha(textArchive, archiveCost)

					//	Função que verifica se o usuario quer realizar um novo cadastro
					continuar = continuityCheck(continuar)
					limpa()
				}enquanto(continuar != 'n' e continuar != 'N') //	Condicao do laco do sistema de cadastro
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
				print_sales_screen() //	Impressao da tela
				databaseAccess() //	Acesso ao banco de dados
				
				//	**SISTEMA DE VENDAS**
				faca{
					clientCode = codeDraw(codeDrawV)
					clientName = salesDBDirectory +"venda"+ contadorAuxiliar
					identificationFile = clientName + "/"+contadorAuxiliar+".txt"
					fileExist()
					faca{
						salesInformation = clientName + "/salesInformation-" + clientCode+".txt"
						taxReceipt = clientName + "/taxReceipt-" + clientCode+".txt"
						idFile = arc.abrir_arquivo(identificationFile, arc.MODO_ESCRITA)
						arc.fechar_arquivo(idFile)
						salesArchive = arc.abrir_arquivo(salesInformation, arc.MODO_ACRESCENTAR)
						print_products()
						print_sales_product_code_request()
						saleSystem(retiradaEstoque, estoqueVenda)
						
						// FUNCIONALIDADE EM CONSTRUÇÃO
						recording_purchase_data()
						print_checkout_text()
						arc.fechar_arquivo(salesArchive)
						limpa()
					}enquanto(makeSale != 's' e makeSale != 'S')
						method_payment_screen()
						print_tax_coupon()
						salesArchive = arc.abrir_arquivo(salesInformation, arc.MODO_ACRESCENTAR)
						arc.escrever_linha(ty.real_para_cadeia(valorVendaRealizada), salesArchive)
						arc.fechar_arquivo(salesArchive)
						print_new_sale_text()
						valorVendaRealizada = 0.0
						contadorAuxiliar++
						limpa()
				}enquanto(newSale != 'n' e newSale != 'N')
				inicio()
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

	//	Função para imprimir produtos vendidos (DESIGN)
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

	//	Funcao para imprimir a opcao de requisicao do codigo (DESIGN)
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

	//	Funcao para imprimir a opcao de requisicao do nome do produto (DESIGN)
	funcao vazio print_name_request_option(){
		print_resgistration_screen()
		print_line_4_options()
		escreva("|         Informe o nome do produto      | \n")
		print_line_4_options()
		escreva(": ")
	}

	//	Funcao para imprimir a opcao de requisicao do estoque do produto (DESIGN)
	funcao vazio print_stock_request_option(){
		print_resgistration_screen()
		print_line_4_options()
		escreva("|      Informe a quantidade P/ estoque   | \n")
		print_line_4_options()
		escreva(": ")
	}

	//	Funcao para imprimir a opcao de requisicao do valor do produto (DESIGN)
	funcao vazio print_value_request_option(){
		print_resgistration_screen()
		print_line_4_options()
		escreva("|         Informe o valor do produto     | \n")
		print_line_4_options()
		escreva("R$ ")
	}

	//	Funcao para imprimir a opcao de requisicao do custo do produto (DESIGN)
	funcao vazio print_cost_request_option(){
		print_resgistration_screen()
		print_line_4_options()
		escreva("|        Informe o custo do produto      | \n")
		print_line_4_options()
		escreva("R$ ")
	}

	//	Funcao para imprimir a requisicao do codigo do produto desejado (DESIGN e INTERAÇÃO)
	funcao vazio print_sales_product_code_request(){
		escreva("| Informe o código do produto desejado   |\n")
		print_line_4_options()
		escreva(": ")
			leia(codigoVenda)
	}

	funcao vazio print_method_payment_screen(){
		print_header_functions_screen()
		print_line_4_options()
		escreva("| PAGAMENTO                              |\n")
		escreva("| Escolha a opção desejada abaixo        |")
		escreva("\n")
		print_line_4_options()
		escreva(" [1]-Cartão \n [2]-Dinheiro/PIX")
		escreva("\n: ")
			leia(metodoPagamento)
		enquanto(metodoPagamento <1 e metodoPagamento>2){
			print_header_functions_screen()
			print_line_4_options()
			escreva("| PAGAMENTO                              |\n")
			escreva("| OPÇÃO INVÁLIDA! Escolha um opção válida|")
			escreva("\n")
			print_line_4_options()
			escreva(" [1]-Cartão \n [2]-Dinheiro/PIX")
			escreva("\n: ")
				leia(metodoPagamento)
		}
	}
	
	funcao vazio print_checkout_text() {
		escreva("\n")
		print_line_4_options()
		escreva("|      Deseja finalizar (S/N)?      | \n")
		print_line_4_options()
		escreva(": ")
			leia(makeSale)
	}

	funcao vazio print_new_sale_text(){
		escreva("| Deseja realizar nova venda(S/N)? ")
			leia(newSale)
	}

	// FUNCIONALIDADE EM CONSTRUCAO (FUNCIONALIDADE COM BUG)
	//	Funﾃｧﾃ｣o de impressﾃ｣o do cumpom fiscal
	funcao vazio print_tax_coupon(){
		escreva("	           PADOCA PÃO QUENTE LTDA.\n\nQuadra 1005 Sul Alameda 23 - Plano Diretor Sul"
			+ "77.018-530\nPalmas-TO CNPJ: 15.688.333/0001-22\nIE: 776537563 IM: ISENTO"
			+"\n==========================================================="
			+"\nCÓDIGO: "+clientCode+"\n"+obtainingTimetable()
			+"\n==========================================================="
			+"\n	             CUPOM SEM VALOR FISCAL"
			+"\n==========================================================="
			+"\n| DESCRIÇÃO..........| VL. UN. (R$) | QTD |  VL. TL. (R$) |")
			para(inteiro i = 0; i < productAdded; i++){
				se(tx.numero_caracteres(nomeProduto[i]) == 3){
					se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) <4){
						se(tx.numero_caracteres(saleSummary[3]) < 2){
							se(tx.numero_caracteres(saleSummary[4]) < 4){
								escreva("\n| "+saleSummary[1]+"                |          "+saleSummary[2]+" |   "+saleSummary[3]+" |            "+saleSummary[4]+"|")
							}senao se(tx.numero_caracteres(saleSummary[4]) < 5){
								escreva("\n| "+saleSummary[1]+"                |          "+saleSummary[2]+" |   "+saleSummary[3]+" |           "+saleSummary[4]+"|")
							}senao se(tx.numero_caracteres(saleSummary[4]) < 6){
								escreva("\n| "+saleSummary[1]+"                |          "+saleSummary[2]+" |   "+saleSummary[3]+" |          "+saleSummary[4]+"|")
							}
						}
						senao se(tx.numero_caracteres(saleSummary[3]) == 2){
							se(tx.numero_caracteres(saleSummary[4]) < 4){
								escreva("\n| "+saleSummary[1]+"                |          "+saleSummary[2]+" |  "+saleSummary[3]+" |          "+saleSummary[4]+"|")
							}senao se(tx.numero_caracteres(saleSummary[4]) < 5){
								escreva("\n| "+saleSummary[1]+"                |          "+saleSummary[2]+" |  "+saleSummary[3]+" |           "+saleSummary[4]+"|")
							}senao se(tx.numero_caracteres(saleSummary[4]) < 6){
								escreva("\n| "+saleSummary[1]+"                |          "+saleSummary[2]+" |  "+saleSummary[3]+" |          "+saleSummary[4]+"|")
							}
						}
						senao se(tx.numero_caracteres(saleSummary[3]) == 3){
							se(tx.numero_caracteres(saleSummary[4]) < 6){
								escreva("\n| "+saleSummary[1]+"                |          "+saleSummary[2]+" | "+saleSummary[3]+" |          "+saleSummary[4]+"|")
							}
						}
					}

					se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) <5){
						se(tx.numero_caracteres(saleSummary[3]) < 2){
							se(tx.numero_caracteres(saleSummary[4]) < 4){
								escreva("\n| "+saleSummary[1]+"                |         "+saleSummary[2]+" |   "+saleSummary[3]+" |            "+saleSummary[4]+"|")
							}senao se(tx.numero_caracteres(saleSummary[4]) < 5){
								escreva("\n| "+saleSummary[1]+"                |         "+saleSummary[2]+" |   "+saleSummary[3]+" |           "+saleSummary[4]+"|")
							}senao se(tx.numero_caracteres(saleSummary[4]) < 6){
								escreva("\n| "+saleSummary[1]+"                |         "+saleSummary[2]+" |   "+saleSummary[3]+" |          "+saleSummary[4]+"|")
							}
						}
						senao se(tx.numero_caracteres(saleSummary[3]) == 2){
							se(tx.numero_caracteres(saleSummary[4]) < 4){
								escreva("\n| "+saleSummary[1]+"                |         "+saleSummary[2]+" |  "+saleSummary[3]+" |          "+saleSummary[4]+"|")
							}senao se(tx.numero_caracteres(saleSummary[4]) < 5){
								escreva("\n| "+saleSummary[1]+"                |         "+saleSummary[2]+" |  "+saleSummary[3]+" |           "+saleSummary[4]+"|")
							}senao se(tx.numero_caracteres(saleSummary[4]) < 6){
								escreva("\n| "+saleSummary[1]+"                |         "+saleSummary[2]+" |  "+saleSummary[3]+" |          "+saleSummary[4]+"|")
							}
						}
						senao se(tx.numero_caracteres(saleSummary[3]) == 3){
							se(tx.numero_caracteres(saleSummary[4]) < 6){
								escreva("\n| "+saleSummary[1]+"                |         "+saleSummary[2]+" | "+saleSummary[3]+" |          "+saleSummary[4]+"|")
							}
						}
					}

					se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) <6){
						se(tx.numero_caracteres(saleSummary[3]) < 2){
							se(tx.numero_caracteres(saleSummary[4]) < 4){
								escreva("\n| "+saleSummary[1]+"                |        "+saleSummary[2]+" |   "+saleSummary[3]+" |            "+saleSummary[4]+"|")
							}senao se(tx.numero_caracteres(saleSummary[4]) < 5){
								escreva("\n| "+saleSummary[1]+"                |        "+saleSummary[2]+" |   "+saleSummary[3]+" |           "+saleSummary[4]+"|")
							}senao se(tx.numero_caracteres(saleSummary[4]) < 6){
								escreva("\n| "+saleSummary[1]+"                |        "+saleSummary[2]+" |   "+saleSummary[3]+" |          "+saleSummary[4]+"|")
							}
						}
						senao se(tx.numero_caracteres(saleSummary[3]) == 2){
							se(tx.numero_caracteres(saleSummary[4]) < 4){
								escreva("\n| "+saleSummary[1]+"                |        "+saleSummary[2]+" |  "+saleSummary[3]+" |          "+saleSummary[4]+"|")
							}senao se(tx.numero_caracteres(saleSummary[4]) < 5){
								escreva("\n| "+saleSummary[1]+"                |        "+saleSummary[2]+" |  "+saleSummary[3]+" |           "+saleSummary[4]+"|")
							}senao se(tx.numero_caracteres(saleSummary[4]) < 6){
								escreva("\n| "+saleSummary[1]+"                |        "+saleSummary[2]+" |  "+saleSummary[3]+" |          "+saleSummary[4]+"|")
							}
						}
						senao se(tx.numero_caracteres(saleSummary[3]) == 3){
							se(tx.numero_caracteres(saleSummary[4]) < 6){
								escreva("\n| "+saleSummary[1]+"                |        "+saleSummary[2]+" | "+saleSummary[3]+" |          "+saleSummary[4]+"|")
							}senao se(tx.numero_caracteres(saleSummary[4]) < 7){
								escreva("\n| "+saleSummary[1]+"                |        "+saleSummary[2]+" | "+saleSummary[3]+" |         "+saleSummary[4]+"|")
							}
						}
					}
				}

				se(tx.numero_caracteres(nomeProduto[i]) == 4){
					se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) == 3){
						se(tx.numero_caracteres(saleSummary[3]) < 2){
							se(tx.numero_caracteres(saleSummary[4]) < 4){
								escreva("\n| "+saleSummary[1]+"               |          "+saleSummary[2]+" |   "+saleSummary[3]+" |            "+saleSummary[4]+"|")
							}senao se(tx.numero_caracteres(saleSummary[4]) < 5){
								escreva("\n| "+saleSummary[1]+"               |          "+saleSummary[2]+" |   "+saleSummary[3]+" |           "+saleSummary[4]+"|")
							}senao se(tx.numero_caracteres(saleSummary[4]) < 6){
								escreva("\n| "+saleSummary[1]+"               |          "+saleSummary[2]+" |   "+saleSummary[3]+" |          "+saleSummary[4]+"|")
							}
						}
						senao se(tx.numero_caracteres(saleSummary[3]) == 2){
							se(tx.numero_caracteres(saleSummary[4]) < 4){
								escreva("\n| "+saleSummary[1]+"             |          "+saleSummary[2]+" |  "+saleSummary[3]+" |          "+saleSummary[4]+"|")
							}senao se(tx.numero_caracteres(saleSummary[4]) < 5){
								escreva("\n| "+saleSummary[1]+"             |          "+saleSummary[2]+" |  "+saleSummary[3]+" |           "+saleSummary[4]+"|")
							}senao se(tx.numero_caracteres(saleSummary[4]) < 6){
								escreva("\n| "+saleSummary[1]+"             |          "+saleSummary[2]+" |  "+saleSummary[3]+" |          "+saleSummary[4]+"|")
							}
						}
						senao se(tx.numero_caracteres(saleSummary[3]) > 2){
							se(tx.numero_caracteres(saleSummary[4]) < 6){
								escreva("\n| "+saleSummary[1]+"             |          "+saleSummary[2]+" | "+saleSummary[3]+" |          "+saleSummary[4]+"|")
							}
						}
					}

					se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) == 4){
						se(tx.numero_caracteres(saleSummary[3]) < 2){
							se(tx.numero_caracteres(saleSummary[4]) < 4){
								escreva("\n| "+saleSummary[1]+"                |         "+saleSummary[2]+" |   "+saleSummary[3]+" |            "+saleSummary[4]+"|")
							}senao se(tx.numero_caracteres(saleSummary[4]) < 5){
								escreva("\n| "+saleSummary[1]+"                |         "+saleSummary[2]+" |   "+saleSummary[3]+" |           "+saleSummary[4]+"|")
							}senao se(tx.numero_caracteres(saleSummary[4]) < 6){
								escreva("\n| "+saleSummary[1]+"                |         "+saleSummary[2]+" |   "+saleSummary[3]+" |          "+saleSummary[4]+"|")
							}
						}
						senao se(tx.numero_caracteres(saleSummary[3]) == 2){
							se(tx.numero_caracteres(saleSummary[4]) < 4){
								escreva("\n| "+saleSummary[1]+"                |         "+saleSummary[2]+" |  "+saleSummary[3]+" |          "+saleSummary[4]+"|")
							}senao se(tx.numero_caracteres(saleSummary[4]) < 5){
								escreva("\n| "+saleSummary[1]+"                |         "+saleSummary[2]+" |  "+saleSummary[3]+" |           "+saleSummary[4]+"|")
							}senao se(tx.numero_caracteres(saleSummary[4]) < 6){
								escreva("\n| "+saleSummary[1]+"                |         "+saleSummary[2]+" |  "+saleSummary[3]+" |          "+saleSummary[4]+"|")
							}
						}
						senao se(tx.numero_caracteres(saleSummary[3]) == 3){
							se(tx.numero_caracteres(saleSummary[4]) < 6){
								escreva("\n| "+saleSummary[1]+"                |         "+saleSummary[2]+" | "+saleSummary[3]+" |          "+saleSummary[4]+"|")
							}
						}
					}

					se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) == 5){
						se(tx.numero_caracteres(saleSummary[3]) < 2){
							se(tx.numero_caracteres(saleSummary[4]) < 4){
								escreva("\n| "+saleSummary[1]+"                |        "+saleSummary[2]+" |   "+saleSummary[3]+" |            "+saleSummary[4]+"|")
							}senao se(tx.numero_caracteres(saleSummary[4]) < 5){
								escreva("\n| "+saleSummary[1]+"                |        "+saleSummary[2]+" |   "+saleSummary[3]+" |           "+saleSummary[4]+"|")
							}senao se(tx.numero_caracteres(saleSummary[4]) < 6){
								escreva("\n| "+saleSummary[1]+"                |        "+saleSummary[2]+" |   "+saleSummary[3]+" |          "+saleSummary[4]+"|")
							}
						}
						senao se(tx.numero_caracteres(saleSummary[3]) == 2){
							se(tx.numero_caracteres(saleSummary[4]) < 4){
								escreva("\n| "+saleSummary[1]+"                |        "+saleSummary[2]+" |  "+saleSummary[3]+" |          "+saleSummary[4]+"|")
							}senao se(tx.numero_caracteres(saleSummary[4]) < 5){
								escreva("\n| "+saleSummary[1]+"                |        "+saleSummary[2]+" |  "+saleSummary[3]+" |           "+saleSummary[4]+"|")
							}senao se(tx.numero_caracteres(saleSummary[4]) < 6){
								escreva("\n| "+saleSummary[1]+"                |        "+saleSummary[2]+" |  "+saleSummary[3]+" |          "+saleSummary[4]+"|")
							}
						}
						senao se(tx.numero_caracteres(saleSummary[3]) == 3){
							se(tx.numero_caracteres(saleSummary[4]) < 6){
								escreva("\n| "+saleSummary[1]+"                |        "+saleSummary[2]+" | "+saleSummary[3]+" |          "+saleSummary[4]+"|")
							}senao se(tx.numero_caracteres(saleSummary[4]) < 7){
								escreva("\n| "+saleSummary[1]+"                |        "+saleSummary[2]+" | "+saleSummary[3]+" |         "+saleSummary[4]+"|")
							}
						}
					}
				}

			}// Fim loop
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

			se(tx.numero_caracteres(saleSummary[4]) < 4){
					escreva("\n|FORMA DE PAGAMENTO                    R$  "+saleSummary[4]+"0|")
			}senao se(tx.numero_caracteres(saleSummary[4]) < 5){
				escreva("\n|FORMA DE PAGAMENTO                    R$  "+saleSummary[4]+"|")
			}senao se(tx.numero_caracteres(saleSummary[4]) < 6){
				escreva("\n|FORMA DE PAGAMENTO                   R$  "+saleSummary[4]+"|")
			}senao se(tx.numero_caracteres(saleSummary[4]) < 7){
				escreva("\n|FORMA DE PAGAMENTO                  R$  "+saleSummary[4]+"|")
			}senao se(tx.numero_caracteres(saleSummary[4]) < 8){
				escreva("\n|FORMA DE PAGAMENTO                 R$  "+saleSummary[4]+"|")
			}senao se(tx.numero_caracteres(saleSummary[4]) < 9){
				escreva("\n|FORMA DE PAGAMENTO                R$  "+saleSummary[4]+"|")
			}
			escreva("\n================================================"
			+"\n|Impostos:                                     |"
			+"\n|Imposto é roubo!                              |"
			+"\n|                                              |"
			+"\n|                                              |"
			+"\n================================================"
			+"\n         VÃO PELA SOMBRA E VOLTE SEMPRE!!         \n")
	}
	
	//	Funcao que mostra o menu para o usuario e retorna a opcao selecionada do mesmo. (DESIGN E INTERACAO)
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
			escreva("| OPÇÃO INVÁIDA!                 |\n")
			escreva("| Escolha uma opção válida abaixo |")
			escreva("\n")
			print_line()
			escreva(" [1]- Cadastrar Produto \n [2]- Realizar Venda \n [3]- Relatório Atual \n [4]- Fechamento de Caixa")
			escreva("\n: ")
				leia(menuOption)
		}

		retorne menuOption
	}

	funcao vazio method_payment_screen(){
		print_method_payment_screen()
		escolha(metodoPagamento){
			caso 1:
			
			pare
			caso 2:
				
			pare
		}
	}

	//	Funcao de verificacao de continuidade do usuario.
	funcao caracter continuityCheck(caracter continue){
		escreva("Deseja cadastrar um novo produto (S/N)? ")
			leia(continue)
		retorne continue
	}

	//	Funcao da funcionalidade de vendas que acessa as databases e extrai os dados necessarios
	funcao vazio databaseAccess(){
		archiveCode = arc.abrir_arquivo(codeDB,arc.MODO_LEITURA)
		archiveName = arc.abrir_arquivo(nameDB,arc.MODO_LEITURA)
		
		archiveValue = arc.abrir_arquivo(valueDB,arc.MODO_LEITURA)
		archiveCost = arc.abrir_arquivo(costDB,arc.MODO_LEITURA)
		archiveStock = arc.abrir_arquivo(stockDB,arc.MODO_LEITURA)
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
		arc.fechar_arquivo(archiveStock)
	}
	
	// FUNCIONALIDADE EM CONSTRUÇÃO
	funcao vazio saleSystem(inteiro retiradaEstoque, inteiro estoqueVenda){
		inteiro itemAddition = 1
		para(inteiro i = 0; i < arraySize; i++){
			se(codigoProduto[i]==codigoVenda){
				escreva("|         Informe a quantidade           |\n")
				escreva("|: ")
					leia(retiradaEstoque)
				se(retiradaEstoque < 1){
					escreva("|         Informe a quantidade           |\n")
					escreva("| QUANTIDADE INVÁIDA!!!                 |")
					escreva("| Informe uma quantia válida             |\n")
					escreva("|: ")
						leia(retiradaEstoque)
				}
				
				para(inteiro j = 0; j < itemAddition; j++){
					inteiro auxiliar = estoqueProduto[i] - retiradaEstoque 
					estoqueProduto[i] = auxiliar
					se(estoqueProduto[i] < 0){
						escreva("| Não foi possível realizar a adição do  |\n")
						escreva("| item! Quantidade solicitada insponível |\n| em estoque!")
						estoqueVenda = estoqueVenda
					}senao{
						estoqueVenda = estoqueProduto[i]
					}
					auxiliar = 0
				}
				saleSummary[0] = ty.inteiro_para_cadeia(codigoVenda, 10)
				saleSummary[1] = nomeProduto[i]
				saleSummary[2] = ty.real_para_cadeia(valorProduto[i])
				saleSummary[3] = ty.inteiro_para_cadeia(retiradaEstoque, 10)
				saleSummary[4] = ty.real_para_cadeia(math.arredondar(valorProduto[i]*retiradaEstoque,2))
				productAdded++
				valorVendaRealizada+=math.arredondar(valorProduto[i]*retiradaEstoque,2)
			}
		}
		
		archiveStock = arc.abrir_arquivo(stockDB,arc.MODO_ESCRITA)
		para(inteiro i = 0; i< arraySize; i++){
			se(codigoProduto[i] > 0){
				textArchive = ty.inteiro_para_cadeia(estoqueProduto[i],10)
				arc.escrever_linha(textArchive, archiveStock)
			}
		}
		arc.fechar_arquivo(archiveStock)
		arc.fechar_arquivo(salesArchive)
	}

	// 	Função de gravação dos itens comprados no arquivo resumo da compra
	funcao vazio recording_purchase_data(){
		salesArchive = arc.abrir_arquivo(salesInformation, arc.MODO_ACRESCENTAR)
		saleSummaryText = "Código: "+saleSummary[0]+", Produto: "+saleSummary[1]
		+", Valor Un.: R$ "+saleSummary[2]+", Qtd. Vend.: "+saleSummary[3]
		+", Valor Total R$: "+saleSummary[4]
		arc.escrever_linha(saleSummaryText, salesArchive)
	}
	
	//	Funcao de verificação da existencia da DB de venda ao reiniciar o sistema
	funcao vazio fileExist(){
		logico fileExist = arc.arquivo_existe(identificationFile)
		enquanto(fileExist == verdadeiro){
						contadorAuxiliar++
						clientName = salesDBDirectory +"venda"+ contadorAuxiliar
						identificationFile = clientName + "/" +contadorAuxiliar+".txt"
						fileExist = arc.arquivo_existe(identificationFile)
		}
	}

	//	Funcao para obter a data e hora da venda
	funcao cadeia obtainingTimetable(){
		minute = cad.minuto_atual()
		se(minute < 10){
			minuteCad = "0"+ty.inteiro_para_cadeia(minute, 10)
		}senao{
			minuteCad = ty.inteiro_para_cadeia(minute,10)
		}
		salesDate = ty.inteiro_para_cadeia(cad.dia_mes_atual(),10) +"/"+  cad.mes_atual() +"/"+ cad.ano_atual() +" - "+ 
		cad.hora_atual(formato_12h) +":"+ minuteCad
		retorne salesDate 
	}

	funcao inteiro codeDraw(inteiro codeDraw){
		codeDraw = utl.sorteia(10000, 20000)
		retorne codeDraw
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 13180; 
 * @DOBRAMENTO-CODIGO = [215, 220, 226, 231, 236, 244, 252, 265, 277, 286, 295, 304, 343, 352];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */