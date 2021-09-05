<%@ Page Title="" Language="C#" MasterPageFile="~/Users/UserMaster.master" AutoEventWireup="true" CodeFile="FAQ.aspx.cs" Inherits="Users_FAQ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
    <h1>Frequently Asked Questions (FAQ)</h1>
    <hr />
    
     <div id="accordion">

        <%
            Connection con = new Connection();
            System.Data.SqlClient.SqlCommand cmd = con.openConnection();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "Select * from FAQ";
            System.Data.SqlClient.SqlDataReader sr = cmd.ExecuteReader();
            
            while(sr.Read())
            { 
            %>
          <div class="card">
            <div class="card-header">
              <a class="card-link" data-toggle="collapse" href="#collapseOne">
                <%=sr[1].ToString() %>
              </a>
            </div>
            <div id="collapseOne" class="collapse show" data-parent="#accordion">
              <div class="card-body">
                <%=sr[2].ToString() %>
              </div>
            </div>
          </div>

        <%}
            con.closeConnection(); %>

</div>
       </div>
</asp:Content>


