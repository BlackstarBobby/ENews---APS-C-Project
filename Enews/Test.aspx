<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="Enews.Editor.Test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <select id="Select1" runat="server" name="nume">
        <option></option>

    </select>
    
    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="TestSel" />
</asp:Content>
