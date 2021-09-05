<%@ Page Title="" Language="C#" MasterPageFile="~/Users/UserMaster.master" AutoEventWireup="true" CodeFile="HOSTAuction.aspx.cs" Inherits="Users_HOSTAuction" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="form-horizontal">
            <h2>Host Auction</h2>
            <hr />
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Product name"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtProduct" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" runat="server" Display="Dynamic"
                        ErrorMessage="This field is Required !" ControlToValidate="txtProduct"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label2" runat="server" CssClass="col-md-2 control-label" Text="Product Image"></asp:Label>
                <div class="col-md-3">
                    <asp:FileUpload ID="ImgFile" CssClass="form-control" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" CssClass="text-danger" runat="server" Display="Dynamic"
                        ErrorMessage="This field is Required !" ControlToValidate="imgFile"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label3" runat="server" CssClass="col-md-2 control-label" Text="Category"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlCategory" CssClass="form-control" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="text-danger" runat="server" Display="Dynamic"
                        ErrorMessage="This field is Required !" ControlToValidate="ddlCategory" InitialValue="0">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label4" runat="server" CssClass="col-md-2 control-label" Text="Description"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtDesc" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" Display="Dynamic"
                        ErrorMessage="This field is Required !" ControlToValidate="txtDesc"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label5" runat="server" CssClass="col-md-2 control-label" Text="Base Price"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtAmt" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" Display="Dynamic"
                        ErrorMessage="This field is Required !" ControlToValidate="txtAmt"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label6" runat="server" CssClass="col-md-2 control-label" Text="Start Date"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtSDate" CssClass="form-control" runat="server" TextMode="DateTime"></asp:TextBox>
                    <cc1:CalendarExtender ID="txt_sdate_CalendarExtender" runat="server" PopupPosition="TopLeft"
                        Enabled="True" TargetControlID="txtSDate"></cc1:CalendarExtender> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="text-danger" runat="server" Display="Dynamic"
                        ErrorMessage="This field is Required !" ControlToValidate="txtSDate"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label7" runat="server" CssClass="col-md-2 control-label" Text="End Date"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtEDate" CssClass="form-control" runat="server" TextMode="DateTime"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupPosition="TopLeft"
                        Enabled="True" TargetControlID="txtEDate"></cc1:CalendarExtender> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" CssClass="text-danger" runat="server" Display="Dynamic"
                        ErrorMessage="This field is Required !" ControlToValidate="txtEDate"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button ID="Button1" runat="server" Text="Host" CssClass="btn btn-default" OnClick="Button1_Click" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Label ID="lblError" runat="server" CssClass="text-danger"></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

