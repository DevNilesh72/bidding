using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookieCollection cookies = Response.Cookies;
        if(cookies.Count > 0)
        {
            if(Session["USERTYPE"] != null)
            {
                string usertype = Session["USERTYPE"].ToString();
                if (usertype.Equals("ADMIN"))
                {
                    Response.Redirect("Admin/AdminHome.aspx");
                }
                else if (usertype.Equals("Customer") || usertype.Equals("Vendor") || usertype.Equals("Both"))
                {
                    Response.Redirect("Users/UserHome.aspx");
                }
            }
            else
            {
                Session["USERTYPE"] = cookies["USERTYPE"].Value;
                Session["USERID"] = cookies["USERID"].Value;
                string usertype = Session["USERTYPE"].ToString();
                if (usertype.Equals("ADMIN"))
                {
                    Response.Redirect("Admin/AdminHome.aspx");
                }
                else if (usertype.Equals("Customer") || usertype.Equals("Vendor") || usertype.Equals("Both"))
                {
                    Response.Redirect("Users/UserHome.aspx");
                }
            }
        }
        else
        {
            if (Session["USERTYPE"] != null)
            {
                string usertype = Session["USERTYPE"].ToString();
                if (usertype.Equals("ADMIN"))
                {
                    Response.Redirect("Admin/AdminHome.aspx");
                }
                else if (usertype.Equals("Customer") || usertype.Equals("Vendor") || usertype.Equals("Both"))
                {
                    Response.Redirect("Users/UserHome.aspx");
                }
            }
        }
        BindRptrCatogery();
    }
    protected void BindRptrCatogery()
    {
        DataTable dt = BussinessLogic.getCategories();
        rptrCatogery.DataSource = dt;
        rptrCatogery.DataBind();
    }
}