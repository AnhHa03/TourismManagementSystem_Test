//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TourismManagementSystem.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class THONGTINTHANHTOAN
    {
        public string MATT { get; set; }
        public string MAPHIEU { get; set; }
        public Nullable<int> SOTIEN { get; set; }
        public Nullable<System.DateTime> THOIGIAN { get; set; }
        public string TRANGTHAI { get; set; }
        public string PHUONGTHUC { get; set; }
    
        public virtual PHIEUDATCHO PHIEUDATCHO { get; set; }
    }
}
