using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users_MyProducts : System.Web.UI.Page
{
    protected bool flag = true;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USERTYPE"].Equals("Cusomer"))
            Response.Redirect("../SignIn.aspx");
        if (!IsPostBack)
        {
            BindActiveProd();
            BindInActiveProd();
            BindFinished();
        }
    }

    private void BindActiveProd()
    {
        int userid = Convert.ToInt32(Session["USERID"]);
        DataTable dt;
        dt = BussinessLogic.getProducts(0,userid);
        if (dt == null)
            flag = false;
        else
        {
            rptrActiveProducts.DataSource = dt;
            rptrActiveProducts.DataBind();
        }
    }

    private void BindInActiveProd()
    {
        int userid = Convert.ToInt32(Session["USERID"]);
        DataTable dt;
        dt = BussinessLogic.getProducts(1,userid);
        if (dt == null)
            flag = false;
        else
        {
            rptrInActiveProducts.DataSource = dt;
            rptrInActiveProducts.DataBind();
        }
    }

    private void BindFinished()
    {
        int userid = Convert.ToInt32(Session["USERID"]);
        DataTable dt;
        dt = BussinessLogic.getProducts(-1,userid);
        if (dt == null)
            flag = false;
        else
        {
            rptrFinished.DataSource = dt;
            rptrFinished.DataBind();
        }
    }
}