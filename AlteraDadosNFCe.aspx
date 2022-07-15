<%@ Page language="c#" Inherits="Nico" CodeFile="AlteraDadosNFCe.aspx.cs" %>

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
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	<style>
	.group-text{border: 1px solid #ccc; padding: 5px;border-radius:10px; background: #f1f1f1;}
.success{display: none; color: #009900;}
.error{display: none; color: #cc0000;}
	.txtNCM{border: none; margin:0px; padding:0px; background: none; width: 90px;border-bottom:2px solid #ccc; font-weight: bold;}
	.txtCargaTributaria{display:block; font-size: 6pt; width: 200px;}
	.txtSuccess{color:#096;}
	.txtError{color: #cc0000;}
	.txtNFCE{border: 1px solid #000; border-radius: 5px; overflow:hidden;padding:5px;width:130px; height: 30px;position: relative;}
	.txtNFCE span{ color: #fff; background: #009933; padding: 5px; float: left; display: block; width: 100px; height: 30px;position:absolute;left:0px; top:0px;}
	.txtNFCE b{color: #000;padding: 5px;  float:left; display: block; width: 50px; height:30px; position: absolute; left: 100px;top:0px;}
	.NFCEautorizada{background:#cf9;}
	.NFCEenviada{background:#ff0;}
	.NFCEcancelada{background:#c00;}
	</style>
  </head>

  <body>


    <div class="container-fluid">

      <!-- #include file="Menu.aspx" -->

      <!-- Main component for a primary marketing message or call to action -->
		<div class="row-fluid">
			<h3>Dados Fiscais</h3>
			<div class="well">
				<form method="get" action="AlteraDadosNFCe.aspx">			
					<div class="row">
						<div class='col-sm-3 col-md-3 col-lg-3 col-xl-3'>
							<label for="txtFilial">Filial</label>		  		            
							<% listaFiliais(); %>
						</div>			    	
						<div class='col-sm-3 col-md-3 col-lg-3 col-xl-3'>
							<label for="txtSequencia">Sequencia</label>
							<div class="input-group">
								<input type="text" class="form-control" id="txtSequencia" name="txtSequencia" placeholder="Sequencia da Venda" style="width: 200px;" value="<% Response.Write(sequencia); %>">
								<div class="input-group-btn">
									<input type="submit" class="btn btn-primary btnEnviar" value="	Buscar">							
								</div>
							</div>
						</div>
					</div>			
				</form>
				<div class="row">
					<div class='col-sm-3 col-md-3 col-lg-3 col-xl-3'>
						<label for="txtIdCliente">Cliente</label>
						<div class="input-group">						      	
							<input type="text" id="txtIdCliente" name="txtIdCliente" class="form-control" placeholder="">
							<div class="input-group-btn">
								<button type="button" class="btn btn-primary btnBuscarCliente">
									<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
								</button>
							</div>
						</div>
					</div>
					<div class='col-sm-8 col-md-8 col-lg-8 col-xl-8'>
						<label for="txtNomeCliente">&nbsp;</label>
						<input type="text" id="txtNomeCliente" class="form-control" placeholder="" disabled>
					</div>
					
					<!-- Modal Busca Clientes-->
					
					<div style="width:auto;" class="modal fade" id="modalBuscarClientes" tabindex="-1" role="dialog" aria-labelledby="modalBuscarClientesLabel" aria-hidden="true">
						<div>
						  <div class="modal-dialog">
							<div class="modal-content">
							  <div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
								<h4>Buscar Clientes</h4>
							  </div>            
							  <div class="modal-body">								
								<div class="input-group">						      	
									<input type="text" id="txtBuscarCliente" name="txtBuscarCliente" class="form-control" placeholder="Digite qualquer informação do cliente.">
									<div class="input-group-btn">
										<button type="button" class="btn btn-primary btnBuscarCliente2">
											<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
										</button>
									</div>
								</div>
								<div id="resultadoBuscaClientes"></div>
							  </div>                          
							  <div class="modal-footer">
								
								<!--<a href="#" id="btnConfirmaAlteracaoSenha" data-dismiss="modal" aria-hidden="true" class="btn btn-primary confirm">Confirma</a>-->
								<a href="#" class="btn btn-primary confirm btnConfirmaAlteracaoSenha">Selecionar</a>
								<a href="#" data-dismiss="modal" aria-hidden="true" class="btn secondary">Cancelar</a>
								
							  </div>
							</div>
						  </div>
						</div>
					</div>
					
					<!-- ##FIM ## Modal Busca Clientes-->
				</div>
				
				<div class="row">
					<% localizaSequencia(); %>
				</div>
			</div>
		</div>
	</div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>

    <script type="text/javascript">
	function carregarNCM(txtNCM, txtOrdemMovimento, txtOrdemProdServ, txtOrdemMovimentoProdServ){
		console.log("\nNCM:"+txtNCM);
		console.log("\nORDEM MOVIMENTO:"+txtOrdemMovimento);
		console.log("\nORDEM PROD SERV:"+txtOrdemProdServ);
	}

	$(".txtNCM").blur(function(){
		
		var campo = $(this);

		var txtNCM = campo.val();
		var txtOrdemMovimento = campo.nextAll('.txtOrdemMovimento').val();
		var txtOrdemProdServ = campo.nextAll('.txtOrdemProdServ').val();
		var txtOrdemMovimentoProdServ = campo.nextAll('.txtOrdemMovimentoProdServ').val();

		console.log("\n1:"+txtNCM);
		console.log("\n2:"+txtOrdemMovimento);
		console.log("\n3:"+txtOrdemProdServ);
		console.log("\n4:"+txtOrdemMovimentoProdServ);

		$.ajax({
			url:"Processa.aspx",
			data:{"Pagina":"AtualizarNCM","txtNCM":txtNCM,"txtOrdemMovimento":txtOrdemMovimento, "txtOrdemProdServ":txtOrdemProdServ, "txtOrdemMovimentoProdServ":txtOrdemMovimentoProdServ},
			success: function(data){
				if(data!="NCM invalido!"){
					console.log(data);
					console.log(campo.prop("tagName"));
					campo.nextAll('.txtCargaTributaria').html(data).removeClass("txtError").addClass("txtSuccess");				
					campo.nextAll('.error').hide();
					campo.nextAll('.success').fadeIn(200);
				}else{
					console.log(data);
					console.log(campo.prop("tagName"));
					campo.nextAll('.txtCargaTributaria').html(data).removeClass("txtSuccess").addClass("txtError");					
					campo.nextAll('.success').hide();
					campo.nextAll('.error').fadeIn(200);
				}
			}		
		});	

	});
	
	$(document).on("keyup", "#txtBuscarCliente", function(e){
		//e.preventDefault();
		var txtBusca = $(this).val();
		$.ajax({
			url:"Processa.aspx",
			data:{"Pagina":"BuscarClientes", "txtBusca":txtBusca},
			success: function(data){
				$("#resultadoBuscaClientes").html(data);			
			}
		});
	
	});
	
	$(document).on("click",".btnBuscarCliente", function(e){
		e.preventDefault();
		$("#modalBuscarClientes").modal('show');
	});
	

    </script>

  </body>
</html>

