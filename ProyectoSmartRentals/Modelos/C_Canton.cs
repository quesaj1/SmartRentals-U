//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProyectoSmartRentals.Modelos
{
    using System;
    using System.Collections.Generic;
    
    public partial class C_Canton
    {
        public C_Canton()
        {
            this.C_Alquiler = new HashSet<C_Alquiler>();
            this.C_Distrito = new HashSet<C_Distrito>();
            this.C_Proveedor = new HashSet<C_Proveedor>();
        }
    
        public int Id_Canton { get; set; }
        public string Nombre { get; set; }
        public int Id_Provincia { get; set; }
    
        public virtual ICollection<C_Alquiler> C_Alquiler { get; set; }
        public virtual C_Provincia C_Provincia { get; set; }
        public virtual ICollection<C_Distrito> C_Distrito { get; set; }
        public virtual ICollection<C_Proveedor> C_Proveedor { get; set; }
    }
}
