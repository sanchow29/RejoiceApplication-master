using RejoiceApplication.Class;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace RejoiceApplication
{
    /// <summary>
    /// Summary description for GetService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class GetService : System.Web.Services.WebService
    {
        [WebMethod]
        public void GetDoctorList()
        {
            var cs = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            var doctorsList = new List<GetDoctorDetails>();
            using (var con = new SqlConnection(cs))
            {
                var cmd = new SqlCommand("SPGetDoctorDetails", con) {CommandType = CommandType.StoredProcedure};
                con.Open();
                var dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    var doctors = new GetDoctorDetails
                    {
                        UserId = Convert.ToInt32(dr[0].ToString()),
                        UserFirstName = dr[1].ToString(),
                        UserLastName = dr[2].ToString(),
                        UserDepartment = dr[3].ToString(),
                        UserGender = dr[4].ToString(),
                        UserEmailId = dr[5].ToString(),
                        UserPhoneNumber = dr[6].ToString(),
                        UserDob = Convert.ToDateTime(dr[7].ToString())
                    };
                    doctorsList.Add(doctors);
                }
            }

            var js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(doctorsList));
        }

        [WebMethod]
        public void GetMedicinesList()
        {
            var cs = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            var medicinesList = new List<GetMedicinesList>();
            using (var con = new SqlConnection(cs))
            {
                var cmd = new SqlCommand("SPGetMedicineDetails", con) {CommandType = CommandType.StoredProcedure};
                con.Open();
                var dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    var medicines = new GetMedicinesList
                    {
                        MedicineName = dr[0].ToString(),
                        MedicineDescription = dr[1].ToString(),
                        MedicineType = dr[2].ToString(),
                        Quantity = dr[3].ToString(),
                        Manufacture = dr[4].ToString(),
                        Mrp = dr[5].ToString(),
                        DiscountPrice = dr[6].ToString(),
                        ExpiryDate = Convert.ToDateTime(dr[7].ToString())
                    };
                    medicinesList.Add(medicines);
                }
            }

            var js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(medicinesList));
        }

        [WebMethod]
        public void GetInpatientList()
        {
            var cs = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            var inPatientList = new List<GetPatientDetails>();
            using (var con = new SqlConnection(cs))
            {
                var cmd = new SqlCommand("SPGetInpatientDetails", con) {CommandType = CommandType.StoredProcedure};
                con.Open();
                var dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    var inpatient = new GetPatientDetails
                    {
                        PatientID = Convert.ToInt32(dr[0].ToString()),
                        PatientFirstName = dr[1].ToString(),
                        PatientLastName = dr[2].ToString(),
                        PatientDisease = dr[3].ToString(),
                        PatientGender = dr[4].ToString(),
                        PatientEmailId = dr[5].ToString(),
                        PatientPhoneNumber = dr[6].ToString(),
                        PatientDOB = Convert.ToDateTime(dr[7].ToString())
                    };
                    inPatientList.Add(inpatient);
                }
            }

            var js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(inPatientList));
        }

        [WebMethod]
        public void GetOutPatientList()
        {
            var cs = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            var outPatientList = new List<GetPatientDetails>();
            using (var con = new SqlConnection(cs))
            {
                var cmd = new SqlCommand("SPGetOutPatientDetails", con) {CommandType = CommandType.StoredProcedure};
                con.Open();
                var dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    var outpatient = new GetPatientDetails
                    {
                        PatientID = Convert.ToInt32(dr[0].ToString()),
                        PatientFirstName = dr[1].ToString(),
                        PatientLastName = dr[2].ToString(),
                        PatientDisease = dr[3].ToString(),
                        PatientGender = dr[4].ToString(),
                        PatientEmailId = dr[5].ToString(),
                        PatientPhoneNumber = dr[6].ToString(),
                        PatientDOB = Convert.ToDateTime(dr[7].ToString())
                    };
                    outPatientList.Add(outpatient);
                }
            }

            var js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(outPatientList));
        }

        [WebMethod]
        public void GetSupportStaffList()
        {
            var cs = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            var doctorsList = new List<GetDoctorDetails>();
            using (var con = new SqlConnection(cs))
            {
                var cmd = new SqlCommand("SPGetSupportStaffDetails", con) {CommandType = CommandType.StoredProcedure};
                con.Open();
                var dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    var doctors = new GetDoctorDetails
                    {
                        UserId = Convert.ToInt32(dr[0].ToString()),
                        UserFirstName = dr[1].ToString(),
                        UserLastName = dr[2].ToString(),
                        UserDepartment = dr[3].ToString(),
                        UserGender = dr[4].ToString(),
                        UserEmailId = dr[5].ToString(),
                        UserPhoneNumber = dr[6].ToString(),
                        UserDob = Convert.ToDateTime(dr[7].ToString())
                    };
                    doctorsList.Add(doctors);
                }
            }

            var js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(doctorsList));
        }

        [WebMethod]
        public void GetAdminList()
        {
            var cs = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            var doctorsList = new List<GetDoctorDetails>();
            using (var con = new SqlConnection(cs))
            {
                var cmd = new SqlCommand("SPGetAdminDetails", con) {CommandType = CommandType.StoredProcedure};
                con.Open();
                var dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    var doctors = new GetDoctorDetails
                    {
                        UserId = Convert.ToInt32(dr[0].ToString()),
                        UserFirstName = dr[1].ToString(),
                        UserLastName = dr[2].ToString(),
                        UserDepartment = dr[3].ToString(),
                        UserGender = dr[4].ToString(),
                        UserEmailId = dr[5].ToString(),
                        UserPhoneNumber = dr[6].ToString(),
                        UserDob = Convert.ToDateTime(dr[7].ToString())
                    };
                    doctorsList.Add(doctors);
                }
            }

            var js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(doctorsList));
        }

        [WebMethod]
        public void GetNurseList()
        {
            var cs = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            var doctorsList = new List<GetDoctorDetails>();
            using (var con = new SqlConnection(cs))
            {
                var cmd = new SqlCommand("SPGetNurseDetails", con) {CommandType = CommandType.StoredProcedure};
                con.Open();
                var dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    var doctors = new GetDoctorDetails
                    {
                        UserId = Convert.ToInt32(dr[0].ToString()),
                        UserFirstName = dr[1].ToString(),
                        UserLastName = dr[2].ToString(),
                        UserDepartment = dr[3].ToString(),
                        UserGender = dr[4].ToString(),
                        UserEmailId = dr[5].ToString(),
                        UserPhoneNumber = dr[6].ToString(),
                        UserDob = Convert.ToDateTime(dr[7].ToString())
                    };
                    doctorsList.Add(doctors);
                }
            }

            var js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(doctorsList));
        }

        [WebMethod]
        public void GetPharamistList()
        {
            var cs = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            var doctorsList = new List<GetDoctorDetails>();
            using (var con = new SqlConnection(cs))
            {
                var cmd = new SqlCommand("SPGetPharmacistDetails", con) {CommandType = CommandType.StoredProcedure};
                con.Open();
                var dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    var doctors = new GetDoctorDetails
                    {
                        UserId = Convert.ToInt32(dr[0].ToString()),
                        UserFirstName = dr[1].ToString(),
                        UserLastName = dr[2].ToString(),
                        UserDepartment = dr[3].ToString(),
                        UserGender = dr[4].ToString(),
                        UserEmailId = dr[5].ToString(),
                        UserPhoneNumber = dr[6].ToString(),
                        UserDob = Convert.ToDateTime(dr[7].ToString())
                    };
                    doctorsList.Add(doctors);
                }
            }

            var js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(doctorsList));
        }

        [WebMethod]
        public void GetTechnicianList()
        {
            var cs = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            var doctorsList = new List<GetDoctorDetails>();
            using (var con = new SqlConnection(cs))
            {
                var cmd = new SqlCommand("SPGetTechnicianDetails", con) {CommandType = CommandType.StoredProcedure};
                con.Open();
                var dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    var doctors = new GetDoctorDetails
                    {
                        UserId = Convert.ToInt32(dr[0].ToString()),
                        UserFirstName = dr[1].ToString(),
                        UserLastName = dr[2].ToString(),
                        UserDepartment = dr[3].ToString(),
                        UserGender = dr[4].ToString(),
                        UserEmailId = dr[5].ToString(),
                        UserPhoneNumber = dr[6].ToString(),
                        UserDob = Convert.ToDateTime(dr[7].ToString())
                    };
                    doctorsList.Add(doctors);
                }
            }

            var js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(doctorsList));
        }
    }
}