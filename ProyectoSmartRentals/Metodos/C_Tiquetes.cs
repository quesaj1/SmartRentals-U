﻿using ProyectoSmartRentals.Interfaces;
using ProyectoSmartRentals.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoSmartRentals.Metodos
{
    public class C_Tiquetes : ITiquetes
    {

        SmartRentalsEntities1 modeloDB = new SmartRentalsEntities1();

        #region Método insertar tiquete
        public bool InsertaTiquete(int? v_fk_ctr_contrato, string v_tqt_tipo_problema, bool? v_tqt_activo, string v_tqt_descripcion,
            string v_tqt_nota_reparacion, DateTime? v_tqt_fecha_inicio, DateTime? v_tqt_fecha_finalizacion, int? v_fk_prv_idproveedor,
            string v_tqt_titulo, decimal? v_tqt_precio_preparacion, string v_tqt_estado)
        {
            try
            {
                int registroAfectados = 0;
                registroAfectados = this.modeloDB.sp_InsertarTiquete(v_fk_ctr_contrato, v_tqt_tipo_problema, v_tqt_activo, v_tqt_descripcion,
                    v_tqt_nota_reparacion, v_tqt_fecha_inicio, v_tqt_fecha_finalizacion, v_fk_prv_idproveedor, v_tqt_titulo,
                    v_tqt_precio_preparacion, v_tqt_estado);
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

        #region Método para modificar un tiquete
        public bool modificaTiquete(int? v_tqt_id, int? v_id_ctr_contrato, string v_tqt_tipo_problema, bool? v_tqt_activo,
            string v_tqt_descripcion, string v_tqt_nota_reparacion, DateTime? v_tqt_fechainicio,
            DateTime? v_tqt_fechafinalizacion, int? v_fk_prv_idProveedor, 
            string v_tqt_titulo, decimal? v_tqt_monto, string v_tqt_estado)
        {
            try
            {
                int registroAfectados = 0;
                registroAfectados = this.modeloDB.sp_ModificarTiquete(v_tqt_id, v_id_ctr_contrato, v_tqt_tipo_problema,
                    v_tqt_activo, v_tqt_descripcion, v_tqt_nota_reparacion, v_tqt_fechainicio, v_tqt_fechafinalizacion,
                    v_fk_prv_idProveedor, v_tqt_titulo, v_tqt_monto, v_tqt_estado);

                if (registroAfectados > 0)
                    return true;
            }
            catch (Exception error)
            {

                throw error;
            }
            return false;
        }

        #region Método para asignar un tiquete
        public bool asignaTiquete(int? v_tqt_id, int? v_id_proveedor)
        {
            try
            {
                int registroAfectados = 0;
             registroAfectados = this.modeloDB.sp_AsignaTiqueteProveedor(v_tqt_id, v_id_proveedor);

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

        public bool ModificaTiqueteProveedor(int? v_tqt_id, string v_tqt_nota_reparacion, DateTime? v_tqt_fechafinalizacion, decimal? v_tqt_monto, string v_tqt_estado)
        {

            try
            {
                int registroAfectados = 0;
                registroAfectados = this.modeloDB.sp_ModificarTiquetexProveedor(v_tqt_id, v_tqt_nota_reparacion, v_tqt_fechafinalizacion,
                   v_tqt_monto, v_tqt_estado);

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

        #region Método para obtener la información para el datadrig
        public List<sp_RetornaTiquetesDataGrid_Result> RetornarTiqueteDataGrid(bool? v_tqr_activo, int? v_fk_adr_id_admin, 
            int? v_fk_cli_client, int? v_fk_prv_proveedor, string v_tqt_estado)
        {
            List<sp_RetornaTiquetesDataGrid_Result> resultado = new List<sp_RetornaTiquetesDataGrid_Result>();
            resultado = this.modeloDB.sp_RetornaTiquetesDataGrid(v_tqr_activo, v_fk_adr_id_admin, v_fk_cli_client,
                v_fk_prv_proveedor, v_tqt_estado).ToList();
            return resultado;
        }
        #endregion

        #region Método para obtener la información de tiquete

        public sp_RetornaTiqueteID_Result RetornaTiqueteID(int id_tiquete)
        {
            sp_RetornaTiqueteID_Result resultado = new sp_RetornaTiqueteID_Result();

            resultado = modeloDB.sp_RetornaTiqueteID(id_tiquete).FirstOrDefault();

            return resultado;
        }

        #endregion


        public List<sp_RetornaGastosCalend_Result>RetornarGastosCalend(DateTime fecha_Inicio, DateTime fecha_Final)
        {
            List<sp_RetornaGastosCalend_Result>resultado = new List<sp_RetornaGastosCalend_Result>();
            resultado = this.modeloDB.sp_RetornaGastosCalend(fecha_Inicio, fecha_Final).ToList();
            return resultado;
        }

        public List<sp_RetornaGastosCat_Result> RetornarGastosCat(string tqt_tipo_problema)
        {
            List<sp_RetornaGastosCat_Result> resultado = new List<sp_RetornaGastosCat_Result>();
            resultado = this.modeloDB.sp_RetornaGastosCat(tqt_tipo_problema).ToList();
            return resultado;
        }

        public List<sp_RetornaReporteAdmin_Result> RetornarReporteTiquetes(int? v_fk_adr_id_admin, int? v_fk_ctr_cliente, 
            int? v_fk_prv_proveedor, string v_estado, DateTime? v_fecha_inicio1, DateTime? v_fecha_inicio2, 
            DateTime? v_fecha_finalizacion1, DateTime? v_fecha_finalizacion2, int? v_ctr_contrato)
        {
            List<sp_RetornaReporteAdmin_Result> resultado = new List<sp_RetornaReporteAdmin_Result>();
            resultado = this.modeloDB.sp_RetornaReporteAdmin(v_fk_adr_id_admin,v_fk_ctr_cliente,v_fk_prv_proveedor,
            v_estado,v_fecha_inicio1,v_fecha_inicio2,v_fecha_finalizacion1, v_fecha_finalizacion2,v_ctr_contrato).ToList();
            return resultado;
        }

        public List<sp_RetornaTotalGastosTiquetes1_Result> RetornaGastosTiquetes1(int id_contrato, float montorep, string numcont, int tottiq)
        {
            List<sp_RetornaTotalGastosTiquetes1_Result> resultado = new List<sp_RetornaTotalGastosTiquetes1_Result>();
            resultado = this.modeloDB.sp_RetornaTotalGastosTiquetes1(id_contrato,0,"",0).ToList();
            return resultado;
        }

        public List<sp_RetornaGananciasPerdidas1_Result> RetornaGananciasPerdidas1(int id_contrato, float montorep, float montopagos, string numcont, float montomens, float balance, string res, int tottiq)
        {
            List<sp_RetornaGananciasPerdidas1_Result> resultado = new List<sp_RetornaGananciasPerdidas1_Result>();
            resultado = this.modeloDB.sp_RetornaGananciasPerdidas1(id_contrato, 0, 0, "",0,0,"",0).ToList();
            return resultado;
        }
    }
}