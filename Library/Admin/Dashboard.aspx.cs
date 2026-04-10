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
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetStats();
            }
            if (Session["UserName"] == null)
            {
                Response.Redirect("~/Assets/Login.aspx");
            }
        }
       

        protected void PostBtn_Click(object sender, EventArgs e)
        {
            Functions Con = new Functions();
            string Query = string.Format("INSERT INTO BulletinTbl (BContent, BCategory) VALUES ('{0}', '{1}')",
                           ContentTb.Text.Replace("'", "''"), CategoryCb.SelectedValue);

            Con.SetData(Query);

            ContentTb.Text = ""; // Clear the box

            // IMPORTANT: You MUST call this again to refresh the Repeater!
            GetStats();
        }
        private void GetStats()
        {
            Functions Con = new Functions();

            // 1. Total Collection
            DataTable dtBooks = Con.GetData("SELECT COUNT(*) FROM BooksTbl");
            BookCountLbl.Text = dtBooks.Rows[0][0].ToString();

            // 2. Active Readers
            DataTable dtUsers = Con.GetData("SELECT COUNT(*) FROM UserTbl");
            UserCountLbl.Text = dtUsers.Rows[0][0].ToString();

            // 3. Issued Books
            DataTable dtIssues = Con.GetData("SELECT COUNT(*) FROM IssueTbl WHERE Status = 'Issued'");
            IssueCountLbl.Text = dtIssues.Rows[0][0].ToString();

            DataTable dtBulletin = Con.GetData("SELECT TOP 3 * FROM BulletinTbl ORDER BY BId DESC");
            if (dtBulletin != null)
            {
                BulletinRepeater.DataSource = dtBulletin;
                BulletinRepeater.DataBind();
            }
        }
    }
}