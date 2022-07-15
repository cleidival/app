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
	Session["Pagina_Atual"] = "RELATORIOS::VENDAS";
	
	try{	
		con = new SqlConnection(ConfigurationManager.ConnectionStrings["shop9ConnectionString"].ConnectionString);
	}catch(Exception ex){Response.Write(ex.ToString());}	
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


protected void listaCaixas(){
		string filial = Request.QueryString["filial"];
		string caixa = Request.QueryString["caixa"];

		string sql = @"select * from Caixas where codigo>0 and ordem_filial=(select top 1 ordem from filiais where codigo='"+filial+"') order by codigo";
		
		string txt = "";
		cmd = new SqlCommand(sql, con);

	  	con.Close();
		con.Open();
		rdr = cmd.ExecuteReader();
		if(rdr.HasRows){
			Response.Write("<select name='caixaField' id='caixaField' class='form-control'>");
			Response.Write("<option value='0'>Selecione...</option>");
			while(rdr.Read()){
				if(caixa == rdr["codigo"].ToString()){
					Response.Write("<option value='"+rdr["codigo"].ToString()+"' selected>"+rdr["codigo"].ToString()+":"+rdr["nome"].ToString()+"</option>");
				}else{
					Response.Write("<option value='"+rdr["codigo"].ToString()+"'>"+rdr["codigo"].ToString()+":"+rdr["nome"].ToString()+"</option>");
				}
			}
			Response.Write("</select>");
		}
		rdr.Close();
		con.Close();
	}
	

protected void totaisCaixas(){
		string caixa = "0";
		string data_inicial = DateTime.Now.ToString("yyyy-MM-dd")+ " 00:00:00";
		string data_final = DateTime.Now.ToString("yyyy-MM-dd")+" 23:59:59";
		
		if(Request.QueryString["caixa"]!=""){
			caixa = Request.QueryString["caixa"];
		}
		if(Request.QueryString["data_inicial"]!=""){
			//data_inicial = Request.QueryString["data_inicial"];
		}
		if(Request.QueryString["data_final"]!=""){
			//data_final = Request.QueryString["data_final"];
		}
		string sql = @"select sum(dinheiro) as dinheiro, sum(vale) as vale,  sum(cheque_a_vista) as cheque, sum(cheque_pre) as cheque_pre, sum(cartao_debito) as cartao_debito, sum(cartao_credito) as cartao_credito,  sum(cartao_convenio) as convenio, sum(parcelamento_boleto) as boleto,  sum(parcelamento_carne) as carne, sum(parcelamento_carteira) as carteira, sum(credito_cliente) as credito_cliente from financeiro_caixa  where  ordem_filial=(select ordem from filiais where codigo=1)  and ordem_caixa=(select ordem from caixas where codigo='"+caixa+"') and data between '"+data_inicial+"' and '"+data_final+"'";
		//Response.Write(sql);
		try{
			cmd = new SqlCommand(sql, con);		
		  	con.Close();
			con.Open();
			rdr = cmd.ExecuteReader();	
			if(rdr.HasRows){
				Response.Write("<div class='table-responsive'>");
				Response.Write("<table class='table table-hover'>");
				Response.Write("<thead>");
				Response.Write("<tr><th colspan='2'>Movimentaçào de: "+String.Format("{0:dd/MM/yyyy}", Convert.ToDateTime(data_inicial))+" à "+String.Format("{0:dd/MM/yyyy}", Convert.ToDateTime(data_final))+"</th></tr></thead><tbody>");
				Response.Write("<tr><th>Forma de Pagamento</th><th>Valor</th></tr></thead><tbody>");
				Response.Write("</thead>");
				Response.Write("<tbody>");
				while(rdr.Read()){
					Response.Write("<tr><td>Dinheiro:</td><td>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["dinheiro"].ToString()))+"</td></tr>");
	  				Response.Write("<tr><td>Vale:</td><td>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["vale"].ToString()))+"</td></tr>");
	  				Response.Write("<tr><td>Cheque:</td><td>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["cheque"].ToString()))+"</td></tr>");
	  				Response.Write("<tr><td>Cheque Pré:</td><td>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["cheque_pre"].ToString()))+"</td></tr>");
		  			Response.Write("<tr><td>Cartão Débito:</td><td>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["cartao_debito"].ToString()))+"</td></tr>");
		  			Response.Write("<tr><td>Cartão Crédito:</td><td>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["cartao_credito"].ToString()))+"</td></tr>");
	  				Response.Write("<tr><td>Cartão Convênio:</td><td>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["convenio"].ToString()))+"</td></tr>");
	  				Response.Write("<tr><td>Boleto:</td><td>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["boleto"].ToString()))+"</td></tr>");
	  				Response.Write("<tr><td>Carnê:</td><td>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["carne"].ToString()))+"</td></tr>");
		  			Response.Write("<tr><td>Carteira:</td><td>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["carteira"].ToString()))+"</td></tr>");
	  				Response.Write("<tr><td>Crédito:</td><td>"+String.Format("{0:C2}", Convert.ToDecimal(rdr["credito_cliente"].ToString()))+"</td></tr>");
				}
				Response.Write("</tbody>");
				Response.Write("</table>");
				Response.Write("</div>");
			}else{
				Response.Write("Nada Localizado");
			}
			rdr.Close();
			con.Close();		
		}catch(Exception ex){Response.Write("");}	
	}

  
}

