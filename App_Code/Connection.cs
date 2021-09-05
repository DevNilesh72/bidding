using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Open or close Connection of DataBase
/// </summary>
public class Connection
{
    private SqlConnection con;
    public SqlCommand cmd = new SqlCommand();
    public SqlCommand openConnection()
    {
        try
        {
            con = new SqlConnection("Data Source=localhost;Initial Catalog=AuctionOfAssets;User ID=sa;Password=123;Integrated Security=True");
            cmd.Connection = con;
            con.Open();
            return cmd;
        }
        catch(Exception e)
        {
            return null;
        }
    }

    public void closeConnection()
    {
        con.Close();
    }
}