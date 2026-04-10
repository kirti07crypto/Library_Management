<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IssueDesk.aspx.cs" Inherits="Library_Nook.Admin.IssueDesk" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h2 style="color:#a18cd1; margin-bottom:30px;">Issue Desk</h2>

        <div class="glass-card" style="margin-bottom:40px;">
            <div class="input-grid">
                <div>
                    <label>Select Member</label>
                    <asp:DropDownList ID="UserCb" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div>
                    <label>Select Book</label>
                    <asp:DropDownList ID="BookCb" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div>
                    <label>Issue Date</label>
                    <asp:TextBox ID="DateTb" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                </div>
            </div>

            <div style="margin-top:20px;">
                <asp:Button ID="IssueBtn" runat="server" Text="Issue Book ✨" CssClass="btn-primary" OnClick="IssueBtn_Click" />
            </div>
            <asp:Label ID="MsgLbl" runat="server"></asp:Label>
        </div>

        <div class="glass-card">
            <h3 style="color:#fbc2eb; margin-bottom:15px;">Active Issues</h3>
            <asp:GridView ID="IssueGV" runat="server" CssClass="table" Width="100%" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="IssueId" HeaderText="ID" />
                    <asp:BoundField DataField="UName" HeaderText="Member" />
                    <asp:BoundField DataField="BTitle" HeaderText="Book" />
                    <asp:BoundField DataField="IssueDate" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                </Columns>
                <HeaderStyle BackColor="#a18cd1" ForeColor="White" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>