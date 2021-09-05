<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="Users_Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h4>Merchant ID:<asp:Label ID="lblmname" runat="server" /></h4>
     
     <table>
      <tr>
    <td colspan="2"><h6>Payment Information(Please enter your card details to authorise this transaction)</h6></td>
    </tr>
    <tr>
    <td>
        <asp:Label Text="Card Company" runat="server" id="Label1"/></td>
    <td>
        <asp:DropDownList ID="ddlCompanyname" runat="server" OnSelectedIndexChanged="ddlCompanyname_SelectedIndexChanged" AutoPostBack="true">
            <asp:ListItem Value="0">-Select-</asp:ListItem>
            <asp:ListItem>VISA</asp:ListItem>
            <asp:ListItem>RUPAY</asp:ListItem>
            <asp:ListItem>MASTERCARD</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" runat="server" ControlToValidate="ddlCompanyname" InitialValue="0" 
            ErrorMessage="Plese select Company name!"></asp:RequiredFieldValidator>
    </td>
    </tr>
    <tr>
    <td>
        <asp:Label Text="Card Number" runat="server" id="lblcno"/>
    </td>
    <td>
        <asp:TextBox id="txtcno" runat="server" MaxLength="20" Width="248px" />
        
        <asp:RegularExpressionValidator 
            ErrorMessage="Plz enter number in correct format" 
            ControlToValidate="txtcno"
            ForeColor="Red"
            runat="server"
            ID="REV_For_All"
             />
        
        <asp:RequiredFieldValidator
         ID="RequiredFieldValidator2" runat="server" 
         ErrorMessage="CreditCard Number can not be blank"
         ForeColor="red"
         ControlToValidate="txtcno"></asp:RequiredFieldValidator>
    </td>
    </tr>
    <tr>
    <td>
        <asp:Label Text="Name On Card" runat="server" id="lblname"/>
    </td><td><asp:textbox ID="txtcname" runat="server" Width="249px" />
            <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator1" 
            runat="server" 
            ErrorMessage="Name can not be blank"
            ForeColor="red"
            ControlToValidate="txtcname"></asp:RequiredFieldValidator>
    </td>
    </tr>
    <tr>
    <td>
        <asp:Label Text="Expiry Date" runat="server" id="lbledate"/>
    </td>
    <td>
        <asp:DropDownList ID="mm" runat="server" Height="16px" Width="43px" >
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>6</asp:ListItem>
            <asp:ListItem>7</asp:ListItem>
            <asp:ListItem>8</asp:ListItem>
            <asp:ListItem>9</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>11</asp:ListItem>
            <asp:ListItem>12</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="yyyy" runat="server" Height="16px" Width="60px"  >
            <asp:ListItem>2015</asp:ListItem>
            <asp:ListItem>2016</asp:ListItem>
            <asp:ListItem>2017</asp:ListItem>
            <asp:ListItem>2018</asp:ListItem>
            <asp:ListItem>2019</asp:ListItem>
            <asp:ListItem>2020</asp:ListItem>
        </asp:DropDownList>
    </td>
    </tr>
      <tr>
    <td>
        <asp:Label Text="CVV Number" runat="server" id="lblcvd"/>
    </td>
    <td><asp:textbox ID="txtcvd" runat="server" Width="83px" />
    <asp:RequiredFieldValidator
     ID="RequiredFieldValidator3" 
     runat="server"
     ForeColor="red"
     ErrorMessage="CVD Number can not be blank"
     ControlToValidate="txtcvd"></asp:RequiredFieldValidator>
            

        <asp:RegularExpressionValidator ID="REV_cre" runat="server" 
            ErrorMessage="Enter Correct CVD Number" 
            ForeColor="Red"
            ControlToValidate="txtcvd" >
            </asp:RegularExpressionValidator>
           

    </td>
    </tr>
    <tr>
    <td colspan="2" align="center">
        <asp:Button ID="btncancel" Text="Cancel" 
            runat="server" onclick="btncancel_Click" />
    <asp:Button ID="btnpayment" Text="Make Payment" runat="server" onclick="btnpayment_Click" />

    </td>
            <asp:Label ID="msg" runat="server"/>
    </tr>
    </table>
    </div>
    </form>
</body>
</html>
