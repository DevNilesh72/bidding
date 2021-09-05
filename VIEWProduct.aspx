<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="VIEWProduct.aspx.cs" Inherits="VIEWProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <h2>Products</h2>
        <hr />
        <asp:Repeater ID="rptrProducts" runat="server">
            <ItemTemplate>
                <div class="col-sm-3 col-md-3">
                    <a style="text-decoration:none;" href="SignIn.aspx">
                    <div class="thumbnail">
                        <img src="Images/Products/<%# Eval("Pimage")%>" alt="<%# Eval("Pname") %>" height="480px">
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
    </div>
</asp:Content>