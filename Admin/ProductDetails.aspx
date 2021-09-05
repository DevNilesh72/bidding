<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="Admin_ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="row">
        
        <div style="padding-top:50px" class="col">
            <asp:Repeater ID="rptrProductDetails" runat="server" OnItemDataBound="rptrProductDetails_ItemDataBound">
                <ItemTemplate>
                    <div class="col-md-5">
                        <div style="max-width:370px" class="thumbnail">
                            <img src="../Images/Products/<%# Eval("Pimage")%>" alt="<%# Eval("Pname") %>" />
                            </div>
                        </div>
                    <div class="col-md-7">
                        <div class="divDet1">
                            <h1 class="proNameView"><%# Eval("pname") %></h1>
                            <span class="prodesc"><%# Eval("description") %></span>
                        </div>
                        <div class="divDet1">
                            <span class="prodesc">Type: <%# Eval("ptype") %></span>
                        </div>
                        <div class="divDet1">
                            <span class="prodesc">Starts on: <%# Eval("startdate") %></span> <br />
                            <span class="prodesc" >Ends on: <%# Eval("enddate") %></span>
                        </div>
                        <div class="divDet1">
                            <h1 class="proPrice">Base Price: <%# Eval("baseamt") %></h1>
                        </div>
                        <div class="divDet1">
                            <h1 class="proPrice"><% if(approveflag){ %> Current Price:<% }else{ %> Final Price: <% } %> <%# Eval("currentValue") %></h1>
                        </div>
                        <h1>Peoples bid on this Product</h1>
                            <hr />
                            <div class="panel panel-default">
                                <div class="panel-heading">All users who bid on this product</div>
                                <asp:Panel ID="Panel1" runat="server">
                                <asp:Repeater ID="rptrProductBid" runat="server">
                                    <HeaderTemplate>
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>Name</th>
                                                    <th>Amount bided</th>
                                                    <th>Bid date</th>
                              <% if(approveflag){ %><th>Aprove</th><% } %>
                                                </tr>
                                            </thead>
                                    <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <th><%# Eval("username") %></th>
                                            <td><%# Eval("Bidprice") %></td>
                                            <td><%# Eval("Biddate") %></td>
                     <% if(approveflag){ %> <td><a href="Aprove.aspx?<%# getQuery(Eval("userid").ToString(),Eval("bidid").ToString()) %>">Aprove</a></td> <% } %>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                    </tbody>
                                    </table>
                                    </FooterTemplate>
                                </asp:Repeater>
                                </asp:Panel>
                            </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        </div>
    </div>
</asp:Content>

