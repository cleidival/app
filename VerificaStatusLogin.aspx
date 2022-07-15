using System;
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
using System.Net;  
using System.IO;

public partial class Nico: System.Web.UI.Page 
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader rdr;

    string cons9, sql = "";

	protected void Page_Load(object sender, System.EventArgs e){
	   		
		if(Session["Usuario_Logado"]==null){
			Response.Redirect("http://192.168.0.1/app/Login.aspx");
		}
	}

    
}
