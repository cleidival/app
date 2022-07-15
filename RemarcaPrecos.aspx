<%@ Page language="c#" Inherits="Nico" CodeFile="RemarcaPrecos.aspx.cs" %>

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
	.msgProcessando{background: #1A1A1A url('img/loading.gif') no-repeat center; display: none; text-align: center; font-size: 14pt; color: #fff; height: 300px; line-height: 300px;}
	.msgResultado{display: none; text-align: center; font-size: 14pt; background: #5cb85c; color: #fff;}
	.status{text-align: center; display: none; font-size: 14pt; width: 100%;}
	.success{color: #090;}
    .error{color: #900;}
    
    
    .row{margin: 0px; padding: 0px;}
    
	</style>
  </head>

  <body>

    
 <div class="container-fluid">

      <!-- #include file="Menu.aspx" -->

      <!-- Main component for a primary marketing message or call to action -->
      <div class="row-fluid">
        <h3>Remarca Preços</h3> 
		
			<div class="msgProcessando">Aguarde enquanto processamos sua solicitacao...<span class="spanTimer"></span></div>			
			<div class="msgResultado">Precos alterados com sucesso</div>			
<div id="box-configuracaoPrecos">
<div class="well">
<div class="row">    
    <button type="button" class="btn btn-success" id="btn-remarcarPrecos">
        <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>&nbsp;Remarcar Precos
    </button>	
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalAdicionarConfiguracoes" >
        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Adicionar Configuracao
    </button>
    <button type="button" class="btn btn-danger" id="btn-removerConfiguracao" >
        <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>&nbsp;Remover Configuracao
    </button>
    <button type="button" class="btn btn-default disabled" id="btn-verResultados" data-toggle="modal" data-target="#modalResultadoRemarcacao"  >
        <span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;Resultados
    </button>	
</div>
<% listaTabelaPrecosRemarcacao(); %>
</div>
</div>	</form>

        </div>
      </div>

    </div> <!-- /container -->
		<!-- Modal -->				    
 <div id="modalAdicionarConfiguracoes" class="modal">
   <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
            <!--<a href="#" data-dismiss="modal" aria-hidden="true" class="close">×</a>-->
	     <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
             <h3>Adicionar Configurações</h3>
        </div>
        <div class="modal-body">
		<div class="row">
			<% listaClasses(); %>	
		</div>
		<div class="row">
			<% listaSubClasses(); %>	
		</div>
		<div class="row">
			<% listaGrupos(); %>	
		</div>
		<div class="row">
			<% listaFamilias(); %>	
		</div>
		<div class="row">
			<% listaFabricantes(); %>	
		</div>
		<div class="row">
			<label>Preços:</label>
			<select name="txtOperacao" id="txtOperacao" class="form-control">
				<option value="M">Mantem Preço</option>
				<option value="A">Aumenta Preço</option>
				<option value="D">Diminui Preço</option>
			</select>
		</div>
		<div class="row">
			<% listaTabelaPrecos1(); %>
		</div>
		<div class="row">
			<% listaTabelaPrecos2(); %>
		</div>
		<div class="row">
			<label>Precentual de aumento:</label>
			<input type="text" name="txtPercentual" id="txtPercentual" class="form-control">
		</div>
		<div class="row">
		    <span class="status"></span>
		</div>
        </div>
        <div class="modal-footer">
          <a href="#" id="btnAdicionarConfiguracoes" class="btn btn-primary confirm">Adicionar</a>
          <a href="#" data-dismiss="modal" aria-hidden="true" class="btn secondary">Cancelar</a>
        </div>
      </div>
    </div>
</div>
                 <!--Fim Modal-->
                 
                 <!-- Modal -->				    
 <div id="modalConfirma" class="modal">
   <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
            <!--<a href="#" data-dismiss="modal" aria-hidden="true" class="close">×</a>-->
	     <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
             <h3>Confirma</h3>
        </div>
        <div class="modal-body">
		    Deseja realmente <span style="color: red">EXCLUIR</span> os registros Selecionados?
        </div>
        <div class="modal-footer">
          <a href="#" id="btn-confirmaExcluirRegistros" data-dismiss="modal" aria-hidden="true" class="btn btn-primary confirm">Confirma</a>
          <a href="#" data-dismiss="modal" aria-hidden="true" class="btn secondary">Cancelar</a>
        </div>
      </div>
    </div>
</div>
                 <!--Fim Modal-->
                 
                 <!-- Modal -->				    
 <div id="modalResultadoRemarcacao" class="modal">
   <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
            <!--<a href="#" data-dismiss="modal" aria-hidden="true" class="close">×</a>-->
	     <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
             <h3>Resultado Remarcação Preços</h3>
        </div>
        <div class="modal-body">
		    <div id="resultadoRemarcacao"></div>
        </div>
        <div class="modal-footer">
         &nbsp;         
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
    <script src="js/bootstrap-datagrid.js"></script>
    <script src="js/main.js"></script>
    <script src="js/timer.jquery.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>

    <script type="text/javascript">
	$("#btnAdicionarConfiguracoes").click(function(){

		var classe = $("#classeField").val();
		var content_classe = $("#classeField option:selected").text();
		var subclasse = $("#subclasseField").val();
		var content_subclasse = $("#subclasseField option:selected").text();
		var grupo = $("#grupoField").val();
		var content_grupo = $("#grupoField option:selected").text();
		var familia = $("#familiaField").val();
		var content_familia = $("#familiaField option:selected").text();		
		var fabricante = $("#fabricanteField").val();
		var content_fabricante = $("#fabricanteField option:selected").text();
		var tabela1 = $("#tabela1Field").val();
		var content_tabela1 = $("#tabela1Field option:selected").text();
		var tabela2 = $("#tabela2Field").val();
		var content_tabela2 = $("#tabela2Field option:selected").text();
		var percentual = $("#txtPercentual").val();
		var operacao = $("#txtOperacao").val();
		console.log("Pagina"+"ConfiguracoesPrecos"+"Acao"+"Adicionar"+"Classe"+classe+"Subclasse"+subclasse+"Grupo"+grupo+"Familia"+familia+"Tabela1"+tabela1+"Tabela2"+tabela2+"Percentual"+percentual+"Operacao"+operacao);

		$.ajax({
			url: "processa.aspx",
	        data: {"Pagina":"ConfiguracoesPrecos","Acao":"Verificar", "Classe":classe, "Subclasse":subclasse, "Grupo":grupo, "Familia":familia, "Fabricante":fabricante, "Tabela1":tabela1, "Tabela2":tabela2, "Percentual":percentual, "Operacao":operacao},
        	success:function(data){          	    
        	    if(data.split(":")[0]!="Suspend"){
        	    	adicionarConfiguracaoPrecos();        	    	
        	    }else{$(".status").html(data).removeClass("sucess").addClass("error").fadeIn();}
	        },
			error:function(data){
				console.log('erro: '+data);
			}	
		});
	});

	function adicionarConfiguracaoPrecos(){
		
		var classe = $("#classeField").val();
		var content_classe = $("#classeField option:selected").text();
		var subclasse = $("#subclasseField").val();
		var content_subclasse = $("#subclasseField option:selected").text();
		var grupo = $("#grupoField").val();
		var content_grupo = $("#grupoField option:selected").text();
		var familia = $("#familiaField").val();
		var content_familia = $("#familiaField option:selected").text();		
		var fabricante = $("#fabricanteField").val();
		var content_fabricante = $("#fabricanteField option:selected").text();
		var tabela1 = $("#tabela1Field").val();
		var content_tabela1 = $("#tabela1Field option:selected").text();
		var tabela2 = $("#tabela2Field").val();
		var content_tabela2 = $("#tabela2Field option:selected").text();
		var percentual = $("#txtPercentual").val();
		var operacao = $("#txtOperacao").val();

		$.ajax({
			url: "processa.aspx",
	        data: {"Pagina":"ConfiguracoesPrecos","Acao":"Adicionar", "Classe":classe, "Subclasse":subclasse, "Grupo":grupo, "Familia":familia, "Fabricante":fabricante, "Tabela1":tabela1, "Tabela2":tabela2, "Percentual":percentual, "Operacao":operacao},
        	success:function(data){  
        	    $(".status").html("Dados gravados...").removeClass("error").addClass("success").fadeIn();
			    $(".lista-configuracoesPrecos tbody").append("<tr><td><input type='checkbox' name='codigo[]' class='codigo[]' value=''></td><td>"+(content_classe!="Todos"?content_classe.split(':')[1]:"Todos")+"</td><td>"+(content_subclasse!="Todos"?content_subclasse.split(':')[1]:"Todos")+"</td><td>"+(content_grupo!="Todos"?content_grupo.split(':')[1]:"Todos")+"</td><td>"+(content_familia!="Todos"?content_familia.split(':')[1]:"Todos")+"</td><td>"+(content_fabricante!="Todos"?content_fabricante.split(':')[1]:"Todos")+"</td><td>"+content_tabela1+"</td><td>"+content_tabela2+"</td><td>"+percentual+"</td><td>"+operacao+"</td></tr>").css("color","dark green").fadeIn();
	        },
			error:function(data){
				console.log('erro: '+data);
			}	
		});				
	}

	$("#btn-removerConfiguracao").click(function(){
	    $("#modalConfirma").modal();
	 });
	 $("#btn-confirmaExcluirRegistros").click(function(){	    	        
	        $(".lista-configuracoesPrecos input:checked").each(function(){	            
	            var elem = $(this);
	            var ordem = elem.val();
	            $.ajax({
                    url: "processa.aspx",
                    data: {"Pagina":"ConfiguracoesPrecos", "Acao":"Remover", "Ordem":ordem},
                    success:function(data){
                        elem.parents("tbody>tr").css("color","red").fadeOut();	                    
                    },
                    error:function(data){
                        console.log(data);
                    }
	            });
	            
	        });	    
	});
	$("#codigo_todos").click(function(){
	    if($(":checked").val()=="seleciona_todos"){
	        $(".lista-configuracoesPrecos input").each(function(){
	            $(this).prop("checked", true);
	        });
	        console.log("selecionou");
	    }else{
	        console.log("deselecionou");
	       $(".lista-configuracoesPrecos input").each(function(){
	            $(this).prop("checked", false);
	        });
	    }
	});
        
        $("#btn-remarcarPrecos").click(function(){
            $(".msgResultado").fadeOut();
            $.ajax({
                url: "processa.aspx",
                data: {"Pagina":"RemarcarPrecos"},
                beforeSend:function(){
                    $(".msgProcessando").show();
		            $("#box-configuracaoPrecos").hide();
                    $("#btn-remarcarPrecos").addClass("disabled");                 
		            $(".spanTimer").timer();		    
                },
                success:function(data){           
                    $("#btn-remarcarPrecos").removeClass("disabled");
                    $(".msgProcessando").hide();
		            $("#box-configuracaoPrecos").show();
                    $(".msgResultado").show();                    
                    //console.log(tempo);
                    $("#btn-verResultados").removeClass("disabled");
                    $("#resultadoRemarcacao").html("<pre>"+data+"</pre>");
                    $(".spanTimer").timer('remove');
                },
                error:function(){
                    $("#btn-remarcarPrecos").removeClass("disabled");                    
		            $("#box-configuracaoPrecos").show();
		            $(".msgProcessando").hide();
                }
            });
        });
        
        $("#btn-removerConfiguracao").click(function(){
            $(".lista-configuracoesPrecos input[checkbox]:selected").css("background","#000");
        });
        
    </script>

  </body>
</html>

