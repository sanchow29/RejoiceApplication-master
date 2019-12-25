using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RejoiceApplication.Class
{
    public class GetDoctorDetails
    {
        public int UserId { get; set; }
        public string UserFirstName { get; set; }
        public string UserLastName { get; set; }
        public string UserDepartment { get; set; }
        public string UserGender { get; set; }
        public string UserEmailId { get; set; }
        public string UserPhoneNumber { get; set; }
        public DateTime UserDob { get; set; }
    }

    public class GetMedicinesList
    {
        public string MedicineName { get; set; }
        public string MedicineDescription { get; set; }
        public string MedicineType { get; set; }
        public string Quantity { get; set; }
        public string Code { get; set; }
        public string BatchNumber { get; set; }
        public string Manufacture { get; set; }
        public DateTime ExpiryDate { get; set; }
        public string Composition { get; set; }
        public string Dosage { get; set; }
        public string DiscountPrice { get; set; }
        public string Mrp { get; set; }
    }

    public class GetPatientDetails
    {
        public int PatientID { get; set; }
        public string PatientFirstName { get; set; }
        public string PatientLastName { get; set; }
        public string PatientDisease { get; set; }
        public string PatientGender { get; set; }
        public string PatientEmailId { get; set; }
        public string PatientPhoneNumber { get; set; }
        public DateTime PatientDOB { get; set; }
    }
}