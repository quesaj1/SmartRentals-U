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
    
    public partial class sp_BuscaMisContratos3_Result
    {
        public int id_ctr_contrato { get; set; }
        public string ctr_numeroContrato { get; set; }
        public string nombre { get; set; }
        public System.DateTime ctr_fechainicio { get; set; }
        public string name_admin { get; set; }
        public Nullable<System.DateTime> ctr_fechafinalizacion { get; set; }
        public decimal ctr_monto { get; set; }
        public string ctr_file { get; set; }
        public string alq_ubicacionExacta { get; set; }
        public string alq_ImagenURL { get; set; }
        public int Id_Canton { get; set; }
        public string nombre_canton { get; set; }
        public int Id_Provincia { get; set; }
        public string nombre_provincia { get; set; }
        public int Id_Distrito { get; set; }
        public string nombre_distrito { get; set; }
        public Nullable<System.DateTime> ctr_fechaPago { get; set; }
    }
}
