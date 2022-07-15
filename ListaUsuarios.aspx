<%@ Page language="c#" Inherits="Nico" CodeFile="ListaUsuarios.aspx.cs" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">

    <title>CF SISTEMAS</title>

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
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  <style>
    
    .container{width: auto;}
    .red{color: red;}
    .green{color: green; font-weight: bold; }
    .btnAlterarAcessoFuncionario, .btnAdicionarFuncionario, .btnRemoverFuncionario, .btnAlterarSenha, .btnPermissoes{cursor: pointer;}
  </style>
  </head>

  <body>


    <div class="container-fluid">
      <!-- #include file="Menu.aspx" -->

      <!-- Main component for a primary marketing message or call to action -->      
      <div class="row-fluid">
        <h3>Usuários</h3>
		<div class="well">
        <div class="row">
		  
		 <div class="col-sm-6 col-md-6 col-lg-6 col-xl-6">
		 <% listaFuncionariosShop9(); %>
		 </div>
		 <div class="col-sm-6 col-md-6 col-lg-6 col-xl-6">
         <% listaUsuarios(); %>
		 </div>
        </div>
		</div>
      </div>

    </div> <!-- /container -->



     <!-- Modal -->            
                    <div style="width:auto;" class="modal fade" id="modalAlterarSenha" tabindex="-1" role="dialog" aria-labelledby="modalAltararSenhaLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Alterar Senha</h4>
                          </div>            
                          <div class="modal-body">
							<input type="hidden" id="hidden_ordem_usuario" name="hidden_ordem_usuario" />
                            <label>USUÁRIO:</label><input type="text" name="label_nome_usuario" id="label_nome_usuario" class="form-control" disabled>
                            <label>Nova Senha:</label>
                            <input type="password" name="nova_senha" id="nova_senha" class="form-control">
                            <label>Confirmar Senha:</label>
                            <input type="password" name="cofirma_nova_senha" id="confirma_nova_senha" class="form-control">                            
							<span id="erroConfirmaSenha">..</span>
                          </div>                          
                          <div class="modal-footer">
							
                            <!--<a href="#" id="btnConfirmaAlteracaoSenha" data-dismiss="modal" aria-hidden="true" class="btn btn-primary confirm">Confirma</a>-->
							<a href="#" class="btn btn-primary confirm btnConfirmaAlteracaoSenha">Confirma</a>
                            <a href="#" data-dismiss="modal" aria-hidden="true" class="btn secondary">Cancelar</a>
							
                          </div>
                        </div>
                      </div>
                    </div>
					</div>
                    <!--Fim Modal-->
					
					 <!-- Modal -->            
                    <div style="width:auto;" class="modal fade" id="modalListaPermissoes" tabindex="-1" role="dialog" aria-labelledby="modalListaPermissoesLabel" aria-hidden="true">
                    <div>
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                            <h4>Permissões</h4>
                          </div>            
                          <div class="modal-body">
							<form method="post" action="">
							<input type="hidden" id="hidden_ordem_usuario2" name="hidden_ordem_usuario2" />
                            <label>USUÁRIO:</label><input type="text" name="label_nome_usuario2" id="label_nome_usuario2" class="form-control" disabled>							
							<div class="input-group">								
								<div class="checkbox"><label><input type="checkbox" name="opPermissoes" class="opPermissoes" value="CADASTRO::ALTERAR_FILTROS" />CADASTRO/ALTERAR FILTROS</label></div>
								<div class="checkbox"><label>&raquo;&raquo;&raquo;&raquo;<input type="checkbox" name="opPermissoes" class="opPermissoes" value="CADASTRO::ALTERAR_FILTROS::ADICIONAL" />ADICONAL</label></div>
								<div class="checkbox"><label>&raquo;&raquo;&raquo;&raquo;<input type="checkbox" name="opPermissoes" class="opPermissoes" value="CADASTRO::ALTERAR_FILTROS::NOME" />NOME</label></div>
								<div class="checkbox"><label>&raquo;&raquo;&raquo;&raquo;<input type="checkbox" name="opPermissoes" class="opPermissoes" value="CADASTRO::ALTERAR_FILTROS::P.COMPRA" />P.COMPRA</label></div>
								<div class="checkbox"><label>&raquo;&raquo;&raquo;&raquo;<input type="checkbox" name="opPermissoes" class="opPermissoes" value="CADASTRO::ALTERAR_FILTROS::P.AVISTA" />P.AVISTA</label></div>
								<div class="checkbox"><label><input type="checkbox" name="opPermissoes" class="opPermissoes" value="CADASTRO::REMARCACAO_DE_PRECOS" />CADASTRO/REMARCAÇÃO DE PREÇOS</label></div>
								<div class="checkbox"><label><input type="checkbox" name="opPermissoes" class="opPermissoes" value="CADASTRO::USUARIOS" />CADASTRO/USUARIOS</label></div>
								
								<div class="checkbox"><label><input type="checkbox" name="opPermissoes" class="opPermissoes" value="RELATORIOS::CAIXA" />RELATORIOS/CAIXA</label></div>
								
								<div class="checkbox"><label><input type="checkbox" name="opPermissoes" class="opPermissoes" value="RELATORIOS::CONTAS_PAGAS_RECEBIDAS" />RELATORIOS/CONTAS PAGAS RECEBIDAS</label></div>
								<div class="checkbox"><label><input type="checkbox" name="opPermissoes" class="opPermissoes" value="RELATORIOS::VENDAS" />RELATORIOS/VENDAS</label></div>
								<div class="checkbox"><label><input type="checkbox" name="opPermissoes" class="opPermissoes" value="RELATORIOS::PRODUTOS_PRECO_ESTOQUE_ALTERADOS" />RELATORIOS/PRODUTOS PRECO OU ESTOQUE ALTERADOS</label></div>
								<div class="checkbox"><label><input type="checkbox" name="opPermissoes" class="opPermissoes" value="FISCAL::ALTERAR_DADOS_NFCE" />FISCAL/ALTERAR_DADOS_NFCE</label></div>
								<div class="checkbox"><label><input type="checkbox" name="opPermissoes" class="opPermissoes" value="RELATORIOS::NOTAS_FISCAIS_EM_ABERTO" />RELATORIOS/NOTAS FISCAIS EM ABERTO</label></div>
								
							</div                            
							</form>
                          </div>                          
                          <div class="modal-footer">							                            
							<a href="#" class="btn btn-primary confirm btnSalvarPermissoes">Salvar</a>
                            <a href="#" data-dismiss="modal" aria-hidden="true" class="btn secondary">Cancelar</a>
							
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
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>

    <script type="text/javascript">
      var ordem_funcionario_pagina = "0";
      var apelido_funcionario_pagina = "";
      $( document ).on( "click", ".btnAlterarAcessoFuncionario", function(e) {
      //$(".btnAlterarAcessoFuncionario").click(function(e){
        e.preventDefault(); 
        var campo = $(this);
        var linha = $(this).parent().parent();
        var codigo_usuario = campo.parent().prev().prev().prev().find('.ordem_funcionario').val();
        var status = "";

        if(linha.hasClass("red")){
          linha.removeClass("red").addClass("green");
          campo.removeClass("red").addClass("green");
          campo.removeClass("glyphicon-remove").addClass("glyphicon-ok");
          status = "1";          
        }else{
            linha.removeClass("green").addClass("red");
            campo.removeClass("green").addClass("red");
            campo.removeClass("glyphicon-ok").addClass("glyphicon-remove");
            status = "0";
        }
        
        console.log(codigo_usuario);
        $.ajax({                 
              url: "Processa.aspx",
              data:{"Pagina":"Funcionarios","Acao":"AlterarAcessoFuncionario", "codigo_usuario":codigo_usuario, "status":status},
              success:function(data){                    
                console.log(data);
              },
              error:function(data){
                console.log('erro:' + data);
              }                
        });  
      });
	  $( document ).on( "click", ".btnAlterarSenhaFuncionario", function(e) {
      //$(".btnAlterarSenhaFuncionario").click(function(e){
	    e.preventDefault(); 
        var campo = $(this);
        var linha = $(this).parent().parent();
        var codigo_usuario = campo.parent().prev().prev().prev().find('.ordem_funcionario').val();
        var status = "";
		
        $.ajax({                 
              url: "Processa.aspx",
              data:{"Pagina":"Funcionarios","Acao":"AlterarAcessoFuncionario", "codigo_usuario":codigo_usuario, "nova_senha":nova_senha},
              success:function(data){                    
                console.log(data);
              },
              error:function(data){
                console.log('erro:' + data);
              }                
        }); 
      });
	  
	   $( document ).on( "click", ".btnRemoverFuncionario", function(e) {
     // $(".btnRemoverFuncionario").click(function(e){
		e.preventDefault();
		var campo = $(this);
        var linha = $(this).parent().parent();
        var codigo_usuario = campo.parent().prev().prev().prev().prev().prev().prev().find('.ordem_funcionario').val();
		campo.parent().parent().hide();
		
		var codigo_funcionario = campo.parent().prev().prev().prev().prev().prev().prev().text();
		var nome_funcionario = campo.parent().prev().prev().prev().prev().prev().text();
		var apelido_funcionario = campo.parent().prev().prev().prev().prev().text();
		
		campo.parent().parent().hide();	
		$("#listaFuncionariosShop9 > tbody").append('<tr><td><input type="hidden" class="ordem_funcionario" value="'+codigo_usuario+'">'+codigo_funcionario+'</td><td>'+nome_funcionario+'</td><td>'+apelido_funcionario+'</td><td><b class="glyphicon glyphicon-plus btnAdicionarFuncionario"></b></td></tr>');
		
        
		$.ajax({                 
              url: "Processa.aspx",
              data:{"Pagina":"Funcionarios","Acao":"RemoverFuncionario", "codigo_usuario":codigo_usuario},
              success:function(data){                    
                console.log(data);
              },
              error:function(data){
                console.log('erro:' + data);
              }                
        }); 
      });
	  
	    $( document ).on( "click", ".btnAdicionarFuncionario", function(e) {
      	e.preventDefault();
		var campo = $(this);
        var linha = $(this).parent().parent();
        var codigo_usuario = campo.parent().prev().prev().prev().find('.ordem_funcionario').val();
		var codigo_funcionario = campo.parent().prev().prev().prev().text();
		var nome_funcionario = campo.parent().prev().prev().text();
		var apelido_funcionario = campo.parent().prev().text();
		//alert(codigo_funcionario);
		campo.parent().parent().hide();
		$("#listaUsuariosApp > tbody").append('<tr class="red"><td><input type="hidden" class="ordem_funcionario" value="'+codigo_usuario+'">'+codigo_funcionario+'</td><td>'+nome_funcionario+'</td><td>'+apelido_funcionario+'</td><td><i class="glyphicon glyphicon-remove red btnAlterarAcessoFuncionario"></i></td><td><b class="glyphicon glyphicon-lock btnPermissoes"></b></td><td><b class="glyphicon glyphicon-edit btnAlterarSenha"></b></td><td><b class="glyphicon glyphicon-remove btnRemoverFuncionario"></b></td></tr>');
        $.ajax({                 
              url: "Processa.aspx",
              data:{"Pagina":"Funcionarios","Acao":"AdicionarFuncionario", "codigo_usuario":codigo_usuario},
              success:function(data){                    
                console.log(data);
              },
              error:function(data){
                console.log('erro:' + data);
              }                
        });
		});		
		
		$( document ).on( "click", ".btnAlterarSenha", function(e) {      
			e.preventDefault();			
			var campo = $(this);						
			var codigo_usuario = campo.parent().prev().prev().prev().prev().prev().find('.ordem_funcionario').val();			
			var codigo_funcionario = campo.parent().prev().prev().prev().prev().prev().text();
			var nome_funcionario = campo.parent().prev().prev().prev().prev().text();
			$("#label_nome_usuario").val(codigo_funcionario + " - "+nome_funcionario);		
			$("#hidden_ordem_usuario").val(codigo_usuario);
			$("#modalAlterarSenha").modal('show');
			//alert(codigo_usuario);
				
		});
		
		$( document ).on( "click", ".btnConfirmaAlteracaoSenha", function(e) {      
			e.preventDefault();			
			var campo = $(this);
			var codigo_usuario = $("#hidden_ordem_usuario").val();			
			var nova_senha = $("#nova_senha").val();
			var confirma_nova_senha = $("#confirma_nova_senha").val();
			//alert(codigo_usuario);
			if(nova_senha == confirma_nova_senha){							
				$.ajax({                 
				  url: "Processa.aspx",
				  data:{"Pagina":"Funcionarios","Acao":"AlterarSenhaFuncionario", "codigo_usuario":codigo_usuario, "nova_senha":nova_senha},
				  success:function(data){                    
					console.log(data);
					$("#modalAlterarSenha").modal('hide');
				  },
				  error:function(data){
					console.log('erro:' + data);
					$("#erroConfirmaSenha").append("<b class='red'>Erro ao tentar alterar senha. Tente novamente!</b>");
				  }                
				});
			}else{
				$("#erroConfirmaSenha").append("<b class='red'>As senhas são diferentes.</b>");
			}
				
		});
		
		$( document ).on( "click", ".btnPermissoes", function(e) {      
			e.preventDefault();			
			var campo = $(this);						
			var codigo_usuario = campo.parent().prev().prev().prev().prev().find('.ordem_funcionario').val();			
			var codigo_funcionario = campo.parent().prev().prev().prev().prev().text();
			var nome_funcionario = campo.parent().prev().prev().prev().text();
			$("#label_nome_usuario2").val(codigo_funcionario + " - "+nome_funcionario);		
			$("#hidden_ordem_usuario2").val(codigo_usuario);				
			carregarPermissoesFuncionarios(codigo_usuario);
			$("#modalListaPermissoes").modal('show');
			
			
		});
		
		$(document).on("click", ".btnSalvarPermissoes", function(e){
			e.preventDefault();
			var txtPermissoes = "";
			var codigo_usuario = $("#hidden_ordem_usuario2").val();		
			$("input:checkbox[name=opPermissoes]:checked").each(function(i){
				txtPermissoes += $(this).val()+";";
			});
			console.log(txtPermissoes);
			$.ajax({                 
			  url: "Processa.aspx",
			  data:{"Pagina":"Funcionarios","Acao":"PermissoesFuncionario", "codigo_usuario":codigo_usuario, "txtPermissoes":txtPermissoes},
			  success:function(data){                    
				//console.log(data);
				$("#modalListaPermissoes").modal('hide');
			  }                
			});
		});
      
	  
	  function carregarPermissoesFuncionarios(c){
			
			var codigo_usuario = c; 
			console.log("ORDEM FUNCIONARIO: "+codigo_usuario);
			$.ajax({
				url: "Processa.aspx",
				data:{"Pagina":"Funcionarios", "Acao":"CarregarPermissoesFuncionario", "codigo_usuario":codigo_usuario},
				success: function(data){
					//console.log(data);
					var permissoes = data.split(";");					
					$("input:checkbox[name=opPermissoes]").each(function(i){
						for(i = 0; i< permissoes.length - 2; i++){						
							if($(this).val() == permissoes[i]){
								console.log("-- > "+$(this).val());								
								$(this).prop("checked", true);
							}														
						}						
					});														
				}
			});
			
	  }
      
      
    </script>

    

  </body>
</html>

