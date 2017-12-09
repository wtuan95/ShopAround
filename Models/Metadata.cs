using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace ShopAround.Models
{
    [MetadataType(typeof(HopThuMetadata))]
    public partial class HopThu 
    {
    }
    sealed class HopThuMetadata
    {
        [Display(Name = "ID")]
        public int HopThuID { get; set; }
        [Display(Name = "Họ tên")]
        [Required]
        [StringLength(200)]
        public string HoTen { get; set; }
        [Display(Name = "Địa chỉ")]
        [Required]
        public string DiaChi { get; set; }
        [Display(Name = "Email")]
        [Required]
        [EmailAddress]
        public string Email { get; set; }
        [Display(Name = "Nội dung")]
        [Required]
        public string NoiDung { get; set; }
        [Display(Name = "Ngày gửi")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        public System.DateTime NgayGui { get; set; }
    }
}