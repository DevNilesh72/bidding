using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Delete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"]);
        string table = Request.QueryString["table"];
        BussinessLogic.delete(id, table);
        Response.Redirect("/ADDCatagory.aspx");
    }
}