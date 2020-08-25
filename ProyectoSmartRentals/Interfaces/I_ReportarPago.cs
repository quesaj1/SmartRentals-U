using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProyectoSmartRentals.Modelos;

namespace ProyectoSmartRentals.Interfaces
{
   public interface I_ReportarPago
    {

        #region Metodo Insertar Reporte de Pago
        bool InsertarPago(
             int fk_cli_cliente,
             int fk_ctr_IDContrato,
             Nullable<System.DateTime> rpp_FechaPagoRecibido,
             Nullable<bool> rpp_estadoDePago,
             string rpp_DetallesDePago);
        #endregion


        #region Metodo Modificar Reporte de Pagos
        bool ModificarReportePago(
             int rpp_IDReportarPago,
             int fk_cli_cliente,
             int fk_ctr_IDContrato,
             Nullable<System.DateTime> rpp_FechaPagoRecibido,
             Nullable<bool> rpp_estadoDePago,
             string rpp_DetallesDePago);
        #endregion


        #region Metodo  Retornar Reportar Pago
        List<sp_RetornaReportarPago_Result> RetornarReportarPago(
             int rpp_IDReportarPago,
             int fk_cli_cliente,
             int fk_ctr_IDContrato,
             Nullable<System.DateTime> rpp_FechaPagoRecibido,
             bool rpp_estadoDePago,
             string rpp_DetallesDePago);
        #endregion

        #region Metodo  Retornar ID Reportar Pago
        sp_RetornaPagoID_Result RetornaPagoID(int rpp_IDReportarPago);
        #endregion


        #region Metodo  Retornar Reportar Pago DataGrid
        List<sp_RetornaPagosRealizadosDataGrid_Result> RetornaPagosRealizadosDataGrid(bool rpp_estadoDePago, Nullable<int> v_fk_adr_id_admin);
        #endregion


        #region Método para obtener la información para el reporte de los pagos
        List<sp_RetornaReportePagos_Result> sp_RetornaReportePagos(
            Nullable<int> v_rpp_IDReportarPago, Nullable<int> v_fk_ctr_cliente, Nullable<int> v_fk_ctr_IDContrato,
            string v_estado, Nullable<System.DateTime> v_fecha_Pagoinicio1, Nullable<System.DateTime> v_fecha_Pagoinicio2,
            Nullable<System.DateTime> v_fecha_Pagofinalizacion1, Nullable<System.DateTime> v_fecha_Pagofinalizacion2, string v_rpp_DetallesDePago,
            Nullable<int> v_ctr_contrato);
        #endregion

        #region Método Archivar Pagos

        bool ArchivarPago(int rpp_IDReportarPago, Nullable<bool> rpp_estadoDePago);



        #endregion

        #region Metodo  Retornar Reportar Balance
        List<sp_RetornaTotalPagosReporte1_Result> RetornaTotalPagosReporte1(
             int id_contrato,
             float montomensual,
             string numcontrato);
        #endregion

    }
}
