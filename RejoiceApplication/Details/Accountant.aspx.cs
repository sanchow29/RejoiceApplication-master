using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RejoiceApplication.Details
{
    public partial class Accountant : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                string constr = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT UserFirstName,UserEducation,UserDepartment from userdetails where usertype='Admin'", con))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            cmd.CommandType = CommandType.Text;
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            gvCustomers.DataSource = dt;
                            gvCustomers.DataBind();
                        }
                    }
                    con.Dispose();
                    con.Close();
                }

            }
        }
    }
}