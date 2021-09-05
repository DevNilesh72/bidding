<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="VIEWProduct.aspx.cs" Inherits="Admin_VIEWProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <h2>Active</h2>
        <hr />
        <div class="row" style="padding-top: 50px">
            <% if(flag){ %>
            <asp:Repeater ID="rptrActiveProducts" runat="server">
                <ItemTemplate>
                    <div class="col-sm-3 col-md-3">
                        <a style="text-decoration:none;" href="ProductDetails.aspx?AUCID=<%# Eval("Aucid") %>">
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
            <h2>Server is down please try again later!!</h2>
            <% } %>
        </div>
        <h2>Up Comming</h2>
        <hr />
        <div class="row" style="padding-top: 50px">
            <% if(flag){ %>
            <asp:Repeater ID="rptrInActiveProducts" runat="server">
                <ItemTemplate>
                    <div class="col-sm-3 col-md-3">
                        <a style="text-decoration:none;" href="ProductDetails.aspx?AUCID=<%# Eval("Aucid") %>">
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
            <h2>Server is down please try again later!!</h2>
            <% } %>
        </div>
        <h2>Finished</h2>
        <hr />
        <div class="row" style="padding-top: 50px">
            <% if(flag){ %>
            <asp:Repeater ID="rptrFinished" runat="server">
                <ItemTemplate>
                    <div class="col-sm-3 col-md-3">
                        <a style="text-decoration:none;" href="ProductDetails.aspx?AUCID=<%# Eval("Aucid") %>">
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
            <h2>Server is down please try again later!!</h2>
            <% } %>
        </div>
    </div>
</asp:Content>

