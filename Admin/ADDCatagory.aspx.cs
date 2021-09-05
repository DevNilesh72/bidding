using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Admin_ADDCatagory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BindBrandsRptr();
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (ImgFile.HasFile)
        {
            string SavePath = Server.MapPath("../Images/Categories/");
            if (!Directory.Exists(SavePath))
            {
                Directory.CreateDirectory(SavePath);
            }
            string Extention = Path.GetExtension(ImgFile.PostedFile.FileName);
            ImgFile.SaveAs(SavePath + "\\" + txtCatName.Text + Extention);
            BussinessLogic.setProductType(txtCatName.Text, txtCatName.Text + Extention);
            lblMsg.Text = "Category Inserted Successfully !!!";
            BindBrandsRptr();
        }
    }

    private void BindBrandsRptr()
    {
        DataTable dtBrands;
        dtBrands = BussinessLogic.getCategories();
        rptrCategory.DataSource = dtBrands;
        rptrCategory.DataBind();
    }
}