using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
//using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
//using System.Xml.Linq;





public partial class Processa : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd, cmd1, cmd2;
    SqlDataReader rdr;

    string cons9, sql = "";

    protected void Page_Load(object sender, EventArgs e)
    {
	
		con = new SqlConnection(ConfigurationManager.ConnectionStrings["shop9ConnectionString"].ConnectionString);

        if(Request.QueryString["Pagina"].ToString() == "AlterarFiltros"){
            if(Request.QueryString["Acao"].ToString() ==  "consultarNomeFiltros"){
                Response.Write(getNomeFiltro(Request.QueryString["Objeto"].ToString(), Request.QueryString["Codigo"].ToString()));
            }else
            if(Request.QueryString["Acao"].ToString() ==  "mostrarReultadosAlterarFiltros"){
				string classe = Request.QueryString["Classe"].ToString();
		        string subclasse = Request.QueryString["Subclasse"].ToString();
		        string grupo = Request.QueryString["Grupo"].ToString();
		        string familia = Request.QueryString["Familia"].ToString();
		        string pesquisa_1 = Request.QueryString["Pesquisa_1"].ToString();
		        string pesquisa_2 = Request.QueryString["Pesquisa_2"].ToString();
		        string pesquisa_3 = Request.QueryString["Pesquisa_3"].ToString();
		        string fabricante = Request.QueryString["Fabricante"].ToString();		        
		        string NCM = Request.QueryString["NCM"].ToString();
		        string descricao1 = Request.QueryString["Descricao1"].ToString();
		        string descricao2 = Request.QueryString["Descricao2"].ToString();
		        string inativo = Request.QueryString["Inativo"].ToString();

		        mostarResultadoAlterarFiltros(classe, subclasse, grupo, familia, pesquisa_1, pesquisa_2, pesquisa_3, fabricante, NCM, descricao1, descricao2, inativo);
            }else
            if(Request.QueryString["Acao"].ToString() ==  "confirmarAlteracaoFiltros"){
				/*FILTROS A SEREM ALTERADOS*/
				string codigo_produtos = Request.QueryString["Codigos_produtos"].ToString();
				string classe = Request.QueryString["Classe"].ToString();
		        string subclasse = Request.QueryString["Subclasse"].ToString();
		        string grupo = Request.QueryString["Grupo"].ToString();
		        string familia = Request.QueryString["Familia"].ToString();
		        string pesquisa_1 = Request.QueryString["Pesquisa_1"].ToString();
		        string pesquisa_2 = Request.QueryString["Pesquisa_2"].ToString();
		        string pesquisa_3 = Request.QueryString["Pesquisa_3"].ToString();
		        string fabricante = Request.QueryString["Fabricante"].ToString();		        
		        string NCM = Request.QueryString["NCM"].ToString();
		        string descricao1 = Request.QueryString["Descricao1"].ToString();
		        string descricao2 = Request.QueryString["Descricao2"].ToString();
		        /*NOVOS FILTROS*/
				string classeNovo = Request.QueryString["ClasseNovo"].ToString();
		        string subclasseNovo = Request.QueryString["SubclasseNovo"].ToString();
		        string grupoNovo = Request.QueryString["GrupoNovo"].ToString();
		        string familiaNovo = Request.QueryString["FamiliaNovo"].ToString();
		        string pesquisa_1Novo = Request.QueryString["Pesquisa_1Novo"].ToString();
		        string pesquisa_2Novo = Request.QueryString["Pesquisa_2Novo"].ToString();
		        string pesquisa_3Novo = Request.QueryString["Pesquisa_3Novo"].ToString();
		        string fabricanteNovo = Request.QueryString["FabricanteNovo"].ToString();		        
		        string NCMNovo = Request.QueryString["NCMNovo"].ToString();
		        //string nomeNovo = Request.QueryString["NovoNome"].ToString();
		       	string inativo = Request.QueryString["Inativo"].ToString();

		        confirmarAlteracaoFiltros(codigo_produtos, classe, subclasse, grupo, familia, pesquisa_1, pesquisa_2, pesquisa_3, fabricante, NCM, descricao1, descricao2, classeNovo, subclasseNovo, grupoNovo, familiaNovo, pesquisa_1Novo, pesquisa_2Novo, pesquisa_3Novo, fabricanteNovo, NCMNovo, inativo);
            }else
            if(Request.QueryString["Acao"].ToString() ==  "alterarDescricaoProdutos"){
            	string codigo = Request.QueryString["Codigo_produto"].ToString();
				string codigo_adicional1 = Request.QueryString["Codigo_Adicional"].ToString();
				string nome = Request.QueryString["Nome_produto"].ToString();
				string preco_compra = Request.QueryString["Preco_Compra"].ToString();
				string preco_avista = Request.QueryString["Preco_Avista"].ToString();
				
				alterarDescricaoProdutos(codigo, nome, codigo_adicional1, preco_compra, preco_avista);
            }else
            if(Request.QueryString["Acao"].ToString() ==  "alterarProdutoInativo"){
            	string codigo = Request.QueryString["Codigo_produto"].ToString();
				string inativo = Request.QueryString["Inativo_produto"].ToString();
				alterarProdutoInativo(codigo, inativo);
            }else
            if(Request.QueryString["Acao"].ToString() ==  "apagarRelacaoProdutosSimilares"){
                apagarRelacaoProdutosSimilares(Request.QueryString["ordem_produto_origem"].ToString(), Request.QueryString["ordem_produto_similar"].ToString());
            }else
            if(Request.QueryString["Acao"].ToString() ==  "adicionarRelacaoProdutosSimilares"){
                adicionarRelacaoProdutosSimilares(Request.QueryString["ordem_produto_origem"].ToString(), Request.QueryString["ordem_produto_similar"].ToString());
            }else
            if(Request.QueryString["Acao"].ToString() ==  "listarRelacaoProdutosSimilares"){
                listarRelacaoProdutosSimilares(Request.QueryString["ordem_produto_origem"].ToString());
            }
        }else
            if(Request.QueryString["Pagina"].ToString() == "RemarcarPrecos"){
                atualizarPrecos();
            }else
            if(Request.QueryString["Pagina"].ToString() == "ConfiguracoesPrecos"){
                if(Request.QueryString["Acao"].ToString() == "Verificar"){			
			        string classe = Request.QueryString["Classe"].ToString();
			        string subclasse = Request.QueryString["Subclasse"].ToString();
			        string grupo = Request.QueryString["Grupo"].ToString();
			        string familia = Request.QueryString["Familia"].ToString();
			        string fabricante = Request.QueryString["Fabricante"].ToString();
			        string tabela1 = Request.QueryString["Tabela1"].ToString();
			        string tabela2 = Request.QueryString["Tabela2"].ToString();
			        string percentual = Request.QueryString["Percentual"].ToString();
			        string operacao = Request.QueryString["Operacao"].ToString();

			        verificarConfiguracaoPrecosExiste(classe, subclasse, grupo, familia, fabricante, tabela1, tabela2, percentual, operacao);
			    }else
			        if(Request.QueryString["Acao"].ToString() == "Adicionar"){			
				        string classe = Request.QueryString["Classe"].ToString();
				        string subclasse = Request.QueryString["Subclasse"].ToString();
				        string grupo = Request.QueryString["Grupo"].ToString();
				        string familia = Request.QueryString["Familia"].ToString();
				        string fabricante = Request.QueryString["Fabricante"].ToString();
				        string tabela1 = Request.QueryString["Tabela1"].ToString();
				        string tabela2 = Request.QueryString["Tabela2"].ToString();
				        string percentual = Request.QueryString["Percentual"].ToString();
				        string operacao = Request.QueryString["Operacao"].ToString();

				        adicionarConfiguracaoPrecos(classe, subclasse, grupo, familia, fabricante, tabela1, tabela2, percentual, operacao);
			        }else
				        if(Request.QueryString["Acao"].ToString() == "Remover"){				
					        string ordem = Request.QueryString["Ordem"].ToString();
					        removerConfiguracaoPrecos(ordem);
				        }
            }else
            if(Request.QueryString["Pagina"].ToString() == "Login"){
            	string codigo_usuario = Request.QueryString["Codigo_Usuario"].ToString();

            	if(Request.QueryString["Acao"].ToString() == "Verificar_Usuario"){            		
            		verificarUsuario(codigo_usuario);
            	}else
            	if(Request.QueryString["Acao"].ToString() == "Logar"){
            		string senha_usuario = Request.QueryString["Senha_Usuario"].ToString();
            		verificarCredenciais(codigo_usuario, senha_usuario);
            	}
          		
            }else
            if(Request.QueryString["Pagina"].ToString() == "Funcionarios"){
            	string codigo_usuario = Request.QueryString["Codigo_Usuario"].ToString();
            	if(Request.QueryString["Acao"].ToString() == "AlterarAcessoFuncionario")	{
					string status = Request.QueryString["status"].ToString();
            		AlterarAcessoFuncionario(codigo_usuario, status);
            	}else
				if(Request.QueryString["Acao"].ToString() == "RemoverFuncionario")	{
            		RemoverFuncionario(codigo_usuario);
            	}else
				if(Request.QueryString["Acao"].ToString() == "PermissoesFuncionario")	{
					string txtPermissoes = Request.QueryString["txtPermissoes"].ToString();
            		PermissoesFuncionario(codigo_usuario, txtPermissoes);
            	}else
				if(Request.QueryString["Acao"].ToString() == "AdicionarFuncionario")	{
            		AdicionarFuncionario(codigo_usuario);
            	}else
				if(Request.QueryString["Acao"].ToString() == "AlterarSenhaFuncionario")	{
					string nova_senha = Request.QueryString["nova_senha"].ToString();
            		AlterarSenhaFuncionario(codigo_usuario, nova_senha);
            	}else
				if(Request.QueryString["Acao"].ToString() == "CarregarPermissoesFuncionario")	{					
            		CarregarPermissoesFuncionario(codigo_usuario);
            	}				
            }else
			if(Request.QueryString["Pagina"].ToString() == "AtualizarNCM"){
				string txtNCM = Request.QueryString["txtNCM"].ToString();
				string txtOrdemMovimento = Request.QueryString["txtOrdemMovimento"].ToString();
				string txtOrdemProdServ = Request.QueryString["txtOrdemProdServ"].ToString();
				string txtOrdemMovimentoProdServ = Request.QueryString["txtOrdemMovimentoProdServ"].ToString();
                atualizarNCM(txtNCM, txtOrdemMovimento, txtOrdemProdServ, txtOrdemMovimentoProdServ);
            }else
			if(Request.QueryString["Pagina"].ToString() == "BuscarClientes"){
				string txtBusca = Request.QueryString["txtBusca"].ToString();				
                BuscarClientes(txtBusca);
            }else
            if(Request.QueryString["Pagina"].ToString() == "Relatorios"){
            	if(Request.QueryString["Acao"].ToString() == "VendasPorCliente"){
					string filial = Request.QueryString["filial"].ToString();
					string caixa = Request.QueryString["caixa"].ToString();
					string data_inicial = Request.QueryString["data_inicial"].ToString();
					string data_final = Request.QueryString["data_final"].ToString();
					viewRelatorioVendasPorCliente(filial, caixa, data_inicial, data_final);
            	}else
				if(Request.QueryString["Acao"].ToString() == "TotaisCaixa"){
					string filial = Request.QueryString["filial"].ToString();
					string caixa = Request.QueryString["caixa"].ToString();
					string data_inicial = Request.QueryString["data_inicial"].ToString();
					string data_final = Request.QueryString["data_final"].ToString();
					totaisCaixas(filial, caixa, data_inicial, data_final);
            	}else
				if(Request.QueryString["Acao"].ToString() == "NotasFiscaisEmAberto"){
					string filial = Request.QueryString["filial"].ToString();
					string data_inicial = Request.QueryString["data_inicial"].ToString();
					string data_final = Request.QueryString["data_final"].ToString();
					RelatorioNotasFiscaisEmAberto(filial, data_inicial, data_final);
            	}
				
            }
    }
	
	protected void PermissoesFuncionario(string codigo_usuario, string txtPermissoes){
		string sql = @"update zcf_funcionarios set permissoes='"+txtPermissoes+"' where ordem_funcionario='"+codigo_usuario+"'";
		Response.Write(sql);
		try{
			con.Close();
			con.Open();
			cmd = new SqlCommand(sql, con);
			cmd.ExecuteNonQuery();
			con.Close();
			Response.Write("Permissoes alteradas com sucesso");
			
		}catch(SqlException ex){
			Response.Write(ex.ToString());
		}
	}
	
	protected void CarregarPermissoesFuncionario(string codigo_usuario){
		string sql = @"select permissoes from zcf_funcionarios where ordem_funcionario='"+codigo_usuario+"'";
		
		try{
			con.Close();
			con.Open();
			cmd = new SqlCommand(sql, con);
			rdr = cmd.ExecuteReader();
			if(rdr.HasRows){
				while(rdr.Read()){
					Response.Write(rdr["permissoes"].ToString()+";");
				}
			}
			con.Close();
		}catch(SqlException ex){
			Response.Write(ex.ToString());
		}
	}

	protected void BuscarClientes(string txtBusca){
    	string sql = @" declare @texto varchar(255) "+
						" set @texto= '%"+txtBusca+"%' "+
						" select top 10 codigo, nome, fantasia, cpf, cnpj, rg_ie,  fone_1,fone_2, comentarios from cli_for where "+
						" nome like @texto or fantasia like @texto or endereco like @texto"+
						" or bairro like @texto or cidade like @texto or cnpj like @texto or rg_ie like @texto or comentarios like @texto ";
    	try{
    		con.Close();
    		con.Open();
    		cmd = new SqlCommand(sql, con);        
	    	rdr = cmd.ExecuteReader();
			Response.Write("<table class='table table-striped'>");
			Response.Write("<tr><th>CODIGO</th><th>NOME</th><th>FANTASIA</th><th>FONE</th></tr>");
			if(rdr.HasRows){				
				while(rdr.Read()){
					Response.Write("<tr>");
					Response.Write("<td>"+rdr["codigo"].ToString()+"</td>");
					Response.Write("<td>"+rdr["nome"].ToString()+"</td>");
					Response.Write("<td>"+rdr["fantasia"].ToString()+"</td>");
					Response.Write("<td>"+rdr["fone_1"].ToString()+" | "+rdr["fone_2"].ToString()+"</td>");
					Response.Write("</tr>");
					
				}
			}
			Response.Write("</table");
	    	con.Close();
	    	
		}catch(SqlException ex){
			Response.Write(ex.ToString());
		}
    }
	
	protected void AlterarSenhaFuncionario(string codigo_usuario, string nova_senha){
    	string sql = @"UPDATE zcf_funcionarios SET senha='"+nova_senha+"' WHERE ordem_funcionario='"+codigo_usuario+"'";
    	try{
    		con.Close();
    		con.Open();
    		cmd = new SqlCommand(sql, con);        
	    	cmd.ExecuteNonQuery();
	    	con.Close();
	    	Response.Write(sql + "senha alterada com sucesso.");
		}catch(SqlException ex){
			Response.Write(ex.ToString());
		}
    }
	
    protected void AlterarAcessoFuncionario(string codigo_usuario, string status){
    	string sql = @"UPDATE zcf_funcionarios SET habilitado='"+status+"' WHERE ordem_funcionario='"+codigo_usuario+"'";
    	try{
    		con.Close();
    		con.Open();
    		cmd = new SqlCommand(sql, con);        
	    	cmd.ExecuteNonQuery();
	    	con.Close();
	    	Response.Write(sql + "funcionarios alterado com sucesso.");
		}catch(SqlException ex){
			Response.Write(ex.ToString());
		}
    }
	
	protected void AdicionarFuncionario(string codigo_usuario){
    	string sql = @"INSERT INTO zcf_funcionarios(ordem_funcionario)VALUES('"+codigo_usuario+"')";
    	try{
    		con.Close();
    		con.Open();
    		cmd = new SqlCommand(sql, con);        
	    	cmd.ExecuteNonQuery();
	    	con.Close();
	    	Response.Write(sql + "funcionarios inserido com sucesso.");
		}catch(SqlException ex){
			Response.Write(ex.ToString());
		}
    }
	
	protected void RemoverFuncionario(string codigo_usuario){
    	string sql = @"DELETE FROM zcf_funcionarios where ordem_funcionario='"+codigo_usuario+"'";
    	try{
    		con.Close();
    		con.Open();
    		cmd = new SqlCommand(sql, con);        
	    	cmd.ExecuteNonQuery();
	    	con.Close();
	    	Response.Write(sql + "funcionarios excluido com sucesso.");
		}catch(SqlException ex){
			Response.Write(ex.ToString());
		}
    }
	
    protected void alterarProdutoInativo(string codigo, string inativo){
    	string sql = @"UPDATE prod_serv SET inativo='"+inativo+"' WHERE ordem='"+codigo+"'";
    	try{
    		con.Close();
    		con.Open();
    		cmd = new SqlCommand(sql, con);        
	    	cmd.ExecuteNonQuery();
	    	con.Close();
	    	Response.Write(sql + "Produto alterado com sucesso.");
		}catch(SqlException ex){
			Response.Write(ex.ToString());
		}
    }
	//alterarDescricaoProdutos(codigo, nome, codigo_adicional1, preco_compra, preco_avista);
    protected void alterarDescricaoProdutos(string codigo, string nome, string codigo_adicional1, string preco_compra, string preco_avista){
		alterarPrecoUnitarioProduto(codigo, "8", preco_compra);
		alterarPrecoUnitarioProduto(codigo, "5", preco_avista);    	

    	string sql = @"UPDATE prod_serv SET nome=UPPER('"+nome+"'), codigo_adicional1=UPPER('"+codigo_adicional1+"') WHERE ordem='"+codigo+"'";

    	try{
    		con.Close();
    		con.Open();
    		cmd = new SqlCommand(sql, con);        
	    	cmd.ExecuteNonQuery();
	    	con.Close();
	    	Response.Write("Nome alterado com sucesso.");
		}catch(SqlException ex){
			Response.Write(ex.ToString());
		}
		
    }

    protected void alterarPrecoUnitarioProduto(string codigo_produto, string codigo_tabela_preco, string preco){
    	preco = preco.Replace(".","").Replace(",",".");
    	
    	string sql = @"UPDATE Prod_Serv_Precos SET preco='"+preco+"' WHERE Ordem_Prod_Serv='"+codigo_produto+"' and ordem_tabela_preco='"+codigo_tabela_preco+"'";
    	Response.Write(sql);
    	try{
    		con.Close();
    		con.Open();
    		cmd = new SqlCommand(sql, con);        
	    	cmd.ExecuteNonQuery();
	    	con.Close();
	    	Response.Write("Preco alterado com sucesso.");
		}catch(SqlException ex){
			Response.Write(ex.ToString());
		}
    }

    protected void mostarResultadoAlterarFiltros(string classe, string subclasse, string grupo, string familia, string pesquisa_1, string pesquisa_2, string pesquisa_3, string fabricante, string NCM, string descricao1, string descricao2, string inativo){
        string sql = @"SELECT ordem, codigo, nome, inativo, codigo_adicional1,
(select top 1 Fabricantes.nome from Fabricantes where Fabricantes.ordem=prod_serv.Ordem_Fabricante) as Fabricante,
(select top 1 Classes.nome from classes where Classes.ordem=prod_serv.Ordem_Classe) as Classe,
(select top 1 Subclasses.nome from Subclasses where Subclasses.ordem=prod_serv.Ordem_Subclasse) as Subclasse,
(select top 1 Grupos.nome from Grupos where Grupos.ordem=prod_serv.Ordem_Grupo) as Grupo,
(select top 1 Familias.nome from Familias where Familias.ordem=prod_serv.Ordem_Familia) as Familia,
(select count(*) from prod_serv_similares where prod_serv_similares.ordem_prod_serv_origem=(select top 1 p2.ordem from prod_serv p2 where p2.ordem=prod_serv.ordem) or prod_serv_similares.ordem_prod_serv_similar=(select top 1 p2.ordem from prod_serv p2 where p2.ordem=prod_serv.ordem)) as similar,
(select sum(estoque_atual.qtde_estoque_atual) from estoque_atual where estoque_atual.ordem_prod_serv=(select top 1 p2.ordem from prod_serv p2 where p2.ordem=prod_serv.ordem)) as estoque,
(select top 1 estoque_atual.estoque_minimo from estoque_atual where estoque_atual.ordem_prod_serv=(select top 1 p2.ordem from prod_serv p2 where p2.ordem=prod_serv.ordem)) as estoque_minimo,
(select top 1 estoque_atual.estoque_ideal from estoque_atual where estoque_atual.ordem_prod_serv=(select top 1 p2.ordem from prod_serv p2 where p2.ordem=prod_serv.ordem)) as estoque_ideal,
(select top 1 Pesquisa_1.nome from Pesquisa_1 where Pesquisa_1.ordem=prod_serv.Ordem_Pesquisa_1) as Pesquisa1,
(select top 1 Pesquisa_2.nome from Pesquisa_2 where Pesquisa_2.ordem=prod_serv.Ordem_Pesquisa_2) as Pesquisa2,
(select top 1 Pesquisa_3.nome from Pesquisa_3 where Pesquisa_3.ordem=prod_serv.Ordem_Pesquisa_3) as Pesquisa3,
(select top 1 Prod_Serv_Precos.Preco from Prod_Serv_Precos  where Prod_Serv_Precos.Ordem_Tabela_Preco=8 and Prod_Serv_Precos.Ordem_Prod_Serv=prod_serv.Ordem) as preco_compra,
(select top 1 Prod_Serv_Precos.Preco from Prod_Serv_Precos  where Prod_Serv_Precos.Ordem_Tabela_Preco=5 and Prod_Serv_Precos.Ordem_Prod_Serv=prod_serv.Ordem) as preco_avista 
 FROM prod_serv WHERE ";
        if(classe.Length!=0){
        	sql += 	@" ordem_classe=(SELECT top 1 ordem FROM classes WHERE codigo='"+classe+"') AND ";
        }
        if(subclasse.Length!=0){
        	sql += 	@" ordem_subclasse=(SELECT  top 1 ordem  FROM subclasses WHERE codigo='"+subclasse+"') AND ";
        }
		if(grupo.Length!=0){
	        	sql += 	@" ordem_grupo=(SELECT  top 1 ordem  FROM grupos WHERE codigo='"+grupo+"') AND ";
	        }
		if(familia.Length!=0){
	        	sql += 	@" ordem_familia=(SELECT  top 1 ordem  FROM familias WHERE codigo='"+familia+"') AND ";
	        }
		if(pesquisa_1.Length!=0){
	        	sql += 	@" ordem_pesquisa_1=(SELECT  top 1 ordem  FROM pesquisa_1 WHERE codigo='"+pesquisa_1+"') AND ";
	        }
		if(pesquisa_2.Length!=0){
	        	sql += 	@" ordem_pesquisa_2=(SELECT  top 1 ordem  FROM pesquisa_2 WHERE codigo='"+pesquisa_2+"') AND ";
	        }
		if(pesquisa_3.Length!=0){
	        	sql += 	@" ordem_pesquisa_3=(SELECT  top 1 ordem  FROM pesquisa_3 WHERE codigo='"+pesquisa_3+"') AND ";
	        }
		if(fabricante.Length!=0){
	        	sql += 	@" ordem_fabricante=(SELECT  top 1 ordem  FROM fabricantes WHERE codigo='"+fabricante+"') AND ";
	        }
        if(NCM.Length!=0){
        	sql += 	@" ordem_ncm=(SELECT  top 1 ordem  FROM NCM WHERE codigo='"+NCM+"') AND ";
        }
        
        if(inativo=="0"){sql += @" inativo='0' AND ";}
		sql += @" (nome like '%" + descricao1 + "%' AND nome like '%" + descricao2 + "%') AND ordem>0 ORDER BY nome ";
        
        cmd = new SqlCommand(sql, con);
        con.Open();        
        rdr = cmd.ExecuteReader();

        //Response.Write(sql);

        /*
		Response.Write("<div class='table-responsive'>");
        Response.Write("<table class='table table-hover table-striped lista-ConfirmacaoProdutos'>");
        Response.Write("<thead>");
        Response.Write("<tr><th><input type='checkbox' name='codigo_todos' id='codigo_todos' Value='0' checked='checkbox'></th><th>CODIGO</th><th>NOME</th></tr>");
        Response.Write("</thead>");
        Response.Write("</tbody>");*/
        
        string listaProdutos = "{\"items\":[";
        try{
	        if (rdr.HasRows)
	        {
				while(rdr.Read()){
					//Response.Write(rdr["codigo"].ToString());
					//listaProdutos += "{\"ordem\":\""+rdr["ordem"].ToString()+"\",\"codigo\":\""+rdr["codigo"].ToString()+"\",\"nome\":\""+rdr["nome"].ToString().Replace("\"","\'")+"\"},";
					string preco_compra = "0";
					if(rdr["preco_compra"].ToString().Length!=0){
						preco_compra = rdr["preco_compra"].ToString();
					}

					string preco_avista = "0";
					if(rdr["preco_avista"].ToString().Length!=0){
						preco_avista = rdr["preco_avista"].ToString();
					}

					string estoque = "0";
					if(rdr["estoque"].ToString().Length!=0){
						estoque = rdr["estoque"].ToString();
					}
					string similar = "0";
					if(rdr["similar"].ToString().Length!=0){
						similar = rdr["similar"].ToString();
					}
					string estoque_minimo = "0";
					if(rdr["estoque_minimo"].ToString().Length!=0){
						estoque_minimo = rdr["estoque_minimo"].ToString();
					}
					string estoque_ideal = "0";
					if(rdr["estoque_ideal"].ToString().Length!=0){
						estoque_ideal = rdr["estoque_ideal"].ToString();
					}


					listaProdutos += "{\"ordem\":\""+rdr["ordem"].ToString()+
					"\",\"codigo_adicional1\":\""+Server.HtmlEncode(rdr["codigo_adicional1"].ToString())+
					"\",\"codigo\":\""+rdr["codigo"].ToString().Replace("\"","\'")+
					"\",\"nome\":\""+Server.HtmlEncode(rdr["nome"].ToString())+
					"\",\"fabricante\":\""+Server.HtmlEncode(rdr["fabricante"].ToString().Replace("\"","\'"))+
					"\",\"classe\":\""+rdr["classe"].ToString().Replace("\"","\'")+
					"\",\"subclasse\":\""+rdr["subclasse"].ToString().Replace("\"","\'")+
					"\",\"grupo\":\""+rdr["grupo"].ToString().Replace("\"","\'")+
					"\",\"familia\":\""+rdr["familia"].ToString().Replace("\"","\'")+
					"\",\"inativo\":\""+rdr["inativo"].ToString()+					
					"\",\"similar\":\""+String.Format("{0:0}", Convert.ToDecimal(similar))+					
					"\",\"estoque\":\""+String.Format("{0:N}", Convert.ToDecimal(estoque))+					
					"\",\"estoque_minimo\":\""+String.Format("{0:N}", Convert.ToDecimal(estoque_minimo))+					
					"\",\"estoque_ideal\":\""+String.Format("{0:N}", Convert.ToDecimal(estoque_ideal))+					
					"\",\"preco_compra\":\""+String.Format("{0:N}", Convert.ToDecimal(preco_compra))+					
					"\",\"preco_avista\":\""+String.Format("{0:N}", Convert.ToDecimal(preco_avista))+
					"\"},";


				}
	        }else{
	        	//Response.Write("<tr><td colspan='3'><div class='error'>Para os filtros NAO foi realizada NENHUMA ATUALIZACAO!</div></td></tr>");        	
	        }
	        listaProdutos += "]}";
	        listaProdutos = listaProdutos.Replace("},]}","}]}");
        }catch(Exception ex){ Response.Write(ex.ToString());}
        
       //Response.Write("({\"teste\":\"teste ok\"})");
		
		//string jsonString = Newtonsoft.Json.JsonConvert.SerializeObject(listaProdutos);
		Response.Write(listaProdutos);

        //Response.Write(sql);
        rdr.Close();        
        con.Close();

        
        
    }
protected void confirmarAlteracaoFiltros(string codigos_produtos, string classe, string subclasse, string grupo, string familia, string pesquisa_1, string pesquisa_2, string pesquisa_3, string fabricante, string NCM, string descricao1, string descricao2, string classeNovo, string subclasseNovo, string grupoNovo, string familiaNovo, string pesquisa_1Novo, string pesquisa_2Novo, string pesquisa_3Novo, string fabricanteNovo, string NCMNovo, string inativo){
		string sqlU = "";
		string sqlT = "";
		string condicao = "";
		string sql = @"SELECT * FROM prod_serv WHERE ";
		
		
		if(codigos_produtos.Length!=0){
        	sql += 	@" ordem in ("+codigos_produtos+") AND ";
        }
        if(classe.Length!=0){
        	sql += 	@" ordem_classe=(SELECT top 1 ordem FROM classes WHERE codigo='"+classe+"') AND ";
        }
        if(subclasse.Length!=0){
        	sql += 	@" ordem_subclasse=(SELECT  top 1 ordem  FROM subclasses WHERE codigo='"+subclasse+"') AND ";
        }
		if(grupo.Length!=0){
	        	sql += 	@" ordem_grupo=(SELECT  top 1 ordem  FROM grupos WHERE codigo='"+grupo+"') AND ";
	        }
		if(familia.Length!=0){
	        	sql += 	@" ordem_familia=(SELECT  top 1 ordem  FROM familias WHERE codigo='"+familia+"') AND ";
	        }
		if(pesquisa_1.Length!=0){
	        	sql += 	@" ordem_pesquisa_1=(SELECT  top 1 ordem  FROM pesquisa_1 WHERE codigo='"+pesquisa_1+"') AND ";
	        }
		if(pesquisa_2.Length!=0){
	        	sql += 	@" ordem_pesquisa_2=(SELECT  top 1 ordem  FROM pesquisa_2 WHERE codigo='"+pesquisa_2+"') AND ";
	        }
		if(pesquisa_3.Length!=0){
	        	sql += 	@" ordem_pesquisa_3=(SELECT  top 1 ordem  FROM pesquisa_3 WHERE codigo='"+pesquisa_3+"') AND ";
	        }
		if(fabricante.Length!=0){
	        	sql += 	@" ordem_fabricante=(SELECT  top 1 ordem  FROM fabricantes WHERE codigo='"+fabricante+"') AND ";
	        }
	        if(NCM.Length!=0){
	        	sql += 	@" ordem_ncm=(SELECT  top 1 ordem  FROM NCM WHERE codigo='"+NCM+"') AND ";
	        }
	    if(inativo=="0"){sql += @" inativo='0' AND ";}
		sql += @" (nome like '%" + descricao1 + "%' AND nome like '%" + descricao2 + "%') ORDER BY nome ";
        
        //Response.Write(sql);

        cmd = new SqlCommand(sql, con);
        con.Open();        
        rdr = cmd.ExecuteReader();
        string result = "";
        result += @"<div class='table-responsive'>";
        result += @"<table class='table table-hover table-striped lista-configuracoesPrecos'>";
        result += @"<thead>";
        result += @"<tr><th>CODIGO</th><th>NOME</th></tr>";
        result += @"</thead>";
        result += @"</tbody>";
        
		if (rdr.HasRows)
        {
			while(rdr.Read()){

				result += @"<tr><td><span class='glyphicon glyphicon-ok'></span>"+rdr["codigo"].ToString()+"</td><td>"+rdr["nome"].ToString()+"</td></tr>";

				sqlU = "";
				
		        if(classe!=classeNovo && classeNovo.Length!=0){
		        	sqlU += 	(sqlU.Length!=0?@", ":"") + @" ordem_classe=(SELECT top 1 ordem FROM classes WHERE codigo='"+classeNovo+"') ";		        	
		        }
		        if(subclasse!=subclasseNovo && subclasseNovo.Length!=0){
		        	sqlU += 	(sqlU.Length!=0?@", ":"") + @" ordem_subclasse=(SELECT  top 1 ordem  FROM subclasses WHERE codigo='"+subclasseNovo+"') ";		        	
		        }
				if(grupo!=grupoNovo && grupoNovo.Length!=0){
			        sqlU += 	(sqlU.Length!=0?@", ":"") + @" ordem_grupo=(SELECT  top 1 ordem  FROM grupos WHERE codigo='"+grupoNovo+"') ";			        
			   	}
				if(familia!=familiaNovo && familiaNovo.Length!=0){
			        sqlU += 	(sqlU.Length!=0?@", ":"") + @" ordem_familia=(SELECT  top 1 ordem  FROM familias WHERE codigo='"+familiaNovo+"') ";			        
			    }
				if(pesquisa_1!=pesquisa_1Novo && pesquisa_1Novo.Length!=0){
			        sqlU += 	(sqlU.Length!=0?@", ":"") + @" ordem_pesquisa_1=(SELECT  top 1 ordem  FROM pesquisa_1 WHERE codigo='"+pesquisa_1Novo+"') ";
			    }
				if(pesquisa_2!=pesquisa_2Novo && pesquisa_2Novo.Length!=0){
			        sqlU += 	(sqlU.Length!=0?@", ":"") + @" ordem_pesquisa_2=(SELECT  top 1 ordem  FROM pesquisa_2 WHERE codigo='"+pesquisa_2Novo+"') ";			    
			    }
				if(pesquisa_3!=pesquisa_3Novo && pesquisa_3Novo.Length!=0){
			        sqlU += 	(sqlU.Length!=0?@", ":"") + @" ordem_pesquisa_3=(SELECT  top 1 ordem  FROM pesquisa_3 WHERE codigo='"+pesquisa_3Novo+"') ";			        
			    }
				if(fabricante!=fabricanteNovo && fabricanteNovo.Length!=0){
			        sqlU += 	(sqlU.Length!=0?@", ":"") + @" ordem_fabricante=(SELECT  top 1 ordem  FROM fabricantes WHERE codigo='"+fabricanteNovo+"') ";			        
			    }
		        if(NCM!=NCMNovo && NCMNovo.Length!=0){
		        	sqlU += 	(sqlU.Length!=0?@", ":"") + @" ordem_ncm=(SELECT  top 1 ordem  FROM NCM WHERE codigo='"+NCMNovo+"') ";		        	
		        }		        
		        
		        if(sqlU.Length!=0){		        	
		        	sqlT += @"UPDATE prod_serv SET " + sqlU +  @" WHERE ordem='"+rdr["ordem"].ToString()+"';";			        			    
		        }
		        
			}
        }else{
        	result += @"<tr><td colspan='2'>NADA FOI ALTERADO</td></tr>";
        }
        result += @"</tbody></table></div>";
        
        //Response.Write(result);
        //Response.Write("SQL: "+sqlT+"<BR>");
        rdr.Close();

		/*ATUALIZA PRODUTOS DE ACORDO COM O FILTROS INFORMADOS ANTERIORMENTE*/
        if(sqlT.Length!=0){
	        cmd2 = new SqlCommand(sqlT, con);        
	        cmd2.ExecuteNonQuery();
	        con.Close();	
	        Response.Write("<div class='success'>Produtos Atualizados com sucesso.</div>");
	        Response.Write(result);

        }else{
        	Response.Write("<div class='error'>Para os filtros NAO foi realizada NENHUMA ATUALIZACAO!</div>");
        }
        con.Close();
        
        
    }
    protected string getNomeFiltro(string tabela, string codigo){
    	
    	string nome = "NAO CADASTRADO";

    	if(codigo.Length!=0){
	    	string sql = @"SELECT top 1 nome FROM " + tabela + " WHERE codigo='" + codigo + "'";
	        
	        cmd = new SqlCommand(sql, con);
	        con.Open();
	        rdr = cmd.ExecuteReader();
	        if (rdr.HasRows)
	        {
	            rdr.Read();            
	            nome = rdr["nome"].ToString();            
	        }
	        rdr.Close();
	        con.Close();	
    	}
        
        return nome;
    } 
   
    protected void atualizarPrecos(){
        string data_inicial = DateTime.Now.ToString("yyyy-MM-dd h:m:s");
        string data_final = DateTime.Now.ToString("yyyy-MM-dd h:m:s");
		try{
            
            cmd = new SqlCommand("spRemarcacaoPrecos", con);
	        cmd.CommandTimeout = 3000;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@tipo", SqlDbType.VarChar).Value = 'v';
            con.Close();
            con.Open();			
            cmd.ExecuteNonQuery();            
            con.Close();            
        }
        catch (SqlException ex) { Response.Write("Erro: " + ex.ToString()); }	
   } 
	protected void adicionarConfiguracaoPrecos(string classe, string subclasse, string grupo, string familia, string fabricante, string tabela1, string tabela2, string percentual, string operacao){
        string data_inicial = DateTime.Now.ToString("yyyy-MM-dd h:m:s");
        string data_final = DateTime.Now.ToString("yyyy-MM-dd h:m:s");
		try{

	        string sql = @"INSERT INTO x_cfsis_remarcacao_preco(ordem_classe, ordem_subclasse, ordem_grupo, ordem_familia, ordem_fabricante, ordem_tabela_1, ordem_tabela_2, valor, aumenta_diminui) VALUES('"+classe+"', '"+subclasse+"', '"+grupo+"', '"+familia+"', '"+fabricante+"', '"+tabela1+"', '"+tabela2+"', '"+percentual+"', '"+operacao+"')";
			//Response.Write(sql);
			cmd = new SqlCommand(sql, con);
	        	con.Open();
			cmd.ExecuteNonQuery();
	        	con.Close();
	            
	    }catch (SqlException ex) { Response.Write("Erro: " + ex.ToString()); }	
	} 
	protected void verificarConfiguracaoPrecosExiste(string classe, string subclasse, string grupo, string familia, string fabricante, string tabela1, string tabela2, string percentual, string operacao){
        
		try{

			string sql = @"SELECT TOP 1 * FROM x_cfsis_remarcacao_preco WHERE ordem_classe='"+classe+"' AND ordem_subclasse='"+subclasse+"' AND ordem_grupo='"+grupo+"' AND ordem_familia='"+familia+"' AND ordem_fabricante='"+fabricante+"' AND ordem_tabela_1='"+tabela1+"' AND ordem_tabela_2='"+tabela2+"'";
			//Response.Write(sql);
			cmd = new SqlCommand(sql, con);
	        con.Open();
			rdr = cmd.ExecuteReader();
			if(rdr.HasRows){
				Response.Write("Suspend:Ja existe configuracao de Precos Cadastrada!");
			}else{
				Response.Write("Success:configuracao de Precos NAO Cadastrada!");
			}
	        con.Close();
	            
	    }catch (SqlException ex) { Response.Write("Erro: " + ex.ToString()); }	
	} 

	protected void removerConfiguracaoPrecos(string ordem){
		try{
				string sql = @"DELETE FROM x_cfsis_remarcacao_preco WHERE ordem="+ordem;
				Response.Write(sql);
				cmd = new SqlCommand(sql, con);
				con.Open();
				cmd.ExecuteNonQuery();
				con.Close();
				
				
			}
			catch (SqlException ex) { Response.Write("Erro: " + ex.ToString()); }
	}

	protected void verificarUsuario(string codigo_usuario){
			string listaUsuario = "{\"usuario\":[";
			try{
		        string sql = @"SELECT f.apelido FROM funcionarios f inner join zcf_funcionarios z on f.ordem=z.ordem_funcionario WHERE f.codigo='"+codigo_usuario+"' and z.habilitado='1'";
	            cmd = new SqlCommand(sql, con);
	        	con.Open();        
	        	rdr = cmd.ExecuteReader();
				if (rdr.HasRows)
		        {
					while(rdr.Read()){				

						listaUsuario += "{\"apelido\":\""+rdr["apelido"].ToString()+"\"},";
					}
		        }else{
		        	Response.Write("USUARIO NAO LOCALIZADO OU NAO HABILITADO!<BR>FALE COM O ADMINSITRADOR.");        	
		        }
		      rdr.Close();        
	          con.Close();                      
	        }
	        catch (SqlException ex) { Response.Write("Erro: " + ex.ToString()); }

	        listaUsuario += "]}";
	        listaUsuario = listaUsuario.Replace("},]}","}]}");
	        Response.Write(listaUsuario);
	}

	protected void verificarCredenciais(string codigo_usuario, string senha_usuario){
			
			if(senha_usuario != ""){
		
				try{
					string sql = @"SELECT z.ordem_funcionario, z.permissoes, f.apelido, ltrim(rtrim(z.senha)) as senha FROM zcf_funcionarios z inner join funcionarios f on z.ordem_funcionario=f.ordem WHERE z.habilitado='1' and f.codigo='"+codigo_usuario+"'";
				   
					cmd = new SqlCommand(sql, con);
					con.Open();        
					rdr = cmd.ExecuteReader();
					if (rdr.HasRows)
					{
						rdr.Read();
						
						if(senha_usuario == rdr["senha"].ToString()){
							Session["Ordem_Usuario_Logado"] = rdr["ordem_funcionario"].ToString();						
							Session["Usuario_Logado"] = rdr["apelido"].ToString();
							Session["Usuario_Permissoes"] = rdr["permissoes"].ToString();
							Session["Session_Id"] = getMD5Hash(rdr["apelido"].ToString());							
							Session["Session_Ip"] = GetIPAddress();
							Response.Write("LOGADO");
						}else{
							Response.Write("SENHA_INCORRETA");
						}
					}else{
						Response.Write("USUARIO_NAO_LOCALIZADO");
					}
				  rdr.Close();        
				  con.Close();                      
						
				}
				catch (SqlException ex) { Response.Write("Erro: " + ex.ToString()); }
			}else{Response.Write("SENHA_NAO_PODE_SER_EM_BRANCO");}
	    
	}

	protected void apagarRelacaoProdutosSimilares(string ordem_produto_origem, string ordem_produto_similar){
		try{
	        string sql = @"DELETE FROM prod_serv_similares WHERE ordem_prod_serv_origem='"+ordem_produto_origem+"' AND ordem_prod_serv_similar='"+ordem_produto_similar+"'";
            //Response.Write(sql);
		    cmd = new SqlCommand(sql, con);
        	con.Open();
		    cmd.ExecuteNonQuery();
        	con.Close();
        	Response.Write("SUCESSO");
        }
        catch (SqlException ex) { Response.Write("ERRO: " + ex.ToString()); }
	}
	protected void adicionarRelacaoProdutosSimilares(string ordem_produto_origem, string ordem_produto_similar){
        try{
	        string sql = @"INSERT INTO prod_serv_similares(ordem_prod_serv_origem, ordem_prod_serv_similar) VALUES('"+ordem_produto_origem+"', '"+ordem_produto_similar+"')";
			//Response.Write(sql);
			cmd = new SqlCommand(sql, con);
	        	con.Open();
			cmd.ExecuteNonQuery();
	        	con.Close();
	        Response.Write("SUCESSO");
	    }catch (SqlException ex) { Response.Write("ERRO: " + ex.ToString()); }	
	} 
	protected void listarRelacaoProdutosSimilares(string ordem_produto_origem){

		string listaProdutos = "{\"items\":[";
		try{
	        string sql = @"select prod_serv.codigo, prod_serv.codigo_adicional1, prod_serv.nome from prod_serv_similares "+ 
	        			  	"inner join prod_serv on ordem_prod_serv_similar=prod_serv.ordem "+
							"where ordem_prod_serv_origem='"+ordem_produto_origem+"' or ordem_prod_serv_similar='"+ordem_produto_origem+"' ";
			//Response.Write(sql);			
	        cmd = new SqlCommand(sql, con);
        	con.Open();        
        	rdr = cmd.ExecuteReader();
			if (rdr.HasRows)
	        {
				while(rdr.Read()){				

					listaProdutos += "{\"codigo\":\""+rdr["codigo"].ToString()+
					"\",\"codigo_adicional1\":\""+Server.HtmlEncode(rdr["codigo_adicional1"].ToString())+
					"\",\"nome\":\""+Server.HtmlEncode(rdr["nome"].ToString())+					
					"\"},";
				}
	        }else{
	        	//Response.Write("<tr><td colspan='3'><div class='error'>Para os filtros NAO foi realizada NENHUMA ATUALIZACAO!</div></td></tr>");        	
	        }
	      rdr.Close();        
          con.Close();

        }catch(Exception ex){ Response.Write(ex.ToString());}

        listaProdutos += "]}";
        listaProdutos = listaProdutos.Replace("},]}","}]}");
        Response.Write(listaProdutos);
	}
	
	/***************************************************************************************************
	*############# Funções para atuaizar NCM
	*/
	
	protected void atualizarNCM(string txtNCM, string txtOrdemMovimento, string txtOrdemProdServ, string txtOrdemMovimentoProdServ){

	string ordem_carga_tributaria = "";
	string ncm_nbs = "";
	string perc_federal_nacional = "";
	string perc_federal_importado = "";
	string perc_estadual = "";
	string perc_municipal = "";
	string chave = "";
	string fonte = "";
	bool ncm_existe = false;

	try{
            string sql = @"select * from Carga_Tributaria_Estados where estado='PA' AND NCM_NBS='"+txtNCM+"'";
            cmd = new SqlCommand(sql, con);	        
            con.Close();
            con.Open();			
	    rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
	        {
	            rdr.Read();            
		    ordem_carga_tributaria = rdr["ordem"].ToString();
		    ncm_nbs = rdr["ncm_nbs"].ToString();
		    perc_federal_nacional = String.Format("{0:0.00}", Convert.ToDecimal(rdr["perc_federal_nacional"].ToString())).Replace(",",".");
		    perc_federal_importado = String.Format("{0:0.00}", Convert.ToDecimal(rdr["perc_federal_importado"].ToString())).Replace(",",".");
		    perc_estadual = String.Format("{0:0.00}", Convert.ToDecimal(rdr["perc_estadual"].ToString())).Replace(",",".");
		    perc_municipal = String.Format("{0:0.00}", Convert.ToDecimal(rdr["perc_municipal"].ToString())).Replace(",","."); 
		    chave = rdr["chave"].ToString(); 
		    fonte = rdr["fonte"].ToString();
		    ncm_existe = true;
	        }

	        rdr.Close();
	        con.Close();            
		if(ncm_existe){
			atualizarMovimentoProdServ(txtOrdemMovimentoProdServ, ncm_nbs, perc_federal_nacional, perc_federal_importado, perc_estadual, perc_municipal, chave, fonte);
			atualizarProdServ(txtOrdemProdServ, ncm_nbs);
			atualizarProdServCargaTributaria(txtOrdemProdServ, perc_federal_nacional, perc_federal_importado, perc_estadual, perc_municipal, chave, fonte);
			Response.Write("PFN:"+perc_federal_nacional+"|PFI:"+perc_federal_importado+"|PE:"+perc_estadual+"|PM:"+perc_municipal+"|FONTE:IBPT");
		}else{
			Response.Write("NCM invalido!");
		}
        }
        catch (SqlException ex) { Response.Write("Erro: " + ex.ToString()); }	
   }

    protected void atualizarProdServCargaTributaria(string txtOrdemProdServ, string perc_federal_nacional, string perc_federal_importado, string perc_estadual, string perc_municipal, string chave, string fonte){
	try{
        string sql = @"select * from Prod_Serv_Carga_Tributaria where Ordem_Prod_Serv='"+txtOrdemProdServ+"' and Estado='PA'";
	    bool prod_serv_carga_tributaria_exite = false;
	    //Response.Write(sql);
            cmd = new SqlCommand(sql, con);	        
            con.Close();
            con.Open();	
	    rdr = cmd.ExecuteReader();
	    if(rdr.HasRows){
		prod_serv_carga_tributaria_exite = true;
	    }	
            con.Close();

	    if(!prod_serv_carga_tributaria_exite){
	        sql = @"insert into Prod_Serv_Carga_Tributaria
(Ordem_Prod_Serv,estado,Zero_Nao_Mostrar,Perc_Federal_Nacional,Perc_Federal_Importado,Perc_Estadual,Perc_Municipal,Chave,Fonte)values('"+txtOrdemProdServ+"','PA','0','"+perc_federal_nacional+"','"+perc_federal_importado+"','"+perc_estadual+"','"+perc_municipal+"','"+chave+"','"+fonte+"')";
		//Response.Write(sql);
	        cmd = new SqlCommand(sql, con);	        
        	con.Close();
	        con.Open();	
        	cmd.ExecuteNonQuery();            
		con.Close();		
	    }
	}
        catch (SqlException ex) { Response.Write("Erro: " + ex.ToString()); }	
    }
	
	protected void atualizarProdServ(string txtOrdemProdServ, string ncm_nbs){
		try{
			string sql = @"select top 1 ordem from ncm where codigo='"+ncm_nbs+"'";
			cmd = new SqlCommand(sql, con);	        
			con.Close();
			con.Open();			
			rdr = cmd.ExecuteReader();
			if(!rdr.HasRows){
				rdr.Close();
				sql = @"insert prod_serv(codigo, nome)values('"+ncm_nbs+"','"+ncm_nbs+"');SELECT @@IDENTITY AS ordem;";
				cmd1 = new SqlCommand(sql, con);	        
				cmd1.ExecuteNonQuery();            	
				Response.Write("I;");
			}
			con.Close();
			con.Open();			
			
			sql = @"update prod_serv set ordem_ncm=(select top 1 ordem from ncm where codigo='"+ncm_nbs+"') where ordem='" + txtOrdemProdServ+ "'";
			
			Response.Write("A;");
			
			cmd2 = new SqlCommand(sql, con);	        
			cmd2.ExecuteNonQuery();            
			con.Close();
		}
        catch (SqlException ex) { Response.Write("Erro: " + ex.ToString()); }	
    }

    protected void atualizarMovimentoProdServ(string txtOrdemMovimentoProdServ, string ncm_nbs, string perc_federal_nacional, string perc_federal_importado, string perc_estadual, string perc_municipal, string chave, string fonte){
	try{
            string sql = @"update movimento_prod_serv set ordem_ncm=(select top 1 ordem from ncm where codigo='"+ncm_nbs+"'), ncm='"+ncm_nbs+"', carga_tributaria_federal_perc='"+perc_federal_nacional+"', carga_tributaria_estadual_perc='"+perc_estadual+"', carga_tributaria_municipal_perc='"+perc_municipal+"', carga_tributaria_fonte2='"+fonte+"' where ordem='"+txtOrdemMovimentoProdServ+"'";
			
            
	    //Response.Write(sql);
            cmd = new SqlCommand(sql, con);	        
            con.Close();
            con.Open();			
			cmd.ExecuteNonQuery();            
            con.Close(); 
	}
        catch (SqlException ex) { Response.Write("Erro: " + ex.ToString()); }	
    }
	
	/*****************************************************************************************************/

	public string getMD5Hash(string input){
		System.Security.Cryptography.MD5 md5 = System.Security.Cryptography.MD5.Create();
		byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(input);
		byte[] hash = md5.ComputeHash(inputBytes);
		System.Text.StringBuilder sb = new System.Text.StringBuilder();
		for (int i = 0; i < hash.Length; i++)
		{
		sb.Append(hash[i].ToString("X2"));
		}
		return sb.ToString();
	}
	
	protected string GetIPAddress()
	{
		System.Web.HttpContext context = System.Web.HttpContext.Current; 
		string ipAddress = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

		if (!string.IsNullOrEmpty(ipAddress))
		{
			string[] addresses = ipAddress.Split(',');
			if (addresses.Length != 0)
			{
				return addresses[0];
			}
		}

		return context.Request.ServerVariables["REMOTE_ADDR"];
	}
	
	/*****************************************************************************************************
	
	RELATORIOS
	
	*****************************************************************************************************/
	
	protected void viewRelatorioVendasPorCliente(string filial, string caixa, string data_inicial, string data_final){
        
		try{

			string sql = @"SELECT "+
						" MOVIMENTO.DATA, MOVIMENTO.SEQUENCIA, MOVIMENTO.ORDEM, "+
						" MOVIMENTO.ORDEM_CLI_FOR, "+
						" (SELECT CONCAT(CODIGO, ' - ', NOME) AS NOME FROM CLI_FOR WHERE CLI_FOR.ORDEM=MOVIMENTO.ORDEM_CLI_FOR) AS CLIENTE, "+
						" MOVIMENTO.ORDEM_OPERADOR, "+
						" MOVIMENTO.ORDEM_VENDEDOR1, "+
						" (SELECT CAIXAS.NOME FROM CAIXAS WHERE CAIXAS.ORDEM=(SELECT top 1 Financeiro_Formas_Recebimento_Pagamento_V2.Ordem_Caixa FROM Financeiro_Formas_Recebimento_Pagamento_V2 WHERE Financeiro_Formas_Recebimento_Pagamento_V2.Pagar_Receber='R' AND Financeiro_Formas_Recebimento_Pagamento_V2.Ordem_Movimento=MOVIMENTO.Ordem)) AS CAIXA, "+
						" (SELECT Financeiro_Formas_Recebimento_Pagamento_V2.Dinheiro_Valor FROM Financeiro_Formas_Recebimento_Pagamento_V2 WHERE Financeiro_Formas_Recebimento_Pagamento_V2.Pagar_Receber='R' AND Financeiro_Formas_Recebimento_Pagamento_V2.Ordem_Movimento=MOVIMENTO.Ordem) AS DINHEIRO, "+
						" (SELECT Financeiro_Formas_Recebimento_Pagamento_V2.Conta_Bancaria_Valor FROM Financeiro_Formas_Recebimento_Pagamento_V2 WHERE Financeiro_Formas_Recebimento_Pagamento_V2.Pagar_Receber='R' AND Financeiro_Formas_Recebimento_Pagamento_V2.Ordem_Movimento=MOVIMENTO.Ordem) AS CONTA_BANCARIA, "+
						" (SELECT Financeiro_Formas_Recebimento_Pagamento_V2.Credito_Valor FROM Financeiro_Formas_Recebimento_Pagamento_V2 WHERE Financeiro_Formas_Recebimento_Pagamento_V2.Pagar_Receber='R' AND Financeiro_Formas_Recebimento_Pagamento_V2.Ordem_Movimento=MOVIMENTO.Ordem) AS CREDITO, "+
						" (SELECT Financeiro_Formas_Recebimento_Pagamento_V2.Cartao_Convenio_Valor FROM Financeiro_Formas_Recebimento_Pagamento_V2 WHERE Financeiro_Formas_Recebimento_Pagamento_V2.Pagar_Receber='R' AND Financeiro_Formas_Recebimento_Pagamento_V2.Ordem_Movimento=MOVIMENTO.Ordem) AS CARTAO_CONVEVIO, "+
						" (SELECT Financeiro_Formas_Recebimento_Pagamento_V2.Cartao_Credito_Valor FROM Financeiro_Formas_Recebimento_Pagamento_V2 WHERE Financeiro_Formas_Recebimento_Pagamento_V2.Pagar_Receber='R' AND Financeiro_Formas_Recebimento_Pagamento_V2.Ordem_Movimento=MOVIMENTO.Ordem) AS CARTAO_CREDITO, "+
						" (SELECT Financeiro_Formas_Recebimento_Pagamento_V2.Cartao_Debito_Valor FROM Financeiro_Formas_Recebimento_Pagamento_V2 WHERE Financeiro_Formas_Recebimento_Pagamento_V2.Pagar_Receber='R' AND Financeiro_Formas_Recebimento_Pagamento_V2.Ordem_Movimento=MOVIMENTO.Ordem) AS CARTAO_DEBITO, "+
						" (SELECT Financeiro_Formas_Recebimento_Pagamento_V2.Cheque_Pre_Valor FROM Financeiro_Formas_Recebimento_Pagamento_V2 WHERE Financeiro_Formas_Recebimento_Pagamento_V2.Pagar_Receber='R' AND Financeiro_Formas_Recebimento_Pagamento_V2.Ordem_Movimento=MOVIMENTO.Ordem) AS CHEQUE_PRE, "+
						" (SELECT Financeiro_Formas_Recebimento_Pagamento_V2.Cheque_Valor FROM Financeiro_Formas_Recebimento_Pagamento_V2 WHERE Financeiro_Formas_Recebimento_Pagamento_V2.Pagar_Receber='R' AND Financeiro_Formas_Recebimento_Pagamento_V2.Ordem_Movimento=MOVIMENTO.Ordem) AS CHEQUE, "+
						" (SELECT Financeiro_Formas_Recebimento_Pagamento_V2.Parcelado_Valor FROM Financeiro_Formas_Recebimento_Pagamento_V2 WHERE Financeiro_Formas_Recebimento_Pagamento_V2.Pagar_Receber='R' AND Financeiro_Formas_Recebimento_Pagamento_V2.Ordem_Movimento=MOVIMENTO.Ordem) AS PARCELADO, "+
						" (SELECT Financeiro_Formas_Recebimento_Pagamento_V2.Vale_Valor FROM Financeiro_Formas_Recebimento_Pagamento_V2 WHERE Financeiro_Formas_Recebimento_Pagamento_V2.Pagar_Receber='R' AND Financeiro_Formas_Recebimento_Pagamento_V2.Ordem_Movimento=MOVIMENTO.Ordem) AS VALE "+
						" FROM MOVIMENTO "+
						" WHERE MOVIMENTO.DATA_EFETIVADO_FINANCEIRO BETWEEN '"+data_inicial+" 00:00:00' AND '"+data_final+" 23:59:59'  AND MOVIMENTO.EFETIVADO_FINANCEIRO=1 AND MOVIMENTO.DESEFETIVADO_FINANCEIRO=0 AND MOVIMENTO.TIPO_OPERACAO IN ('VND','VEF') "+
						" AND MOVIMENTO.ORDEM IN (SELECT Financeiro_Formas_Recebimento_Pagamento_V2.ORDEM_MOVIMENTO FROM Financeiro_Formas_Recebimento_Pagamento_V2 WHERE Financeiro_Formas_Recebimento_Pagamento_V2.Ordem_Caixa=(SELECT Caixas.ORDEM FROM Caixas WHERE CODIGO='"+caixa+"' AND ORDEM_FILIAL=(SELECT top 1 ORDEM FROM Filiais WHERE CODIGO='"+filial+"'))) "+
						" GROUP BY MOVIMENTO.ORDEM_CLI_FOR, MOVIMENTO.DATA, MOVIMENTO.SEQUENCIA, MOVIMENTO.ORDEM, "+
						" MOVIMENTO.ORDEM_CAIXA, MOVIMENTO.ORDEM_OPERADOR, MOVIMENTO.ORDEM_VENDEDOR1 "+
						" ORDER BY CLIENTE ";
			//Response.Write(sql);
			
			Response.Write("<hr>");
			cmd = new SqlCommand(sql, con);
	        con.Open();
			rdr = cmd.ExecuteReader();
			if(rdr.HasRows){
				
				string ultimo_cliente = "";
				string novo_cliente = "";

				bool print_total_cliente = false;
				
				decimal total_cliente_dinheiro = 0;
				decimal total_cliente_conta_bancaria = 0;
				decimal total_cliente_credito = 0;
				decimal total_cliente_cartao_convenio = 0;
				decimal total_cliente_cartao_credito = 0;
				decimal total_cliente_cartao_debito = 0;
				decimal total_cliente_cheque = 0;
				decimal total_cliente_cheque_pre = 0;
				decimal total_cliente_parcelado = 0;
				decimal total_cliente_vale = 0;

				decimal total_cliente_dinheiro_geral = 0;
				decimal total_cliente_conta_bancaria_geral = 0;
				decimal total_cliente_credito_geral = 0;
				decimal total_cliente_cartao_convenio_geral = 0;
				decimal total_cliente_cartao_credito_geral = 0;
				decimal total_cliente_cartao_debito_geral = 0;
				decimal total_cliente_cheque_geral = 0;
				decimal total_cliente_cheque_pre_geral = 0;
				decimal total_cliente_parcelado_geral = 0;
				decimal total_cliente_vale_geral = 0;
				decimal total_cliente = 0;



				Response.Write("<table class='table'>");
				while(rdr.Read()){
					novo_cliente = rdr["cliente"].ToString();
					
											

					if(ultimo_cliente == novo_cliente){
							Response.Write("<tr class='detalhes'>");														
							Response.Write("<td>"+String.Format("{0:dd/MM/yyyy}", Convert.ToDateTime(rdr["data"].ToString()))+"</td>");
							Response.Write("<td>"+rdr["sequencia"].ToString()+"</td>");
							Response.Write("<td class='valor_currency'>"+rdr["DINHEIRO"].ToString()+"</td>");
							Response.Write("<td class='valor_currency'>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["CONTA_BANCARIA"].ToString()))+"</td>");
							Response.Write("<td class='valor_currency'>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["CREDITO"].ToString()))+"</td>");
							Response.Write("<td class='valor_currency'>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["CARTAO_CONVEVIO"].ToString()))+"</td>");
							Response.Write("<td class='valor_currency'>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["CARTAO_CREDITO"].ToString()))+"</td>");
							Response.Write("<td class='valor_currency'>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["CARTAO_DEBITO"].ToString()))+"</td>");
							Response.Write("<td class='valor_currency'>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["CHEQUE"].ToString()))+"</td>");
							Response.Write("<td class='valor_currency'>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["CHEQUE_PRE"].ToString()))+"</td>");
							Response.Write("<td class='valor_currency'>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["PARCELADO"].ToString()))+"</td>");
							Response.Write("<td class='valor_currency'>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["VALE"].ToString()))+"</td>");
							Response.Write("</tr>");
							
							
							total_cliente_dinheiro += Convert.ToDecimal(rdr["DINHEIRO"].ToString());
							total_cliente_conta_bancaria += Convert.ToDecimal(rdr["CONTA_BANCARIA"].ToString());
							total_cliente_credito += Convert.ToDecimal(rdr["CREDITO"].ToString());
							total_cliente_cartao_convenio += Convert.ToDecimal(rdr["CARTAO_CONVEVIO"].ToString());
							total_cliente_cartao_credito += Convert.ToDecimal(rdr["CARTAO_CREDITO"].ToString());
							total_cliente_cartao_debito += Convert.ToDecimal(rdr["CARTAO_DEBITO"].ToString());
							total_cliente_cheque += Convert.ToDecimal(rdr["CHEQUE"].ToString());
							total_cliente_cheque_pre += Convert.ToDecimal(rdr["CHEQUE_PRE"].ToString());
							total_cliente_parcelado += Convert.ToDecimal(rdr["PARCELADO"].ToString());
							total_cliente_vale += Convert.ToDecimal(rdr["VALE"].ToString());
							

						}else{
							if(print_total_cliente){
								
								
								total_cliente = total_cliente_dinheiro+total_cliente_conta_bancaria+total_cliente_credito+total_cliente_cartao_convenio+total_cliente_cartao_credito+total_cliente_cartao_debito+total_cliente_cheque+total_cliente_cheque_pre+total_cliente_parcelado+total_cliente_vale;
								Response.Write("<tr>");														
								Response.Write("<td colspan='2' class='total'>Totais</td>");								
								Response.Write("<td class='total valor_currency'>"+String.Format("{0:C2}", total_cliente_dinheiro)+"</td>");
								Response.Write("<td class='total valor_currency'>"+String.Format("{0:C2}", total_cliente_conta_bancaria)+"</td>");
								Response.Write("<td class='total valor_currency'>"+String.Format("{0:C2}", total_cliente_credito)+"</td>");
								Response.Write("<td class='total valor_currency'>"+String.Format("{0:C2}", total_cliente_cartao_convenio)+"</td>");
								Response.Write("<td class='total valor_currency'>"+String.Format("{0:C2}", total_cliente_cartao_credito)+"</td>");
								Response.Write("<td class='total valor_currency'>"+String.Format("{0:C2}", total_cliente_cartao_debito)+"</td>");
								Response.Write("<td class='total valor_currency'>"+String.Format("{0:C2}", total_cliente_cheque)+"</td>");
								Response.Write("<td class='total valor_currency'>"+String.Format("{0:C2}", total_cliente_cheque_pre)+"</td>");
								Response.Write("<td class='total valor_currency'>"+String.Format("{0:C2}", total_cliente_parcelado)+"</td>");
								Response.Write("<td class='total valor_currency'>"+String.Format("{0:C2}", total_cliente_vale)+"</td>");
								Response.Write("</tr>");
								Response.Write("<td colspan='11' class='total'>Totais por Cliente</td>");								
								Response.Write("<td class='total valor_currency'>"+String.Format("{0:C2}", total_cliente)+"</td>");
								Response.Write("<tr>");								
								Response.Write("</tr>");
								print_total_cliente = false;

								total_cliente_dinheiro = 0;
								total_cliente_conta_bancaria = 0;
								total_cliente_credito = 0;
								total_cliente_cartao_convenio = 0;
								total_cliente_cartao_credito = 0;
								total_cliente_cartao_debito = 0;
								total_cliente_cheque = 0;
								total_cliente_cheque_pre = 0;
								total_cliente_parcelado = 0;
								total_cliente_vale = 0;
							}

							Response.Write("<tr>");
							Response.Write("<th class='novo_cliente' colspan='12'><p>&nbsp;</p>"+rdr["cliente"].ToString()+"</th>");
							Response.Write("</tr>");

							Response.Write("<tr>");
							Response.Write("<th>DATA</th>");
							Response.Write("<th>SEQUENCIA</th>");
							Response.Write("<th>DINHEIRO</th>");
							Response.Write("<th>CONTA BANCARIA</th>");
							Response.Write("<th>CREDITO</th>");
							Response.Write("<th>CARTAO CONVEVIO</th>");
							Response.Write("<th>CARTAO CREDITO</th>");
							Response.Write("<th>CARTAO DEBITO</th>");
							Response.Write("<th>CHEQUE</th>");
							Response.Write("<th>CHEQUE PRE</th>");
							Response.Write("<th>PARCELADO</th>");
							Response.Write("<th>VALE</th>");
							Response.Write("</tr>");

							Response.Write("<tr class='detalhes'>");							
							Response.Write("<td>"+String.Format("{0:dd/MM/yyyy}", Convert.ToDateTime(rdr["data"].ToString()))+"</td>");
							
							Response.Write("<td>"+rdr["sequencia"].ToString()+"</td>");
							Response.Write("<td class='valor_currency'>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["DINHEIRO"].ToString()))+"</td>");
							Response.Write("<td class='valor_currency'>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["CONTA_BANCARIA"].ToString()))+"</td>");
							Response.Write("<td class='valor_currency'>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["CREDITO"].ToString()))+"</td>");
							Response.Write("<td class='valor_currency'>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["CARTAO_CONVEVIO"].ToString()))+"</td>");
							Response.Write("<td class='valor_currency'>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["CARTAO_CREDITO"].ToString()))+"</td>");
							Response.Write("<td class='valor_currency'>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["CARTAO_DEBITO"].ToString()))+"</td>");
							Response.Write("<td class='valor_currency'>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["CHEQUE"].ToString()))+"</td>");
							Response.Write("<td class='valor_currency'>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["CHEQUE_PRE"].ToString()))+"</td>");
							Response.Write("<td class='valor_currency'>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["PARCELADO"].ToString()))+"</td>");
							Response.Write("<td class='valor_currency'>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["VALE"].ToString())).Replace(",",".")+"</td>");
							Response.Write("</tr>");
							ultimo_cliente = novo_cliente;
							print_total_cliente = true;

							total_cliente_dinheiro += Convert.ToDecimal(rdr["DINHEIRO"].ToString());
							total_cliente_conta_bancaria += Convert.ToDecimal(rdr["CONTA_BANCARIA"].ToString());
							total_cliente_credito += Convert.ToDecimal(rdr["CREDITO"].ToString());
							total_cliente_cartao_convenio += Convert.ToDecimal(rdr["CARTAO_CONVEVIO"].ToString());
							total_cliente_cartao_credito += Convert.ToDecimal(rdr["CARTAO_CREDITO"].ToString());
							total_cliente_cartao_debito += Convert.ToDecimal(rdr["CARTAO_DEBITO"].ToString());
							total_cliente_cheque += Convert.ToDecimal(rdr["CHEQUE"].ToString());
							total_cliente_cheque_pre += Convert.ToDecimal(rdr["CHEQUE_PRE"].ToString());
							total_cliente_parcelado += Convert.ToDecimal(rdr["PARCELADO"].ToString());
							total_cliente_vale += Convert.ToDecimal(rdr["VALE"].ToString());
						}
						total_cliente_dinheiro_geral += Convert.ToDecimal(rdr["DINHEIRO"].ToString());
						total_cliente_conta_bancaria_geral += Convert.ToDecimal(rdr["CONTA_BANCARIA"].ToString());
						total_cliente_credito_geral += Convert.ToDecimal(rdr["CREDITO"].ToString());
						total_cliente_cartao_convenio_geral += Convert.ToDecimal(rdr["CARTAO_CONVEVIO"].ToString());
						total_cliente_cartao_credito_geral += Convert.ToDecimal(rdr["CARTAO_CREDITO"].ToString());
						total_cliente_cartao_debito_geral += Convert.ToDecimal(rdr["CARTAO_DEBITO"].ToString());
						total_cliente_cheque_geral += Convert.ToDecimal(rdr["CHEQUE"].ToString());
						total_cliente_cheque_pre_geral += Convert.ToDecimal(rdr["CHEQUE_PRE"].ToString());
						total_cliente_parcelado_geral += Convert.ToDecimal(rdr["PARCELADO"].ToString());
						total_cliente_vale_geral += Convert.ToDecimal(rdr["VALE"].ToString());

						

				}
				Response.Write("<tr>");														
				Response.Write("<td colspan='2' class='total'>Totais</td>");								
				Response.Write("<td class='total valor_currency'>"+String.Format("{0:C2}", total_cliente_dinheiro)+"</td>");
				Response.Write("<td class='total valor_currency'>"+String.Format("{0:C2}", total_cliente_conta_bancaria)+"</td>");
				Response.Write("<td class='total valor_currency'>"+String.Format("{0:C2}", total_cliente_credito)+"</td>");
				Response.Write("<td class='total valor_currency'>"+String.Format("{0:C2}", total_cliente_cartao_convenio)+"</td>");
				Response.Write("<td class='total valor_currency'>"+String.Format("{0:C2}", total_cliente_cartao_credito)+"</td>");
				Response.Write("<td class='total valor_currency'>"+String.Format("{0:C2}", total_cliente_cartao_debito)+"</td>");
				Response.Write("<td class='total valor_currency'>"+String.Format("{0:C2}", total_cliente_cheque)+"</td>");
				Response.Write("<td class='total valor_currency'>"+String.Format("{0:C2}", total_cliente_cheque_pre)+"</td>");
				Response.Write("<td class='total valor_currency'>"+String.Format("{0:C2}", total_cliente_parcelado)+"</td>");
				Response.Write("<td class='total valor_currency'>"+String.Format("{0:C2}", total_cliente_vale)+"</td>");
				Response.Write("</tr>");

				Response.Write("<tr>");														
				Response.Write("<td colspan='2' class='total'>Totais Geral</td>");								
				Response.Write("<td class='total valor_currency'>"+String.Format("{0:C2}", total_cliente_dinheiro_geral)+"</td>");
				Response.Write("<td class='total valor_currency'>"+String.Format("{0:C2}", total_cliente_conta_bancaria_geral)+"</td>");
				Response.Write("<td class='total valor_currency'>"+String.Format("{0:C2}", total_cliente_credito_geral)+"</td>");
				Response.Write("<td class='total valor_currency'>"+String.Format("{0:C2}", total_cliente_cartao_convenio_geral)+"</td>");
				Response.Write("<td class='total valor_currency'>"+String.Format("{0:C2}", total_cliente_cartao_credito_geral)+"</td>");
				Response.Write("<td class='total valor_currency'>"+String.Format("{0:C2}", total_cliente_cartao_debito_geral)+"</td>");
				Response.Write("<td class='total valor_currency'>"+String.Format("{0:C2}", total_cliente_cheque_geral)+"</td>");
				Response.Write("<td class='total valor_currency'>"+String.Format("{0:C2}", total_cliente_cheque_pre_geral)+"</td>");
				Response.Write("<td class='total valor_currency'>"+String.Format("{0:C2}", total_cliente_parcelado_geral)+"</td>");
				Response.Write("<td class='total valor_currency'>"+String.Format("{0:C2}", total_cliente_vale_geral)+"</td>");				
				Response.Write("</tr>");

				Response.Write("<tr>");																		
				Response.Write("<td class='total valor_currency' colspan='12'> Totais Geral "+String.Format("{0:C2}", (total_cliente_dinheiro_geral+total_cliente_conta_bancaria_geral+total_cliente_credito_geral+total_cliente_cartao_convenio_geral+total_cliente_cartao_credito_geral+total_cliente_cartao_debito_geral+total_cliente_cheque_geral+total_cliente_cheque_pre_geral+total_cliente_parcelado_geral+total_cliente_vale_geral))+"</td>");
				Response.Write("</tr>");

				Response.Write("</table>");
			}else{
				Response.Write("Nao foram encontrados resultados para estes filtros.");
			}
	        con.Close();
	            
	    }catch (SqlException ex) { Response.Write("Erro: " + ex.ToString()); }	
	} 
	
	
protected void totaisCaixas(string filial, string caixa, string data_inicial, string data_final){
		
		
		if(Request.QueryString["caixa"]!=""){
			caixa = Request.QueryString["caixa"];
		}
		if(Request.QueryString["data_inicial"]!=""){
			data_inicial = String.Format("{0:yyyy-MM-dd}", Convert.ToDateTime(Request.QueryString["data_inicial"]))+ " 00:00:00";
		}
		if(Request.QueryString["data_final"]!=""){			
			data_final = String.Format("{0:yyyy-MM-dd}", Convert.ToDateTime(Request.QueryString["data_final"]))+" 23:59:59";
		}
		//string sql = @"select sum(dinheiro) as dinheiro, sum(vale) as vale,  sum(cheque_a_vista) as cheque, sum(cheque_pre) as cheque_pre, sum(cartao_debito) as cartao_debito, sum(cartao_credito) as cartao_credito,  sum(cartao_convenio) as convenio, sum(parcelamento_boleto) as boleto,  sum(parcelamento_carne) as carne, sum(parcelamento_carteira) as carteira, sum(credito_cliente) as credito_cliente from financeiro_caixa  where ordem_caixa=(select ordem from caixas where codigo='"+caixa+"' and ordem_filial=(select ordem from filiais where codigo='"+filial+"')) and data between '"+data_inicial+"' and '"+data_final+"'";
		
		string sql = @"select sum(dinheiro) as dinheiro, sum(vale) as vale,  sum(cheque_a_vista) as cheque, sum(cheque_pre) as cheque_pre, sum(cartao_debito) as cartao_debito, "+
					" sum(cartao_credito) as cartao_credito,  sum(cartao_convenio) as convenio, sum(parcelamento_boleto) as boleto,  sum(parcelamento_carne) as carne, "+
					" sum(parcelamento_carteira) as carteira, sum(credito_cliente) as credito_cliente "+
					" from financeiro_caixa  "+
					" where ordem_caixa=(select ordem from caixas where codigo='"+caixa+"' and ordem_filial=(select ordem from filiais where codigo='"+filial+"')) "+
					" and data between '"+data_inicial+"' and '"+data_final+"' and tipo_movimento='VND'";
					
					//select sum(dinheiro) as dinheiro, sum(vale) as vale, sum(cheque_a_vista) as cheque, sum(cheque_pre) as cheque_pre, sum(cartao_debito) as cartao_debito,
					//sum(cartao_credito) as cartao_credito, sum(cartao_convenio) as convenio, sum(parcelamento_boleto) as boleto, sum(parcelamento_carne) as carne, 
					//sum(parcelamento_carteira) as carteira, sum(credito_cliente) as credito_cliente from financeiro_caixa
					//where ordem_caixa=(select ordem from caixas where codigo='1' and ordem_filial=(select ordem from filiais where codigo='1')) 
					//and data between '2017-10-03 00:00:00' and '2017-10-03 23:59:59' and tipo_movimento='VND'
		
		string nome_filial = filial + " - " +getNomeFiltro("filiais",filial);
		string nome_caixa =  caixa+ " - " +getNomeFiltro("caixas", caixa);		
		//Response.Write(sql);
				
		Response.Write("<div class='table-responsive'>");
		Response.Write("<table class='table table-hover'>");
		Response.Write("<thead>");
		Response.Write("<tr><th colspan='7'><h4>Relatório do Caixa</h4>");
		Response.Write("<p>Filial: <b>"+nome_filial+"</b></p>");
		Response.Write("<p>Caixa: <b>"+nome_caixa+"</b></p>");
		Response.Write("<p>Data Inicial: <b>"+String.Format("{0:dd/MM/yyyy}", Convert.ToDateTime(data_inicial))+"</b>  Data Final: <b>"+String.Format("{0:dd/MM/yyyy}", Convert.ToDateTime(data_final))+"</b></p></tr>");
		Response.Write("<tr><th>Forma de Pagamento</th><th>Venda</th><th>Recebimento</th><th>Retirada</th><th>Trf. Caixa</th><th>Trf.Banco</th><th>Saldo Final</th></tr>");
		Response.Write("</thead>");
		Response.Write("<tbody>");
		
		decimal dinheiro_venda, dinheiro_recebimento, dinheiro_acrescimo, dinheiro_abertura, dinheiro_retirada_transferencia_banco, dinheiro_retirada_pagar_conta, dinheiro_retirada_apenas;
		dinheiro_venda = dinheiro_recebimento = dinheiro_acrescimo = dinheiro_abertura = dinheiro_retirada_transferencia_banco = dinheiro_retirada_pagar_conta = dinheiro_retirada_apenas = 0;
		
		decimal vale_venda, vale_recebimento, vale_acrescimo, vale_abertura, vale_retirada_transferencia_banco, vale_retirada_pagar_conta, vale_retirada_apenas;
		vale_venda = vale_recebimento = vale_acrescimo = vale_abertura = vale_retirada_transferencia_banco = vale_retirada_pagar_conta = vale_retirada_apenas = 0;
		
		decimal cheque_venda, cheque_recebimento, cheque_acrescimo, cheque_abertura, cheque_retirada_transferencia_banco, cheque_retirada_pagar_conta, cheque_retirada_apenas;
		cheque_venda = cheque_recebimento = cheque_acrescimo = cheque_abertura = cheque_retirada_transferencia_banco = cheque_retirada_pagar_conta = cheque_retirada_apenas = 0;
		
		decimal cheque_pre_venda, cheque_pre_recebimento, cheque_pre_acrescimo, cheque_pre_abertura, cheque_pre_retirada_transferencia_banco, cheque_pre_retirada_pagar_conta, cheque_pre_retirada_apenas;
		cheque_pre_venda = cheque_pre_recebimento = cheque_pre_acrescimo = cheque_pre_abertura = cheque_pre_retirada_transferencia_banco = cheque_pre_retirada_pagar_conta = cheque_pre_retirada_apenas = 0;
		
		decimal cartao_debito_venda, cartao_debito_recebimento, cartao_debito_acrescimo, cartao_debito_abertura, cartao_debito_retirada_transferencia_banco, cartao_debito_retirada_pagar_conta, cartao_debito_retirada_apenas;
		cartao_debito_venda = cartao_debito_recebimento = cartao_debito_acrescimo = cartao_debito_abertura = cartao_debito_retirada_transferencia_banco = cartao_debito_retirada_pagar_conta = cartao_debito_retirada_apenas = 0;
		
		decimal cartao_credito_venda, cartao_credito_recebimento, cartao_credito_acrescimo, cartao_credito_abertura, cartao_credito_retirada_transferencia_banco, cartao_credito_retirada_pagar_conta, cartao_credito_retirada_apenas;
		cartao_credito_venda = cartao_credito_recebimento = cartao_credito_acrescimo = cartao_credito_abertura = cartao_credito_retirada_transferencia_banco = cartao_credito_retirada_pagar_conta = cartao_credito_retirada_apenas = 0;
		
		decimal cartao_convenio_venda, cartao_convenio_recebimento, cartao_convenio_acrescimo, cartao_convenio_abertura, cartao_convenio_retirada_transferencia_banco, cartao_convenio_retirada_pagar_conta, cartao_convenio_retirada_apenas;
		cartao_convenio_venda = cartao_convenio_recebimento = cartao_convenio_acrescimo = cartao_convenio_abertura = cartao_convenio_retirada_transferencia_banco = cartao_convenio_retirada_pagar_conta = cartao_convenio_retirada_apenas = 0;
		
		decimal boleto_venda, boleto_recebimento, boleto_acrescimo, boleto_abertura, boleto_retirada_transferencia_banco, boleto_retirada_pagar_conta, boleto_retirada_apenas;
		boleto_venda = boleto_recebimento = boleto_acrescimo = boleto_abertura = boleto_retirada_transferencia_banco = boleto_retirada_pagar_conta = boleto_retirada_apenas = 0;
		
		decimal carne_venda, carne_recebimento, carne_acrescimo, carne_abertura, carne_retirada_transferencia_banco, carne_retirada_pagar_conta, carne_retirada_apenas;
		carne_venda = carne_recebimento = carne_acrescimo = carne_abertura = carne_retirada_transferencia_banco = carne_retirada_pagar_conta = carne_retirada_apenas = 0;
		
		decimal carteira_venda, carteira_recebimento, carteira_acrescimo, carteira_abertura, carteira_retirada_transferencia_banco, carteira_retirada_pagar_conta, carteira_retirada_apenas;
		carteira_venda = carteira_recebimento = carteira_acrescimo = carteira_abertura = carteira_retirada_transferencia_banco = carteira_retirada_pagar_conta = carteira_retirada_apenas = 0;
		
		decimal credito_cliente_venda, credito_cliente_recebimento, credito_cliente_acrescimo, credito_cliente_abertura, credito_cliente_retirada_transferencia_banco, credito_cliente_retirada_pagar_conta, credito_cliente_retirada_apenas;
		credito_cliente_venda = credito_cliente_recebimento = credito_cliente_acrescimo = credito_cliente_abertura = credito_cliente_retirada_transferencia_banco = credito_cliente_retirada_pagar_conta = credito_cliente_retirada_apenas = 0;
		
		
		try{
			cmd = new SqlCommand(sql, con);		
		  	con.Close();
			con.Open();
			rdr = cmd.ExecuteReader();	
			if(rdr.HasRows){				
				while(rdr.Read()){				
					/*Response.Write("<tr><td>&nbsp;</td><td>Dinheiro</td><td>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["dinheiro"].ToString()))+"</td></tr>");
					Response.Write("<tr><td>&nbsp;</td><td>Vale</td><td>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["vale"].ToString()))+"</td></tr>");
					Response.Write("<tr><td>&nbsp;</td><td>Cheque</td><td>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["cheque"].ToString()))+"</td></tr>");
					Response.Write("<tr><td>&nbsp;</td><td>Cheque Pré</td><td>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["cheque_pre"].ToString()))+"</td></tr>");
					Response.Write("<tr><td>&nbsp;</td><td>Cartão Débito</td><td>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["cartao_debito"].ToString()))+"</td></tr>");
					Response.Write("<tr><td>&nbsp;</td><td>Cartão Crédito</td><td>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["cartao_credito"].ToString()))+"</td></tr>");
					Response.Write("<tr><td>&nbsp;</td><td>Cartão Convênio</td><td>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["convenio"].ToString()))+"</td></tr>");
					Response.Write("<tr><td>&nbsp;</td><td>Boleto</td><td>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["boleto"].ToString()))+"</td></tr>");
					Response.Write("<tr><td>&nbsp;</td><td>Carnê</td><td>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["carne"].ToString()))+"</td></tr>");
					Response.Write("<tr><td>&nbsp;</td><td>Carteira</td><td>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["carteira"].ToString()))+"</td></tr>");
					Response.Write("<tr><td>&nbsp;</td><td>Crédito</td><td>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["credito_cliente"].ToString()))+"</td></tr>");*/				
					dinheiro_venda = Convert.ToDecimal(rdr["dinheiro"].ToString());
					vale_venda = Convert.ToDecimal(rdr["vale"].ToString());
					cheque_venda = Convert.ToDecimal(rdr["cheque"].ToString());
					cheque_pre_venda = Convert.ToDecimal(rdr["cheque_pre"].ToString());
					cartao_debito_venda = Convert.ToDecimal(rdr["cartao_debito"].ToString());
					cartao_credito_venda = Convert.ToDecimal(rdr["cartao_credito"].ToString());
					cartao_convenio_venda = Convert.ToDecimal(rdr["convenio"].ToString());
					boleto_venda = Convert.ToDecimal(rdr["boleto"].ToString());
					carne_venda = Convert.ToDecimal(rdr["carne"].ToString());
					carteira_venda = Convert.ToDecimal(rdr["carteira"].ToString());
					credito_cliente_venda = Convert.ToDecimal(rdr["credito_cliente"].ToString());
				}
				
			}else{
				Response.Write("Nada Localizado");
			}
			rdr.Close();
			con.Close();		
		}catch(Exception ex){Response.Write("");}

		sql = @"select sum(dinheiro) as dinheiro, sum(vale) as vale,  sum(cheque_a_vista) as cheque, sum(cheque_pre) as cheque_pre, sum(cartao_debito) as cartao_debito, "+
					" sum(cartao_credito) as cartao_credito,  sum(cartao_convenio) as convenio, sum(parcelamento_boleto) as boleto,  sum(parcelamento_carne) as carne, "+
					" sum(parcelamento_carteira) as carteira, sum(credito_cliente) as credito_cliente "+
					" from financeiro_caixa  "+
					" where ordem_caixa=(select ordem from caixas where codigo='"+caixa+"' and ordem_filial=(select ordem from filiais where codigo='"+filial+"')) "+
					" and data between '"+data_inicial+"' and '"+data_final+"' and tipo_movimento='REC'";					
		
		try{
			cmd = new SqlCommand(sql, con);		
		  	con.Close();
			con.Open();
			rdr = cmd.ExecuteReader();	
			if(rdr.HasRows){				
				while(rdr.Read()){
					dinheiro_recebimento = Convert.ToDecimal(rdr["dinheiro"].ToString());
					dinheiro_recebimento = Convert.ToDecimal(rdr["dinheiro"].ToString());
					vale_recebimento = Convert.ToDecimal(rdr["vale"].ToString());
					cheque_recebimento = Convert.ToDecimal(rdr["cheque"].ToString());
					cheque_pre_recebimento = Convert.ToDecimal(rdr["cheque_pre"].ToString());
					cartao_debito_recebimento = Convert.ToDecimal(rdr["cartao_debito"].ToString());
					cartao_credito_recebimento = Convert.ToDecimal(rdr["cartao_credito"].ToString());
					cartao_convenio_recebimento = Convert.ToDecimal(rdr["convenio"].ToString());
					boleto_recebimento = Convert.ToDecimal(rdr["boleto"].ToString());
					carne_recebimento = Convert.ToDecimal(rdr["carne"].ToString());
					carteira_recebimento = Convert.ToDecimal(rdr["carteira"].ToString());
					credito_cliente_recebimento = Convert.ToDecimal(rdr["credito_cliente"].ToString());
				}
				
			}else{
				Response.Write("Nada Localizado");
			}
			rdr.Close();
			con.Close();		
		}catch(Exception ex){Response.Write("");}
	
	
		/*select * from financeiro_caixa f inner join financeiro_contas c on f.ordem_financeiro_contas=c.ordem
	 where f.ordem_caixa=(select ordem from caixas where codigo='1' and ordem_filial=(select ordem from filiais where codigo='1')) 
	and f.data between '2017-10-03 00:00:00' and '2017-10-03 23:59:59' and c.pagar_receber='P'*/
	
		sql = @"select sum(f.dinheiro) as dinheiro, sum(f.vale) as vale,  sum(f.cheque_a_vista) as cheque, sum(f.cheque_pre) as cheque_pre, sum(f.cartao_debito) as cartao_debito, "+
					" sum(f.cartao_credito) as cartao_credito,  sum(f.cartao_convenio) as convenio, sum(f.parcelamento_boleto) as boleto,  sum(f.parcelamento_carne) as carne, "+
					" sum(f.parcelamento_carteira) as carteira, sum(f.credito_cliente) as credito_cliente "+
					" from financeiro_caixa f inner join financeiro_contas c on f.ordem_financeiro_contas=c.ordem  "+
					" where f.ordem_caixa=(select ordem from caixas where codigo='"+caixa+"' and ordem_filial=(select ordem from filiais where codigo='"+filial+"')) "+
					" and f.data between '"+data_inicial+"' and '"+data_final+"' and f.tipo_movimento='MM' and c.pagar_receber='P'";					
		
		try{
			cmd = new SqlCommand(sql, con);		
		  	con.Close();
			con.Open();
			rdr = cmd.ExecuteReader();	
			if(rdr.HasRows){				
				while(rdr.Read()){
					dinheiro_retirada_pagar_conta = Convert.ToDecimal(rdr["dinheiro"].ToString());
				}
				
			}else{
				Response.Write("Nada Localizado");
			}
			rdr.Close();
			con.Close();		
		}catch(Exception ex){Response.Write("");}
	
		decimal total_dinheiro = dinheiro_venda+dinheiro_recebimento+dinheiro_retirada_pagar_conta;
		decimal total_vale = vale_venda+vale_recebimento;
		decimal total_cheque = cheque_venda+cheque_recebimento;
		decimal total_cheque_pre = cheque_pre_venda+cheque_pre_recebimento;
		decimal total_cartao_debito = cartao_debito_venda+cartao_debito_recebimento;
		decimal total_cartao_credito = cartao_credito_venda+cartao_credito_recebimento;
		decimal total_cartao_convenio = cartao_convenio_venda+cartao_convenio_recebimento;
		decimal total_boleto = boleto_venda+boleto_recebimento;
		decimal total_carne = carne_venda+carne_recebimento;
		decimal total_carteira = carteira_venda+carteira_recebimento;
		decimal total_credito_cliente = credito_cliente_venda+credito_cliente_recebimento;		
		decimal total = 0;
		Response.Write("<tr><td>Dinheiro</td><td>"+String.Format("{0:###,###,##0.00}",dinheiro_venda)+"</td><td>"+String.Format("{0:###,###,##0.00}",dinheiro_recebimento)+"</td><td class='text-danger'>"+String.Format("{0:###,###,##0.00}",dinheiro_retirada_pagar_conta)+"</td><td></td><td></td><td>"+String.Format("{0:###,###,##0.00}",total_dinheiro)+"</td></tr>");
		Response.Write("<tr><td>Vale</td><td>"+String.Format("{0:###,###,##0.00}",vale_venda)+"</td><td>"+String.Format("{0:###,###,##0.00}",vale_recebimento)+"</td><td class='text-danger'>"+String.Format("{0:###,###,##0.00}",dinheiro_retirada_pagar_conta)+"</td><td></td><td></td><td>"+String.Format("{0:###,###,##0.00}",total_cheque)+"</td></tr>");
		Response.Write("<tr><td>Cheque</td><td>"+String.Format("{0:###,###,##0.00}",cheque_venda)+"</td><td>"+String.Format("{0:###,###,##0.00}",cheque_recebimento)+"</td><td class='text-danger'>"+String.Format("{0:###,###,##0.00}",dinheiro_retirada_pagar_conta)+"</td><td></td><td></td><td>"+String.Format("{0:###,###,##0.00}",total)+"</td></tr>");
		Response.Write("<tr><td>Cheque Pré</td><td>"+String.Format("{0:###,###,##0.00}",cheque_pre_venda)+"</td><td>"+String.Format("{0:###,###,##0.00}",cheque_recebimento)+"</td><td class='text-danger'>"+String.Format("{0:###,###,##0.00}",dinheiro_retirada_pagar_conta)+"</td><td></td><td></td><td>"+String.Format("{0:###,###,##0.00}",total)+"</td></tr>");
		Response.Write("<tr><td>Cartão de Débito</td><td>"+String.Format("{0:###,###,##0.00}",cartao_debito_venda)+"</td><td>"+String.Format("{0:###,###,##0.00}",cartao_debito_recebimento)+"</td><td class='text-danger'>"+String.Format("{0:###,###,##0.00}",dinheiro_retirada_pagar_conta)+"</td><td></td><td></td><td>"+String.Format("{0:###,###,##0.00}",total)+"</td></tr>");
		Response.Write("<tr><td>Cartão de Crédito</td><td>"+String.Format("{0:###,###,##0.00}",cartao_credito_venda)+"</td><td>"+String.Format("{0:###,###,##0.00}",cartao_credito_recebimento)+"</td><td class='text-danger'>"+String.Format("{0:###,###,##0.00}",dinheiro_retirada_pagar_conta)+"</td><td></td><td></td><td>"+String.Format("{0:###,###,##0.00}",total)+"</td></tr>");
		Response.Write("<tr><td>Cartão Convênio</td><td>"+String.Format("{0:###,###,##0.00}",cartao_convenio_venda)+"</td><td>"+String.Format("{0:###,###,##0.00}",cartao_convenio_recebimento)+"</td><td class='text-danger'>"+String.Format("{0:###,###,##0.00}",dinheiro_retirada_pagar_conta)+"</td><td></td><td></td><td>"+String.Format("{0:###,###,##0.00}",total)+"</td></tr>");
		Response.Write("<tr><td>Boleto</td><td>"+String.Format("{0:###,###,##0.00}",boleto_venda)+"</td><td>"+String.Format("{0:###,###,##0.00}",boleto_recebimento)+"</td><td class='text-danger'>"+String.Format("{0:###,###,##0.00}",dinheiro_retirada_pagar_conta)+"</td><td></td><td></td><td>"+String.Format("{0:###,###,##0.00}",total)+"</td></tr>");
		Response.Write("<tr><td>Carne</td><td>"+String.Format("{0:###,###,##0.00}",carne_venda)+"</td><td>"+String.Format("{0:###,###,##0.00}",carne_recebimento)+"</td><td class='text-danger'>"+String.Format("{0:###,###,##0.00}",dinheiro_retirada_pagar_conta)+"</td><td></td><td></td><td>"+String.Format("{0:###,###,##0.00}",total)+"</td></tr>");
		Response.Write("<tr><td>Carteira</td><td>"+String.Format("{0:###,###,##0.00}",carteira_venda)+"</td><td>"+String.Format("{0:###,###,##0.00}",carteira_recebimento)+"</td><td class='text-danger'>"+String.Format("{0:###,###,##0.00}",dinheiro_retirada_pagar_conta)+"</td><td></td><td></td><td>"+String.Format("{0:###,###,##0.00}",total)+"</td></tr>");
		Response.Write("<tr><td>Crédito Cliente</td><td>"+String.Format("{0:###,###,##0.00}",credito_cliente_venda)+"</td><td>"+String.Format("{0:###,###,##0.00}",credito_cliente_recebimento)+"</td><td class='text-danger'>"+String.Format("{0:###,###,##0.00}",dinheiro_retirada_pagar_conta)+"</td><td></td><td></td><td>"+String.Format("{0:###,###,##0.00}",total)+"</td></tr>");
		
		
		Response.Write("</tbody>");
		Response.Write("</table>");
		Response.Write("</div>");
	}
	
	protected void listaFiliais(){
		string filial = Request.QueryString["filial"];
		string sql = @"select * from filiais where codigo>0 order by codigo";
		string txt = "";
		cmd = new SqlCommand(sql, con);
		con.Close();
		con.Open();
		rdr = cmd.ExecuteReader();
		if(rdr.HasRows){
			Response.Write("<select name='txtFilial' id='txtFilial'  class='form-control'>");
			Response.Write("<option value='0'>Selecione...</option>");
			while(rdr.Read()){
				if(filial == rdr["codigo"].ToString()){
					 Response.Write("<option value='"+rdr["codigo"].ToString()+"' selected>"+rdr["codigo"].ToString()+" - "+rdr["nome"].ToString()+"</option>");
				}else{
					 Response.Write("<option value='"+rdr["codigo"].ToString()+"'>"+rdr["codigo"].ToString()+" - "+rdr["nome"].ToString()+"</option>");
				}
			}
			Response.Write("</select>");
		}
		rdr.Close();
		con.Close();
	}
	
	protected void localizaSequencia(){

		string sequencia= "0";
		string filial= "0";

		if(Request.QueryString["txtFilial"]!=null && Request.QueryString["txtSequencia"]!=null){
			sequencia= Request.QueryString["txtSequencia"];
			filial= Request.QueryString["txtFilial"];
			

			string sql = @"update movimento_documentos_fiscais set chave_acesso='' where ordem_movimento=(select top 1 ordem from movimento where sequencia='"+sequencia+"' and ordem_filial=(select top 1 ordem from filiais where codigo='"+filial+"'))";

			//Response.Write(sql);

			try{
				cmd = new SqlCommand(sql, con);		
				con.Close();
				con.Open();
				cmd.ExecuteNonQuery();				
				con.Close();		
				Response.Write("Chave de acesso alterada com sucesso!");
			}catch(Exception ex){Response.Write("Nada foi alterado!");}	
		}
	}
	
	protected void RelatorioNotasFiscaisEmAberto(string filial, string data_inicial, string data_final){
		
		if(Request.QueryString["data_inicial"]!=""){
			data_inicial = String.Format("{0:yyyy-MM-dd}", Convert.ToDateTime(Request.QueryString["data_inicial"]))+ " 00:00:00";
		}
		if(Request.QueryString["data_final"]!=""){			
			data_final = String.Format("{0:yyyy-MM-dd}", Convert.ToDateTime(Request.QueryString["data_final"]))+" 23:59:59";
		}

		if(filial!=null){
			
			string sql = @"select mf.ordem, mv.sequencia, mv.Tipo_Operacao, mf.Modelo, mf.data_emissao, mf.Numero, mf.chave_acesso, mf.numero_recibo, mf.Protocolo_Autorizacao, "+
						" mv.Preco_Final_Somado, status_cancelamento = (case xml_cancelamento when '' then '' else 'C' end) from movimento mv inner join movimento_documentos_fiscais mf "+
						" on mv.ordem=mf.ordem_movimento left join filiais fl on mv.ordem_filial=fl.ordem "+
						" where  mf.Protocolo_Autorizacao=''  and (mf.Documento_Inutilizado is null) and (mv.Tipo_Operacao='vnd' or mv.Tipo_Operacao='vef') and mf.data_emissao between CONVERT(datetime,'"+data_inicial+"',121) and CONVERT(datetime,'"+data_final+"',121) and fl.codigo='"+filial+"' "+
						" order by mf.data_emissao desc";

			//Response.Write(sql);
			string nome_filial = filial + " - " +getNomeFiltro("filiais",filial);
			try{
				cmd = new SqlCommand(sql, con);
				con.Close();
				con.Open();
				rdr = cmd.ExecuteReader();
				if(rdr.HasRows){
					Response.Write("<table class='table table-hover'>");
					Response.Write("<thead>");
					Response.Write("<tr><th colspan='9'>");
					Response.Write("<p>Filial: <b>"+nome_filial+"</b></p>");
					Response.Write("<p>Data Inicial: <b>"+String.Format("{0:dd/MM/yyyy}", Convert.ToDateTime(data_inicial))+"</b>  Data Final: <b>"+String.Format("{0:dd/MM/yyyy}", Convert.ToDateTime(data_final))+"</b></p></tr>");
					Response.Write("<tr><th>Data</th><th>Filial</th><th>Sequencia</th><th>Modelo</th><th>Chave NFC-e</th><th>Nº NFC-e</th><th>Prot. Autorização</th><th>Valor</th><th>Status</th></tr>");
					Response.Write("</thead>");
					Response.Write("<tbody>");
					while(rdr.Read()){
						Response.Write("<tr><td>"+rdr["data_emissao"].ToString()+"</td><td>"+nome_filial+"</td><td><a href='AlteraDadosNFCe.aspx?txtFilial="+filial+"&txtSequencia="+rdr["sequencia"].ToString()+"' target='_blank'><i class='glyphicon glyphicon-new-window'></i>&nbsp;"+rdr["sequencia"].ToString()+" </a></td><td>"+rdr["modelo"].ToString()+"</td><td>"+rdr["chave_acesso"].ToString()+"</td><td>"+rdr["numero"].ToString()+"</td><td>"+rdr["protocolo_autorizacao"].ToString()+"</td><td align='right'>"+String.Format("{0:C2}",Convert.ToDecimal(rdr["preco_final_somado"].ToString()))+"</td><td>"+rdr["status_cancelamento"].ToString()+"</td></tr>");	
					}
					Response.Write("<tbody>");
					Response.Write("</table>");
				}else{Response.Write("<h5>Nada foi localizado!</h5>");}
				rdr.Close();
				con.Close();
			}catch(Exception ex){Response.Write("Nada foi alterado!");}	
		}
	}
	
	protected void RelatorioFinanceiroCustoReceitas(string filial, string data_inicial, string data_final){
		
		if(Request.QueryString["data_inicial"]!=""){
			data_inicial = String.Format("{0:yyyy-MM-dd}", Convert.ToDateTime(Request.QueryString["data_inicial"]))+ " 00:00:00";
		}
		if(Request.QueryString["data_final"]!=""){			
			data_final = String.Format("{0:yyyy-MM-dd}", Convert.ToDateTime(Request.QueryString["data_final"]))+" 23:59:59";
		}

		if(filial!=null){
			
			string sql = @"select mf.ordem, mv.sequencia, mv.Tipo_Operacao, mf.Modelo, mf.data_emissao, mf.Numero, mf.chave_acesso, mf.numero_recibo, mf.Protocolo_Autorizacao, "+
						" mv.Preco_Final_Somado, status_cancelamento = (case xml_cancelamento when '' then '' else 'C' end) from movimento mv inner join movimento_documentos_fiscais mf "+
						" on mv.ordem=mf.ordem_movimento left join filiais fl on mv.ordem_filial=fl.ordem "+
						" where  mf.Protocolo_Autorizacao=''  and (mf.Documento_Inutilizado is null) and (mv.Tipo_Operacao='vnd' or mv.Tipo_Operacao='vef') and mf.data_emissao between CONVERT(datetime,'"+data_inicial+"',121) and CONVERT(datetime,'"+data_final+"',121) and fl.codigo='"+filial+"' "+
						" order by mf.data_emissao desc";

			//Response.Write(sql);
			string nome_filial = filial + " - " +getNomeFiltro("filiais",filial);
			try{
				cmd = new SqlCommand(sql, con);
				con.Close();
				con.Open();
				rdr = cmd.ExecuteReader();
				if(rdr.HasRows){
					Response.Write("<table class='table table-hover'>");
					Response.Write("<thead>");
					Response.Write("<tr><th colspan='9'>");
					Response.Write("<p>Filial: <b>"+nome_filial+"</b></p>");
					Response.Write("<p>Data Inicial: <b>"+String.Format("{0:dd/MM/yyyy}", Convert.ToDateTime(data_inicial))+"</b>  Data Final: <b>"+String.Format("{0:dd/MM/yyyy}", Convert.ToDateTime(data_final))+"</b></p></tr>");
					Response.Write("<tr><th>Data</th><th>Filial</th><th>Sequencia</th><th>Modelo</th><th>Chave NFC-e</th><th>Nº NFC-e</th><th>Prot. Autorização</th><th>Valor</th><th>Status</th></tr>");
					Response.Write("</thead>");
					Response.Write("<tbody>");
					while(rdr.Read()){
						Response.Write("<tr><td>"+rdr["data_emissao"].ToString()+"</td><td>"+nome_filial+"</td><td><a href='AlteraDadosNFCe.aspx?txtFilial="+filial+"&txtSequencia="+rdr["sequencia"].ToString()+"' target='_blank'><i class='glyphicon glyphicon-new-window'></i>&nbsp;"+rdr["sequencia"].ToString()+" </a></td><td>"+rdr["modelo"].ToString()+"</td><td>"+rdr["chave_acesso"].ToString()+"</td><td>"+rdr["numero"].ToString()+"</td><td>"+rdr["protocolo_autorizacao"].ToString()+"</td><td align='right'>"+String.Format("{0:C2}",Convert.ToDecimal(rdr["preco_final_somado"].ToString()))+"</td><td>"+rdr["status_cancelamento"].ToString()+"</td></tr>");	
					}
					Response.Write("<tbody>");
					Response.Write("</table>");
				}else{Response.Write("<h5>Nada foi localizado!</h5>");}
				rdr.Close();
				con.Close();
			}catch(Exception ex){Response.Write("Nada foi alterado!");}	
		}
	}

}

