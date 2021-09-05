using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_FAQ : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BindFAQRptr();
        }
    }

    private void BindFAQRptr()
    {
        DataTable dt;
        dt = BussinessLogic.getFAQ();
        rptrFAQ.DataSource = dt;
        rptrFAQ.DataBind();
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        string question = txtQues.Text;
        string answer = txtAns.Text;
        int status = BussinessLogic.setFAQ(question, answer);
        if (status == 1)
            lblMsg.Text = "Inserted Successfully!!!";
        else
            lblMsg.Text = "Something went wrong!!! Please try again later";
        BindFAQRptr();
    }
}