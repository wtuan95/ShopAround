//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ShopAround.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class HopThu
    {
        public int HopThuID { get; set; }
        public string HoTen { get; set; }
        public string DiaChi { get; set; }
        public string Email { get; set; }
        public string NoiDung { get; set; }
        public System.DateTime NgayGui { get; set; }
        public bool DaXacNhan { get; set; }
        public string tkThanhVien { get; set; }
    
        public virtual QuanTri QuanTri { get; set; }
    }
}
