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
    
    public partial class ChiTietDatHang
    {
        public int DatHangID { get; set; }
        public int MaSanPham { get; set; }
        public int SoLuong { get; set; }
        public int DonGia { get; set; }
        public int ThanhTien { get; set; }
    
        public virtual DatHang DatHang { get; set; }
        public virtual SanPham SanPham { get; set; }
    }
}
