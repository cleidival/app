

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">

    <title>CF SISTEMAS - LOGIN</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
      .Login{display: block; width: 500px; height: 300px; background: #f1f1f1; border: 2px solid #cccccc; margin: auto; padding: 10px; border-radius: 5px; border-right: 1px solid #cccccc; border-bottom: 1px solid #cccccc; position: absolute; top: 50%; left: 50%;  margin-top: -250px; margin-left: -180px;}
      .Login h3{padding: 5px; background: #333; color: #fff; margin: 0px; border-radius: 5px; }
      .form-group{margin-top: 10px;}
      .campo-composto{display: block; margin: 0px; padding: 0px;}
      .campo-composto #txt_nome_usuario{float: left; width: 75px;}     
      .campo-composto span{float: left; text-transform: uppercase; padding: 2px 5px; line-height: 30px;}
    </style>
  </head>

  <body>


	<div class="container">		
		<div class="row main">
			<div class="panel-heading">
				<div class="panel-title text-center">
					<h3 class="title">Entrar</h3>
				</div>
			</div>
		</div>
		<div class="main-login main-center">
			<form class="form-horizontal" method="post" action="#">				
				

				<div class="form-group">
					<label for="txt_nome_usuario" class="cols-sm-2 control-label">Usuário</label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-user" aria-hidden="true"></i></span>
							<input type="text" class="form-control" name="txt_nome_usuario" id="txt_nome_usuario"  placeholder=""/>							
							<span class="input-group-addon" id="txt_rs_nome_usuario"></span>
						</div>
					</div>
				</div>

				<div class="form-group">
					<label for="txt_senha_usuario" class="cols-sm-2 control-label">Senha</label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-lock" aria-hidden="true"></i></span>
							<input type="password" class="form-control" name="txt_senha_usuario" id="txt_senha_usuario"  placeholder=""/>
						</div>
					</div>
				</div>
				
				<div class="form-group ">
					<button type="button" class="btn btn-primary btn-lg btn-block login-button" id="btnEntrarSistema">Entrar</button>
				</div>

			</form>
		</div>
		
	  </div>

	</div><!-- /login -->



    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>

    <script type="text/javascript">
     $("#txt_nome_usuario").blur(function(){
      var codigo_usuario = $("#txt_nome_usuario").val();      
      $.ajax({   
                  dataType: 'json',                                 
                  url: "Processa.aspx",
                  data:{"Pagina":"Login","Acao":"Verificar_Usuario", "codigo_usuario":codigo_usuario},
                  success:function(data){                    
                    $.each( data.usuario, function( usuario, usuario ) {
                      console.log(usuario.apelido);
                      $("#txt_rs_nome_usuario").text(usuario.apelido);
                    });
                  },
                  error:function(data){
                    console.log('erro:' + data);
                  }                
              });
        });

     $("#btnEntrarSistema").click(function(){
      var codigo_usuario = $("#txt_nome_usuario").val();      
      var senha_usuario = $("#txt_senha_usuario").val();      
      $.ajax({   
                  
                  url: "Processa.aspx",
                  data:{"Pagina":"Login","Acao":"Logar", "codigo_usuario":codigo_usuario, "senha_usuario":senha_usuario},
                  success:function(data){    
                  console.log(data);
                    if(data == "LOGADO"){window.location = "Default.aspx";}else
                      if(data == "SENHA_INCORRETA"){alert("SENHA_INCORRETA");}else
                        if(data == "USUARIO_NAO_LOCALIZADO"){alert("USUARIO_NAO_LOCALIZADO");}else
						if(data == "SENHA_NAO_PODE_SER_EM_BRANCO"){alert("SENHA_NAO_PODE_SER_EM_BRANCO");}
						
                  },
                  error:function(data){
                    console.log('erro:' + data);
                  }                
              });
        });
    </script>

  </body>
</html>

