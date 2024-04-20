programa
{
	//	Inclusão de bibliotecas necessárias.
	inclua biblioteca Arquivos --> arc
	inclua biblioteca Calendario --> cad
	inclua biblioteca Matematica --> math
	inclua biblioteca Tipos --> ty
	inclua biblioteca Texto --> tx
	inclua biblioteca Util --> utl

	//	Variáveis globais usadas para a manipulação e alocação "permanente" de dados.
	inteiro estoqueProduto[9999], codigoProduto[9999],
	arraySize = utl.numero_elementos(codigoProduto)/*	Variável auxiliar 
					que guarda o tamanho do vetor*/
	cadeia nomeProduto[9999]
	real valorProduto[9999], custoProduto[9999]
	
	//	Variáveis globais usadas para a manipulação e alocação temporária de dados.
	cadeia textArchive, nome, clientName = "", salesInformation = "", taxReceipt = ""
	inteiro menuOption = 0, estoque, codigo = 0,  contador = 1, quantidadeOperacoes = 0, archiveCode,
	archiveStock, archiveName, archiveValue, archiveCost, salesArchive, textCode, textStock, codigoV, estoqueVenda = 0,
	codeClientlientDirectory,nameClientlientDirectory,valueClientlientDirectory, salesMade = 0, numCaracteres,
	clientValue = 1
	real textValue, textCost, valor, custo, valorVendaRealizada = 0.0,retiradaEstoque = 0.0, CustoV
	
	/*	Variáveis globais de auxílio na obtenção de dados e gerenciamento de estruturas de dados
	(data, tempo, geração de códigos aleatórios,loops, etc...)*/
	cadeia  salesDate = "", minuteCad
	caracter continuar = 's', makeSale = 'n', newSale = 's'
	inteiro clientCode = utl.sorteia(1000, 2000), minute
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
				print_sales_screen() //	Impressão da tela
				databaseAccess() //	Acesso ao banco de dados

				//	**SISTEMA DE VENDAS**
				faca{
					clientName = salesDBDirectory + "Cliente" + clientValue
					salesInformation = clientName + "/salesInformation"+clientValue+".txt"
					fileExist()
					faca{
					salesArchive = arc.abrir_arquivo(salesInformation, arc.MODO_ESCRITA)
					print_products()
					escreva("| Informe o código do produto desejado   |\n")
					print_line_4_options()
					escreva(": ")
						leia(codigoV)

						salesSum(valorVendaRealizada)
						withdrawStock(retiradaEstoque, estoqueVenda)
						
						// FUNCIONALIDADE EM CONSTRUÇÃO
						cadeia teste = ty.real_para_cadeia(valorVendaRealizada) +","+ ty.inteiro_para_cadeia(estoqueProduto[0], 10)
						arc.escrever_linha(teste, salesArchive)
						arc.fechar_arquivo(salesArchive)
						escreva("\n")
						print_line_4_options()
						escreva("|      Deseja finalizar (S/N)?      | \n")
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

	// FUNCIONALIDADE EM CONSTRUÇÃO
	//	Função de impressão do cumpom fiscal
	/*funcao vazio print_tax_coupon(){
		escreva("	     PADOCA PÃO QUENTE LTDA.\nQuadra 1005 Sul Alameda 23 - Plano Diretor Sul"
			+ "\n77.018-530 Palmas-TO\nCNPJ: 15.688.333/0001-22\nIE: 776537563\nIM: ISENTO"
			+"\n================================================"
			+"\nCÓDIGO: "+clientCode+"\nDATA E HORA: "+ obtainingTimetable()
			+"\n================================================"
			+"\n	      CUPOM SEM VALOR FISCAL"
			+"\n================================================"
			+"\n| ITEM | CÓDIGO | DESCRIÇÃO..........|  VALOR  |")
			para(inteiro i = 0; i < 5; i++){
				se(tx.numero_caracteres(nomeProduto[i])< 4){
					se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) <4){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"            |"+valorProduto[i]+"0|")//13
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) ==4){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"            |"+valorProduto[i]+"|")//13
					}
				}senao se(tx.numero_caracteres(nomeProduto[i]) < 5){
					se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 4){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"               |     "+valorProduto[i]+"0|")//14
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 5){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"               |  "+valorProduto[i]+"0|")//14
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 6){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"               |    "+valorProduto[i]+"|")//14
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 7){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"               |   "+valorProduto[i]+"|")//14
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 8){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"               |  "+valorProduto[i]+"|")//14
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 9){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"               | "+valorProduto[i]+"|")//14
					}
				}senao se(tx.numero_caracteres(nomeProduto[i])< 6){//arroz
					se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 4){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"              |     "+valorProduto[i]+"0|")//13
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 5){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"              |  "+valorProduto[i]+"0|")//13
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 6){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"              |    "+valorProduto[i]+"|")//13
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 7){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"              |   "+valorProduto[i]+"|")//13
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 8){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"              |  "+valorProduto[i]+"|")//13
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 9){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"              | "+valorProduto[i]+"|")//13
					}
				}senao se(tx.numero_caracteres(nomeProduto[i])< 7){//batata
					se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 4){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"             |     "+valorProduto[i]+"0|")//12
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 5){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"             |     "+valorProduto[i]+"|")//12
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 6){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"             |    "+valorProduto[i]+"|")//12
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 7){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"             |   "+valorProduto[i]+"|")//12
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 8){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"             |  "+valorProduto[i]+"|")//12
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 9){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"             | "+valorProduto[i]+"|")//12
					}
				}
				senao se(tx.numero_caracteres(nomeProduto[i])< 8){
					se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 4){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"            |     "+valorProduto[i]+"0|")//11
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 5){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"            |     "+valorProduto[i]+"|")//11
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 6){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"            |    "+valorProduto[i]+"|")//11
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 7){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"            |   "+valorProduto[i]+"|")//11
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 8){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"            |  "+valorProduto[i]+"|")//11
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 9){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"            | "+valorProduto[i]+"|")//11
					}
				}senao se(tx.numero_caracteres(nomeProduto[i])< 9){//macarrão
					se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 4){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"           |     "+valorProduto[i]+"0|")//10
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 5){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"           |     "+valorProduto[i]+"|")//10
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 6){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"           |    "+valorProduto[i]+"|")//10
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 7){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"           |   "+valorProduto[i]+"|")//10
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 8){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"           |  "+valorProduto[i]+"|")//10
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 9){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"           | "+valorProduto[i]+"|")//10
					}
				}senao se(tx.numero_caracteres(nomeProduto[i])< 10){
					se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 4){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"          |     "+valorProduto[i]+"0|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 5){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"          |     "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 6){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"          |    "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 7){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"          |   "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 8){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"          |  "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 9){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"          | "+valorProduto[i]+"|")
					}
				}senao se(tx.numero_caracteres(nomeProduto[i])< 11){
					se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 4){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"         |     "+valorProduto[i]+"0|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 5){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"         |     "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 6){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"         |    "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 7){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"         |   "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 8){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"         |  "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 9){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"         | "+valorProduto[i]+"|")
					}
				}senao se(tx.numero_caracteres(nomeProduto[i])< 12){
					se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 4){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"        |     "+valorProduto[i]+"0|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 5){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"        |     "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 6){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"        |    "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 7){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"        |   "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 8){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"        |  "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 9){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"        | "+valorProduto[i]+"|")
					}
				}senao se(tx.numero_caracteres(nomeProduto[i])< 13){
					se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 4){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"       |     "+valorProduto[i]+"0|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 5){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"       |     "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 6){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"       |    "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 7){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"       |   "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 8){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"       |  "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 9){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"       | "+valorProduto[i]+"|")
					}
				}senao se(tx.numero_caracteres(nomeProduto[i])< 14){
					se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 4){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"      |     "+valorProduto[i]+"0|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 5){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"      |     "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 6){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"      |    "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 7){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"      |   "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 8){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"      |  "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 9){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"      | "+valorProduto[i]+"|")
					}
				}senao se(tx.numero_caracteres(nomeProduto[i])< 15){
					se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 4){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"     |     "+valorProduto[i]+"0|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 5){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"     |     "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 6){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"     |    "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 7){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"     |   "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 8){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"     |  "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 9){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"     | "+valorProduto[i]+"|")
					}
				}senao se(tx.numero_caracteres(nomeProduto[i])< 16){
					se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 4){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"    |     "+valorProduto[i]+"0|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 5){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"    |     "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 6){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"    |    "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 7){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"    |   "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 8){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"    |  "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 9){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"    | "+valorProduto[i]+"|")
					}
				}senao se(tx.numero_caracteres(nomeProduto[i])< 17){
					se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 4){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"   |     "+valorProduto[i]+"0|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 5){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"   |     "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 6){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"   |    "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 7){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"   |   "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 8){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"   |  "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 9){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"   | "+valorProduto[i]+"|")
					}
				}senao se(tx.numero_caracteres(nomeProduto[i])< 18){
					se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 4){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"  |     "+valorProduto[i]+"0|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 5){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"  |     "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 6){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"  |    "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 7){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"  |   "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 8){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"  |  "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 9){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"  | "+valorProduto[i]+"|")
					}
				}senao se(tx.numero_caracteres(nomeProduto[i])< 19){
					se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 4){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+" |     "+valorProduto[i]+"0|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 5){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+" |     "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 6){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+" |    "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 7){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+" |   "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 8){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+" |  "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 9){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+" | "+valorProduto[i]+"|")
					}
				}senao se(tx.numero_caracteres(nomeProduto[i])< 20){
					se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 4){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"|     "+valorProduto[i]+"0|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 5){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"|     "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 6){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"|    "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 7){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"|   "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 8){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"|  "+valorProduto[i]+"|")
					}senao se(tx.numero_caracteres(ty.real_para_cadeia(valorProduto[i])) < 9){
						escreva("\n|   "+(i+1)+"  |  "+codigoProduto[i]+" 	| "+nomeProduto[i]+"| "+valorProduto[i]+"|")
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

	*/

	// FUNCIONALIDADE EM CONSTRUÇÃO
	/*funcao cadeia print_tax_receipt(){
		cadeia aux = +", "+
		retorne aux
	}*/
	
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

	//	Função da funcionalidade de vendas que acessa as databases e extrai os dados necessários
	funcao vazio databaseAccess(){
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
	}

	// FUNCIONALIDADE EM CONSTRUÇÃO
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

	// FUNCIONALIDADE EM CONSTRUÇÃO
	funcao inteiro withdrawStock(real retiradaEstoque, inteiro estoqueVenda){
		inteiro itemAddition = 1
		para(inteiro i = 0; i < itemAddition; i++){
			se(codigoProduto[i]==codigoV){
				escreva("|         Informe a quantidade           |\n")
				escreva("|: ")
					leia(retiradaEstoque)
				se(retiradaEstoque < 1){
					escreva("|         Informe a quantidade           |\n")
					escreva("| QUANTIDADE INVÁLIDA!!!                 |")
					escreva("| Informe uma quantia válida             |\n")
					escreva("|: ")
						leia(retiradaEstoque)
				}
				
				para(inteiro j = 0; j < itemAddition; j++){
					inteiro auxiliar = estoqueProduto[i] - retiradaEstoque 
					estoqueProduto[i] = auxiliar
					se(estoqueProduto[i] < 0){
						escreva("| Não foi possível realizar a adiçao do  |\n")
						escreva("| item! Quantidade solicitada insponível |\n| em estoque!")
						estoqueVenda = estoqueVenda
					}senao{
						estoqueVenda = estoqueProduto[i]
					}
					auxiliar = 0
				}
			}
		}retorne estoqueVenda
	}

	//	Função de verificação da existencia da DB de venda ao reiniciar o sistema
	funcao vazio fileExist(){
		logico fileExist = arc.arquivo_existe(salesInformation)
		enquanto(fileExist == verdadeiro){
						clientValue++
						clientName = salesDBDirectory + "Cliente" + clientValue
						salesInformation = clientName + "/salesInformation"+clientValue+".txt"
						fileExist = arc.arquivo_existe(salesInformation)
		}
	}

	//	Função para obter a data e hora da venda
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

}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 8005; 
 * @DOBRAMENTO-CODIGO = [218, 223, 229, 234, 239, 247, 255, 268, 280, 289, 298, 307, 317, 606, 632, 639, 682, 694, 726, 737];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {estoqueProduto, 12, 9, 14}-{auxiliar, 711, 13, 8};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */