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
    
    public partial class sp_RetornaContratoDataGridMod_Result
    {
        public int id_ctr_contrato { get; set; }
        public string ctr_numeroContrato { get; set; }
        public string nombre { get; set; }
        public System.DateTime ctr_fechainicio { get; set; }
        public Nullable<System.DateTime> ctr_fechafinalizacion { get; set; }
        public decimal ctr_monto { get; set; }
        public string ctr_file { get; set; }
        public string alq_ubicacionExacta { get; set; }
        public Nullable<System.DateTime> ctr_fechapago { get; set; }
    }
}