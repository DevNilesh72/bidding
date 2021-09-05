using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users_MyProductDetails2 : System.Web.UI.Page
{
    protected int aucid,amount;
    protected bool paid = true;
    protected void Page_Load(object sender, EventArgs e)
    {
        aucid = Convert.ToInt32(Request.QueryString["AUCID"]);
        if (!IsPostBack)
        {
            BindProduct();
        }
    }
    protected void BindProduct()
    {
        DataTable dt;
        dt = BussinessLogic.getProductDetails(aucid);
        rptrProductDetails.DataSource = dt;
        rptrProductDetails.DataBind();
        amount = Convert.ToInt32(dt.Rows[0]["currentValue"]);
        if (Convert.ToInt32(dt.Rows[0]["isPaid"]) == 1)
            paid = false;
    }

    protected void btnBid_Click(object sender, EventArgs e)
    {
        int userid = Convert.ToInt32(Session["USERID"]);
        Response.Redirect("Payment.aspx?AUCID=" + aucid + "&USERID=" + userid + "&AMOUNT=" + amount);
        BindProduct();
    }
}