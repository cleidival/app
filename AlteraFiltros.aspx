<%@ Page language="c#" Inherits="Nico" CodeFile="AlteraFiltros.aspx.cs" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">

    <title>CF SISTEMAS - NICO</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/navbar.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>'
    <![endif]-->
	<style>
  
	.group-text{border: 1px solid #ccc; padding: 5px; border-radius:10px; background: #f1f1f1;}		
	.resultados{margin-top: 100px;font-size: 10pt;}
	#txtPesquisaClasse{text-transform:uppercase; }
	.lista-classes tbody>tr{cursor: pointer;}
	.table tr{cursor: pointer;}
	/*#filtrosAtuais{width: 450px; padding: 0px; display: block; float: left;}*/
	/*#filtrosNovos{width: 450px; padding: 0px; display: block; float: left;}*/
	.bgCinza{background: #f1f1f1; padding: 0px 20px;}
	.red{color: red;}
	#resultadoAlteracaoFiltros{display: block; width: auto; height:500px; background: #f1f1f1; border: 1px solid #ccc; overflow: auto;}
	.group-text{border: 1px solid #ccc; padding: 5px;border-radius:10px; background: #f1f1f1;}
	.msgProcessando{background: #1A1A1A url('img/loading.gif') no-repeat center; display: none; text-align: center; font-size: 14pt; color: #fff; height: 300px; line-height: 300px;}
	.msgResultado{display: none; text-align: center; font-size: 14pt; background: #5cb85c; color: #fff; z-index: 999;}
	.status{text-align: center; display: none; font-size: 14pt; }
	.success{color: #090;}
    .error{color: #900;}
    .verNovoNome{display: none;}
    .txt_nome_resultado{width: 500px;}
    td.filtro{width: 200px;}
    td.descricao_filtro{width: 400px;}
    #btnConfirmarAlteracaoFiltros{display: none;}
    .btnGreen{color: #009900; visibility: hidden;}
    .cinza{color: #ccc;}
    .vermelho{color: #cc0000;}
    .preto{color: #000;}
    
    .btnBoxNav{color: #000;}
    .btnAlterarProduto, .btnSalvarProduto, .input_edit{display: none;}
    .btnAlterarProduto{display: block;}
    .input_edit{margin: 0px; padding: 0px; border: none; background: #fff; border-left: 1px solid #333; border-bottom: 1px solid #333;}
	*{font-size: 9pt;}
	</style>
  </head>

  <body>

    
  <div class="container-fluid">

    <!-- #include file="Menu.aspx" -->
      
    <!--<div class="container">-->
      <!-- Main component for a primary marketing message or call to action -->
     <div class="row-fluid">
        
        <h3>Altera Filtros</h3>

        <div class="well">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
          <li role="presentation" class="active"><a href="#tab_filtros_iniciais" aria-controls="tab_filtros_iniciais" role="tab" data-toggle="tab">Filtros Iniciais</a></li>
          
          <li role="presentation"><a href="#tab_novos_filtros_resultados" aria-controls="tab_novos_filtros_resultados" role="tab" data-toggle="tab">Novos Filtros</a></li>
          <li role="presentation"><a href="#tab_filtros_resultados" aria-controls="tab_filtros_resultados" role="tab" data-toggle="tab">Resultados</a></li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
          <div role="tabpanel" class="tab-pane active" id="tab_filtros_iniciais">

<div id="filtrosAtuais">        
    <p><b>&raquo;</b>&nbsp;Aqui são definidos os filtros iniciais para realizar as alterações necessárias.</p>
        <form>
      <table class="table">            
            <tbody>
              <!-- INICIO CLASSE -->
              <tr class="active">
                <td class="filtro">                    
                    <label for="txtCodigoClasses">Classe</label>
                    <div class="input-group">
              <input type="text" class="form-control" id="txtCodigoClasses" name="txtCodigoClasses">    
              <div class="input-group-btn">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalClasses">
                  <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>     
              </div>
            </div>      
            <!-- Modal -->            
                    <div style="width:auto;" class="modal fade" id="modalClasses" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Classes</h4>
                          </div>                          
                          <div class="input-group well">
                      <input type="text" class="form-control txtPesquisa" alt="lista-Classes" name="txtPesquisaClasses">    
                      <div class="input-group-btn">
                        <button type="button" class="btn btn-primary" >
                          <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>     
                      </div>
                    </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Classes",""); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
        </td>
                <td class="descricao_filtro"><p>&nbsp;</p><span class="resultados" id="nomeClasses"></span></td>                
              
              <!-- FIM CLASSE -->
              
              <!-- INICIO SUBCLASSE -->
              
                <td class="filtro">                    
                    <label for="txtCodigoSubclasses">Subclasse</label>
                    <div class="input-group">
              <input type="text" class="form-control" id="txtCodigoSubclasses" name="txtCodigoSubclasses">    
              <div class="input-group-btn">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalSubclasses">
                  <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>     
              </div>
            </div>      
            <!-- Modal -->            
                    <div style="width:auto;" class="modal fade" id="modalSubclasses" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Subclasses</h4>
                          </div>                          
                          <div class="input-group well">
                      <input type="text" class="form-control txtPesquisa" alt="lista-Subclasses" name="txtPesquisaSubclasses">    
                      <div class="input-group-btn">
                        <button type="button" class="btn btn-primary" >
                          <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>     
                      </div>
                    </div>                           
                          <div class="modal-body">
                                <% listaFiltros("Subclasses", ""); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
        </td>
                <td class="descricao_filtro"><p>&nbsp;</p><span class="resultados" id="nomeSubclasses"></span></td>                
              </tr>
               <!-- FIM SUBCLASSE -->
               
               <!-- INICIO GRUPO -->
                <tr class="active">
                <td class="filtro">                    
                    <label for="txtCodigoGrupos">Grupo</label>
                    <div class="input-group">
              <input type="text" class="form-control" id="txtCodigoGrupos" name="txtCodigoGrupos">    
              <div class="input-group-btn">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalGrupos">
                  <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>     
              </div>
            </div>      
            <!-- Modal -->            
                    <div style="width:auto;" class="modal fade" id="modalGrupos" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Grupos</h4>
                          </div>                          
                          <div class="input-group well">
                      <input type="text" class="form-control txtPesquisa" alt="lista-Grupos" name="txtPesquisaGrupos">    
                      <div class="input-group-btn">
                        <button type="button" class="btn btn-primary" >
                          <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>     
                      </div>
                    </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Grupos", ""); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
        </td>
                <td class="descricao_filtro"><p>&nbsp;</p><span class="resultados" id="nomeGrupos"></span></td>                
             
               <!-- FIM GRUPO -->
               
               <!-- INICIO FAMILIA -->
                <td class="filtro">                    
                    <label for="txtCodigoFamilias">Familias</label>
                    <div class="input-group">
              <input type="text" class="form-control" id="txtCodigoFamilias" name="txtCodigoFamilias">    
              <div class="input-group-btn">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalFamilias">
                  <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>     
              </div>
            </div>      
            <!-- Modal -->            
                    <div style="width:auto;" class="modal fade" id="modalFamilias" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Familias</h4>
                          </div>                          
                          <div class="input-group well">
                      <input type="text" class="form-control txtPesquisa" alt="lista-Familias" id="txtPesquisaFamilias" name="txtPesquisaFamilias">   
                      <div class="input-group-btn">
                        <button type="button" class="btn btn-primary" >
                          <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>     
                      </div>
                    </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Familias", ""); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
        </td>
                <td class="descricao_filtro"><p>&nbsp;</p><span class="resultados" id="nomeFamilias"></span></td>                
              </tr>
               <!-- FIM FAMILIA -->
               
               <!-- INICIO PESQUISA 1-->
                <tr class="active">
                <td class="filtro">                    
                    <label for="txtCodigoPesquisa_1">Pesquisa_1</label>
                    <div class="input-group">
              <input type="text" class="form-control" id="txtCodigoPesquisa_1" name="txtCodigoPesquisa_1">    
              <div class="input-group-btn">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalPesquisa_1">
                  <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>     
              </div>
            </div>      
            <!-- Modal -->            
                    <div style="width:auto;" class="modal fade" id="modalPesquisa_1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Pesquisa 1</h4>
                          </div>                          
                          <div class="input-group well">
                      <input type="text" class="form-control txtPesquisa" alt="lista-Pesquisa_1" id="Text6" name="txtPesquisaPesquisa_1">   
                      <div class="input-group-btn">
                        <button type="button" class="btn btn-primary" >
                          <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>     
                      </div>
                    </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Pesquisa_1", ""); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
        </td>
                <td class="descricao_filtro"><p>&nbsp;</p><span class="resultados" id="nomePesquisa_1"></span></td>                
              
               <!-- FIM PESQUISA 2 -->
               
               <!-- INICIO PESQUISA 2 -->
              
                <td  class="filtro">                    
                    <label for="txtCodigoPesquisa_2">Pesquisa_2</label>
                    <div class="input-group">
              <input type="text" class="form-control" id="txtCodigoPesquisa_2" name="txtCodigoPesquisa_2">    
              <div class="input-group-btn">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalPesquisa_2">
                  <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>     
              </div>
            </div>      
            <!-- Modal -->            
                    <div style="width:auto;" class="modal fade" id="modalPesquisa_2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Pesquisa 2</h4>
                          </div>                          
                          <div class="input-group well">
                      <input type="text" class="form-control txtPesquisa" alt="lista-Pesquisa_2" id="Text8" name="txtPesquisaPesquisa_2">   
                      <div class="input-group-btn">
                        <button type="button" class="btn btn-primary" >
                          <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>     
                      </div>
                    </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Pesquisa_2", ""); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
        </td>
                <td class="descricao_filtro"><p>&nbsp;</p><span class="resultados" id="nomePesquisa_2"></span></td>                
              </tr>
               <!-- FIM PESQUISA 2 -->
               
               <!-- INICIO PESQUISA 3 -->
                <tr class="active">
                <td>                    
                    <label for="txtCodigoPesquisa_3">Pesquisa_3</label>
                    <div class="input-group">
              <input type="text" class="form-control" id="txtCodigoPesquisa_3" name="txtCodigoPesquisa_3">    
              <div class="input-group-btn">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalPesquisa_3">
                  <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>     
              </div>
            </div>      
            <!-- Modal -->            
                    <div style="width:auto;" class="modal fade" id="modalPesquisa_3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Pesquisa 3</h4>
                          </div>                          
                          <div class="input-group well">
                      <input type="text" class="form-control txtPesquisa" alt="lista-Pesquisa_3" id="txtPesquisaPesquisa_3" name="txtPesquisaPesquisa_3">   
                      <div class="input-group-btn">
                        <button type="button" class="btn btn-primary" >
                          <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>     
                      </div>
                    </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Pesquisa_3", ""); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
        </td>
                <td class="descricao_filtro"><p>&nbsp;</p><span class="resultados" id="nomePesquisa_3"></span></td>                
              
               <!-- FIM PESQUISA 3 -->
               
               <!-- INICIO FABRICANTE -->
              
                <td >                    
                    <label for="txtCodigoFabricantes">Fabricante</label>
                    <div class="input-group">
              <input type="text" class="form-control" id="txtCodigoFabricantes" name="txtCodigoFabricantes">    
              <div class="input-group-btn">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalFabricantes">
                  <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>     
              </div>
            </div>      
            <!-- Modal -->            
                    <div style="width:auto;" class="modal fade" id="modalFabricantes" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Fabricantes</h4>
                          </div>                          
                          <div class="input-group well">
                      <input type="text" class="form-control txtPesquisa" alt="lista-Fabricantes" id="txtPesquisaFabricantes" name="txtPesquisaFabricantes">    
                      <div class="input-group-btn">
                        <button type="button" class="btn btn-primary" >
                          <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>     
                      </div>
                    </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Fabricantes", ""); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
        </td>
                <td class="descricao_filtro"><p>&nbsp;</p><span class="resultados" id="nomeFabricantes"></span></td>                
              </tr>
               <!-- FIM FABRICANTE -->
               
               
               
               <!-- INICIO NCM -->
                <tr class="active">
                <td  class="filtro">                    
                    <label for="txtCodigoNCM">NCM</label>
                    <div class="input-group">
              <input type="text" class="form-control" id="txtCodigoNCM" name="txtCodigoNCM">    
              <div class="input-group-btn">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalNCM">
                  <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>     
              </div>
            </div>      
            <!-- Modal -->            
                    <div style="width:auto;" class="modal fade" id="modalNCM" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>NCM</h4>
                          </div>                          
                          <div class="input-group well">
                      <input type="text" class="form-control txtPesquisa" alt="lista-NCM" id="Text18" name="txtPesquisaLocalizacoes">   
                      <div class="input-group-btn">
                        <button type="button" class="btn btn-primary" >
                          <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>     
                      </div>
                    </div>                           
                          <div class="modal-body">
                            <% listaFiltros("NCM", ""); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
        </td>
                <td class="descricao_filtro" colspan="3"><p>&nbsp;</p><span class="resultados" id="nomeNCM"></span></td>                
              </tr>
               <!-- FIM NCM --> 

               <!-- INICIO CLASSE IMPOSTO SAIDA -->
                <tr class="active">
                <td>                    
                    <label for="txtCodigoClasseImpostoSaida">C. Imposto Saidas</label>
                    <div class="input-group">
              <input type="text" class="form-control" id="txtCodigoClasseImpostoSaida" name="txtCodigoClasseImpostoSaida">    
              <div class="input-group-btn">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalClasseImpostoSaida">
                  <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>     
              </div>
            </div>      
            <!-- Modal -->            
                    <div style="width:auto;" class="modal fade" id="modalClasseImpostoSaida" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Classe Imposto Saidas</h4>
                          </div>                          
                          <div class="input-group well">
                      <input type="text" class="form-control txtPesquisa" alt="lista-ClasseImpostoSaida" id="txtPesquisaClasseImpostoSaida" name="txtPesquisaClasseImpostoSaida">   
                      <div class="input-group-btn">
                        <button type="button" class="btn btn-primary" >
                          <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>     
                      </div>
                    </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Classe_Imposto-S", ""); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
        </td>
                <td class="descricao_filtro"><p>&nbsp;</p><span class="resultados" id="nomeClasse_Imposto-S"></span></td>                
              
               <!-- FIM NCM --> 

               <!-- INICIO NCM -->
              
                <td class="filtro">                    
                    <label for="txtCodigoClasse_Imposto-E">C. Imposto Entrada</label>
                    <div class="input-group">
              <input type="text" class="form-control" id="txtCodigoClasse_Imposto-E" name="txtCodigoClasse_Imposto-E">    
              <div class="input-group-btn">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalClasse_Imposto-E">
                  <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>     
              </div>
            </div>      
            <!-- Modal -->            
                    <div style="width:auto;" class="modal fade" id="modalClasse_Imposto-E" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Classe Imposto Entrada</h4>
                          </div>                          
                          <div class="input-group well">
                      <input type="text" class="form-control txtPesquisa" alt="lista-Classe_Imposto-E" id="txtPesquisaClasse_Imposto-E" name="txtPesquisaClasse_Imposto-E">   
                      <div class="input-group-btn">
                        <button type="button" class="btn btn-primary" >
                          <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>     
                      </div>
                    </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Classe_Imposto-E", ""); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
        </td>
                <td class="descricao_filtro"><p>&nbsp;</p><span class="resultados" id="nomeClasse_Imposto-E"></span></td>                
              </tr>
               <!-- FIM NCM -->               
               
               <!-- INICIO DESCRICAO -->               
               <tr class="active">
                <td colspan="4">                    
                    <div class="row">
						<div class="col-sm-6 col-md-6 col-lg-6 col-xl-6">
							<label>Descrição 1</label><input type="text" class="form-control" id="txtDescricao1" name="txtDescricao1">
						</div>
						<div class="col-sm-6 col-md-6 col-lg-6 col-xl-6">
							<label>Descrição 2</label><input type="text" class="form-control" id="txtDescricao2" name="txtDescricao2">
						</div>            
					</div>
              </td>               
              </tr>
              <tr>
                <td colspan="4">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="cbxIncluirInativos" id="cbxIncluirInativos"> Incluir Inativos
                    </label>
                  </div>
                </td>
              </tr>
              <!-- FIM DESCRICAO -->
                        
       </tbody>
          </table> 
           <!--<div class="row bgCinza">            
            <button class="btn btn-primary" id="btnProcessarSolicitacao"><span class="glyphicon glyphicon-transfer" aria-hidden="true"></span>&nbsp;Processar</button>            
            <button type="button" class="btn btn-danger" id="btnLimparCampos">
              <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span> LIMPAR CAMPOS
            </button>
           </div>
    -->
            </form>          
            </div>
          </div>


<!-- ********************************************************************************************************************************************** -->          

          <div role="tabpanel" class="tab-pane" id="tab_filtros_resultados">
            <div id="resultadoAlteracaoFiltros">
              <div class='table-responsive'>
                <table id="resultadosProdutos" class='table table-hover table-striped lista-ConfirmacaoProdutos'>
                    <thead>
                    <tr>
                    <th colspan="2"><input type='checkbox' name='codigo_todos' id='codigo_todos' Value='seleciona_todos' checked='checkbox'></th>
                    <th>CODIGO</th>
                    <th>ADICIONAL</th>
                    <th>NOME</th>
                    <th>FABRICANTE</th>
                    <th>COMPRA</th>
                    <th>AVISTA</th>                    
                    <th>INATIVO</th>
                    <th>ESTOQUE</th>
                    <!--<th>MIN</th>
                    <th>MAX</th>-->
                    <th>CLASSE</th>
                    <th>SUBCLASSE</th>
                    <th>GRUPO</th>
                    <th>FAMILIA</th>
                    <th>PESQUISA1</th>
                    <th>PESQUISA2</th>
                    <th>PESQUISA3</th></tr>
                    </thead>
                    <tbody>                                          
                    </tbody>
                </table>                
              </div>
            </div>
           
          </div>



<!-- ********************************************************************************************************************************************** -->


          <div role="tabpanel" class="tab-pane" id="tab_novos_filtros_resultados">
            <div id="ConfirmarResultadoAlteracaoFiltros">
                  <div id="filtrosNovos">        
        <form>
      <table class="table">            
            <tbody>
              <!-- INICIO CLASSE -->
              <tr class="active">
                <td class="filtro">                   
                    <label for="txtCodigoNovoClasses">Classe</label>
                    <div class="input-group">
              <input type="text" class="form-control" id="txtCodigoNovoClasses" name="txtCodigoNovoClasses">    
              <div class="input-group-btn">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalNovoClasses">
                  <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>     
              </div>
            </div>      
            <!-- Modal -->            
                    <div style="width:auto;" class="modal fade" id="modalNovoClasses" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Classes</h4>
                          </div>                          
                          <div class="input-group well">
                      <input type="text" class="form-control txtPesquisa" alt="lista-NovoClasses" name="txtPesquisaClasses">    
                      <div class="input-group-btn">
                        <button type="button" class="btn btn-primary" >
                          <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>     
                      </div>
                    </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Classes","Novo"); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
        </td>
                <td><p>&nbsp;</p><span class="resultados" id="nomeNovoClasses"></span></td>                
              
              <!-- FIM CLASSE -->
              
              <!-- INICIO SUBCLASSE -->
              
                <td class="filtro">                   
                    <label for="txtCodigoNovoSubclasses">Subclasse</label>
                    <div class="input-group">
              <input type="text" class="form-control" id="txtCodigoNovoSubclasses" name="txtCodigoSubclasses">    
              <div class="input-group-btn">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalNovoSubclasses">
                  <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>     
              </div>
            </div>      
            <!-- Modal -->            
                    <div style="width:auto;" class="modal fade" id="modalNovoSubclasses" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Subclasses</h4>
                          </div>                          
                          <div class="input-group well">
                      <input type="text" class="form-control txtPesquisa" alt="lista-NovoSubclasses" name="txtPesquisaSubclasses">    
                      <div class="input-group-btn">
                        <button type="button" class="btn btn-primary" >
                          <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>     
                      </div>
                    </div>                           
                          <div class="modal-body">
                                <% listaFiltros("Subclasses", "Novo"); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
        </td>
                <td><p>&nbsp;</p><span class="resultados" id="nomeNovoSubclasses"></span></td>                
              </tr>
               <!-- FIM SUBCLASSE -->
               
               <!-- INICIO GRUPO -->
                <tr class="active">
                <td class="filtro">                  
                    <label for="txtCodigoNovoGrupos">Grupo</label>
                    <div class="input-group">
              <input type="text" class="form-control" id="txtCodigoNovoGrupos" name="txtCodigoNovoGrupos">    
              <div class="input-group-btn">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalNovoGrupos">
                  <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>     
              </div>
            </div>      
            <!-- Modal -->            
                    <div style="width:auto;" class="modal fade" id="modalNovoGrupos" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Grupos</h4>
                          </div>                          
                          <div class="input-group well">
                      <input type="text" class="form-control txtPesquisa" alt="lista-NovoGrupos" name="txtPesquisaGrupos">    
                      <div class="input-group-btn">
                        <button type="button" class="btn btn-primary" >
                          <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>     
                      </div>
                    </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Grupos", "Novo"); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
        </td>
                <td><p>&nbsp;</p><span class="resultados" id="nomeNovoGrupos"></span></td>                
              
               <!-- FIM GRUPO -->
               
               <!-- INICIO FAMILIA -->
              
               <td class="filtro">                     
                    <label for="txtCodigoNovoFamilias">Familias</label>
                    <div class="input-group">
              <input type="text" class="form-control" id="txtCodigoNovoFamilias" name="txtCodigoNovoFamilias">    
              <div class="input-group-btn">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalNovoFamilias">
                  <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>     
              </div>
            </div>      
            <!-- Modal -->            
                    <div style="width:auto;" class="modal fade" id="modalNovoFamilias" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Familias</h4>
                          </div>                          
                          <div class="input-group well">
                      <input type="text" class="form-control txtPesquisa" alt="lista-NovoFamilias" id="Text5" name="txtPesquisaFamilias">   
                      <div class="input-group-btn">
                        <button type="button" class="btn btn-primary" >
                          <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>     
                      </div>
                    </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Familias", "Novo"); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
        </td>
                <td><p>&nbsp;</p><span class="resultados" id="nomeNovoFamilias"></span></td>                
              </tr>
               <!-- FIM FAMILIA -->
               
               <!-- INICIO PESQUISA 1-->
                <tr class="active">
                <td class="filtro">                      
                    <label for="txtCodigoNovoPesquisa_1">Pesquisa_1</label>
                    <div class="input-group">
              <input type="text" class="form-control" id="txtCodigoNovoPesquisa_1" name="txtCodigoNovoPesquisa_1">    
              <div class="input-group-btn">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalNovoPesquisa_1">
                  <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>     
              </div>
            </div>      
            <!-- Modal -->            
                    <div style="width:auto;" class="modal fade" id="modalNovoPesquisa_1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Pesquisa 1</h4>
                          </div>                          
                          <div class="input-group well">
                      <input type="text" class="form-control txtPesquisa" alt="lista-NovoPesquisa_1" id="Text9" name="txtPesquisaPesquisa_1">   
                      <div class="input-group-btn">
                        <button type="button" class="btn btn-primary" >
                          <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>     
                      </div>
                    </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Pesquisa_1", "Novo"); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
        </td>
                <td><p>&nbsp;</p><span class="resultados" id="nomeNovoPesquisa_1"></span></td>                
              
               <!-- FIM PESQUISA 2 -->
               
               <!-- INICIO PESQUISA 2 -->
              
                <td class="filtro">                     
                    <label for="txtCodigoNovoPesquisa_2">Pesquisa_2</label>
                    <div class="input-group">                    
              <input type="text" class="form-control" id="txtCodigoNovoPesquisa_2" name="txtCodigoNovoPesquisa_2">    
              <div class="input-group-btn">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalNovoPesquisa_2">
                  <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>     
              </div>
            </div>      
            <!-- Modal -->            
                    <div style="width:auto;" class="modal fade" id="modalNovoPesquisa_2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Pesquisa 2</h4>
                          </div>                          
                          <div class="input-group well">
                      <input type="text" class="form-control txtPesquisa" alt="lista-NovoPesquisa_2" id="Text11" name="txtPesquisaPesquisa_2">    
                      <div class="input-group-btn">
                        <button type="button" class="btn btn-primary" >
                          <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>     
                      </div>
                    </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Pesquisa_2", "Novo"); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
        </td>
                <td><p>&nbsp;</p><span class="resultados" id="nomeNovoPesquisa_2"></span></td>                
              </tr>
               <!-- FIM PESQUISA 2 -->
               
               <!-- INICIO PESQUISA 3 -->
                <tr class="active">
                <td class="filtro">                      
                    <label for="txtCodigoNovoPesquisa_3">Pesquisa_3</label>
                    <div class="input-group">
              <input type="text" class="form-control" id="txtCodigoNovoPesquisa_3" name="txtCodigoNovoPesquisa_3">    
              <div class="input-group-btn">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalNovoPesquisa_3">
                  <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>     
              </div>
            </div>      
            <!-- Modal -->            
                    <div style="width:auto;" class="modal fade" id="modalNovoPesquisa_3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Pesquisa 3</h4>
                          </div>                          
                          <div class="input-group well">
                      <input type="text" class="form-control txtPesquisa" alt="lista-NovoPesquisa_3" id="Text13" name="txtPesquisaPesquisa_3">    
                      <div class="input-group-btn">
                        <button type="button" class="btn btn-primary" >
                          <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>     
                      </div>
                    </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Pesquisa_3", "Novo"); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
        </td>
                <td><p>&nbsp;</p><span class="resultados" id="nomeNovoPesquisa_3"></span></td>                
              
               <!-- FIM PESQUISA 3 -->
               
               <!-- INICIO FABRICANTE -->
              
                <td class="filtro">                      
                    <label for="txtCodigoNovoFabricantes">Fabricante</label>
                    <div class="input-group">
              <input type="text" class="form-control" id="txtCodigoNovoFabricantes" name="txtCodigoNovoFabricantes">    
              <div class="input-group-btn">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalNovoFabricantes">
                  <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>     
              </div>
            </div>      
            <!-- Modal -->            
                    <div style="width:auto;" class="modal fade" id="modalNovoFabricantes" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Fabricantes</h4>
                          </div>                          
                          <div class="input-group well">
                      <input type="text" class="form-control txtPesquisa" alt="lista-NovoFabricantes" id="Text15" name="txtPesquisaFabricantes">    
                      <div class="input-group-btn">
                        <button type="button" class="btn btn-primary" >
                          <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>     
                      </div>
                    </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Fabricantes", "Novo"); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
        </td>
                <td><p>&nbsp;</p><span class="resultados" id="nomeNovoFabricantes"></span></td>                
              </tr>
               <!-- FIM FABRICANTE -->
               
               
               <!-- FIM NCM -->
               <!-- INICIO NCM -->
                <tr class="active">
                <td class="filtro">                      
                    <label for="txtCodigoNovoNCM">NCM</label>
                    <div class="input-group">
              <input type="text" class="form-control" id="txtCodigoNovoNCM" name="txtCodigoNovoNCM">    
              <div class="input-group-btn">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalNovoNCM">
                  <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>     
              </div>
            </div>      
            <!-- Modal -->            
                    <div style="width:auto;" class="modal fade" id="modalNovoNCM" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>NCM 2</h4>
                          </div>                          
                          <div class="input-group well">
                      <input type="text" class="form-control txtPesquisa" alt="lista-NovoNCM" id="Text20" name="txtPesquisaLocalizacoes">   
                      <div class="input-group-btn">
                        <button type="button" class="btn btn-primary" >
                          <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>     
                      </div>
                    </div>                           
                          <div class="modal-body">
                            <% listaFiltros("NCM", "Novo"); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
        </td>
                <td colspan="3"><p>&nbsp;</p><span class="resultados" id="nomeNovoNCM"></span></td>                
              </tr>
               <!-- FIM LOCALIZACAO --> 

               <!-- INICIO classe imposto de saida -->
                <tr class="active">
                <td class="filtro">                      
                    <label for="txtNovoCodigoClasseImpostoSaida">C. Imposto Saidas</label>
                    <div class="input-group">
              <input type="text" class="form-control" id="txtNovoCodigoClasseImpostoSaida" name="txtNovoCodigoClasseImpostoSaida">    
              <div class="input-group-btn">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalNovoCodigoClasseImpostoSaida">
                  <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>     
              </div>
            </div>      
            <!-- Modal -->            
                    <div style="width:auto;" class="modal fade" id="modalNovoCodigoClasseImpostoSaida" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Classe Imposto Saidas</h4>
                          </div>                          
                          <div class="input-group well">
                      <input type="text" class="form-control txtPesquisa" alt="lista-NovoClasseImpostoSaida" id="Text18" name="txtPesquisaLocalizacoes">    
                      <div class="input-group-btn">
                        <button type="button" class="btn btn-primary" >
                          <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>     
                      </div>
                    </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Classe_Imposto-S", ""); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
        </td>
                <td><p>&nbsp;</p><span class="resultados" id="nomeNCM"></span></td>                
              
               <!-- FIM NCM --> 

               <!-- INICIO NCM -->
              
                <td class="filtro">                     
                    <label for="txtCodigoNCM">C. Imposto Entrada</label>
                    <div class="input-group">
              <input type="text" class="form-control" id="txtCodigoNCM" name="txtCodigoNCM">    
              <div class="input-group-btn">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalNCM">
                  <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>     
              </div>
            </div>      
            <!-- Modal -->            
                    <div style="width:auto;" class="modal fade" id="modalNCM" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Classe Imposto Entrada</h4>
                          </div>                          
                          <div class="input-group well">
                      <input type="text" class="form-control txtPesquisa" alt="lista-NCM" id="Text18" name="txtPesquisaLocalizacoes">   
                      <div class="input-group-btn">
                        <button type="button" class="btn btn-primary" >
                          <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>     
                      </div>
                    </div>                           
                          <div class="modal-body">
                            <% listaFiltros("Classe_Imposto-E", ""); %>
                          </div>                          
                        </div>
                      </div>
                    </div>
                    <!--Fim Modal-->
        </td>
                <td><p>&nbsp;</p><span class="resultados" id="nomeNCM"></span></td>                
              </tr>              
               <!-- FIM NCM --> 

               <tr>

                <td colspan="2">
                  <div class="">
                      <label>ESTOQUE MINIMO</label><input type="text" class="form-control" id="txtEstoqueMinimo" name="txtEstoqueMinimo">
                  </div>
                </td>
                <td colspan="2">
                  <div>
                    <label>ESTOQUE IDEAL</label><input type="text" class="form-control" id="txtEstoqueIdeal" name="txtEstoqueIdeal">
                  </div>
                </td>

                </tr>
      </tbody>
          </table> 
            </form>          
            </div>
            </div>            
          </div>        
        </div>

      </div>

      <div id="barra_navegacao">
        <button type="button" class="btn btn-default" id="btnVoltarTabFiltros">
          <span class="glyphicon glyphicon-confirm" aria-hidden="true"></span> &laquo; VOLTAR 
        </button>
        <button type="button" class="btn btn-primary" id="btnProximoTabFiltros">
          <span class="glyphicon glyphicon-confirm" aria-hidden="true"></span> PROXIMO &raquo;
        </button>
        <button type="button" class="btn btn-success" id="btnConfirmarAlteracaoFiltros">
          <span class="glyphicon glyphicon-confirm" aria-hidden="true"></span> CONFIRMAR
        </button>
        <button type="button" class="btn btn-danger" id="btnLimparCampos">
          <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span> LIMPAR CAMPOS
        </button>
      </div>

      </div>      
    </div>    
  </div>

 
<!-- 
**********************************************************************************************************************************************

incio da coluna com nos filtros

**********************************************************************************************************************************************
-->

		<!-- Modal reaultados alteracao filtros-->				    
                    <div style="width: auto;" class="modal fade" id="modalListaResultadosAlterarFiltros" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>RESULTADOS: PRODUTOS ALTERADOS</h4>
				<p class="red"><b>ATENÇÃO:</b> Para finalizar a alteração de <u>Filtros Analise</u> os produtos abaixo logo após lique em CONFIRMAR OU CANCELAR.</p>
                          </div>                          
                          <div class="modal-body">
                            <div id="resultadoAlteracaoFiltros">
                             
                            </div>
                          </div>                  
                          <div class="modal-footer">

				  <button type="button" class="btn btn-success" id="btnConfirmarAlteracaoFiltros">
					    <span class="glyphicon glyphicon-confirm" aria-hidden="true"></span> CONFIRMAR
				   </button>
				  <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>

                          </div>                                  
                        </div>
                      </div>
                    </div>
                    </div>
               <!--Fim Modal-->



               <!-- Modal reaultados produtos similares-->           
                    <div style="width: auto;" class="modal fade" id="modalListaProdutosSimilares" tabindex="-1" role="dialog" aria-labelledby="myModalListaProdutosSimilares" aria-hidden="true">
                    <div>
                      <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>PRODUTOS SIMILARES</h4>
                            <h3 id="listarNomeProdutoOrigem"></h3>        
                          </div>                          
                          <div class="modal-body">
                            <div>
                              <table id="resultadoListaProdutosSimilares" class="table table-hover table-striped">
                                <thead>
                                <tr>                                
                                <th>CODIGO</th>
                                <th>ADICIONAL</th>
                                <th>NOME</th>                                
                                </thead>
                                <tbody>                                          
                                </tbody>
                              </table>
                            </div>
                          </div>                  
                          <div class="modal-footer">
          
          <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>

                          </div>                                  
                        </div>
                      </div>
                    </div>
                    </div>
               <!--Fim Modal-->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery.min.js"></script>

<script src="js/jquery.mask.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-datagrid.js"></script>
    <script src="js/main.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>

    <script type="text/javascript">

      //$(document).ready(function(){$('.preco').mask('000.000.000.000.000,00', {reverse: true});});

      $(".tab-content").tab('show');

      $( document ).on( "blur", "input.txt_nome_resultado", function() {
        console.log($(this).val());
        //console.log($(this).prev("td").prev("td").prev("td").("tete"));
      });
         

    
      $("#codigo_todos").click(function(){
        if($(":checked").val()=="seleciona_todos"){
            $(".lista-ConfirmacaoProdutos input").each(function(){
                $(this).prop("checked", true);
            });
            console.log("selecionou");
        }else{
            console.log("deselecionou");
           $(".lista-ConfirmacaoProdutos input").each(function(){
                $(this).prop("checked", false);
            });
        }
    });

      $( document ).on( "click", ".codigo_produtos", function(e) {
          
            $(".lista-ConfirmacaoProdutos input").each(function(){
                //$(this).prop("checked", true);
                if($(this).attr("checked")!="checked"){
                  $("#codigo_todos").prop("checked", false);
                }
            });            
        });


    
        var filial = $("#filialField").val();

        $("#filialField").change(function(){
            var url = "Caixa.aspx?filial="+$(this).val(); 
            if (url) { 
                window.location = url; 
            }
            return false;
        });


        $("#caixaField").change(function(){
           var url = "Caixa.aspx?filial="+filial+"&caixa="+$(this).val(); 
          if (url) { 
              window.location = url; 
          }
          return false;
        });
        
        /***
        Chama a funcao carregaNomeFiltro apos o cursor sair do campo atraves do evento 'BLUR'
        ***/  
        $("#txtCodigoClasses").blur(function(){carregaNomeFiltro("Classes","txtCodigoClasses","nomeClasses");});
        $("#txtCodigoSubclasses").blur(function(){carregaNomeFiltro("SubClasses","txtCodigoSubclasses","nomeSubclasses");});
        $("#txtCodigoGrupos").blur(function(){carregaNomeFiltro("Grupos","txtCodigoGrupos","nomeGrupos");});
        $("#txtCodigoFamilias").blur(function(){carregaNomeFiltro("Familias","txtCodigoFamilias","nomeFamilias");});
        $("#txtCodigoPesquisa_1").blur(function(){carregaNomeFiltro("Pesquisa_1","txtCodigoPesquisa_1","nomePesquisa_1");});
        $("#txtCodigoPesquisa_2").blur(function(){carregaNomeFiltro("Pesquisa_2","txtCodigoPesquisa_2","nomePesquisa_2");});
        $("#txtCodigoPesquisa_3").blur(function(){carregaNomeFiltro("Pesquisa_3","txtCodigoPesquisa_3","nomePesquisa_3");});
        $("#txtCodigoFabricantes").blur(function(){carregaNomeFiltro("Fabricantes","txtCodigoFabricantes","nomeFabricantes");});
        //$("#txtCodigoLocalizacoes").blur(function(){carregaNomeFiltro("Localizacoes","txtCodigoLocalizacoes","nomeLocalizacoes");});
        $("#txtCodigoNCM").blur(function(){carregaNomeFiltro("NCM","txtCodigoNCM","nomeNCM");});
        $("#txtCodigoClasseImpostoSaida").blur(function(){carregaNomeFiltro("Classe_Imposto","txtCodigoClasseImpostoSaida","nomeClasse_Imposto-S");});
        $("#txtCodigoClasseImpostoEntrada").blur(function(){carregaNomeFiltro("Classe_Imposto","txtCodigoClasseImpostoEntrada","nomeClasse_Imposto-E");});
        


        $("#txtCodigoNovoClasses").blur(function(){carregaNomeFiltro("Classes","txtCodigoNovoClasses","nomeNovoClasses");});
        $("#txtCodigoNovoSubclasses").blur(function(){carregaNomeFiltro("Subclasses","txtCodigoNovoSubclasses","nomeNovoSubclasses");});
        $("#txtCodigoNovoGrupos").blur(function(){carregaNomeFiltro("Grupos","txtCodigoNovoGrupos","nomeNovoGrupos");});
        $("#txtCodigoNovoFamilias").blur(function(){carregaNomeFiltro("Familias","txtCodigoNovoFamilias","nomeNovoFamilias");});
        $("#txtCodigoNovoPesquisa_1").blur(function(){carregaNomeFiltro("Pesquisa_1","txtCodigoNovoPesquisa_1","nomeNovoPesquisa_1");});
        $("#txtCodigoNovoPesquisa_2").blur(function(){carregaNomeFiltro("Pesquisa_2","txtCodigoNovoPesquisa_2","nomeNovoPesquisa_2");});
        $("#txtCodigoNovoPesquisa_3").blur(function(){carregaNomeFiltro("Pesquisa_3","txtCodigoNovoPesquisa_3","nomeNovoPesquisa_3");});
        $("#txtCodigoNovoFabricantes").blur(function(){carregaNomeFiltro("Fabricantes","txtCodigoNovoFabricantes","nomeNovoFabricantes");});
        //$("#txtCodigoNovoLocalizacoes").blur(function(){carregaNomeFiltro("Localizacoes","txtCodigoNovoLocalizacoes","nomeNovoLocalizacoes");});
        $("#txtCodigoNovoNCM").blur(function(){carregaNomeFiltro("NCM","txtCodigoNovoNCM","nomeNovoNCM");});

        function carregaNomeFiltro(tabela, campo, destino, parametros){        
            $.ajax({
                url: "processa.aspx",
                data: {"Pagina":"AlterarFiltros","Objeto":tabela, "Acao":"consultarNomeFiltros", "Codigo":$('#'+campo).val(),"Parametros":parametros},
                success:function(data){ 
                	if(data!="NAO CADASTRADO"){
                		$('#'+destino).html(data);
                	}else{
                		$('#'+campo).val("");
                		$('#'+destino).html("");
                	}             
                }
            });        
        }


           
        $(".txtPesquisa").keyup(function(){
            var tabela = $(this).attr('alt');
            console.log("->"+tabela+" tbody>tr ->" + $(this).val());
            
            if($(this).val()!=""){
                $("."+tabela+" tbody>tr").hide();
                $("."+tabela+" td:contains('"+$(this).val().toUpperCase()+"')").parent("tr").show();
            }else{
                $("."+tabela+" tbody>tr").show();
            }            
        });
          
        $("table tr.codigoFiltro").click(function(e){  
            e.preventDefault();       
            var codigoNomeClasse = $(this).attr('value');
            var resultadoSplit = codigoNomeClasse.split(':');
            console.log(codigoNomeClasse+'\n'+resultadoSplit[0]+'\n'+resultadoSplit[1]+'\n'+resultadoSplit[2]+'\n resultado: '+"#txtCodigo"+resultadoSplit[2]);
            $("#txtCodigo"+resultadoSplit[2]).val(resultadoSplit[0]);
            $("#nome"+resultadoSplit[2]).html(resultadoSplit[1]);
            $("#modal"+resultadoSplit[2]).modal('hide');
        });
        
        $("table tr.codigoNovoFiltro").click(function(e){  
            e.preventDefault();       
            var codigoNomeClasse = $(this).attr('value');
            var resultadoSplit = codigoNomeClasse.split(':');
            console.log(codigoNomeClasse+'\n'+resultadoSplit[0]+'\n'+resultadoSplit[1]+'\n'+resultadoSplit[2]+'\n resultado: '+"#txtNovoCodigo"+resultadoSplit[2]);
            $("#txtCodigoNovo"+resultadoSplit[2]).val(resultadoSplit[0]);
            $("#nomeNovo"+resultadoSplit[2]).html(resultadoSplit[1]);
            $("#modalNovo"+resultadoSplit[2]).modal('hide');
        });

        function DesativarBotoesNavegacao(){
            $("#btnConfirmarAlteracaoFiltros").addClass('disabled');
            $("#btnVoltarTabFiltros").addClass('disabled');
            $("#btnProximoTabFiltros").addClass('disabled');
            $("#btnLimparCampos").addClass('disabled')
        }
        function AtivarBotoesNavegacao(){
            $("#btnConfirmarAlteracaoFiltros").removeClass('disabled');
            $("#btnVoltarTabFiltros").removeClass('disabled');
            $("#btnProximoTabFiltros").removeClass('disabled');
            $("#btnLimparCampos").removeClass('disabled');
        }

        $("#btnProximoTabFiltros").click(function(e){
            $('.nav-tabs > .active').next('li').find('a').trigger('click'); 
            console.log($('.nav-tabs > .active').find('a').attr('href'));
            
            if($('.nav-tabs > .active').find('a').attr('href')=='#tab_novos_filtros_resultados'){
              $("#btnConfirmarAlteracaoFiltros").hide();
              $("#btnConfirmarAlteracaoFiltros").removeClass('disabled');
            }
            if($('.nav-tabs > .active').find('a').attr('href')=='#tab_filtros_resultados'){
              processaSolicitacao();
              $("#btnConfirmarAlteracaoFiltros").show();
            } 
            e.preventDefault();
        });      
        $("#btnVoltarTabFiltros").click(function(e){
            $('.nav-tabs > .active').prev('li').find('a').trigger('click');            
            $("#btnConfirmarAlteracaoFiltros").hide();
            if($('.nav-tabs > .active').find('a').attr('href')=='#tab_filtros_iniciais'){              
              $("#btnConfirmarAlteracaoFiltros").hide();
            } 
            
            if($('.nav-tabs > .active').find('a').attr('href')=='#tab_novos_filtros_resultados'){
              $("#btnConfirmarAlteracaoFiltros").hide();
              $("#btnConfirmarAlteracaoFiltros").removeClass('disabled');
            }             
            e.preventDefault();
        });     

        //$("#btnProcessarSolicitacao").click(function(e){
        //    $('.nav-tabs > .active').next('li').find('a').trigger('click');            
        function processaSolicitacao(){
            //e.preventDefault();          	
      			var classe = $("#txtCodigoClasses").val();
      			var subclasse = $("#txtCodigoSubclasses").val();
      			var grupo = $("#txtCodigoGrupos").val();
      			var familia = $("#txtCodigoFamilias").val();
      			var pesquisa_1 = $("#txtCodigoPesquisa_1").val();
      			var pesquisa_2 = $("#txtCodigoPesquisa_2").val();
      			var pesquisa_3 = $("#txtCodigoPesquisa_3").val();
      			var fabricante = $("#txtCodigoFabricantes").val();      	  	
      			var NCM = $("#txtCodigoNCM").val();
      			var descricao1 = $("#txtDescricao1").val();
      			var descricao2 = $("#txtDescricao2").val();

      			var classeNovo = $("#txtCodigoNovoClasses").val();
      			var subclasseNovo = $("#txtCodigoNovoSubclasses").val();
      			var grupoNovo = $("#txtCodigoNovoGrupos").val();
      			var familiaNovo = $("#txtCodigoNovoFamilias").val();
      			var pesquisa_1Novo = $("#txtCodigoNovoPesquisa_1").val();
      			var pesquisa_2Novo = $("#txtCodigoNovoPesquisa_2").val();
      			var pesquisa_3Novo = $("#txtCodigoNovoPesquisa_3").val();
      			var fabricanteNovo = $("#txtCodigoNovoFabricantes").val();      	  	
      			var NCMNovo = $("#txtCodigoNovoNCM").val();
            var NovoNome = $("#txtNovoNome").val();

            var incluirInativos = ($("#cbxIncluirInativos").is(':checked')?"1":"0");

            console.log("icluir invativos: "+incluirInativos);
            

      			var processa = true; //false;
      			
            $("#resultadosProdutos tbody").empty();
	           
            if(processa){      
	            $.ajax({   
                  dataType: 'json',                                 
	                url: "Processa.aspx",
	                data:{"Pagina":"AlterarFiltros","Acao":"mostrarReultadosAlterarFiltros", "Classe":classe, "Subclasse":subclasse, "Grupo":grupo, "Familia":familia, "Pesquisa_1":pesquisa_1, "Pesquisa_2":pesquisa_2, "Pesquisa_3":pesquisa_3, "Fabricante":fabricante, "NCM":NCM, "Descricao1":descricao1, "Descricao2":descricao2, "Inativo":incluirInativos},
	                beforeSend:function(){
                    //$(".tab-content a[href='#tab_filtros_resultados']").tab('show');
	                	$("#resultadoAlteracaoFiltros").prepend("<div class='msgProcessando'>Aguarde enquanto processamos sua solicitacao...<span class='spanTimer'></span></div>");       
	                	$(".msgProcessando").show();					         	

						        //$("#modalListaResultadosAlterarFiltros").modal();					
	                },
	                success:function(data){
                    
                    $.each( data.items, function( item, produto ) {
		      //console.log(produto.nome);
                      $("#resultadosProdutos tbody").append("<tr>"+                        
                        "<td nowrap><input type='checkbox'  Value='"+produto.ordem+"' class='codigo_produtos' checked='checkbox'></td>"+
                        "<td><a href='#' class='btnBoxNav btnAlterarProduto glyphicon glyphicon glyphicon-edit'></a>"+
                        " <a href='#' class='btnBoxNav btnSalvarProduto glyphicon glyphicon-floppy-disk'></a>"+                       
                        "</td>"+
                        "<td nowrap>"+produto.codigo+"</td>"+
                        "<td nowrap><input type='text' class='txt_codigo_adicional1 input_edit' value=\""+produto.codigo_adicional1+"\" style='width:100px;'>"+
                        "<span class='sp_codigo_adicional1 span_edit'>"+produto.codigo_adicional1+"</span>"+
                        "</td>"+
                        //"<td nowrap width='30px'><a href='#' class='btnSalvarNomeProduto glyphicon glyphicon-floppy-disk'>&nbsp;</a></td>"+
                        "<td nowrap>"+
                        "<input type='text' class='txt_nome_resultado input_edit' value=\""+produto.nome+"\">"+                        
                        "<span class='span_edit sp_produto_nome'>"+produto.nome+"</span>"+
                        "</td>"+
                        "<td nowrap>"+produto.fabricante+"</td>"+
                        "<td nowrap>"+
                        "<input type='text' class='txt_produto_preco_compra input_edit preco' value=\""+produto.preco_compra+"\"  style='width:50px;'>"+
                        "<span class='span_edit sp_preco_compra'>"+produto.preco_compra+"</span>"+
                        "</td>"+
                        "<td nowrap>"+
                        "<input type='text' class='txt_produto_preco_avista input_edit preco' value=\""+produto.preco_avista+"\"  style='width:50px;'>"+
                        "<span class='span_edit sp_preco_avista'>"+produto.preco_avista+"</span>"+
                        "</td>"+
                        //"<td nowrap>"+produto.similar+"</td>"+
                        "<td nowrap>"+(produto.inativo=="True"?"<i class='glyphicon glyphicon-info-sign vermelho btnInativoAlterar'><i/>":"<i class='glyphicon glyphicon-info-sign cinza btnInativoAlterar'><i/>")+"</td>"+
                        
                        "<td nowrap style='text-align: right;'>"+produto.estoque+"</td>"+
                        //"<td nowrap style='text-align: right;'>"+produto.estoque_minimo+"</td>"+
                        //"<td nowrap style='text-align: right;'>"+produto.estoque_ideal+"</td>"+
                        "<td nowrap>"+produto.classe+"</td>"+
                        "<td nowrap>"+produto.subclasse+"</td>"+
                        "<td nowrap>"+produto.grupo+"</td>"+
                        "<td nowrap>"+produto.familia+"</td><td nowrap>"+produto.pesquisa1+"</td>"+
                        "<td nowrap>"+produto.pesquisa2+"</td>"+
                        "<td nowrap>"+produto.pesquisa3+"</td></tr>");
                    });
                    AtivarBotoesNavegacao();

						        $(".msgProcessando").hide();
	                },
	                error:function(data){
	                	console.log('erro:' + data);
	                }                
	            });
            }else{
	           	alert("Voce deve preencher pelo menos um FILTRO NOVO!");
	          }
        }

      $( document ).on( "click", ".produtos_similares", function(e) {
          //e.preventDefault(); 
                
          var checkbox = $('input:checkbox[name^=similares]:checked');
             //verifica se existem checkbox selecionados
          if(checkbox.length > 0){
                  //array para armazenar os valores
                  var produtos = [];
                  //fun��o each para pegar os selecionados
                  checkbox.each(function(){
                    produtos.push($(this).val());
                  });
                  //exibe no console o array com os valores selecionados
                  //console.log(produtos);
              } 
          var i = 0;
          var j = 0;
          var combinacao = [];
          for(i = 0; i < checkbox.length; i++){
            
            for(j = i;j<checkbox.length; j++){
              if((j+1)<checkbox.length){
                combinacao.push("{{i:"+i+"; j:"+j+" / "+produtos[i]+"-->"+produtos[j+1]+"}}");
                console.log("adicionar");
                apagarRelacaoProdutosSimilares(produtos[i], produtos[j+1]);
                adicionarRelacaoProdutosSimilares(produtos[i], produtos[j+1]);
              }
            }
          }
          console.log(combinacao);
    });
      function listarRelacaoProdutosSimilares(ordem_produto_origem, nome_produto_origem){        
        $.ajax({
                dataType: 'json',
                url: "processa.aspx",
                data: {"Pagina":"AlterarFiltros", "Acao":"listarRelacaoProdutosSimilares", "ordem_produto_origem":ordem_produto_origem},
                success:function(data){                                     
                  $("#resultadoListaProdutosSimilares tbody").empty();
                  $("#listarNomeProdutoOrigem").empty();
                  $("#listarNomeProdutoOrigem").text(nome_produto_origem);
                    $.each( data.items, function( item, produto ) {
                        $("#resultadoListaProdutosSimilares tbody").append("<tr>"+                        
                            "<td nowrap>"+produto.codigo+"</td>"+
                            "<td nowrap>"+produto.codigo_adicional1+"</td>"+                            
                            "<td nowrap>"+produto.nome+"</td>"+
                            "</tr>");
                    });
                }
            });   
        $("#modalListaProdutosSimilares").modal();        
      }
      function adicionarRelacaoProdutosSimilares(ordem_produto_origem, ordem_produto_similar){
        $.ajax({
                url: "processa.aspx",
                data: {"Pagina":"AlterarFiltros", "Acao":"adicionarRelacaoProdutosSimilares", "ordem_produto_origem":ordem_produto_origem,"ordem_produto_similar":ordem_produto_similar},
                success:function(data){ 
                  /*if(data!="SUCESSO"){
                    $('#'+destino).html(data);
                  }else{
                    $('#'+campo).val("");
                    $('#'+destino).html("");
                  } */            
                }
            });     
      }
      function apagarRelacaoProdutosSimilares(ordem_produto_origem, ordem_produto_similar){
        $.ajax({
                url: "processa.aspx",
                data: {"Pagina":"AlterarFiltros", "Acao":"apagarRelacaoProdutosSimilares", "ordem_produto_origem":ordem_produto_origem,"ordem_produto_similar":ordem_produto_similar},
                success:function(data){ 
                  /*if(data!="SUCESSO"){
                    $('#'+destino).html(data);
                  }else{
                    $('#'+campo).val("");
                    $('#'+destino).html("");
                  } */            
                }
            });     
      }

    $( document ).on( "click", "i.btnInativoAlterar", function(e) {
          e.preventDefault(); 
                
          console.log('Salvar');     

          //console.log($(this).parent().prev().prev().find('.codigo_produtos').val());
          var btnSalvar = $(this);
          var Codigo_produto = btnSalvar.parent().prev().prev().prev().prev().prev().prev().prev().prev().find('.codigo_produtos').val();
          var Nome_produto = btnSalvar.parent().prev().prev().prev().prev().find('.txt_nome_resultado').val();
          var inativo = btnSalvar.hasClass("vermelho")?"0":"1";
          btnSalvar.hasClass("vermelho")?btnSalvar.removeClass("vermelho").addClass("cinza"):btnSalvar.removeClass("cinza").addClass("vermelho");
          console.log('>>> ordem: '+Codigo_produto+'; nome: '+Nome_produto);          
          console.log(btnSalvar.hasClass("vermelho")?"vermelho":"cinza");
          
          /*
          var Codigo_produto = $(this).parent().prev().prev().find('.codigo_produtos').val();
          var Nome_produto = $(this).parent().next().find('.txt_nome_resultado').val();
          console.log('ordem: '+Codigo_produto+'; nome: '+Nome_produto);
          */
          $.ajax({
            url: "Processa.aspx",
            //data:{"Pagina":"AlterarFiltros", "Acao":"alterarProdutoInativo","Codigo_produto":Codigo_produto},
            data:{"Pagina":"AlterarFiltros", "Acao":"alterarProdutoInativo", "Codigo_produto":Codigo_produto, "inativo_produto":inativo},
            beforeSend:function(){
                  console.log("aguarde...");
              },
            success:function(data){
                console.log('processado: '+data);                 
              },
            error:function(data){console.log('erro: '+data);}
          });

        });

    

     $( document ).on( "click", "a.btnSalvarProduto", function(e) {   

          
           e.preventDefault(); 
          desativarEdicaoProdutos($(this));
          //console.log('Salvar ---- ');     

          //console.log($(this).parent().prev().prev().find('.codigo_produtos').val());
          var btnSalvar = $(this);
          btnSalvar.parent().parent().find('td').css({'font-weight':'bold'});

          var Codigo_produto = btnSalvar.parent().prev().find('.codigo_produtos').val();

          var Codigo_Adicional = btnSalvar.parent().next().next().find('.txt_codigo_adicional1').val();
          btnSalvar.parent().next().next().find('.sp_codigo_adicional1').text(Codigo_Adicional);
          
          var Nome_produto = btnSalvar.parent().next().next().next().find('.txt_nome_resultado').val();
          btnSalvar.parent().next().next().next().find('.sp_produto_nome').text(Nome_produto);

          var Preco_Compra = btnSalvar.parent().next().next().next().next().next().find('.txt_produto_preco_compra').val();
          btnSalvar.parent().next().next().next().next().next().find('.sp_preco_compra').text(Preco_Compra);

          var Preco_Avista = btnSalvar.parent().next().next().next().next().next().next().find('.txt_produto_preco_avista').val();
          btnSalvar.parent().next().next().next().next().next().next().find('.sp_preco_avista').text(Preco_Avista);



          /*
          var Codigo_produto = $(this).parent().prev().prev().find('.codigo_produtos').val();
          var Nome_produto = $(this).parent().next().find('.txt_nome_resultado').val();
          console.log('ordem: '+Codigo_produto+'; nome: '+Nome_produto);
          */
          console.log('codigo produto: '+Codigo_produto+'\n');
          console.log('codigo adicional: '+Codigo_Adicional+'\n');
          console.log('nome produto: '+Nome_produto +'\n');
          console.log('preco compra: '+Preco_Compra+'\n');
          console.log('preco avista: '+Preco_Avista+'\n');
          $.ajax({
            url: "Processa.aspx",
            data:{"Pagina":"AlterarFiltros", "Acao":"alterarDescricaoProdutos","Codigo_produto":Codigo_produto, "Codigo_Adicional":Codigo_Adicional, "Nome_produto":Nome_produto,"Preco_Compra":Preco_Compra, "Preco_Avista":Preco_Avista},
            beforeSend:function(){
                  console.log("aguarde...");
              },
            success:function(data){
                console.log('processado: '+data);                 
                btnSalvar.parent().next().find('.txt_nome_resultado').css('font-weight','bold');
                
              },
            error:function(data){console.log('erro: '+data);}
          });

        });


        $("#btnConfirmarAlteracaoFiltros").click(function(e){
      		e.preventDefault();  
			
    			var codigos_produtos = "";	            

      		$(".lista-ConfirmacaoProdutos input:checked").each(function(){	            
	            var elem = $(this);
	            if(codigos_produtos.length!=0){	            	
	            	codigos_produtos += ", '"+elem.val()+"'";	            
	            }else{
	            	codigos_produtos = "'"+elem.val()+"'";
	            }
	        });	 
	        console.log('lista de codigos: '+codigos_produtos);

    			var classe = $("#txtCodigoClasses").val();
    			var subclasse = $("#txtCodigoSubclasses").val();
    			var grupo = $("#txtCodigoGrupos").val();
    			var familia = $("#txtCodigoFamilias").val();
    			var pesquisa_1 = $("#txtCodigoPesquisa_1").val();
    			var pesquisa_2 = $("#txtCodigoPesquisa_2").val();
    			var pesquisa_3 = $("#txtCodigoPesquisa_3").val();
    			var fabricante = $("#txtCodigoFabricantes").val();      	  	
    			var NCM = $("#txtCodigoNCM").val();
    			var descricao1 = $("#txtDescricao1").val();
    			var descricao2 = $("#txtDescricao2").val();

    			var classeNovo = $("#txtCodigoNovoClasses").val();
    			var subclasseNovo = $("#txtCodigoNovoSubclasses").val();
    			var grupoNovo = $("#txtCodigoNovoGrupos").val();
    			var familiaNovo = $("#txtCodigoNovoFamilias").val();
    			var pesquisa_1Novo = $("#txtCodigoNovoPesquisa_1").val();
    			var pesquisa_2Novo = $("#txtCodigoNovoPesquisa_2").val();
    			var pesquisa_3Novo = $("#txtCodigoNovoPesquisa_3").val();
    			var fabricanteNovo = $("#txtCodigoNovoFabricantes").val();      	  	
    			var NCMNovo = $("#txtCodigoNovoNCM").val();      
          var NovoNome = $("#txtNovoNome").val();

          var incluirInativos = ($("#cbxIncluirInativos").is(':checked')?"1":"0");
          console.log("icluir invativos: "+incluirInativos);
        	
        	$.ajax({
        		url: "Processa.aspx",
        		data:{"Pagina":"AlterarFiltros", "Acao":"confirmarAlteracaoFiltros","Codigos_produtos":codigos_produtos, "Classe":classe, "Subclasse":subclasse, "Grupo":grupo, "Familia":familia, "Pesquisa_1":pesquisa_1, "Pesquisa_2":pesquisa_2, "Pesquisa_3":pesquisa_3, "Fabricante":fabricante, "NCM":NCM, "Descricao1":descricao1, "Descricao2":descricao2, "ClasseNovo":classeNovo, "SubclasseNovo":subclasseNovo, "GrupoNovo":grupoNovo, "FamiliaNovo":familiaNovo, "Pesquisa_1Novo":pesquisa_1Novo, "Pesquisa_2Novo":pesquisa_2Novo, "Pesquisa_3Novo":pesquisa_3Novo, "FabricanteNovo":fabricanteNovo, "NCMNovo":NCMNovo, "NovoNome":NovoNome, "Inativo":incluirInativos},
        		beforeSend:function(){
                	$("#resultadoAlteracaoFiltros").html("<div class='msgProcessando'>Aguarde enquanto processamos sua solicitacao...<span class='spanTimer'></span></div>");       
                	$(".msgProcessando").show();					         						
                },
        		success:function(data){console.log(data);$(".msgProcessando").hide();	$("#resultadoAlteracaoFiltros").html(data);	},
        		error:function(data){console.log(data);}
        	});
        });

        $("#btnLimparCampos").click(function(e){
        	   e.preventDefault();  

      			$("#txtCodigoClasses").val("");
      			$("#nomeClasses").html("");
      			$("#txtCodigoSubclasses").val("");
      			$("#nomeSubclasses").html("");
      			$("#txtCodigoGrupos").val("");
      			$("#nomeGrupos").html("");
      			$("#txtCodigoFamilias").val("");
      			$("#nomeFamilias").html("");
      			$("#txtCodigoPesquisa_1").val("");
      			$("#nomePesquisa_1").html("");
      			$("#txtCodigoPesquisa_2").val("");
      			$("#nomePesquisa_2").html("");
      			$("#txtCodigoPesquisa_3").val("");
      			$("#nomePesquisa_3").html("");
      			$("#txtCodigoFabricantes").val("");      	  	
      			$("#nomeFabricantes").html("");
      			$("#txtCodigoNCM").val("");
      			$("#nomeNCM").html("");
      			$("#txtDescricao1").val("");			
      			$("#txtDescricao2").val("");      			

      			$("#txtCodigoNovoClasses").val("");
      			$("#nomeNovoClasses").html("");
      			$("#txtCodigoNovoSubclasses").val("");
      			$("#nomeNovoSubclasses").html("");
      			$("#txtCodigoNovoGrupos").val("");
      			$("#nomeNovoGrupos").html("");
      			$("#txtCodigoNovoFamilias").val("");
      			$("#nomeNovoFamilias").html("");
      			$("#txtCodigoNovoPesquisa_1").val("");
      			$("#nomeNovoPesquisa_1").html("");
      			$("#txtCodigoNovoPesquisa_2").val("");
      			$("#nomeNovoPesquisa_2").html("");
      			$("#txtCodigoNovoPesquisa_3").val("");
      			$("#nomeNovoPesquisa_3").html("");
      			$("#txtCodigoNovoFabricantes").val("");      	  	
      			$("#nomeNovoFabricantes").html("");
      			$("#txtCodigoNovoNCM").val("");	
      			$("#nomeNovoNCM").html("");
            
      });

        /*$( document ).on( "click", "a.btnSalvarProduto", function(e) {
          e.preventDefault(); 
          desativarEdicaoProdutos($(this));
        });*/

        $( document ).on( "click", "a.btnAlterarProduto", function(e) {
          e.preventDefault(); 
          ativarEdicaoProdutos($(this));
        });

        function ativarEdicaoProdutos(campos){    

          $(".input_edit").hide();
          $(".span_edit").show();
          $('.preco').mask('000.000.000.000.000,00', {reverse: true});
          //altera codigo adicional 1
          campos.parent().next().next().find('.input_edit').show();    
          campos.parent().next().next().find('.span_edit').hide(); 
          //altera nome produto
          campos.parent().next().next().next().find('.input_edit').show();    
          campos.parent().next().next().next().find('.span_edit').hide(); 
          //altera preco compra
          campos.parent().next().next().next().next().next().find('.input_edit').show();    
          campos.parent().next().next().next().next().next().find('.span_edit').hide(); 
          //altera preco avista
          campos.parent().next().next().next().next().next().next().find('.input_edit').show();    
          campos.parent().next().next().next().next().next().next().find('.span_edit').hide();   

          campos.parent().find(".btnSalvarProduto").show();
          campos.parent().find(".btnAlterarProduto").hide();
        }

        function desativarEdicaoProdutos(campos){

          $(".input_edit").hide();
          $(".span_edit").show();
          
          //altera codigo adicional 1
          campos.parent().next().next().find('.input_edit').hide();    
          campos.parent().next().next().find('.span_edit').show(); 
          //altera nome produto
          campos.parent().next().next().next().find('.input_edit').hide();    
          campos.parent().next().next().next().find('.span_edit').show(); 
          //altera preco compra
          campos.parent().next().next().next().next().next().find('.input_edit').hide();    
          campos.parent().next().next().next().next().next().find('.span_edit').show(); 
          //altera preco avista
          campos.parent().next().next().next().next().next().next().find('.input_edit').hide();    
          campos.parent().next().next().next().next().next().next().find('.span_edit').show(); 

          campos.parent().find(".btnSalvarProduto").hide();
          campos.parent().find(".btnAlterarProduto").show();
        }
      
    </script>

  </body>
</html>

