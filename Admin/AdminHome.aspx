<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="Admin_AdminHome" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container">
        <h1>Customers</h1>
        <hr />
        <div class="form-group">
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Customer type"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlCustomerType" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlCustomerType_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem>ALL</asp:ListItem>
                        <asp:ListItem>Customer</asp:ListItem>
                        <asp:ListItem>Vendor</asp:ListItem>
                        <asp:ListItem>Both</asp:ListItem>
                     </asp:DropDownList>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <asp:Repeater ID="rptrCustomer" runat="server">
                <HeaderTemplate>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone no.</th>
                                <th>Address</th>
                                <th>Type</th>
                                <th>Bank</th>
                                <th>A/c no.</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <th><%# Eval("username") %></th>
                        <td><%# Eval("email") %></td>
                        <td><%# Eval("phone") %></td>
                        <td><%# Eval("address") %></td>
                        <td><%# Eval("type") %></td>
                        <td><%# Eval("bank") %></td>
                        <td><%# Eval("acc") %></td>
                        <td><a href="Delete.aspx?id=<%# Eval("id") %>&table=tbl_userdetails">Delete</a></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
            </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>


