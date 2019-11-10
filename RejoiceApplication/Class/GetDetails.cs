using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RejoiceApplication.Class
{
    public class GetDoctorDetails
    {
        public int UserID { get; set; }
        public string UserFirstName { get; set; }
        public string UserLastName { get; set; }
        public string UserDepartment { get; set; }
        public string UserGender { get; set; }
        public string UserEmailId { get; set; }
        public string UserPhoneNumber { get; set; }
        public DateTime UserDOB { get; set; }
    }
}