//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MedicalIndex.Entities
{
    using System;
    using System.Collections.Generic;
    
    public partial class Laboratory : Facility
    {
        public Laboratory()
        {
            this.LabModalities = new HashSet<LabModalities>();
        }
    
    
        public virtual ICollection<LabModalities> LabModalities { get; set; }
    }
}