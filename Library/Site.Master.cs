using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Nook
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Get the name of the current page
            string currentPage = System.IO.Path.GetFileName(Request.Url.AbsolutePath);

            // Hide sidebar if we are on Login or Register
            if (currentPage == "Login.aspx" || currentPage == "Register.aspx")
            {
                SidebarPanel.Visible = false; // Wrap your sidebar div in an asp:Panel ID="SidebarPanel"
                MainContentDiv.Style["margin-left"] = "0"; // Remove the gap for the sidebar
            }
            else
            {
                SidebarPanel.Visible = true;
                MainContentDiv.Style["margin-left"] = "260px";
            }
        }
    }
}