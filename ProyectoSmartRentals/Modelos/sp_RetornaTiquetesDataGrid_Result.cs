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
    
    public partial class sp_RetornaTiquetesDataGrid_Result
    {
        public int tqt_id { get; set; }
        public string ctr_numeroContrato { get; set; }
        public string tqt_tipo_problema { get; set; }
        public string tqt_titulo { get; set; }
        public string tqt_descripcion { get; set; }
        public string tqt_nota_reparacion { get; set; }
        public string prv_nombrevariable { get; set; }
        public Nullable<System.DateTime> tqt_fecha_inicio { get; set; }
        public Nullable<System.DateTime> tqt_fecha_finalizacion { get; set; }
        public string tqt_estado { get; set; }
        public Nullable<decimal> tqt_precio_reparacion { get; set; }
    }
}