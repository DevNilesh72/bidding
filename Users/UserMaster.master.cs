using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users_UserMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["USERTYPE"].Equals("Customer")) || (Session["USERTYPE"].Equals("Vendor")) || (Session["USERTYPE"].Equals("Both")))
        {
            
        }
        else
            Response.Redirect("../SignIn.aspx");

    }
}
