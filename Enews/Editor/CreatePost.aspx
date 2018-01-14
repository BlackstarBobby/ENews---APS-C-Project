<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CreatePost.aspx.cs" Inherits="Enews.Editor.CreatePost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h2>Create a new article</h2>

    <div class="form-group">
        <asp:Label ID="Label1" runat="server" Text="Title"></asp:Label>
        <asp:TextBox ID="title" runat="server" CssClass="form-control"></asp:TextBox>
    </div>

    <div class="form-group">
        <textarea name="content" id="content" cols="40" rows="10" class="form-control"></textarea>
    </div>

    <div class="form-group">
        <select id="categories" runat="server" name="categories" class="form-control">
            <option></option>
        </select>
    </div>

    <div class="form-group">
        <asp:FileUpload ID="FileUpload1" runat="server" />
    </div>

    <div class="form-group">
        <asp:Button ID="article_submit" Text="Post" runat="server" CssClass="btn btn-primary"  OnClick="StorePost" />
    </div>

</asp:Content>
