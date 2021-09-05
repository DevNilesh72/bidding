using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users_ProductDetails : System.Web.UI.Page
{
    int aucid;
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
    }

    protected void btnBid_Click(object sender, EventArgs e)
    {
        int userid = Convert.ToInt32(Session["USERID"]);
        BussinessLogic.setBid(aucid, userid);
        BindProduct();
    }

}