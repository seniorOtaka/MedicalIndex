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
    
    public partial class Neighborhood
    {
        public Neighborhood()
        {
            this.Locations = new HashSet<Location>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
    
        public virtual ICollection<Location> Locations { get; set; }
        public virtual City City { get; set; }
    }
}