using System;
using System.Configuration;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.Sql;
using System.Data.SqlTypes;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
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

	try{	

		con = new SqlConnection(ConfigurationManager.ConnectionStrings["shop9ConnectionString"].ConnectionString);

	}catch(Exception ex){Response.Write(ex.ToString());}			
		
  }

protected void listaProdutos(){

	string codigo_produto = Request.QueryString["codigoProduto"];

	if(codigo_produto!=null){
		string sql = @" SELECT top 1 p.codigo, p.ordem,  p.nome, p.codigo_barras, "+
			" (select top 1 PRECO from Prod_Serv_Precos WHERE ordem_prod_serv=p.ordem and Ordem_Tabela_Preco=7) as PRECO_NORMAL, "+
			" (select top 1 PRECO from Prod_Serv_Precos WHERE ordem_prod_serv=p.ordem and Ordem_Tabela_Preco=9) as PRECO_PRAZO, "+
			" (select top 1 FOTO from Prod_Serv_Fotos WHERE ordem_prod_serv=p.ordem) as foto "+
			" FROM "+
			" PROD_SERV p inner join prod_serv_precos r on p.ordem=r.ordem_prod_SERV "+
			" WHERE "+
			" p.codigo='"+codigo_produto+"' or p.Codigo_Adicional1='"+codigo_produto+"' or p.Codigo_Adicional2='"+codigo_produto+"' or p.Codigo_Adicional3='"+codigo_produto+"' or p.Codigo_Adicional4='"+codigo_produto+"' or p.Codigo_Adicional5='"+codigo_produto+"' or p.Codigo_Barras='"+codigo_produto+"'";
		//Response.Write(sql);

		cmd = new SqlCommand(sql, con);		
	  	con.Close();
		con.Open();
		
		rdr = cmd.ExecuteReader();
		if(rdr.HasRows){
			rdr.Read();
			Response.Write("<div class='row'>");
			Response.Write("<div class='col-md-2'>");
			Response.Write("<img class='foto' class='img-responsive img-thumbnail' src='"+rdr["foto"].ToString()+"' width='100%'>");
			Response.Write("</div>");
			Response.Write("<div class='col-md-10'>");
			Response.Write("<div class='table-responsive'>");
			Response.Write("<table class='table'>");
				Response.Write("<tbody>");
					Response.Write("<tr><td colspan='2'><small>CÓDIGO: "+rdr["codigo"].ToString()+"</small><h1>"+rdr["nome"].ToString()+"</h1></td></tr>");
					Response.Write("<tr><td>PREÇO NORMAL</td><td>PREÇO A PRAZO</td></tr>");	  			
					Response.Write("<tr><td><h2>"+String.Format("{0:C2} ", Convert.ToDecimal(rdr["preco_normal"].ToString()))+"</h2></td><td><h2>"+String.Format("{0:C2} ", Convert.ToDecimal(rdr["preco_prazo"].ToString()))+"</h2></td></tr>");	  			
					//Response.Write("<tr><td colspan='2'>"+rdr.GetSqlBytes(6).ToString()+"</td></tr>");	  						
					//SqlBytes bytes = rdr.GetSqlBytes(6); 
					//Bitmap productImage = new Bitmap(bytes.Stream);  
					//String fileName = "img/foto8938128310.jpg";
    				//productImage.Save(fileName, ImageFormat.Jpeg);
    				//Response.Write("Successfully created "+ fileName);
				Response.Write("</tbody>");
			Response.Write("</table>");
			Response.Write("</div>");
			Response.Write("</div>");
			Response.Write("</div>");
		}else{
			Response.Write("<h1><center>NENHUM PRODUTO LOCALIZADO!</center></h1>");
		}
		
		rdr.Close();
		con.Close();
	}
   
}

protected void mensagemBuscaPreco(){


		string sql = @"select Comentarios from cli_for where codigo=1";
		//Response.Write(sql);

		cmd = new SqlCommand(sql, con);		
	  	con.Close();
		con.Open();
		
		rdr = cmd.ExecuteReader();
		if(rdr.HasRows){
			
			while(rdr.Read()){
				Response.Write(rdr["Comentarios"].ToString());
			}
			
		}
		
		rdr.Close();
		con.Close();
	
}


 


}

