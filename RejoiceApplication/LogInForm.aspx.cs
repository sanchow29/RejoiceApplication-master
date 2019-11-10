using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace RejoiceApplication
{
    public partial class LogInForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void LoginButton_Click(object sender, EventArgs e)
        {
            var userName = UserName.Text;
            var password = Password.Text;

            if (!string.IsNullOrEmpty(userName) && !string.IsNullOrEmpty(password))
                try
                {
                    var connectionString =
                        ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
                    SqlConnection con = new SqlConnection();
                    con.ConnectionString = connectionString;
                   // SqlCommand scmd = new SqlCommand("select count (*) as cnt from login_database where username=@usr and password=@pwd", scn);
                    SqlCommand cmd = new SqlCommand("select count (*) as cnt from UsersList ", con);

                    // scmd.Parameters.Clear();
                    // scmd.Parameters.AddWithValue("@usr", txt_UserName.Text);
                    // scmd.Parameters.AddWithValue("@pwd", txt_PWD.Text);
                  //  con.Open();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    con.Open();
                    int i = cmd.ExecuteNonQuery();
                  
                    if (dt.Rows.Count > 0)
                    {
                       Response.Redirect("Default.aspx",false);
                    }
                    else
                    {
                       // Label1.Text = "Your username and word is incorrect";
                      //  Label1.ForeColor = System.Drawing.Color.Red;

                    }
                    con.Close();

                }
                catch (Exception ex)
                {
                    var filePath = Server.MapPath("~/testfolder/Logs/") + "\\" + "Catch.txt";

                    using (var writer = new StreamWriter(filePath, true))
                    {
                        writer.WriteLine(
                            "-----------------------------------------------------------------------------");
                        writer.WriteLine("Date : " + DateTime.Now.ToString());
                        writer.WriteLine();

                        while (ex != null)
                        {
                            writer.WriteLine(ex.GetType().FullName);
                            writer.WriteLine("Message : " + ex.Message);
                            writer.WriteLine("StackTrace : " + ex.StackTrace);

                            ex = ex.InnerException;
                        }
                    }

                    //   ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertLogin", "alert('Unable to login , Please try again')", true);
                    return;
                }
            else
                // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertLogin", "alert('Please enter username and password to proceed')", true);
                return;
        }
    }
}