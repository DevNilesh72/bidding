<%@ Page Title="" Language="C#" MasterPageFile="~/Users/UserMaster.master" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="Users_ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div style="padding-top:50px">
            <asp:Repeater ID="rptrProductDetails" runat="server">
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
                            <span class="prodesc">Ends on: <%# Eval("enddate") %></span>
                        </div>
                        <div class="divDet1">
                            <h1 class="proPrice">Base Price: <%# Eval("baseamt") %></h1>
                        </div>
                        <div class="divDet1">
                            <h1 class="proPrice">Current Price: <%# Eval("currentValue") %></h1>
                        </div>
                        <div class="divDet1">
                            <asp:Button ID="btnBid" CssClass="mainButton" runat="server" Text="Bid x10%" OnClick="btnBid_Click" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>