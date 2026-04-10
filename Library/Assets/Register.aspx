<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Library_Nook.Assets.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="auth-wrapper">
        <div class="glass-card auth-card" style="width:450px;">
            <h2 style="color:var(--nook-pink);">Join the Sanctuary</h2>
            <p class="subtitle">Create your digital reading nook</p>

            <asp:TextBox ID="UserTb" runat="server" CssClass="form-control" placeholder="Full Name"></asp:TextBox>
            <asp:TextBox ID="EmailTb" runat="server" CssClass="form-control" placeholder="Email Address"></asp:TextBox>
            <asp:TextBox ID="PassTb" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>

            <asp:Label ID="ErrLbl" runat="server" Text=" "></asp:Label>

            <asp:Button ID="RegisterBtn" runat="server" Text="Register" CssClass="btn-primary" Width="100%" OnClick="RegisterBtn_Click" />
            
            <p class="footer-text" style="margin-top:20px;">Already a member? <a href="Login.aspx">Login here</a></p>
        </div>
    </div>
</asp:Content>