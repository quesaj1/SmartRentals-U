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
    
    public partial class sp_RetornaReportePagos_Result
    {
        public int rpp_IDReportarPago { get; set; }
        public string ctr_numeroContrato { get; set; }
        public string cli_Email { get; set; }
        public string datosCliente { get; set; }
        public Nullable<System.DateTime> ctr_fechaPago { get; set; }
        public decimal ctr_monto { get; set; }
        public Nullable<System.DateTime> rpp_FechaPagoRecibido { get; set; }
        public Nullable<bool> rpp_estadoDePago { get; set; }
        public string rpp_DetallesDePago { get; set; }
    }
}
