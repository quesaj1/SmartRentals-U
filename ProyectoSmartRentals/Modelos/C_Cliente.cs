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
    
    public partial class C_Cliente
    {
        public C_Cliente()
        {
            this.C_Contratos = new HashSet<C_Contratos>();
        }
    
        public int cli_Cliente { get; set; }
        public string cli_Cedula { get; set; }
        public string cli_Nombre { get; set; }
        public string cli_SegundoNombre { get; set; }
        public string cli_PrimerApelido { get; set; }
        public string cli_SegundoApellido { get; set; }
        public Nullable<System.DateTime> cli_FechaNacimiento { get; set; }
        public string cli_TelefonoCasa { get; set; }
        public string cli_TelefonoCelular { get; set; }
        public string cli_Email { get; set; }
        public Nullable<bool> alq_Activo { get; set; }
    
        public virtual ICollection<C_Contratos> C_Contratos { get; set; }
    }
}
