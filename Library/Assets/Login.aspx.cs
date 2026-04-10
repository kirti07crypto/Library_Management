using Book_Store.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Nook.Assets
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            // 1. Fixed Admin Check (No DB needed!)
            if (EmailTb.Text == "kirtikri3428@gmail.com" && PassTb.Text == "2004")
            {
                Session["UserName"] = "Admin";
                Session["Role"] = "Admin";
                Response.Redirect("~/Admin/Dashboard.aspx");
            }
            else
            {
                // 2. Database Check for Students
                Functions Con = new Functions();
                string Query = "SELECT * FROM UserTbl WHERE UEmail='{0}' AND UPass='{1}'";
                Query = string.Format(Query, EmailTb.Text, PassTb.Text);
                DataTable dt = Con.GetData(Query);

                if (dt != null && dt.Rows.Count > 0)
                {
                    Session["UserId"] = dt.Rows[0]["UId"].ToString();
                    Session["UserName"] = dt.Rows[0]["UName"].ToString();
                    Session["Role"] = dt.Rows[0]["URole"].ToString();
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    ErrLbl.Text = "Invalid Credentials!";
                }
            }
        }
    }
}