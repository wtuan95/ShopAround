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
    
    public partial class DatHang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DatHang()
        {
            this.ChiTietDatHangs = new HashSet<ChiTietDatHang>();
        }
    
        public int DatHangID { get; set; }
        public string HoDem { get; set; }
        public string Ten { get; set; }
        public string Email { get; set; }
        public string SDT { get; set; }
        public string DiaChi { get; set; }
        public bool GioiTinh { get; set; }
        public byte TongSoLuong { get; set; }
        public int TongThanhTien { get; set; }
        public System.DateTime NgayDatHang { get; set; }
        public bool TrangThai { get; set; }
        public string xacNhanBoi { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietDatHang> ChiTietDatHangs { get; set; }
        public virtual QuanTri QuanTri { get; set; }
    }
}
