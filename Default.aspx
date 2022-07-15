<%@ Page language="c#" Inherits="Nico" CodeFile="Default.aspx.cs" %>
	

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
		ul.atalhosMenu{list-style: none; margin:0px;padding:0px;}
		ul.atalhosMenu li{float: left; padding: 5px;}
	</style>
  </head>

  <body>


    <div class="container-fluid">
		
      <!-- #include file="Menu.aspx" -->

      <!-- Main component for a primary marketing message or call to action -->
      <div class="row-fluid">
        
        <div class="row">
			<div class="col-sm-12 col-md-12 col-lg-12 col-xl-12">
				<ul class="atalhosMenu">
				  <li><a href="RemarcaPrecos.aspx" class="btn btn-primary"><b class="glyphicon glyphicon-usd"></b>&nbsp;Remarcar Precos</a></li>
				  <li><a href="AlteraFiltros.aspx" class="btn btn-primary"><b class="glyphicon glyphicon-filter"></b>&nbsp;Alterar Filtros</a></li>
				</ul>
			</div>			
        </div>
		<div class="">
			<% if(Request.QueryString["pagina"]!=null){Response.Write("<div class='alert alert-danger'><h3>Atenção!</h3><p>Você não tem permissão para acessar a página: "+Request.QueryString["pagina"].ToString()+"</p><p>Entre em contato com o administrador do sistema através do e-mail: abelacessorios@abelacessorios.com.br</p></div>");} %>
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

    

  </body>
</html>

