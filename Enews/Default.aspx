<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Enews.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<%--    <div class="jumbotron">
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div class="row">
                    <div class="col-xs-6">
                        <h2> <%#Eval("title") %> </h2>
                        <p><%#Eval("content") %></p>
                    </div>
                    <div class="col-xs-6">
                        <img style="height:100px" src="Pictures/<%#Eval("picture") %>" />
                        
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [title], [content], [created_by], [picture] FROM [News]"></asp:SqlDataSource>--%>


    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <div class="container">
                <a href="Category.aspx?category=<%#Eval("cat_id") %>"><h2>Category:  <%#Eval("category") %> </h2> <a>

                <div class="row">
                    <div class="col-xs-6">
                        <a href="Article.aspx?article=<%#Eval("expr1") %>"><h3> <%#Eval("title") %> </h3></a>
                        <p><%#Eval("article") %></p>
                    </div>
                    <div class="col-xs-6">
                        <img style="height:100px" src="Pictures/<%#Eval("image") %>" />
                        
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:ListView>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Categories.Id as cat_id, Categories.display as category, News.Id AS Expr1, News.title as title, News.[content] as article, News.picture as image, News.created_by as author FROM Categories INNER JOIN NewsCategories ON Categories.Id = NewsCategories.Category_ID INNER JOIN News ON NewsCategories.News_ID = News.Id
where News.id in (
select top (1) News.Id as Expr1 from News inner join NewsCategories on NewsCategories.News_id = News.Id  and NewsCategories.Category_ID = Categories.ID order by expr1 desc
)
 "></asp:SqlDataSource>


</asp:Content>
