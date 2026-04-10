using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Book_Store.Models;
using System.Data;

namespace Library_Nook.Admin
{
    public partial class ManageBooks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowBooks();
                UpdateBtn.Visible = false;
            }
        }
        private void ShowBooks()
        {
            try
            {
                Functions Con = new Functions();
                // Use the exact database column names from SSMS here
                string Query = "SELECT * FROM BooksTbl";
                DataTable dt = Con.GetData(Query);

                if (dt != null)
                {
                    BooksGV.DataSource = dt;
                    BooksGV.DataBind();
                }
            }
            catch (Exception ex)
            {
                // This will show the EXACT error on your screen
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

        protected void AddBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string imgPath = "default.jpg";

                if (BookImgUpload.HasFile)
                {
                    string fileName = System.IO.Path.GetFileName(BookImgUpload.PostedFile.FileName);
                    BookImgUpload.SaveAs(Server.MapPath("~/Assets/") + fileName);
                    imgPath = fileName;
                }

                Functions Con = new Functions();

           
                string title = TitleTb.Text.Replace("'", "''");
                string author = AuthorTb.Text.Replace("'", "''");
                string desc = DescTb.Text.Replace("'", "''");
                string category = CatCb.SelectedItem.Text;
                string qty = QtyTb.Text;

                // Use the sanitized variables in your query
                string Query = "INSERT INTO BooksTbl (BTitle, BAuthor, BCategory, BQty, BImage, BDesc) " +
                               "VALUES ('{0}', '{1}', '{2}', {3}, '{4}', '{5}')";

                Query = string.Format(Query, title, author, category, qty, imgPath, desc);

                Con.SetData(Query);
                MsgLbl.Text = "Book Added to Sanctuary! ✨";
                ShowBooks();

                // Clear fields
                TitleTb.Text = "";
                AuthorTb.Text = "";
                DescTb.Text = "";
            }
            catch (Exception ex)
            {
                MsgLbl.Text = "Error: " + ex.Message;
            }
        }
        // 1. DELETE LOGIC
        protected void BooksGV_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int bId = Convert.ToInt32(BooksGV.DataKeys[e.RowIndex].Value);
            string query = string.Format("DELETE FROM BooksTbl WHERE BId = {0}", bId);
            new Functions().SetData(query);
            ShowBooks();
            MsgLbl.Text = "Book removed from Sanctuary.";
        }

        // 2. "FETCH FOR EDIT" LOGIC
        protected void BooksGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get the ID from the first cell
            string id = BooksGV.SelectedRow.Cells[0].Text;

            // Fetch the full row from DB so we get the hidden Description
            Functions Con = new Functions();
            DataTable dt = Con.GetData("SELECT * FROM BooksTbl WHERE BId = " + id);

            if (dt.Rows.Count > 0)
            {
                TitleTb.Text = dt.Rows[0]["BTitle"].ToString();
                AuthorTb.Text = dt.Rows[0]["BAuthor"].ToString();
                CatCb.SelectedValue = dt.Rows[0]["BCategory"].ToString();
                QtyTb.Text = dt.Rows[0]["BQty"].ToString();
                ImageTb.Text = dt.Rows[0]["BImage"].ToString();
                DescTb.Text = dt.Rows[0]["BDesc"].ToString();
                // Now it won't be empty!

                AddBtn.Visible = false;
                UpdateBtn.Visible = true;
            }
        }
        // 3. UPDATE LOGIC (For the UpdateBtn_Click)
        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            try
            {
                // Use the existing filename as default
                string imgPath = ImageTb.Text;

                if (BookImgUpload.HasFile)
                {
                    string fileName = System.IO.Path.GetFileName(BookImgUpload.PostedFile.FileName);
                    BookImgUpload.SaveAs(Server.MapPath("~/Assets/") + fileName);
                    imgPath = fileName;
                }

                int bId = Convert.ToInt32(BooksGV.SelectedDataKey.Value);
                // Fix: Ensure your format indices {0}, {1}, etc. match the order in string.Format
                string query = "UPDATE BooksTbl SET BTitle='{0}', BAuthor='{1}', BCategory='{2}', BQty={3}, BImage='{4}', BDesc='{5}' WHERE BId={6}";
                query = string.Format(query, TitleTb.Text, AuthorTb.Text, CatCb.SelectedItem.Text, QtyTb.Text, imgPath, DescTb.Text, bId);

                new Functions().SetData(query);
                MsgLbl.Text = "Sanctuary Updated! ✨";
                ShowBooks();

                AddBtn.Visible = true;
                UpdateBtn.Visible = false;
            }
            catch (Exception ex) { MsgLbl.Text = ex.Message; }
        }
    }
}