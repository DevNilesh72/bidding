using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

public class BussinessLogic
{
    public static SqlCommand cmd;
    public static Connection connection = new Connection();
	public static string setCustomer(string user,string pass,string email,Int64 mob,string add,string bank,string acc,string ques,string ans,string type)
    {
        cmd = connection.openConnection();
        if (cmd == null)
            return "Server is Down! Please try again later";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "sp_signupuser";
        cmd.Parameters.Clear();
        cmd.Parameters.AddWithValue("@username", user);
        cmd.Parameters.AddWithValue("@password", pass);
        cmd.Parameters.AddWithValue("@usertype", type);
        cmd.Parameters.AddWithValue("@address", add);
        cmd.Parameters.AddWithValue("@mobile", mob);
        cmd.Parameters.AddWithValue("@email", email);
        cmd.Parameters.AddWithValue("@bank", bank);
        cmd.Parameters.AddWithValue("@account", acc);
        cmd.Parameters.AddWithValue("@ques", ques);
        cmd.Parameters.AddWithValue("@ans", ans);
        cmd.Parameters.Add("@result", SqlDbType.VarChar, 100);
        cmd.Parameters["@result"].Direction = ParameterDirection.Output;
        string result;
        cmd.ExecuteNonQuery();
        result = Convert.ToString(cmd.Parameters["@result"].Value);
        connection.closeConnection();
        return result;
    }

    public static void verifyUser(string user,string pass,out string usertype,out int userid)
    {
        cmd = connection.openConnection();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "sp_UserVerify";
        cmd.Parameters.Clear();
        cmd.Parameters.AddWithValue("@user", user);
        cmd.Parameters.AddWithValue("@pass", pass);
        cmd.Parameters.Add("@usertype", SqlDbType.VarChar, 50);
        cmd.Parameters.Add("@userId", SqlDbType.Int);
        cmd.Parameters["@usertype"].Direction = ParameterDirection.Output;
        cmd.Parameters["@userId"].Direction = ParameterDirection.Output;
        cmd.ExecuteNonQuery();
        usertype = cmd.Parameters["@usertype"].Value.ToString();
        userid = Convert.ToInt32(cmd.Parameters["@userId"].Value);
        connection.closeConnection();
    }

    public static void setProductType(string name,string imgfile)
    {
        cmd = connection.openConnection();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "sp_insertProductType";
        cmd.Parameters.Clear();
        cmd.Parameters.AddWithValue("@name", name);
        cmd.Parameters.AddWithValue("@imgfile", imgfile);
        cmd.ExecuteNonQuery();
        connection.closeConnection();
    }

    public static DataTable getCategories()
    {
        cmd = connection.openConnection();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select * from dbo.fn_selectCategory()";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        connection.closeConnection();
        return dt;
    }

    public static void delete(int id,string table)
    {
        cmd = connection.openConnection();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "delete from " + table + " where i_autoid = " + id;
        cmd.ExecuteNonQuery();
        connection.closeConnection();
    }

    public static string setAuction(string itemname,string itemimg,int itemtype,int amt,string startdate,string enddate,string desc,int userid,string usertype)
    {
        cmd = connection.openConnection();
        if (cmd == null)
            return "Server is Down! Please try again later";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "sp_hostAuction";
        cmd.Parameters.Clear();
        cmd.Parameters.AddWithValue("@itemname", itemname);
        cmd.Parameters.AddWithValue("@itemimage", itemimg);
        cmd.Parameters.AddWithValue("@itemtype", itemtype);
        cmd.Parameters.AddWithValue("@amt", amt);
        cmd.Parameters.AddWithValue("@startdate", startdate);
        cmd.Parameters.AddWithValue("@enddate", enddate);
        cmd.Parameters.AddWithValue("@desc", desc);
        cmd.Parameters.AddWithValue("@userid", userid);
        cmd.Parameters.AddWithValue("@usertype", usertype);
        int status = cmd.ExecuteNonQuery();
        connection.closeConnection();
        if (status == -1)
            return "Something went wrong!!! Please try again later";
        else
            return "Auction Hosted Successfully!!!";
    }

    public static DataTable getProducts(int val)
    { 
        cmd = connection.openConnection();
        if (cmd == null)
            return null;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select * from dbo.fn_selectProducts(@val)";
        cmd.Parameters.Clear();
        cmd.Parameters.AddWithValue("@val",val);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        connection.closeConnection();
        return dt;
    }

    public static DataTable getProducts(int val,int userid)
    {
        cmd = connection.openConnection();
        if (cmd == null)
            return null;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select * from dbo.fn_selectProducts(@val) where hostby = "+userid;
        cmd.Parameters.Clear();
        cmd.Parameters.AddWithValue("@val", val);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        connection.closeConnection();
        return dt;
    }

    public static DataTable getProductDetails(int aucid)
    {
        cmd = connection.openConnection();
        if (cmd == null)
        {
            return null;
        }
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select * from dbo.fn_selectProductDetails(@aucid)";
        cmd.Parameters.Clear();
        cmd.Parameters.AddWithValue("@aucid",aucid);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        connection.closeConnection();
        return dt;
    }

    public static DataTable getProductBidDetails(int aucid)
    {
        cmd = connection.openConnection();
        if (cmd == null)
        {
            return null;
        }
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select * from dbo.fn_Item_Bid_Details(@aucid)";
        cmd.Parameters.Clear();
        cmd.Parameters.AddWithValue("@aucid", aucid);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        connection.closeConnection();
        return dt;
    }

    public static void setBid(int auctionid,int userid)
    {
        cmd = connection.openConnection();
        if (cmd == null)
            return;

        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "sp_insertBid";
        cmd.Parameters.Clear();
        cmd.Parameters.AddWithValue("@auctionid", auctionid);
        cmd.Parameters.AddWithValue("@userid", userid);
        int status = cmd.ExecuteNonQuery();
        connection.closeConnection();
    }

    public static DataTable getFAQ()
    {
        cmd = connection.openConnection();
        if (cmd == null)
        {
            return null;
        }
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "Select * from FAQ";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        connection.closeConnection();
        return dt;
    }

    public static int setFAQ(string question, string answer)
    {
        cmd = connection.openConnection();
        if (cmd == null)
            return -1;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "insert into FAQ(question,answer) values ('" + question + "','" + answer + "')";
        int status = cmd.ExecuteNonQuery();
        connection.closeConnection();
        return status;
    }

    public static DataTable getCustomers()
    {
        cmd = connection.openConnection();
        if (cmd == null)
        {
            return null;
        }
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select * from dbo.fn_selectCustomers()";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        connection.closeConnection();
        return dt;
    }

    public static DataTable getCustomers(string customertype)
    {
        cmd = connection.openConnection();
        if (cmd == null)
        {
            return null;
        }
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select * from dbo.fn_selectCustomers() where type = '" + customertype + "'";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        connection.closeConnection();
        return dt;
    }


    public static DataTable getProducts(string type)
    {
        cmd = connection.openConnection();
        if (cmd == null)
            return null;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select * from dbo.fn_selectProducts(0) where Ptype = '" + type + "'";
        cmd.Parameters.Clear();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        connection.closeConnection();
        return dt;
    }

    public static void setAprove(int aucid,int userid,int bidid)
    {
        cmd = connection.openConnection();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "sp_insertAprove";
        cmd.Parameters.Clear();
        cmd.Parameters.AddWithValue("@auctid", aucid);
        cmd.Parameters.AddWithValue("@userid", userid);
        cmd.Parameters.AddWithValue("@bidid", bidid);
        cmd.ExecuteNonQuery();
        connection.closeConnection();
    }

    public static DataTable getWinProducts(int userid)
    {
        cmd = connection.openConnection();
        if (cmd == null)
        {
            return null;
        }
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select * from dbo.fn_selectWinProducts(@userid)";
        cmd.Parameters.Clear();
        cmd.Parameters.AddWithValue("@userid", userid);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        connection.closeConnection();
        return dt;
    }

    public static DataTable getProductCount()
    {
        cmd = connection.openConnection();
        if (cmd == null)
            return null;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select * from dbo.fn_Productcuonts()";
        cmd.Parameters.Clear();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        connection.closeConnection();
        return dt;
    }

    public static int makePayment(int aucid)
    {
        cmd = connection.openConnection();
        if (cmd == null)
            return -1;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "sp_Payment";
        cmd.Parameters.Clear();
        cmd.Parameters.AddWithValue("@aucid", aucid);
        int result;
        result = cmd.ExecuteNonQuery();
        connection.closeConnection();
        return result;
    }
}