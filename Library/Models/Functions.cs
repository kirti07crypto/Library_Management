using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace Book_Store.Models
{
    public class Functions
    {
        private SqlConnection Con;
        private SqlCommand Cmd;
        private DataTable dt;
        // The Master Key: No physical paths, just the DB name
        private string ConnString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=NookDB;Integrated Security=True;TrustServerCertificate=True";

        public Functions()
        {
            Con = new SqlConnection(ConnString);
            Cmd = new SqlCommand();
            Cmd.Connection = Con;
        }

        public DataTable GetData(string Query)
        {
            DataTable dt = new DataTable();
            using (SqlConnection Con = new SqlConnection(ConnString)) // Use 'using' to auto-close
            {
                try
                {
                    SqlDataAdapter sda = new SqlDataAdapter(Query, Con);
                    sda.Fill(dt); // This is where the crash happens
                }
                catch (Exception ex)
                {
                    // This will show you the REAL error in the Debugger
                    throw ex;
                }
            }
            return dt;
        }

        public int SetData(string Query)
        {
            int cnt = 0;
            if (Con.State == ConnectionState.Closed)
            {
                Con.Open();
            }
            Cmd.CommandText = Query;
            cnt = Cmd.ExecuteNonQuery();
            Con.Close();
            return cnt;
        }
      

}
}