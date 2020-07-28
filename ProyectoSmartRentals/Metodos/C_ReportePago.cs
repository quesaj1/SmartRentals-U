using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ProyectoSmartRentals.Modelos;
using ProyectoSmartRentals.Interfaces;

namespace ProyectoSmartRentals.Metodos
{
    public class C_ReportePago : I_ReportarPago
    {

        SmartRentalsEntities1 modeloDB = new SmartRentalsEntities1();

        #region Metodo Insertar Reportar Pago del Cliente
        public bool InsertarPago(int fk_cli_cliente, int fk_ctr_IDContrato, Nullable<System.DateTime> rpp_FechaPagoRecibido, Nullable<bool> rpp_estadoDePago, string rpp_DetallesDePago)
        {
            try
            {
                int registroAfectados = 0;
                registroAfectados = this.modeloDB.sp_InsertarReportePago(fk_cli_cliente, fk_ctr_IDContrato,rpp_FechaPagoRecibido, rpp_estadoDePago, rpp_DetallesDePago);
                if (registroAfectados > 0)
                    return true;
            }
            catch (Exception error)
            {

                throw error;
            }
            return false;
        }
        #endregion

        #region Metodo Modificar Reportar Pago del Cliente
        public bool ModificarReportePago(int rpp_IDReportarPago, int fk_cli_cliente, int fk_ctr_IDContrato, DateTime? rpp_FechaPagoRecibido, bool? rpp_estadoDePago, string rpp_DetallesDePago)
        {
            try
            {
                int registroAfectados = 0;
                registroAfectados = this.modeloDB.sp_ModificarReportePago(rpp_IDReportarPago, fk_cli_cliente, fk_ctr_IDContrato, rpp_FechaPagoRecibido, rpp_estadoDePago, rpp_DetallesDePago);

                if (registroAfectados > 0)
                    return true;
            }
            catch (Exception error)
            {

                throw error;
            }
            return false;
        }
        #endregion

        #region Metodo RetornaPagoID Reportar Pago del Cliente
        public sp_RetornaPagoID_Result RetornaPagoID(int rpp_IDReportarPago)
        {
            sp_RetornaPagoID_Result resultado = new sp_RetornaPagoID_Result();

            resultado = modeloDB.sp_RetornaPagoID(rpp_IDReportarPago).FirstOrDefault();

            return resultado;
        }
        #endregion

        #region Metodo PagosRealizadosDataGrid Reportar Pago del Cliente
        public List<sp_RetornaPagosRealizadosDataGrid_Result> RetornaPagosRealizadosDataGrid(bool rpp_estadoDePago)
        {
            List<sp_RetornaPagosRealizadosDataGrid_Result> resultado = new List<sp_RetornaPagosRealizadosDataGrid_Result>();
            resultado = this.modeloDB.sp_RetornaPagosRealizadosDataGrid(rpp_estadoDePago).ToList();
            return resultado;
        }
        #endregion

        #region Metodo RetornarReportarPago Reportar Pago del Cliente
        public List<sp_RetornaReportarPago_Result> RetornarReportarPago(int rpp_IDReportarPago, int fk_cli_cliente, int fk_ctr_IDContrato, DateTime? rpp_FechaPagoRecibido, bool rpp_estadoDePago, string rpp_DetallesDePago)
        {
            List<sp_RetornaReportarPago_Result> resultado = new List<sp_RetornaReportarPago_Result>();
            resultado = this.modeloDB.sp_RetornaReportarPago(rpp_IDReportarPago, fk_cli_cliente, fk_ctr_IDContrato, rpp_FechaPagoRecibido, rpp_estadoDePago, rpp_DetallesDePago).ToList();
            return resultado;
        }


        #endregion



        public List<sp_RetornaReportePagos_Result> sp_RetornaReportePagos(int? v_rpp_IDReportarPago, 
            int? v_fk_ctr_cliente, int? v_fk_ctr_IDContrato, 
            string v_estado, DateTime? v_fecha_Pagoinicio1, 
            DateTime? v_fecha_Pagoinicio2, DateTime? v_fecha_Pagofinalizacion1, 
            DateTime? v_fecha_Pagofinalizacion2, string v_rpp_DetallesDePago, 
            int? v_ctr_contrato)
        {
            List<sp_RetornaReportePagos_Result> resultado = new List<sp_RetornaReportePagos_Result>();
            resultado = this.modeloDB.sp_RetornaReportePagos(v_rpp_IDReportarPago, v_fk_ctr_cliente, v_fk_ctr_IDContrato,
            v_estado, v_fecha_Pagoinicio1, v_fecha_Pagoinicio2, v_fecha_Pagofinalizacion1, v_fecha_Pagofinalizacion2, v_rpp_DetallesDePago, v_ctr_contrato).ToList();
            return resultado;
        }



    }
}