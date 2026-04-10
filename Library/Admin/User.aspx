<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="Library_Nook.Admin.User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h2 style="color:var(--nook-pink); margin-bottom:30px;">Members Registry</h2>
        
        <div class="glass-card" style="margin-bottom:40px;">
            <div class="input-grid">
                <div>
                    <label>Full Name</label>
                    <asp:TextBox ID="UNameTb" runat="server" CssClass="form-control" placeholder="Full Name"></asp:TextBox>
                </div>
                <div>
                    <label>Email Address</label>
                    <asp:TextBox ID="UEmailTb" runat="server" CssClass="form-control" placeholder="name@example.com"></asp:TextBox>
                </div>
                <div>
                    <label>Phone Number</label>
                    <asp:TextBox ID="UPhoneTb" runat="server" CssClass="form-control" placeholder="+91..."></asp:TextBox>
                </div>
                <div>
                    <label>Password</label>
                    <asp:TextBox ID="UPassTb" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                </div>
            </div>

            <div style="margin-top:20px; display:flex; gap:15px;">
                <asp:Button ID="AddBtn" runat="server" Text="Add Member" CssClass="btn-primary" OnClick="AddBtn_Click" />
                <asp:Button ID="UpdateBtn" runat="server" Text="Update Member" CssClass="btn-primary" OnClick="UpdateBtn_Click" Visible="false" />
                <asp:Button ID="DeleteBtn" runat="server" Text="Remove" CssClass="btn-primary" style="background:#ff4d4d !important;" OnClick="DeleteBtn_Click" Visible="false" />
            </div>
            <asp:Label ID="MsgLbl" runat="server"></asp:Label>
        </div>

        <div class="glass-card">
            <asp:GridView ID="UsersGV" runat="server" CssClass="table" Width="100%" AutoGenerateColumns="false" DataKeyNames="UId" OnSelectedIndexChanged="UsersGV_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="UId" HeaderText="ID" />
                    <asp:BoundField DataField="UName" HeaderText="Name" />
                    <asp:BoundField DataField="UEmail" HeaderText="Email" />
                    <asp:BoundField DataField="UPhone" HeaderText="Phone" />
                    <asp:TemplateField HeaderText="Manage">
                        <ItemTemplate>
                            <asp:LinkButton ID="SelectBtn" runat="server" CommandName="Select" Text="✏️ View Details" ForeColor= "#a18cd1" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle BackColor="#fbc2eb" ForeColor="White" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>
