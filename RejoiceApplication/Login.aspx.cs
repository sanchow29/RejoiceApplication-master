﻿using System;
using System.IO;
using System.Web.UI;
using MySql.Data.MySqlClient;
using System.Data;

namespace RejoiceApplication
{
    public partial class Login : Page
    {
        private string MyConnection2 =
            "server = localhost; user id = sa; database = Rejoice;password=AclIndia@080419";

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
                    var Query = "select * from UsersList ;";
                    var MyConn2 = new MySqlConnection(MyConnection2);
                    var MyCommand2 = new MySqlCommand(Query, MyConn2);
                    MyConn2.Open();
                    var MyAdapter = new MySqlDataAdapter();
                    MyAdapter.SelectCommand = MyCommand2;
                    var dTable = new DataTable();
                    MyAdapter.Fill(dTable);
                    if (dTable.Rows.Count > 0)
                        //Session["CurrentUser"] = Login1.UserName;
                        //foreach (DataRow row in dTable.Rows)
                        //{
                        //    Session["FName"] = row["FName"].ToString();
                        //    Session["LName"] = row["LName"].ToString();
                        //    Session["Email"] = row["Email_ID"].ToString();
                        //    Session["UserID"] = row["UserID"].ToString();
                        //    Session["PHNO"] = row["Phone_Number"].ToString();
                        //    Session["Role"] = row["Role"].ToString();
                        //    Session["EmailLimit"] = row["EmailLimit"].ToString();
                        //    Session["Status"] = row["Status"].ToString();

                        //}
                        Response.Redirect("~/Default.aspx");
                    else
                        //  ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertLogin", "alert('Unable to login , Please try again')", true);
                        return;

                    MyConn2.Close();
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