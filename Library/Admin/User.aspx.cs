using Book_Store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Library_Nook.Admin
{
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { ShowUsers(); }
        }

        private void ShowUsers()
        {
            Functions Con = new Functions();
            string Query = "SELECT UId, UName, UEmail, UPhone FROM UserTbl";
            UsersGV.DataSource = Con.GetData(Query);
            UsersGV.DataBind();
        }

        protected void AddBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string Query = "INSERT INTO UserTbl (UName, UEmail, UPhone, UPass) VALUES ('{0}', '{1}', '{2}', '{3}')";
                Query = string.Format(Query, UNameTb.Text, UEmailTb.Text, UPhoneTb.Text, UPassTb.Text);
                new Functions().SetData(Query);
                MsgLbl.Text = "Member Welcomed! ✨";
                ShowUsers();
            }
            catch (Exception ex) { MsgLbl.Text = ex.Message; }
        }
        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            try
            {
               
                int userId = Convert.ToInt32(UsersGV.SelectedDataKey.Value);

               
                string Query = "UPDATE UserTbl SET UName='{0}', UEmail='{1}', UPhone='{2}', UPass='{3}' WHERE UId={4}";
                Query = string.Format(Query, UNameTb.Text, UEmailTb.Text, UPhoneTb.Text, UPassTb.Text, userId);

            
                Functions Con = new Functions();
                Con.SetData(Query);

                MsgLbl.Text = "Member Registry Updated! ✨";
                MsgLbl.ForeColor = System.Drawing.Color.MediumSeaGreen;

                // Reset the UI
                ClearInputs();
                ShowUsers();
                AddBtn.Visible = true;
                UpdateBtn.Visible = false;
                DeleteBtn.Visible = false;
            }
            catch (Exception ex)
            {
                MsgLbl.Text = "Error: " + ex.Message;
                MsgLbl.ForeColor = System.Drawing.Color.Red;
            }
        }
        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            try
            {
                int userId = Convert.ToInt32(UsersGV.SelectedDataKey.Value);
                string Query = string.Format("DELETE FROM UserTbl WHERE UId = {0}", userId);

                new Functions().SetData(Query);
                MsgLbl.Text = "Member removed from the Sanctuary.";

                ClearInputs();
                ShowUsers();
                AddBtn.Visible = true;
                UpdateBtn.Visible = false;
                DeleteBtn.Visible = false;
            }
            catch (Exception ex)
            {
                MsgLbl.Text = "Cannot delete: Member might have issued books.";
            }
        }

        // Quick helper to clear textboxes after update
        private void ClearInputs()
        {
            UNameTb.Text = "";
            UEmailTb.Text = "";
            UPhoneTb.Text = "";
            UPassTb.Text = "";
        }
        protected void UsersGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            UNameTb.Text = UsersGV.SelectedRow.Cells[1].Text;
            UEmailTb.Text = UsersGV.SelectedRow.Cells[2].Text;
            UPhoneTb.Text = UsersGV.SelectedRow.Cells[3].Text;

            AddBtn.Visible = false;
            UpdateBtn.Visible = true;
            DeleteBtn.Visible = true;
        }
    }
}