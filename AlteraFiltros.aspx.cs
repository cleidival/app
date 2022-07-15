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
	
	Session["Pagina_Atual"] = "CADASTRO::ALTERAR_FILTROS";	
	
  }


  protected void listaFiliais(){
		string filial = Request.QueryString["filial"];
		string sql = @"select * from filiais where codigo>0 order by codigo";
		string txt = "";
		cmd = new SqlCommand(sql, con);
		con.Open();
		rdr = cmd.ExecuteReader();
		if(rdr.HasRows){
			Response.Write("<select name='filialField' id='filialField'  class='form-control'>");
			Response.Write("<option value='0'>Selecione...</option>");
			while(rdr.Read()){
				if(filial == rdr["codigo"].ToString()){
					 Response.Write("<option value='"+rdr["codigo"].ToString()+"' selected>"+rdr["nome"].ToString()+"</option>");
				}else{
					 Response.Write("<option value='"+rdr["codigo"].ToString()+"'>"+rdr["nome"].ToString()+"</option>");
				}
			}
			Response.Write("</select>");
		}
		rdr.Close();
		con.Close();
	}


  protected void listaFiltros(string tabela, string novo)
  {
      //string sql = @"select * from " + tabela +" where codigo>0 order by codigo";
	  string condicao = "";
	  string operacao = "";
	  if(tabela == "Classe_Imposto-S"){
		  tabela="Classe_Imposto"; 
		  operacao = "-S";
		  condicao = " tipo_operacao='S' AND";
		}else
			if(tabela == "Classe_Imposto-E"){
				tabela="Classe_Imposto"; 
				operacao = "-E";
				condicao = " tipo_operacao='E' AND";
			}
		
      string sql = @"select * from " + tabela + " where " + condicao + " codigo>'0' order by codigo";
		//Response.Write(sql);
		tabela += operacao;
      try
      {
          cmd = new SqlCommand(sql, con);
          con.Close();
          con.Open();
          rdr = cmd.ExecuteReader();
          if (rdr.HasRows)
          {
              Response.Write("<div class='table-responsive'>");
              Response.Write("<table class='table table-hover lista-" + novo + tabela + "'");
              Response.Write("<thead>");
              Response.Write("<tr><th>Codigo</th><th>Nome</th></tr>");
              Response.Write("</thead>");
              Response.Write("<tbody>");
              while (rdr.Read())
              {
                  Response.Write("<tr class='codigo" + novo + "Filtro' value='" + rdr["codigo"].ToString() + ":" + rdr["nome"].ToString().ToUpper() + ":" + tabela + "'><td>" + rdr["codigo"].ToString() + "</td><td>" + rdr["nome"].ToString().ToUpper() + "</td></tr>");
              }
              Response.Write("</tbody>");
              Response.Write("</table>");
              Response.Write("</div>");
          }
          else
          {
              Response.Write("Nada Localizado:\n" + sql);
          }
          rdr.Close();
          con.Close();
      }
      catch (Exception ex) { Response.Write(""); }
  }

  protected void listaFiltrosNovo(string tabela)
  {
      //string sql = @"select * from " + tabela +" where codigo>0 order by codigo";
      string sql = @"select * from " + tabela + " where codigo>'0' order by codigo";

      try
      {
          cmd = new SqlCommand(sql, con);
          con.Close();
          con.Open();
          rdr = cmd.ExecuteReader();
          if (rdr.HasRows)
          {
              Response.Write("<div class='table-responsive'>");
              Response.Write("<table class='table table-hover lista-Novo" + tabela + "'");
              Response.Write("<thead>");
              Response.Write("<tr><th>Codigo</th><th>Nome</th></tr>");
              Response.Write("</thead>");
              Response.Write("<tbody>");
              while (rdr.Read())
              {
                  Response.Write("<tr class='codigoNovoFiltro' value='" + rdr["codigo"].ToString() + ":" + rdr["nome"].ToString().ToUpper() + ":" + tabela + "'><td>" + rdr["codigo"].ToString() + "</td><td>" + rdr["nome"].ToString().ToUpper() + "</td></tr>");
              }
              Response.Write("</tbody>");
              Response.Write("</table>");
              Response.Write("</div>");
          }
          else
          {
              Response.Write("Nada Localizado:\n" + sql);
          }
          rdr.Close();
          con.Close();
      }
      catch (Exception ex) { Response.Write(""); }
  }

  
}

