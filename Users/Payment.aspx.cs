using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users_Payment : System.Web.UI.Page
{
    int aucid;
    protected void Page_Load(object sender, EventArgs e)
    {
        aucid = Convert.ToInt32(Request.QueryString["AUCID"]);
        lblmname.Text = Request.QueryString["USERID"];
        
    }
    protected void btnpayment_Click(object sender, EventArgs e)
    {
        BussinessLogic.makePayment(aucid);
        Response.Redirect("Confirm.aspx");
    }
    protected void ddlCompanyname_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlCompanyname.SelectedValue.Equals("VISA"))
        {
            REV_For_All.ValidationExpression = @"\d{4}\-\d{4}\-\d{4}\-\d{4}";
            REV_cre.ValidationExpression = @"\d{4}";
        }
        else
        {
            if (ddlCompanyname.SelectedValue.Equals("RUPAY"))
            {
                REV_For_All.ValidationExpression = @"\d{4}\-\d{4}\-\d{4}\-\d{4}";
                REV_cre.ValidationExpression = @"\d{4}";
            }
            else
            {
                REV_For_All.ValidationExpression = @"\d{4}\-\d{4}\-\d{4}\-\d{4}";
                REV_cre.ValidationExpression = @"\d{4}";
            }
        }
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("MyProductDetails2.aspx?AUCID="+aucid);
    }
}