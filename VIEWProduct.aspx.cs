using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VIEWProduct : System.Web.UI.Page
{
    string type;
    protected void Page_Load(object sender, EventArgs e)
    {
        type = Request.QueryString["TYPE"];
    }

    private void BindActiveProd()
    {
        DataTable dt;
        dt = BussinessLogic.getProducts(type);
        rptrProducts.DataSource = dt;
        rptrProducts.DataBind();
    }
}