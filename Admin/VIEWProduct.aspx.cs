using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_VIEWProduct : System.Web.UI.Page
{
    protected bool flag = true;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BindActiveProd();
            BindInActiveProd();
            BindFinished();
        }
    }

    private void BindActiveProd()
    {
        DataTable dt;
        dt = BussinessLogic.getProducts(0);
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
        DataTable dt;
        dt = BussinessLogic.getProducts(1);
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
        DataTable dt;
        dt = BussinessLogic.getProducts(-1);
        if (dt == null)
            flag = false;
        else
        {
            rptrFinished.DataSource = dt;
            rptrFinished.DataBind();
        }
    }
}