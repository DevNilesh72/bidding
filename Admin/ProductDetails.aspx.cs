using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ProductDetails : System.Web.UI.Page
{
    protected int aucid;
    protected bool approveflag = true;
    protected void Page_Load(object sender, EventArgs e)
    {
        aucid = Convert.ToInt32(Request.QueryString["AUCID"]);
        if(!IsPostBack)
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

    protected void rptrProductDetails_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if(e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        {
            int flag = (int)DataBinder.Eval(e.Item.DataItem, "isAproved");
            if (flag == 1)
                approveflag = false;

            //if ((int)DataBinder.Eval(e.Item.DataItem, "Hostby") != (int)Session["USERID"])
                //approveflag = false;
        }
        Repeater inner = (Repeater)e.Item.FindControl("rptrProductBid");
        DataTable dt;
        dt = BussinessLogic.getProductBidDetails(aucid);
        inner.DataSource = dt;
        inner.DataBind();
    }

    protected string getQuery(string userid,string bidid)
    {
        string result = "AUCID=" + aucid + "&USERID=" + userid + "&BIDID=" + bidid;
        return result;
    }
}