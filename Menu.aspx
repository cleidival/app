	  <!-- Static navbar -->
	  <%
		string[] paginas_permitidas = {""};
		if(Session["Usuario_Logado"]==null){
			Response.Redirect("Login.aspx");
		}else{			
			Response.Write("<div class='row-fluid informacoes_usuario'>");
			Response.Write("Usuario Logado: "+Session["Usuario_Logado"]+" | Ip: "+Session["Session_Ip"]+" | Id de Sessão: "+Session["Session_Id"]+" | <a href='Logout.aspx'>Sair</a>");			
			Response.Write("</div>");
		}
		if(Session["Usuario_Permissoes"]!=null){
			bool acesso_permitido = false;
			paginas_permitidas = Session["Usuario_Permissoes"].ToString().Split(';');
			for(int i=0; i<paginas_permitidas.Length - 1 ; i++){
				//Response.Write(i + "> " + paginas_permitidas[i]+"<br>");
				
				if(Session["Pagina_Atual"].ToString()==paginas_permitidas[i]) {
					acesso_permitido = true;
					//Response.Write("<b> |"+Session["Pagina_Atual"] + "| > |" + paginas_permitidas[i]+"|</b><br>");
				}else{
					//Response.Write("|"+Session["Pagina_Atual"] + "| > |" + paginas_permitidas[i]+"|<br>");
				}
			}
		/*	Response.Write("<br>Pagina_Atual: "+Session["Pagina_Atual"]);
			Response.Write("<br>Acesso_permitido: "+acesso_permitido);*/
			if(acesso_permitido==false){
				if(Session["Pagina_Atual"]!="INICIO"){					
					string texto = Session["Pagina_Atual"].ToString();										
					Response.Redirect("Default.aspx?pagina="+texto);
				}
			}
			
		}
	  %>
      <nav class="navbar navbar-default">
        
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Navegação</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><img src="img/logomarca.png"  border="0" /></a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li><a href="./">Inicio</a></li>               
			  
				<% if(paginas_permitidas.Contains("FISCAL::ALTERAR_DADOS_NFCE")){ %>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Fiscal<span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="AlteraDadosNFCe.aspx">Altera Dados > NFCe</a></li>
				  <li><a href="CorrecaoCampoId.aspx">Corrição Campo ID</a></li>
                </ul>
              </li>
               <% } %> 
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Cadastro <span class="caret"></span></a>
                <ul class="dropdown-menu">                  
                  <% if(paginas_permitidas.Contains("CADASTRO::REMARCACAO_DE_PRECOS")){ %><li><a href="RemarcaPrecos.aspx"><span class="glyphicon glyphicon-usd" aria-hidden="true"></span>&nbsp;Remarcar Precos</a></li><% } %>
                  <% if(paginas_permitidas.Contains("CADASTRO::ALTERAR_FILTROS")){ %><li><a href="AlteraFiltros.aspx"><span class="glyphicon glyphicon-filter" aria-hidden="true"></span>&nbsp;Altera Filtros</a></li><% } %>
                  
				  <% if(paginas_permitidas.Contains("CADASTRO::USUARIOS")){ %>
				  <li class="divider"></li>
                  <li><a href="ListaUsuarios.aspx"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;Usuários</a></li>
				  <% } %>
                </ul>
              </li>
			  <% if(paginas_permitidas.Contains("RELATORIOS::CAIXA")||paginas_permitidas.Contains("RELATORIOS::VENDAS")||paginas_permitidas.Contains("RELATORIOS::CONTAS_PAGAS_RECEBIDAS")||paginas_permitidas.Contains("RELATORIOS::PRODUTOS_PRECO_ESTOQUE_ALTERADOS")||paginas_permitidas.Contains("RELATORIOS::NOTAS_FISCAIS_EM_ABERTO")){ %>
			  <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Relatórios<span class="caret"></span></a>
                <ul class="dropdown-menu">                					
					<% if(paginas_permitidas.Contains("RELATORIOS::CAIXA")){ %><li><a href="Caixa.aspx">Caixas</a></li><% } %>
					<% if(paginas_permitidas.Contains("RELATORIOS::VENDAS")){ %><li><a href="RelatorioVendas.aspx">Vendas por Tipo Recebimento</a></li><% } %>
					<% if(paginas_permitidas.Contains("RELATORIOS::CONTAS_PAGAS_RECEBIDAS")){ %><li><a href="RelatorioPagasRecebidas.aspx">Contas Pagas/Recebidas</a></li><% } %>
					<% if(paginas_permitidas.Contains("RELATORIOS::PRODUTOS_PRECO_ESTOQUE_ALTERADOS")){ %><li><a href="RelatorioProdutosPrecoEstoqueAlterados.aspx">Produtos Preco/Estoque Alterados</a></li><% } %>
					<% if(paginas_permitidas.Contains("RELATORIOS::NOTAS_FISCAIS_EM_ABERTO")){ %><li><a href="RelatorioNotasFiscaisEmAberto.aspx">Notas Fiscais em Aberto</a></li><% } %>
                </ul>
             </li>
			 <% } %>
             </ul>            
          </div>
      </nav>
