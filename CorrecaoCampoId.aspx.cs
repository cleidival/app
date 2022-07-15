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
	public string sequencia= "0";

  protected void Page_Load(object sender, System.EventArgs e)
  {
   	
	//Session["Pagina_Atual"] = "FISCAL::CORRECAO_CAMPO_ID";
	
	try{	

		con = new SqlConnection(ConfigurationManager.ConnectionStrings["shop9ConnectionString"].ConnectionString);

	}catch(Exception ex){Response.Write(ex.ToString());}			

	sequencia= Request.QueryString["txtSequencia"]!=null?Request.QueryString["txtSequencia"]:"0";
		
  }


  
/*protected void listaFiliais(){
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
	}*/
	protected void listaFiliais(){
		string filial = Request.QueryString["txtFilial"];
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

	protected int geraDigMod11(string strText)
	{		
		int[] intPesos = { 2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5, 6, 7, 8, 9 };

		int intSoma = 0;
		int intIdx = 0;

		for (int intPos = strText.Length - 1; intPos >= 0; intPos--)
		{
			intSoma += Convert.ToInt32(strText[intPos].ToString()) * intPesos[intIdx];				
			if (intIdx == 9)
			{
				intIdx = 2;
			}
			else
			{
				intIdx++;
			}
		}

		int intResto = (intSoma * 10) % 11;
		int intDigito = intResto;
		if (intDigito >= 10) intDigito = 0;

		return intDigito;
	}	
	
	protected string getChaveAcesso(string filial, string sequencia)
	{
		
		string chave_acesso = "0";
		string chave_tmp = "";
		
		string sql = @"select chave_acesso from movimento_documentos_fiscais where ordem_movimento=(select top 1 ordem from movimento where sequencia='"+sequencia+"' and ordem_filial=(select top 1 ordem from filiais where codigo='"+filial+"'))";

		//Response.Write(sql);
		string ano_mes = DateTime.Now.ToString("yyMM");

		try{
			cmd = new SqlCommand(sql, con);		
			con.Close();
			con.Open();
			rdr = cmd.ExecuteReader();				
			if(rdr.HasRows){
				while(rdr.Read()){
					chave_acesso = rdr["chave_acesso"].ToString();
				}
			}			
			con.Close();					
		}catch(Exception ex){Response.Write("Erro: "+ex.ToString());}	
		
		return chave_acesso;
	}

	protected void localizaSequencia()
	{

		string sequencia= "0";
		string filial= "0";
		string chave_acesso = "";
		string chave_tmp = "";
		string ano_mes = DateTime.Now.ToString("yyMM");
		string nova_chave_acesso = "";
		
		if(Request.QueryString["txtFilial"]!=null && Request.QueryString["txtSequencia"]!=null){
			sequencia= Request.QueryString["txtSequencia"];
			filial= Request.QueryString["txtFilial"];
			
			chave_acesso = getChaveAcesso(filial, sequencia);
			Response.Write(chave_acesso);
			
			
			chave_tmp += chave_acesso.Substring(0,2);
			chave_tmp += ano_mes;
			chave_tmp += chave_acesso.Substring(6,(chave_acesso.Length-6));
			chave_tmp = chave_tmp.Substring(0, (chave_tmp.Length-1));
			
			Response.Write("<br>");
			Response.Write(chave_tmp);
			
			nova_chave_acesso = chave_tmp + Convert.ToString(geraDigMod11(chave_tmp));
			
			Response.Write("<br>");
			Response.Write(nova_chave_acesso);
			Response.Write("<br>");
			
			string sql = @"update movimento_documentos_fiscais set chave_acesso='"+nova_chave_acesso+"' where ordem_movimento=(select top 1 ordem from movimento where sequencia='"+sequencia+"' and ordem_filial=(select top 1 ordem from filiais where codigo='"+filial+"'))";

			//Response.Write(sql);

			try{
				cmd = new SqlCommand(sql, con);		
				con.Close();
				con.Open();
				cmd.ExecuteNonQuery();				
				con.Close();		
				Response.Write("Dados Atualizados Com Sucesso!");
				Response.Write("<p><a href='AlteraDadosNFCe.aspx?txtFilial="+filial+"&txtSequencia="+sequencia+"' class='btn btn-primary'>Dados NFC-e</a></p>");
				
			}catch(Exception ex){Response.Write("Erro sql: "+ex.ToString());}	
		}
	}
  
}

