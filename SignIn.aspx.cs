using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SignIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string username = UserName.Text;
        string password = Password.Text;
        string usertype;
        int userid;

        BussinessLogic.verifyUser(username, password, out usertype, out userid);

        if (usertype != "" && userid != null)
        {
            Session["USERTYPE"] = usertype;
            Session["USERID"] = userid.ToString();
            if (CheckBox1.Checked)
            {
                HttpCookie c1 = new HttpCookie("USERTYPE",username);
                HttpCookie c2 = new HttpCookie("USERID",userid.ToString());
                
                c1.Expires = DateTime.Now.AddDays(365);
                c2.Expires = DateTime.Now.AddDays(365);

                Response.Cookies.Add(c1);
                Response.Cookies.Add(c2);
            }

            if (usertype.Equals("ADMIN"))
            {
                Response.Redirect("Admin/AdminHome.aspx");
            }
            else if (Session["USERTYPE"].Equals("Customer"))
                Response.Redirect("Users/VIEWProducts.aspx");
            if (Session["USERTYPE"].Equals("Vendor"))
                Response.Redirect("Users/MyProducts.aspx");
            else
                Response.Redirect("Users/VIEWProducts.aspx");
        }
        else
            lblError.Text = "Invalid Username or password";
    }
}