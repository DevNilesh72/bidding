using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users_MyProducts2 : System.Web.UI.Page
{
    protected bool flag = true;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BindProduct();
        }
    }

    private void BindProduct()
    {
        int userid = Convert.ToInt32(Session["USERID"]);
        DataTable dt;
        dt = BussinessLogic.getWinProducts(userid);
        if (dt.Rows.Count == 0)
            flag = false;
        else
        {
            rptrProducts.DataSource = dt;
            rptrProducts.DataBind();
        }
    }
}