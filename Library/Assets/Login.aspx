<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Library_Nook.Assets.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="auth-wrapper">
        <div class="glass-card auth-card">
            <h2>Welcome Back</h2>
            <p class="subtitle">Enter the Digital Sanctuary</p>

            <asp:TextBox ID="EmailTb" runat="server" CssClass="form-control" placeholder="Email Address"></asp:TextBox>
            <asp:TextBox ID="PassTb" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>

            <asp:Button ID="LoginBtn" runat="server" Text="Login" CssClass="btn-primary" Width="100%" OnClick="LoginBtn_Click" />
            
            <p class="footer-text">New here? <a href="Register.aspx">Create an account</a></p>
            <asp:Label ID="ErrLbl" runat="server" CssClass="error-msg"></asp:Label>
        </div>
    </div>
</asp:Content>