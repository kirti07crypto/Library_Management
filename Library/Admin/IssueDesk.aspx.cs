using Book_Store.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Nook.Admin
{
    public partial class IssueDesk : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetUsers();
                GetBooks();
                ShowIssues();
                DateTb.Text = DateTime.Today.ToString("yyyy-MM-dd"); // Default to today
            }
        }

        private void GetUsers()
        {
            Functions Con = new Functions();
            UserCb.DataTextField = "UName";
            UserCb.DataValueField = "UId";
            UserCb.DataSource = Con.GetData("SELECT UId, UName FROM UserTbl");
            UserCb.DataBind();
        }

        private void GetBooks()
        {
            Functions Con = new Functions();
            BookCb.DataTextField = "BTitle";
            BookCb.DataValueField = "BId";
            // Only show books that are actually in stock
            BookCb.DataSource = Con.GetData("SELECT BId, BTitle FROM BooksTbl WHERE BQty > 0");
            BookCb.DataBind();
        }

        private void ShowIssues()
        {
            Functions Con = new Functions();
            // Join the tables so we see Names instead of IDs
            string Query = "SELECT I.IssueId, U.UName, B.BTitle, I.IssueDate, I.Status " +
                           "FROM IssueTbl I JOIN UserTbl U ON I.UId = U.UId " +
                           "JOIN BooksTbl B ON I.BId = B.BId";
            IssueGV.DataSource = Con.GetData(Query);
            IssueGV.DataBind();
        }
        protected void IssueBtn_Click(object sender, EventArgs e)
        {
            try
            {
                Functions Con = new Functions();

                // Double check quantity hasn't hit 0 while the page was open
                DataTable dt = Con.GetData("SELECT BQty FROM BooksTbl WHERE BId = " + BookCb.SelectedValue);
                int currentQty = Convert.ToInt32(dt.Rows[0][0]);

                if (currentQty > 0)
                {
                    // 1. Save to IssueTbl
                    string Query = "INSERT INTO IssueTbl (BId, UId, IssueDate, Status) VALUES ({0}, {1}, '{2}', 'Issued')";
                    Query = string.Format(Query, BookCb.SelectedValue, UserCb.SelectedValue, DateTb.Text);
                    Con.SetData(Query);

                    // 2. Reduce Book Quantity
                    string UpdateQty = string.Format("UPDATE BooksTbl SET BQty = BQty - 1 WHERE BId = {0}", BookCb.SelectedValue);
                    Con.SetData(UpdateQty);

                    MsgLbl.Text = "Book Issued! 📖";
                    MsgLbl.ForeColor = System.Drawing.Color.FromArgb(161, 140, 209); 
                    ShowIssues();
                    GetBooks();
                }
                else
                {
                    MsgLbl.Text = "This book is currently out of stock!";
                    MsgLbl.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex) { MsgLbl.Text = "Error: " + ex.Message; }
        }
    }
}