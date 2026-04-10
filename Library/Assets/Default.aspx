<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Library_Nook.Assets.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<style>
    /* This hides the sidebar ONLY on this page */
    .sidebar { display: none !important; }

    /* This forces the main content to take up the full width */
    .main-content { 
        margin-left: 0 !important; 
        width: 100% !important; 
        padding: 40px !important;
    }

    /* Make the grid even more airy now that we have more room */
    .book-grid {
        grid-template-columns: repeat(auto-fill, minmax(250px, 1fr)) !important;
        gap: 40px !important;
    }
</style>
    <div class="container">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px;">
            <h1 style="color: #a18cd1; margin: 0; font-size: 1.8rem;">Digital Sanctuary</h1>
            <asp:LinkButton ID="LogoutBtn" runat="server" OnClick="LogoutBtn_Click" style="color: #f093fb; text-decoration: none; font-weight: bold;">Logout →</asp:LinkButton>
        </div>
        <div style="text-align: center; margin-bottom: 60px;">
    <h1 style="font-family: 'Georgia', serif; font-style: italic; color: #a18cd1; font-size: 3rem; margin-bottom: 10px;">
         Ink & Imagination
    </h1>
    <div style="width: 50px; height: 2px; background: #f093fb; margin: 0 auto 20px;"></div>
    <p style="color: #636e72; letter-spacing: 2px; text-transform: uppercase; font-size: 0.8rem;">
        Your Personal Reading Nook
    </p>
</div>
        <div style="text-align: center; margin-bottom: 40px;">
            <div style="margin-bottom: 20px;">
                <asp:TextBox ID="SearchTb" runat="server" placeholder="Search by title or author..." CssClass="form-control" style="width: 300px; display: inline-block; border-radius: 20px; padding: 10px 20px;" OnTextChanged="SearchTb_TextChanged" AutoPostBack="true"></asp:TextBox>
            </div>
            <div class="mood-selector">
                <asp:LinkButton ID="AllBtn" runat="server" OnClick="FilterCategory" CommandArgument="All" CssClass="cat-pill active">All</asp:LinkButton>
                <asp:LinkButton ID="ThrillBtn" runat="server" OnClick="FilterCategory" CommandArgument="Thrill" CssClass="cat-pill">Thrillers</asp:LinkButton>
                 <asp:LinkButton ID="LinkButton7" runat="server" OnClick="FilterCategory" CommandArgument="Fantasy" CssClass="cat-pill">Fantasy</asp:LinkButton>
                <asp:LinkButton ID="RomanceBtn" runat="server" OnClick="FilterCategory" CommandArgument="Romance" CssClass="cat-pill">Romance</asp:LinkButton>
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="FilterCategory" CommandArgument="Comedy" CssClass="cat-pill">Comedy</asp:LinkButton>
                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="FilterCategory" CommandArgument="Horror" CssClass="cat-pill">Horror</asp:LinkButton>
                <asp:LinkButton ID="LinkButton3" runat="server" OnClick="FilterCategory" CommandArgument="Classics" CssClass="cat-pill">Classics</asp:LinkButton>
                <asp:LinkButton ID="LinkButton4" runat="server" OnClick="FilterCategory" CommandArgument="Non-Fiction" CssClass="cat-pill">Non-Fiction</asp:LinkButton>
                <asp:LinkButton ID="LinkButton5" runat="server" OnClick="FilterCategory" CommandArgument="Poetry" CssClass="cat-pill">Poetry</asp:LinkButton>
                <asp:LinkButton ID="LinkButton6" runat="server" OnClick="FilterCategory" CommandArgument="Novella" CssClass="cat-pill">Novella</asp:LinkButton>
               


            </div>
        </div>
<div class="book-grid" style="display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 30px;">
    <asp:Repeater ID="BookRepeater" runat="server">
        <ItemTemplate>
            <div class="glass-card book-card" 
                 style="text-align: center; padding: 15px; transition: transform 0.3s; cursor:pointer;" 
                 onclick="showDetails('<%# Eval("BTitle").ToString().Replace("'", "\\'").Replace("\r\n", " ").Replace("\n", " ") %>', '<%# Eval("BAuthor").ToString().Replace("'", "\\'").Replace("\r\n", " ").Replace("\n", " ") %>', '<%# Eval("BDesc").ToString().Replace("'", "\\'").Replace("\r\n", " ").Replace("\n", " ") %>', '<%# Eval("BQty") %>', '<%# ResolveUrl("~/Assets/" + Eval("BImage")) %>')">
                
                <img src='<%# ResolveUrl("~/Assets/" + Eval("BImage")) %>' 
                     style="width: 100%; height: 250px; object-fit: cover; border-radius: 10px; margin-bottom: 10px;" />

                <h4 style="margin: 5px 0; color: #2d3436;"><%# Eval("BTitle") %></h4>
                <p style="font-size: 0.8rem; color: #a18cd1; margin-bottom: 10px;"><%# Eval("BAuthor") %></p>
                <span style="font-size: 0.7rem; color: #636e72;"><%# Eval("BCategory") %></span>
            </div>
        </ItemTemplate>
        <FooterTemplate>
            <asp:Label ID="lblEmpty" runat="server" 
                Visible='<%# BookRepeater.Items.Count == 0 %>' 
                Text="The Sanctuary is quiet... no books found." 
                style="display:block; text-align:center; padding:50px; margin-top:50px; color:#636e72;" />
        </FooterTemplate>
    </asp:Repeater>
</div>

    <div id="bookModal" class="modal-overlay" onclick="closeModal()" style="display:none;">
        <div class="modal-content" onclick="event.stopPropagation()">
            <img id="modalImg" src="" style="width: 150px; height: 200px; object-fit: cover; border-radius: 10px; margin-bottom: 15px;" />
            <h2 id="modalTitle" style="color: #a18cd1; margin-bottom: 5px;"></h2>
            <p id="modalAuthor" style="color: #f093fb; font-style: italic; margin-bottom: 15px;"></p>
            <p id="modalDesc" style="color: #636e72; font-size: 0.9rem; line-height: 1.5; margin-bottom: 20px;"></p>
            <div style="background: #f8f9fa; padding: 10px; border-radius: 10px;">
                <span style="font-weight: bold; color: #2d3436;">Stock Available: </span>
                <span id="modalQty" style="color: #a18cd1;"></span>
            </div>
            <button onclick="closeModal()" style="margin-top: 20px; background: #a18cd1; color: white; border: none; padding: 10px 25px; border-radius: 20px; cursor: pointer;">Close Sanctuary</button>
        </div>
    </div>

    <script>
        function showDetails(title, author, desc, qty, img) {
            // These IDs must match the ones in the Modal HTML exactly!
            document.getElementById('modalTitle').innerText = title;
            document.getElementById('modalAuthor').innerText = author;
            document.getElementById('modalDesc').innerText = desc || "No description available.";
            document.getElementById('modalQty').innerText = qty + " copies left";
            document.getElementById('modalImg').src = img;
            document.getElementById('bookModal').style.display = 'flex';
        }

        function closeModal() {
            document.getElementById('bookModal').style.display = 'none';
        }
    </script>

    <asp:Label ID="lblEmpty" runat="server" 
        Visible='<%# BookRepeater.Items.Count == 0 %>' 
        Text="The Sanctuary is quiet... no books found." 
        style="display:block; text-align:center; padding:50px; margin-top:50px; color:#636e72;" />

        </div>
        <div>
        <footer style="margin-top: 80px; padding: 40px 0; border-top: 1px solid rgba(161, 140, 209, 0.2); text-align: center;">
    <div style="margin-bottom: 15px;">
        <span style="font-family: 'Georgia', serif; font-style: italic; color: #a18cd1; font-size: 1.2rem;">
            The Aesthetic Nook
        </span>
    </div>
    
    <p style="color: #636e72; font-size: 0.8rem; letter-spacing: 1px; text-transform: uppercase; margin-bottom: 20px;">
        "A room without books is like a body without a soul."
    </p>

    <div style="font-size: 0.75rem; color: #b2bec3;">
        &copy; 2026 Developed with ✨ by <span style="color: #f093fb; font-weight: bold;">Suruti, Kirti, Jeet & Priyesh</span>
    </div>
</footer>
    </div>
    <script>
        function showDetails(title, author, desc, qty, img) {
            document.getElementById('modalTitle').innerText = title;
            document.getElementById('modalAuthor').innerText = "by " + author;
            document.getElementById('modalDesc').innerText = desc || "No description available for this treasure.";
            document.getElementById('modalQty').innerText = qty + " copies left";
            document.getElementById('modalImg').src = img;
            document.getElementById('bookModal').style.display = 'flex';
        }

        function closeModal() {
            document.getElementById('bookModal').style.display = 'none';
        }
    </script>
</asp:Content>
