using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class Nico: System.Web.UI.Page
{
	SqlConnection con;
    SqlCommand cmd;
    SqlDataReader rdr;

    string cons9, sql = "";

  protected void Page_Load(object sender, System.EventArgs e)
  {
	Session["Pagina_Atual"] = "CADASTRO::REMARCACAO_DE_PRECOS";

	try{	
		con = new SqlConnection(ConfigurationManager.ConnectionStrings["shop9ConnectionString"].ConnectionString);
	}catch(Exception ex){Response.Write(ex.ToString());}
  }


  protected void listaTabelaPrecosRemarcacao(){

      string sql = @"select 
                    xrm.ordem, 
                    (select nome from classes where ordem=xrm.ordem_classe) as ordem_classe,
                    (select nome from subclasses where ordem=xrm.ordem_subclasse) as ordem_subclasse,
                    (select nome from grupos where ordem=xrm.ordem_grupo) as ordem_grupo,
                    (select nome from familias where ordem=xrm.ordem_familia) as ordem_familia,
                    (select nome from fabricantes where ordem=xrm.ordem_fabricante) as ordem_fabricante,
                    (select nome from Tabelas_Preco where ordem=xrm.ordem_tabela_1) as ordem_tabela_1,
                    (select nome from Tabelas_Preco where ordem=xrm.ordem_tabela_2) as ordem_tabela_2,
                    xrm.valor,
                    xrm.aumenta_diminui,
                    xrm.data_modificacao
                    from 
                    x_cfsis_remarcacao_preco xrm
                    order by xrm.ordem";
		try
        {
            cmd = new SqlCommand(sql, con);
            con.Close();
            con.Open();
            rdr = cmd.ExecuteReader();
            Response.Write("<div class='table-responsive'>");
            Response.Write("<table class='table table-hover table-striped lista-configuracoesPrecos'>");
            Response.Write("<thead>");
            Response.Write("<tr><th><input type='checkbox' name='codigo_todos' id='codigo_todos' value='seleciona_todos'></th><th>Classe</th><th>SubClasse</th><th>Grupo</th><th>Familia</th><th>Fabricante</th><th>Tab Origem</th><th>Tab Destino</th><th>Porcentagem</th><th>A/D</th></tr>");
            Response.Write("</thead>");
            Response.Write("<tbody>");
            if (rdr.HasRows)
            {                
                while (rdr.Read())
                {
                    Response.Write("<tr><td><input type='checkbox' name='codigo[]' class='codigo[]' value='" + rdr["ordem"].ToString() + "'></td><td>" + (rdr["ordem_classe"].ToString() != "Não Cadastrado" ? rdr["ordem_classe"].ToString() : "Todos") + "</td><td>" + (rdr["ordem_subclasse"].ToString() != "Não Cadastrado" ? rdr["ordem_subclasse"].ToString() : "Todos") + "</td><td>" + (rdr["ordem_grupo"].ToString() != "Não Cadastrado" ? rdr["ordem_grupo"].ToString() : "Todos") + "</td><td>" + (rdr["ordem_familia"].ToString() != "Não Cadastrado" ? rdr["ordem_familia"].ToString() : "Todos") + "</td><td>" + (rdr["ordem_fabricante"].ToString() != "Não Cadastrado" ? rdr["ordem_fabricante"].ToString() : "Todos") + "</td><td>" + rdr["ordem_tabela_1"].ToString() + "</td><td>" + rdr["ordem_tabela_2"].ToString() + "</td><td>" + rdr["valor"].ToString() + "</td><td>" + rdr["aumenta_diminui"].ToString() + "</td></tr>");
                }             
            }
            Response.Write("</tbody>");
            Response.Write("</table>");
            Response.Write("</div>");

            rdr.Close();
            con.Close();
        }
        catch (Exception ex) { Response.Write(""); }
	}

  protected void listaClasses(){
		string sql = @"select * from Classes where codigo>0 order by codigo";
		string txt = "";
		cmd = new SqlCommand(sql, con);
		con.Open();
		rdr = cmd.ExecuteReader();
		if(rdr.HasRows){
			Response.Write("<label for='classeField'>Classe</label>");
			Response.Write("<select name='classeField' id='classeField'  class='form-control'>");
			Response.Write("<option value='0'>Todos</option>");
			while(rdr.Read()){
				Response.Write("<option value='"+rdr["ordem"].ToString()+"'>"+rdr["codigo"].ToString()+": "+rdr["nome"].ToString()+"</option>");				
			}
			Response.Write("</select>");
		}
		rdr.Close();
		con.Close();
	}
protected void listaSubClasses(){
		string sql = @"select * from Subclasses where codigo>0 order by codigo";
		string txt = "";
		cmd = new SqlCommand(sql, con);
		con.Open();
		rdr = cmd.ExecuteReader();
		if(rdr.HasRows){
			Response.Write("<label for='subclasseField'>Subclasse</label>");
			Response.Write("<select name='subclasseField' id='subclasseField'  class='form-control'>");
			Response.Write("<option value='0'>Todos</option>");
			while(rdr.Read()){
				Response.Write("<option value='"+rdr["ordem"].ToString()+"'>"+rdr["codigo"].ToString()+": "+rdr["nome"].ToString()+"</option>");				
			}
			Response.Write("</select>");
		}
		rdr.Close();
		con.Close();
	}
protected void listaGrupos(){
		string sql = @"select * from Grupos where codigo>0 order by codigo";
		string txt = "";
		cmd = new SqlCommand(sql, con);
		con.Open();
		rdr = cmd.ExecuteReader();
		if(rdr.HasRows){
			Response.Write("<label for='grupoField'>Grupo</label>");
			Response.Write("<select name='grupoField' id='grupoField'  class='form-control'>");
			Response.Write("<option value='0'>Todos</option>");
			while(rdr.Read()){
				Response.Write("<option value='"+rdr["ordem"].ToString()+"'>"+rdr["codigo"].ToString()+": "+rdr["nome"].ToString()+"</option>");				
			}
			Response.Write("</select>");
		}
		rdr.Close();
		con.Close();
	}
protected void listaFamilias(){
		string sql = @"select * from Familias where codigo>0 order by codigo";
		string txt = "";
		cmd = new SqlCommand(sql, con);
		con.Open();
		rdr = cmd.ExecuteReader();
		if(rdr.HasRows){
			Response.Write("<label for='familiasField'>Familia</label>");
			Response.Write("<select name='familiaField' id='familiaField'  class='form-control'>");
			Response.Write("<option value='0'>Todos</option>");
			while(rdr.Read()){
				Response.Write("<option value='"+rdr["ordem"].ToString()+"'>"+rdr["codigo"].ToString()+": "+rdr["nome"].ToString()+"</option>");				
			}
			Response.Write("</select>");
		}
		rdr.Close();
		con.Close();
	}
protected void listaFabricantes(){
		string sql = @"select * from Fabricantes where codigo>0 order by codigo";
		string txt = "";
		cmd = new SqlCommand(sql, con);
		con.Open();
		rdr = cmd.ExecuteReader();
		if(rdr.HasRows){
			Response.Write("<label for='fabricanteField'>Fabricante</label>");
			Response.Write("<select name='fabricanteField' id='fabricanteField'  class='form-control'>");
			Response.Write("<option value='0'>Todos</option>");
			while(rdr.Read()){
				Response.Write("<option value='"+rdr["ordem"].ToString()+"'>"+rdr["codigo"].ToString()+": "+rdr["nome"].ToString()+"</option>");				
			}
			Response.Write("</select>");
		}
		rdr.Close();
		con.Close();
	}

protected void listaTabelaPrecos1(){
		string sql = @"select * from Tabelas_Preco order by nome";
		string txt = "";
		cmd = new SqlCommand(sql, con);
		con.Open();
		rdr = cmd.ExecuteReader();
		if(rdr.HasRows){
			Response.Write("<label for='tabela1Field'>Tabela de Preços 1</label>");
			Response.Write("<select name='tabela1Field' id='tabela1Field'  class='form-control'>");
			Response.Write("<option value='0'>Selecione...</option>");
			while(rdr.Read()){
				Response.Write("<option value='"+rdr["ordem"].ToString()+"'>"+rdr["nome"].ToString()+"</option>");				
			}
			Response.Write("</select>");
		}
		rdr.Close();
		con.Close();
	}
protected void listaTabelaPrecos2(){
		string sql = @"select * from Tabelas_Preco order by nome";
		string txt = "";
		cmd = new SqlCommand(sql, con);
		con.Open();
		rdr = cmd.ExecuteReader();
		if(rdr.HasRows){
			Response.Write("<label for='tabela2Field'>Tabela de Preços 2</label>");
			Response.Write("<select name='tabela2Field' id='tabela2Field'  class='form-control'>");
			Response.Write("<option value='0'>Selecione...</option>");
			while(rdr.Read()){
				Response.Write("<option value='"+rdr["ordem"].ToString()+"'>"+rdr["nome"].ToString()+"</option>");				
			}
			Response.Write("</select>");
		}
		rdr.Close();
		con.Close();
	}


protected void atualizaPrecos(){
        string data_inicial = DateTime.Now.ToString("yyyy-MM-dd h:m:s");
        string data_final = DateTime.Now.ToString("yyyy-MM-dd h:m:s");
		try{
            
            cmd = new SqlCommand("spRemarcacaoPrecos", con);
	    cmd.CommandTimeout = 30;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@tipo", SqlDbType.VarChar).Value = 'v';
            con.Close();
            con.Open();			
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("Precos atualizados com sucesso!");
        }
        catch (SqlException ex) { Response.Write("Erro: " + ex.ToString()); }	
	} 
}



