using Book_Store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Library_Nook.Assets
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void RegisterBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (UserTb.Text == "" || EmailTb.Text == "" || PassTb.Text == "")
                {
                    ErrLbl.Text = "Please fill all fields!";
                }
                else
                {
                    Functions Con = new Functions();
                    // Default role is 'Student' for all registrations
                    string Query = "INSERT INTO UserTbl (UName, UEmail, UPass, URole) VALUES ('{0}', '{1}', '{2}', 'Student')";
                    Query = string.Format(Query, UserTb.Text, EmailTb.Text, PassTb.Text);
                    Con.SetData(Query);

                    Response.Redirect("Login.aspx");
                }
            }
            catch (Exception ex)
            {
                ErrLbl.Text = ex.Message;
            }
        }
    }
}