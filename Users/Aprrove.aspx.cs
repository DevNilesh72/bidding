using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users_Aprrove : System.Web.UI.Page
{
    int aucid, userid, bidid;
    protected void Page_Load(object sender, EventArgs e)
    {
        aucid = Convert.ToInt32(Request.QueryString["AUCID"]);
        userid = Convert.ToInt32(Request.QueryString["USERID"]);
        bidid = Convert.ToInt32(Request.QueryString["BIDID"]);

        BussinessLogic.setAprove(aucid, userid, bidid);

        Response.Redirect("MyProductsDetails.aspx?AUCID=" + aucid);
    }
}