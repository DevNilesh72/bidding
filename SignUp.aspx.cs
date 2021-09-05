using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SignUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (CheckBox1.Checked || CheckBox2.Checked)
        {
            string username = txtUserName.Text;
            string password = txtPassword.Text;
            string email = txtEmail.Text;
            Int64 mob = Int64.Parse(txtMob.Text);
            string bank = txtBank.Text;
            string acc = txtAcc.Text;
            string add = txtAdd.Text;
            string ques = txtQuestion.Text;
            string ans = txtAns.Text;
            string type;
            if (CheckBox1.Checked && CheckBox2.Checked)
                type = "Both";
            else
                type = CheckBox1.Checked ? CheckBox1.Text : CheckBox2.Text;

            string status = BussinessLogic.setCustomer(username, password, email, mob, add, bank, acc, ques, ans, type);

            if (status.Equals("User Registered Succesfully!!!"))
            {
                lblError.Text = status;
                Response.Redirect("SignIn.aspx");
            }
            else
                lblError.Text = status;

        }
        else
        {
            lblError.Text = "Please select customer type !";
        }
    }
    
}