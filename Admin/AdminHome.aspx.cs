using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

public partial class Admin_AdminHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCustomerRptr();
        }
    }

    private void BindCustomerRptr()
    {
        DataTable dt;
        dt = BussinessLogic.getCustomers();
        rptrCustomer.DataSource = dt;
        rptrCustomer.DataBind();
    }
    protected void ddlCustomerType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string type = ddlCustomerType.SelectedValue;
        if (type.Equals("ALL"))
        {
            DataTable dt;
            dt = BussinessLogic.getCustomers();
            rptrCustomer.DataSource = dt;
            rptrCustomer.DataBind();
        }
        else
        {
            DataTable dt;
            dt = BussinessLogic.getCustomers(type);
            rptrCustomer.DataSource = dt;
            rptrCustomer.DataBind();
        }
    }
}