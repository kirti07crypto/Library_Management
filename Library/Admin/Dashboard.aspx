<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Library_Nook.Admin.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
    <div style="width: 100%; margin-bottom: 30px; padding-top: 10px;">
        <h2 style="color:#a18cd1; font-size: 2.2rem; margin: 0;">Library Analytics</h2>
        <p style="color:#636e72; opacity: 0.7; margin: 5px 0 0 0;">Welcome back to your Digital Sanctuary.</p>
    </div>
    
       <div class="dashboard-grid" style="display: grid !important; grid-template-columns: repeat(2, 1fr) !important; gap: 20px; width: 100%;">
            
            <div class="glass-card" style="text-align:center; border-left: 5px solid var(--nook-purple); padding: 30px;">
                <h3 style="color:var(--text-dark); opacity:0.7; font-size: 1.1rem;">Total Collection</h3>
                <h1 style="font-size: 3.5rem; color: var(--nook-purple); margin: 15px 0;">
                    <asp:Label ID="BookCountLbl" runat="server" Text="0"></asp:Label>
                </h1>
                <p style="font-size: 0.9rem;">Books in Sanctuary</p>
            </div>

            <div class="glass-card" style="text-align:center; border-left: 5px solid var(--nook-pink); padding: 30px;">
                <h3 style="color:var(--text-dark); opacity:0.7; font-size: 1.1rem;">Active Readers</h3>
                <h1 style="font-size: 3.5rem; color: var(--nook-pink); margin: 15px 0;">
                    <asp:Label ID="UserCountLbl" runat="server" Text="0"></asp:Label>
                </h1>
                <p style="font-size: 0.9rem;">Registered Students</p>
            </div>

            <div class="glass-card" style="text-align:center; border-left: 5px solid #ff4d4d; padding: 30px;">
                <h3 style="color:var(--text-dark); opacity:0.7; font-size: 1.1rem;">Issued Books</h3>
                <h1 style="font-size: 3.5rem; color: #ff4d4d; margin: 15px 0;">
                    <asp:Label ID="IssueCountLbl" runat="server" Text="0"></asp:Label>
                </h1>
                <p style="font-size: 0.9rem;">Currently with Readers</p>
            </div>
      <div class="glass-card" style="text-align:left; border-left: 5px solid #a18cd1; min-height:280px; display:flex; flex-direction:column !important;">
    <h3 style="color:#2d3436; opacity:0.7; font-size:1.1rem; margin-bottom:10px;">Sanctuary Bulletin</h3>
    
    <div style="flex-grow: 1; max-height: 120px; overflow-y: auto;">
        <asp:Repeater ID="BulletinRepeater" runat="server">
            <ItemTemplate>
                <div style="margin-bottom:8px; border-bottom:1px solid #f1f1f1; padding-bottom:3px;">
                    <span style="font-size:0.6rem; font-weight:bold; color:#f093fb; text-transform:uppercase;"><%# Eval("BCategory") %>:</span>
                    <span style="font-size:0.8rem; color:#636e72;"><%# Eval("BContent") %></span>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <div style="margin-top:auto; padding-top:10px;">
        <asp:DropDownList ID="CategoryCb" runat="server" CssClass="form-control" Width="1422px" >
        <asp:ListItem>Event</asp:ListItem>
            <asp:ListItem>Notice</asp:ListItem>
            <asp:ListItem>Task</asp:ListItem>
        </asp:DropDownList>
        <asp:TextBox ID="ContentTb" runat="server" CssClass="form-control" placeholder="New note..." Height="16px" Width="1393px"></asp:TextBox>
        <asp:Button ID="PostBtn" runat="server" Text="Add Note ✨" OnClick="PostBtn_Click" CssClass="btn-primary" style="width:100%; height:35px;" />
    </div>
</div>

</asp:Content>