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
	Session["Pagina_Atual"] = "RELATORIOS::CAIXA";			
		
  }
  
}

