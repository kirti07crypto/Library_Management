<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageBooks.aspx.cs" Inherits="Library_Nook.Admin.ManageBooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h2 style="color:var(--nook-purple); margin-bottom:30px;">Manage Collection</h2>
        
        <div class="glass-card" style="margin-bottom:40px;">
            <div style="display:grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap:20px;">
                <div>
                    <label>Book Title</label>
                    <asp:TextBox ID="TitleTb" runat="server" CssClass="form-control" placeholder="The Great Gatsby"></asp:TextBox>
                </div>
                <div>
                    <label>Author</label>
                    <asp:TextBox ID="AuthorTb" runat="server" CssClass="form-control" placeholder="F. Scott Fitzgerald"></asp:TextBox>
                </div>
                <div>
                    <label>Category</label>
                    <asp:DropDownList ID="CatCb" runat="server" CssClass="form-control">
                        <asp:ListItem> Thrillers</asp:ListItem>
                        <asp:ListItem>Romance</asp:ListItem>
                        <asp:ListItem>Comedy</asp:ListItem>
                        <asp:ListItem>Horror</asp:ListItem>
                        <asp:ListItem>Classics</asp:ListItem>
                        <asp:ListItem>Non-Fiction</asp:ListItem>
                        <asp:ListItem>Poetry</asp:ListItem>
                        <asp:ListItem>Novella</asp:ListItem>
                        <asp:ListItem>Fantasy</asp:ListItem>
                         <asp:ListItem>Young Adult</asp:ListItem>
                         <asp:ListItem>Kids</asp:ListItem>

                        <asp:ListItem>Others</asp:ListItem>
               </asp:DropDownList>
                </div>

                <div>
    
                    <label>Quantity</label>
                    <asp:TextBox ID="QtyTb" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                </div>
            </div>
            <div style="display: flex; gap: 25px; margin-top: 20px; align-items: flex-start;">
            <div style="margin-top:20px;">
                <label>Description </label>
                <asp:TextBox ID="DescTb" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
            </div>
            <div>
    <label>Cover Photo</label>
    <asp:FileUpload ID="BookImgUpload" runat="server" CssClass="form-control" />
    <asp:TextBox ID="ImageTb" runat="server" Visible="false"></asp:TextBox>
</div>
</div>
            <div style="margin-top:20px; display:flex; gap:15px;">
                <asp:Button ID="AddBtn" runat="server" Text="Add to Library" CssClass="btn-primary" OnClick="AddBtn_Click" />
                <asp:Button ID="UpdateBtn" runat="server" Text="Update" CssClass="btn-primary" OnClick="UpdateBtn_Click" />
            </div>
            <asp:Label ID="MsgLbl" runat="server" ForeColor="Green"></asp:Label>
        </div>

        <div class="glass-card">
    <asp:GridView ID="BooksGV" runat="server" CssClass="table" Width="100%" 
        AutoGenerateColumns="false" DataKeyNames="BId" 
        OnSelectedIndexChanged="BooksGV_SelectedIndexChanged" 
        OnRowDeleting="BooksGV_RowDeleting">
        <Columns>
            <asp:BoundField DataField="BId" HeaderText="ID" />
            <asp:BoundField DataField="BTitle" HeaderText="Title" />
            <asp:BoundField DataField="BAuthor" HeaderText="Author" />
            <asp:BoundField DataField="BCategory" HeaderText="Category" />
            <asp:BoundField DataField="BQty" HeaderText="Qty" />
            <asp:BoundField DataField="BImage" HeaderText="Image" />
            <asp:TemplateField HeaderText="Actions">
                <ItemTemplate>
                    <asp:LinkButton ID="EditBtn" runat="server" CommandName="Select" Text="✏️ Edit" ForeColor="#a18cd1" style="margin-right:15px;" />
                    <asp:LinkButton ID="DelBtn" runat="server" CommandName="Delete" Text="🗑️ Delete" ForeColor="#ff4d4d" OnClientClick="return confirm('Remove this book?');" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
       
    </asp:GridView>
</div>
    </div>
</asp:Content>
