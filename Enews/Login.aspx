<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Enews.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:LoginView ID="LoginView1" runat="server">
        <LoggedInTemplate>
            <asp:LoginName ID="LoginName1" runat="server"
                FormatString="Welcome, {0}" />
            <br />
        </LoggedInTemplate>

        <AnonymousTemplate>
            <asp:Login ID="Login1" runat="server" BackColor="#F7F7DE" BorderColor="#CCCC99" BorderStyle="Solid" BorderWidth="1px" CssClass="form-group" Font-Names="Verdana" Font-Size="10pt" >
                <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" />
            </asp:Login>
        </AnonymousTemplate>
    </asp:LoginView>


   </asp:Content>
