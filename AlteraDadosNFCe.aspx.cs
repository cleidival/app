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
   	try{	
		con = new SqlConnection(ConfigurationManager.ConnectionStrings["shop9ConnectionString"].ConnectionString);
	}catch(Exception ex){Response.Write(ex.ToString());}

	   sequencia= Request.QueryString["txtSequencia"]!=null?Request.QueryString["txtSequencia"]:"0";
		
  }


  
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


protected void localizaSequencia(){

		
		string filial= "0";

		if(Request.QueryString["txtFilial"]!=null && Request.QueryString["txtSequencia"]!=null){
			sequencia= Request.QueryString["txtSequencia"];
			filial= Request.QueryString["txtFilial"];

			//modificarCampoId(filial, sequencia);
			

		string sql = @"select mv.ordem as ordem_movimento, mp.ordem as ordem_mov_prod_serv, mv.data_efetivado_financeiro, mf.chave_acesso, ps.codigo, ps.nome, ps.codigo_barras, mp.ncm, mf.numero, ps.ordem as ordem_prod_serv, ps.ordem_ncm, mp.quantidade, mp.preco_unitario, mp.preco_total_sem_desconto, (select top 1 Concat('PFN:',Perc_Federal_Nacional,'|PFI:',Perc_Federal_Importado,'|PE:',Perc_Estadual,'|PM:',Perc_Municipal,'|FONTE:',Fonte) from Carga_Tributaria_Estados where NCM_NBS=mp.NCM and Estado='PA') as carga_tributaria , mv.efetivado_financeiro, mv.efetivado_estoque,
(select CONCAT('NUMERO:',Numero,'|MODELO:',Modelo,'|SERIE:',Serie,'|CHAVE:',Chave_Acesso,'|NUMERO_RECIBO:',Numero_Recibo,'|PROTOCOLO_AUTORIZACAO:',Protocolo_Autorizacao,'|CODIGO_STATUS:',Codigo_Status) from Movimento_Documentos_Fiscais where modelo=65 and ordem_movimento=mv.ordem) as dadosNF from movimento mv inner join movimento_prod_serv mp on mv.ordem=mp.ordem_movimento left join prod_serv ps on mp.ordem_prod_serv=ps.ordem left join movimento_documentos_fiscais mf on mv.ordem=mf.ordem_movimento where mv.ordem_filial=(select top 1 ordem from filiais where codigo='"+filial+"') and mv.sequencia='"+sequencia+"'";

		//Response.Write(sql);

		try{
			cmd = new SqlCommand(sql, con);		
		  	con.Close();
			con.Open();
			rdr = cmd.ExecuteReader();
			int i = 1;	
			if(rdr.HasRows){
				Response.Write("<hr style='border:1px solid #ccc;'>");
				Response.Write("<div class='col-sm-6 col-md-6 col-lg-6 col-xl-6'>");				
				Response.Write("<h5>FILIAL SELECIONADA: <b>"+filial+"</b></h5>");
				Response.Write("<h5>SEQUENCIA SELECIONADA: <b>"+sequencia+"</b></h5>");
				
				Response.Write("</div>");				
				Response.Write("<div class='col-sm-6 col-md-6 col-lg-6 col-xl-6'>");
Response.Write("<h5><a href='CorrecaoCampoId.aspx?txtFilial="+filial+"&txtSequencia="+sequencia+"' class='btn btn-primary'>Corrigir Campo ID/Duplicidade</a></h5>");				
							
				Response.Write("</div>");	
				Response.Write("<div class='col-sm-12 col-md-12 col-lg-12 col-xl-12'>");				
				//Response.Write("<div class='col'>");				
				
				Response.Write("<table class='table table-striped'>");
				Response.Write("<thead>");
				Response.Write("<tr>");
				Response.Write("<th>#</th>");
				Response.Write("<th>CODIGO</th>");
				Response.Write("<th>PRODUTO</th>");
				Response.Write("<th>EAN</th>");
				Response.Write("<th>NCM</th>");
				Response.Write("<th>QTDE</th>");
				Response.Write("<th>VALOR</th>");
				Response.Write("<th>TOTAL</th>");
				Response.Write("</tr>");
				Response.Write("</thead>");
				Response.Write("<tbody>");
				while(rdr.Read()){
					Response.Write("<tr >");
					Response.Write("<td>"+i+"</td>");
					Response.Write("<td>"+rdr["codigo"].ToString()+"</td>");
					Response.Write("<td><a href='https://cosmos.bluesoft.com.br/pesquisar?utf8=✓&q="+rdr["nome"].ToString()+"' target='_blank'>"+rdr["nome"].ToString()+"</a></td>");
					Response.Write("<td><a href='https://cosmos.bluesoft.com.br/produtos/"+rdr["codigo_barras"].ToString()+"' target='_blank'>"+rdr["codigo_barras"].ToString()+"</a></td>");
					Response.Write("<td width='200px'>");
Response.Write("<input type='text' class='txtNCM' value='"+rdr["ncm"].ToString()+"' maxlength='8'><span class='success glyphicon glyphicon-ok'></span><span class='error glyphicon glyphicon-remove'></span>");

					Response.Write("<input type='hidden' name='txtOrdemMovimento' class='txtOrdemMovimento' value='"+rdr["ordem_movimento"].ToString()+"'>");
					Response.Write("<input type='hidden' name='txtOrdemProdServ' class='txtOrdemProdServ' value='"+rdr["ordem_prod_serv"].ToString()+"'>");
					Response.Write("<input type='hidden' name='txtOrdemMovimentoProdServ' class='txtOrdemMovimentoProdServ' value='"+rdr["ordem_mov_prod_serv"].ToString()+"'>");
					
					if(rdr["carga_tributaria"].ToString()!=""){
					Response.Write("<small class='txtCargaTributaria txtSuccess'>"+rdr["carga_tributaria"].ToString()+"</small>");
					}else{
Response.Write("<small class='txtCargaTributaria txtError'>SEM CARGA TRIBUTARIA</small>");
					}
					
					Response.Write("</td>");
					Response.Write("<td>"+rdr["quantidade"].ToString()+"</td>");
					Response.Write("<td>R$ "+rdr["preco_unitario"].ToString()+"</td>");
					Response.Write("<td>R$ "+rdr["preco_total_sem_desconto"].ToString()+"</td>");
					Response.Write("</tr>");
					i++;
				}
				Response.Write("</tbody>");
				Response.Write("</table>");
				Response.Write("</div'>");
				
			}else{
				Response.Write("<div class='col-sm-12 col-md-12 col-lg-12 col-xl-12'><b style='color: #c00; font-weight: bold;'>Nada Localizado</b></div>");
			}
			rdr.Close();
			con.Close();		
		}catch(Exception ex){Response.Write("");}	
	}
}

protected void modificarCampoId(string filial, string sequencia){


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

