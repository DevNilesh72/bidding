<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
            <div class="form-horizontal">
                <h2>Register</h2>
                <hr />
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Username"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" runat="server" Display="Dynamic"
                            ErrorMessage="This field is Required !" ControlToValidate="txtUserName"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" CssClass="col-md-2 control-label" Text="Password"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" CssClass="text-danger" runat="server" Display="Dynamic"
                            ErrorMessage="This field is Required !" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label3" runat="server" CssClass="col-md-2 control-label" Text="Retype Password"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtRePassword" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" 
                            ErrorMessage="This field is Required !" ControlToValidate="txtRePassword" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" CssClass="text-danger" 
                            ErrorMessage="Password does not match!" ControlToValidate="txtRePassword" ControlToCompare="txtPassword" Display="Dynamic"></asp:CompareValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label4" runat="server" CssClass="col-md-2 control-label" Text="Email ID"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" Display="Dynamic"
                            ErrorMessage="This field is Required !" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="text-danger" Display="Dynamic"
                            ErrorMessage="Please provide valid email id!" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label5" runat="server" CssClass="col-md-2 control-label" Text="Mobile No"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtMob" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="text-danger" runat="server" Display="Dynamic"
                            ErrorMessage="This field is Required !" ControlToValidate="txtMob"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" CssClass="text-danger" Display="Dynamic"
                            ErrorMessage="Please provide valid Mobile no!" ControlToValidate="txtMob" ValidationExpression="^[0-9]{10}$"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label11" runat="server" CssClass="col-md-2 control-label" Text="Address"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtAdd" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" CssClass="text-danger" runat="server" Display="Dynamic"
                            ErrorMessage="This field is Required !" ControlToValidate="txtAdd"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label6" runat="server" CssClass="col-md-2 control-label" Text="Bank"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtBank" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="text-danger" runat="server" Display="Dynamic"
                            ErrorMessage="This field is Required !" ControlToValidate="txtBank"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label7" runat="server" CssClass="col-md-2 control-label" Text="Account No"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtAcc" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" CssClass="text-danger" runat="server" Display="Dynamic"
                            ErrorMessage="This field is Required !" ControlToValidate="txtAcc"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label8" runat="server" CssClass="col-md-2 control-label" Text="Type"></asp:Label>
                    <div class="col-md-3">
                        <asp:CheckBox ID="CheckBox1" runat="server" Text="Customer" />
                        <asp:CheckBox ID="CheckBox2" runat="server" Text="Vendor" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label9" runat="server" CssClass="col-md-2 control-label" Text="Security Question"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtQuestion" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" CssClass="text-danger" runat="server" Display="Dynamic"
                            ErrorMessage="This field is Required !" ControlToValidate="txtQuestion"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label10" runat="server" CssClass="col-md-2 control-label" Text="Answer"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtAns" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" CssClass="text-danger" runat="server" Display="Dynamic"
                            ErrorMessage="This field is Required !" ControlToValidate="txtans"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-2"></div>
                    <div class="col-md-6">
                        <asp:Button ID="Button1" runat="server" Text="SignUp" CssClass="btn btn-default" OnClick="Button1_Click" />
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

