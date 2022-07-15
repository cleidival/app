<%@ Page language="c#" Inherits="Nico" CodeFile="BuscaPreco.aspx.cs" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">

    <title>CF SISTEMAS - BUSCA PREÇOS</title>

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
body{background: #3070f0; color: #fff;}
.logomarca{display: block; width: 300px; height: 100px; border: 1px solid #3070f0; solid #fff; margin: 0px auto; position: relative;}
.logomarca small{position: absolute; left: 10px; font-style: italic; font-family: Georgia; font-weight: bold; color: #ffffff; font-size: 18pt;}
.logomarca h1{font-style: italic; font-family: Georgia; font-weight: bold; color: #ffffff; font-size: 38pt;}
.foteer{background: #1d418a; color: #fff; position: fixed; bottom: 0px; display: block; width: 100%; text-align: center; font-size: 10pt;}
marquee{color: yellow;}

</style>
  </head>

  <body>
   

    <div class="container" id="buscaPrecoPainel">

      <!-- include file="Menu.aspx" -->
	
      <!-- Main component for a primary marketing message or call to action -->
      <div class="row">	
	<div class="logomarca">
		<small>Supermercado</small>
		<h1>CasaAbreu</h1>
	</div>
        <h2><marquee scrolldelay="0"><% mensagemBuscaPreco(); %></marquee></h2>
        
          <form action="BuscaPreco.aspx" method="get" id="formBuscaProduto">
  <div class="form-group">
	<div class="col-md-11">
		<input type="text" class="form-control" id="codigoProduto" name="codigoProduto" placeholder="Código de Barras do Produto">
	</div>
	<div class="col-md-1">
		<input type="submit" class="btn btn-default" value="Buscar" >	
	</div>
  </div>  
  
  
</form>
        </div>
<div class="row" id="resListaProdutos">
<% listaProdutos(); %>
</div>

    </div> <!-- /container -->

<div class="foteer">
	&copy; <% Response.Write(DateTime.Now.ToString("yyyy")); %> - Todos os direitos reservados a CLEIDIVAL FERNANDES - (93) 99653-4485 | cleidivalf@yahoo.com.br | http://cleidivalfernandes.com.br
</div>
	

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
    <script>
	$(document).ready(function() {
            window.open("http://servidor/nico/BuscaPreco.aspx","Precos", "fullscreen=yes");
	});


    </script>

   

  </body>
</html>

