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
    
    public partial class Facility
    {
        public Facility()
        {
            this.Phones = new HashSet<Phone>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Website { get; set; }
    
        public virtual Location Location { get; set; }
        public virtual ICollection<Phone> Phones { get; set; }
        public virtual FacilityTypeEnum FacilityTypeEnum { get; set; }
    }
}