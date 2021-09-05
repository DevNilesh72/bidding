using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_HOSTAuction : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Session["USERTYPE"] == null && Session["USERID"] == null)
                Response.Redirect("../SignIn.aspx");

            if(!Session["USERTYPE"].Equals("ADMIN"))
                Response.Redirect("../SignIn.aspx");
            BindCategoryDD();
        }
    }

    private void BindCategoryDD()
    {
        DataTable dtBrands;
        dtBrands = BussinessLogic.getCategories();
        ddlCategory.DataSource = dtBrands;
        ddlCategory.DataTextField = "Name";
        ddlCategory.DataValueField = "ID";
        ddlCategory.DataBind();
        ddlCategory.Items.Insert(0, new ListItem("-Select-", "0"));
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (ImgFile.HasFile)
        {
            string itemname = txtProduct.Text;
            string SavePath = Server.MapPath("../Images/Products/");
            if (!Directory.Exists(SavePath))
            {
                Directory.CreateDirectory(SavePath);
            }
            string Extention = Path.GetExtension(ImgFile.PostedFile.FileName);
            ImgFile.SaveAs(SavePath + "\\" + txtProduct.Text + Extention);
            string itemimg = txtProduct.Text + Extention;
            int itemtype = Int32.Parse(ddlCategory.SelectedValue);
            string desc = txtDesc.Text;
            int price = Int32.Parse(txtAmt.Text);
            string sDate = txtSDate.Text;
            string eDate = txtEDate.Text;
            string usertype = Session["USERTYPE"].ToString();
            int userid = Convert.ToInt32(Session["USERID"]);
            lblError.Text = BussinessLogic.setAuction(itemname, itemimg, itemtype, price, sDate, eDate, desc, userid, usertype);
            //Response.Write(itemname+","+ itemimg+","+ itemtype+","+ price+","+ sDate+","+ eDate+","+ desc+","+ userid+","+ usertype);
        }
    }
}