<%@ Page Title="" Language="C#" MasterPageFile="~/Users/UserMaster.master" AutoEventWireup="true" CodeFile="MyProducts2.aspx.cs" Inherits="Users_MyProducts2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <h2>Auctions you won</h2>
        <hr />
        <% if(flag){ %>
            <asp:Repeater ID="rptrProducts" runat="server">
            <ItemTemplate>
                <div class="col-sm-3 col-md-3">
                    <a style="text-decoration:none;" href="MyProductDetails2.aspx?AUCID=<%# Eval("Aucid") %>">
                    <div class="thumbnail">
                        <img src="../Images/Products/<%# Eval("Pimage")%>" alt="<%# Eval("Pname") %>" height="480px">
                        <div class="caption">
                            <div class="probrand">Name: <%# Eval("Pname") %></div>
                            <div class="proName">Category: <%# Eval("Ptype") %></div>
                            <div class="proPrice">Base Price: Rs. <%# Eval("Pprice") %></div>
                        </div>
                    </div>
                    </a>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <% }else{ %>
        <h2>Seems like you have not won any auction yet!!! Try bidding higher</h2>
        <% } %>
    </div>
</asp:Content>

