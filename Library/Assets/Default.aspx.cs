using Book_Store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Nook.Assets
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBooks();
            }
        }

        private void LoadBooks(string filter = "")
        {
            Functions Con = new Functions();
            string Query = "SELECT BId, BTitle, BAuthor, BCategory, BQty, BDesc, BImage FROM BooksTbl";
            if (!string.IsNullOrEmpty(filter))
            {
                Query += " WHERE BTitle LIKE '%" + filter + "%' OR BAuthor LIKE '%" + filter + "%' OR BCategory LIKE '%" + filter + "%'";
            }
            BookRepeater.DataSource = Con.GetData(Query);
            BookRepeater.DataBind();
        }

        protected void FilterCategory(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string category = btn.CommandArgument;
            if (category == "All") LoadBooks();
            else LoadBooks(category);
        }

        protected void SearchTb_TextChanged(object sender, EventArgs e)
        {
            LoadBooks(SearchTb.Text);
        }

        protected void LogoutBtn_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Assets/Login.aspx");
        }
    }
}