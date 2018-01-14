<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="Enews.Admin.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h3>Manage Role by user</h3>

    <div class="row">
        <asp:Label ID="Label1" runat="server" Text="Select a user"></asp:Label>
        <asp:DropDownList ID="UserList" runat="server"  DataTextField="UserName" DataValueField="UserName" AutoPostBack="true" OnSelectedIndexChanged="UserList_SelectedIndexChanged"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [UserName] FROM [Users]"></asp:SqlDataSource>
    </div>

    <div class="row">
        <asp:Repeater ID="UsersRoleList" runat="server">
            <ItemTemplate>
                <asp:CheckBox runat="server" ID="RoleCheckBox" AutoPostBack="true" OnCheckedChanged="RoleCheckBox_CheckChanged"
                    Text='<%# Container.DataItem %>' />
                <br />
            </ItemTemplate>
        </asp:Repeater>
    </div>


    <p class="text-center">

        <asp:Label ID="ActionStatus" runat="server" ForeColor="Red" Font-Size="Large"></asp:Label>
    </p>
</asp:Content>
