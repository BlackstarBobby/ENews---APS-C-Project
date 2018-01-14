<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="Enews.Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ListView ID="ListView1" runat="server">
        <ItemTemplate>
        </ItemTemplate>


    </asp:ListView>

    <%--<asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>

        </ItemTemplate>
    </asp:Repeater>--%>

    <asp:ListView ID="ListView2" runat="server">

        <ItemTemplate>
            <div class="container">

                <div class="row">
                    <div class="col-xs-6">
                        <a href="Article.aspx?article=<%#Eval("id") %>">
                            <h3><%#Eval("title") %> </h3>
                        </a>
                        <p><%#Eval("content") %></p>
                    </div>
                    <div class="col-xs-6">
                        <img style="height: 200px" src="Pictures/<%#Eval("picture") %>" />
                    </div>
                </div>

                <h6>Posted: <%#Eval("created_at") %> </h6>

            </div>
        </ItemTemplate>
    </asp:ListView>

</asp:Content>
