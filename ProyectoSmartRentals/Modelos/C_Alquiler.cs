//------------------------------------------------------------------------------
// <auto-generated>
//    Este código se generó a partir de una plantilla.
//
//    Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//    Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProyectoSmartRentals.Modelos
{
    using System;
    using System.Collections.Generic;
    
    public partial class C_Alquiler
    {
        public int alq_id_Propiedad { get; set; }
        public string alq_UbicacionExacta { get; set; }
        public string alq_TipoPropiedad { get; set; }
        public string alq_Detalles { get; set; }
        public int Id_Distrito { get; set; }
        public int Id_Canton { get; set; }
        public int Id_Provincia { get; set; }
        public string alq_ImagenURL { get; set; }
    
        public virtual C_Canton C_Canton { get; set; }
        public virtual C_Distrito C_Distrito { get; set; }
        public virtual C_Provincia C_Provincia { get; set; }
    }
}
