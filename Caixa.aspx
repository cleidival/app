<%@ Page language="c#" Inherits="Nico" CodeFile="Caixa.aspx.cs" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">

    <title>CF SISTEMAS - CAIXA</title>

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
		
	</style>
  </head>
  

  <body>


    <div class="container-fluid">

      <!-- #include file="Menu.aspx" -->

      <!-- Main component for a primary marketing message or call to action -->
      <div class="row-fluid">
        <h3>Caixa</h3>
		<div class="well">
			<div class="row">
				<div class="col-md-2"> 
				  <p>Filial: <div class="input-group">      
					<input type="text" id="txt_filial" class="form-control" placeholder="Filial" aria-describedby="gtxtNomeFilial">     
					<span class="input-group-addon" id="gtxtNomeFilial"></span>
				  </div></p>
				  <p>Caixa: 
				  <div class="input-group">     
					<input type="text" id="txt_caixa" class="form-control" placeholder="Caixa" aria-describedby="gtxtNomeCaixa">      
					<span class="input-group-addon" id="gtxtNomeCaixa"></span>
				  </div>

					<p>Data Inicial:<input class="form-control" id="txt_data_inicial" data-date-format="mm/dd/yyyy" value="<%=DateTime.Now.ToString("dd/MM/yyyy")%>"></p>
					<p>Data Final:<input class="form-control" id="txt_data_final" data-date-format="mm/dd/yyyy" value="<%=DateTime.Now.ToString("dd/MM/yyyy")%>"></p>

					<button class="btn btn-primary" id="btnImprimir">Imprimir</button>
				</div>
				<div class="col-md-10"> 
				  <div id="resultadoRelatorio">
				  </div>
				</div>
			</div>
		</div>
      </div>

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.maskedinput.min.js"></script>
	
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
	


    <script type="text/javascript">
    $(document).ready(function(){           
	
        $("#txt_data_inicial").mask("99/99/9999");
        $("#txt_data_final").mask("99/99/9999");		
		
		$("#txt_filial").blur(function(){            
            var codigo = $(this).val();
             $.ajax({
                url: "processa.aspx",
                data: {"Pagina":"AlterarFiltros","Acao":"consultarNomeFiltros", "Objeto": "Filiais", "Codigo":codigo},
                success:function(data){
                  $("#gtxtNomeFilial").text(data);
                },
                error:function(data){console.log(data);} 
            });
        });

        $("#txt_caixa").blur(function(){
          var codigo = $(this).val();
             $.ajax({
                url: "processa.aspx",
                data: {"Pagina":"AlterarFiltros","Acao":"consultarNomeFiltros", "Objeto": "Caixas", "Codigo":codigo},
                success:function(data){
                  $("#gtxtNomeCaixa").text(data);                  
                },
                error:function(data){console.log(data);} 
            });
        });

        function converterData(data){
            var data = data.split("/");
            
            return data[2]+"-"+data[1]+"-"+data[0];
        }
		
		$("#btnImprimir").click(function(){
			var filial = $("#txt_filial").val();
			var caixa = $("#txt_caixa").val();
			var data_inicial = $("#txt_data_inicial").val();
			var data_final = $("#txt_data_final").val();
			$.ajax({
				url: "processa.aspx",
				data:{"Pagina":"Relatorios","Acao":"TotaisCaixa","filial":filial, "caixa":caixa, "data_inicial":data_inicial, "data_final":data_final},
				success:function(data){
					$("#resultadoRelatorio").html(data);
					console.log(data);
				},
				error:function(data){
					console.log(data);
				}
			});
			
		});
		
		
	});
	
    
	
    </script>

  </body>
</html>

