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
    
    public partial class C_Alquiler
    {
        public C_Alquiler()
        {
            this.C_Contratos = new HashSet<C_Contratos>();
        }
    
        public int alq_id_Propiedad { get; set; }
        public string alq_UbicacionExacta { get; set; }
        public string alq_TipoPropiedad { get; set; }
        public string alq_Detalles { get; set; }
        public int Id_Distrito { get; set; }
        public int Id_Canton { get; set; }
        public int Id_Provincia { get; set; }
        public string alq_ImagenURL { get; set; }
        public Nullable<bool> alq_Activo { get; set; }
    
        public virtual C_Canton C_Canton { get; set; }
        public virtual C_Distrito C_Distrito { get; set; }
        public virtual C_Provincia C_Provincia { get; set; }
        public virtual ICollection<C_Contratos> C_Contratos { get; set; }
    }
}
