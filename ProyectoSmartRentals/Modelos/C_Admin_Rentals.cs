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
    
    public partial class C_Admin_Rentals
    {
        public C_Admin_Rentals()
        {
            this.C_Contratos = new HashSet<C_Contratos>();
        }
    
        public int adr_id_admin { get; set; }
        public string adr_Cedula { get; set; }
        public string adr_Nombre { get; set; }
        public string adr_SegundoNombre { get; set; }
        public string adr_PrimerApellido { get; set; }
        public string adr_SegundoApellido { get; set; }
        public Nullable<System.DateTime> adr_FechaNacimiento { get; set; }
        public string adr_TelefonoCasa { get; set; }
        public string adr_TelefonoCelular { get; set; }
        public string adr_Email { get; set; }
    
        public virtual ICollection<C_Contratos> C_Contratos { get; set; }
    }
}
