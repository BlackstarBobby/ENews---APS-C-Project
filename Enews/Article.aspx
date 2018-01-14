<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Article.aspx.cs" Inherits="Enews.Article" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">

        <h3 id="title" runat="server"></h3>

        <img id="image" runat="server" style="height:100px" src=" " />

        <p id="article" runat="server" ></p>

    </div>

</asp:Content>
