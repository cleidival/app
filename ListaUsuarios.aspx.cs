using System;
using System.Configuration;
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
	  
	Session["Pagina_Atual"] = "CADASTRO::USUARIOS";
	
	try{	
	
		con = new SqlConnection(ConfigurationManager.ConnectionStrings["shop9ConnectionString"].ConnectionString);
		
	}catch(Exception ex){Response.Write(ex.ToString());}			
	
  }


protected void listaUsuarios(){

		string sql = @"select f.ordem as ordem_f, f.codigo, f.nome, f.apelido, z.ordem as ordem_z, z.senha, z.permissoes, z.habilitado from Zcf_Funcionarios z inner join Funcionarios f on 
z.Ordem_Funcionario=f.Ordem where f.codigo>0 order by f.nome";
		
		string txt = "";
		cmd = new SqlCommand(sql, con);

	  	con.Close();
		con.Open();
		rdr = cmd.ExecuteReader();
		Response.Write("<table class='table table-striped' id='listaUsuariosApp'>");			
		Response.Write("<thead>");
		Response.Write("<tr><th colspan='6' style='text-align: center;'>TABELA DE USUÁRIOS APP</th>");		
		Response.Write("<tr><th>CODIGO</th><th>NOME</th><th>APELIDO</th><th>HAB.</th><th>PERM.</th><th>SENHA</th><th>REM.</th></tr>");
		Response.Write("</thead>");
		Response.Write("<tbody>");
			
		if(rdr.HasRows){			
			while(rdr.Read()){
				string acesso = rdr["habilitado"].ToString()!="True"?"red":"green";
				Response.Write("<tr class='"+acesso+"'>");
				Response.Write("<td><input type='hidden' class='ordem_funcionario' value='"+rdr["ordem_f"].ToString()+"'>"+rdr["codigo"].ToString()+"</td>");
				Response.Write("<td>"+rdr["nome"].ToString()+"</td>");
				Response.Write("<td>"+rdr["apelido"].ToString()+"</td>");
				if(acesso == "red"){
					Response.Write("<td><i class='glyphicon glyphicon-remove red btnAlterarAcessoFuncionario'></i></td>");				
				}else{
					Response.Write("<td><i class='glyphicon glyphicon-ok green btnAlterarAcessoFuncionario'></i></td>");	
				}
				
				//Response.Write("<td><b class='glyphicon glyphicon-edit btnAlterarSenha' data-toggle='modal' data-target='#modalAlterarSenha'></b></td>");
				Response.Write("<td><b class='glyphicon glyphicon-lock btnPermissoes'></b></td>");
				Response.Write("<td><b class='glyphicon glyphicon-edit btnAlterarSenha'></b></td>");
				Response.Write("<td><b class='glyphicon glyphicon-remove red btnRemoverFuncionario'></b></td>");
				Response.Write("</tr>");
			}
		}
		Response.Write("</tbody></table>");
		rdr.Close();
		con.Close();
	}


protected void listaFuncionariosShop9(){

		string sql = @"select ordem, codigo, nome, apelido from Funcionarios where codigo>0 and ordem not in(select ordem_funcionario from Zcf_Funcionarios) order by nome";
		
		string txt = "";
		cmd = new SqlCommand(sql, con);

	  	con.Close();
		con.Open();
		rdr = cmd.ExecuteReader();
		Response.Write("<table class='table  table-striped' id='listaFuncionariosShop9'>");					
		Response.Write("<thead>");
		Response.Write("<tr><th colspan='4'  style='text-align: center;'>TABELA DE FUNCIONÁRIOS SHOP9</th>");
		Response.Write("<tr><th>CODIGO</th><th>NOME</th><th>APELIDO</th><th></th>");
		Response.Write("</thead>");
		Response.Write("<tbody>");
		if(rdr.HasRows){			
			
			while(rdr.Read()){
				
				Response.Write("<tr>");
				Response.Write("<td><input type='hidden' class='ordem_funcionario' value='"+rdr["ordem"].ToString()+"'>"+rdr["codigo"].ToString()+"</td>");
				Response.Write("<td>"+rdr["nome"].ToString()+"</td>");
				Response.Write("<td>"+rdr["apelido"].ToString()+"</td>");
				Response.Write("<td><b class='glyphicon glyphicon-plus btnAdicionarFuncionario'></b></td>");
				Response.Write("</tr>");
			}			
		}
		Response.Write("</tbody></table>");
		rdr.Close();
		con.Close();
	}


  
}

