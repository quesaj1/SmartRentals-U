﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ProyectoSmartRentals.Modelos;
using ProyectoSmartRentals.Interfaces;
using System.Data.Objects;

namespace ProyectoSmartRentals.Metodos
{
    public class C_Contrato : IContrato
    {
        SmartRentalsEntities1 modeloDB = new SmartRentalsEntities1();

        //#region Metodo Eliminar Cliente en la BD
        //public bool EliminalCliente(int cli_Cliente)
        //{
        //    try
        //    {
        //        int registrosAfectados = 0;
        //        registrosAfectados = this.modeloDB.sp_EliminarCliente(cli_Cliente);

        //        if (registrosAfectados > 0)
        //            return true;
        //    }
        //    catch (Exception error)
        //    {
        //        throw error;
        //    }
        //    return false;
        //}
        //#endregion

        #region Metodo Insertar Contrato
        public bool InsertaContrato(int fk_cli_cliente, string ctr_numeroContrato,
             System.DateTime ctr_fechainicio, Nullable<System.DateTime> ctr_fechafinalizacion,
             decimal ctr_monto, Nullable<bool> ctr_activo,string ctr_file, int fk_alq_id_propiedad, int fk_id_admin_rentals,
             Nullable<System.DateTime> v_fechaPago)
        {
            try
            {
                int registroAfectados = 0;
                registroAfectados = this.modeloDB.sp_InsertarContrato(fk_cli_cliente, ctr_numeroContrato,
                    ctr_fechainicio, ctr_fechafinalizacion, ctr_monto, ctr_activo, ctr_file, fk_alq_id_propiedad, fk_id_admin_rentals, v_fechaPago);
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

        #region Metodo Modificar Contrato
        public bool ModificarCliente(int id_ctr_contrato, int fk_cli_cliente, string ctr_numeroContrato,
             System.DateTime ctr_fechainicio, Nullable<System.DateTime> ctr_fechafinalizacion,
             decimal ctr_monto, Nullable<bool> ctr_activo, string ctr_file, int fk_alq_id_propiedad, int fk_id_admin_rentals,
             Nullable<System.DateTime> v_fechaPago)
        {
            try
            {
                int registroAfectados = 0;
                registroAfectados = this.modeloDB.sp_ModificarContrato(id_ctr_contrato, fk_cli_cliente, ctr_numeroContrato,
                    ctr_fechainicio, ctr_fechafinalizacion, ctr_monto, ctr_activo, ctr_file, fk_alq_id_propiedad, fk_id_admin_rentals
                    , v_fechaPago);

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




        #region Metodo Retonar Contrato
        public List<sp_RetornaContrato_Result> RetornarContrato(int id_ctr_contrato,int fk_cli_cliente, string ctr_numeroContrato, bool activo, int fk_id_admin_rentals)
        {
            List<sp_RetornaContrato_Result> resultado = new List<sp_RetornaContrato_Result>();
            resultado = this.modeloDB.sp_RetornaContrato(id_ctr_contrato, fk_cli_cliente, ctr_numeroContrato, activo, fk_id_admin_rentals).ToList();
            return resultado;
        }
        #endregion


        #region Metodo Retornar Contrato ID
        public sp_RetornaContratoID_Result RetornaContratoID(int id_ctr_contrato)
        {
            sp_RetornaContratoID_Result resultado = new sp_RetornaContratoID_Result();

            resultado = modeloDB.sp_RetornaContratoID(id_ctr_contrato).FirstOrDefault();

            return resultado;
        }
        #endregion
        public sp_BuscaMisContratos2_Result BuscaMisContratos2(int v_ctr_numeroContrato)
        {
            sp_BuscaMisContratos2_Result resultado = new sp_BuscaMisContratos2_Result();

            resultado = modeloDB.sp_BuscaMisContratos2(v_ctr_numeroContrato).FirstOrDefault();

            return resultado;
        }
        public List<sp_RetornaContratoDataGrid_Result> RetornarContratoDataGrid(bool ctr_activo, int fk_id_admin_rentals)
        {
            List<sp_RetornaContratoDataGrid_Result> resultado = new List<sp_RetornaContratoDataGrid_Result>();
            resultado = this.modeloDB.sp_RetornaContratoDataGrid(ctr_activo, fk_id_admin_rentals).ToList();
            return resultado;
        }

        public int? retornaCantidadContrato(bool? ctr_activo, int? ctr_cliente)
        {

            return 0;
        }

        public List<sp_BuscaContratoDataGrid_Result> BuscaContratoDataGrid(string ctr_contrato)
        {
            List<sp_BuscaContratoDataGrid_Result> resultado = new List<sp_BuscaContratoDataGrid_Result>();
            resultado = this.modeloDB.sp_BuscaContratoDataGrid(ctr_contrato).ToList();
            return resultado;
        }

        public bool EliminarCliente(int id_ctr_contrato, bool? ctr_activo)
        {

            try
            {
                int registroAfectados = 0;
                registroAfectados = this.modeloDB.sp_EliminarContrato(id_ctr_contrato, ctr_activo);

                if (registroAfectados > 0)
                    return true;
            }
            catch (Exception error)
            {

                throw error;
            }
            return false;
        }

        public List<sp_BuscaMisContratos_Result> BuscaMisContratos(string v_ctr_numeroContrato)
        {
            List<sp_BuscaMisContratos_Result> resultado = new List<sp_BuscaMisContratos_Result>();
            resultado = this.modeloDB.sp_BuscaMisContratos(v_ctr_numeroContrato).ToList();
            return resultado;
        }

        public sp_BuscaMisContratos3_Result BuscaMisContratos3(int v_ctr_numeroContrato)
        {
            sp_BuscaMisContratos3_Result resultado = new sp_BuscaMisContratos3_Result();

            resultado = modeloDB.sp_BuscaMisContratos3(v_ctr_numeroContrato).FirstOrDefault();

            return resultado;
        }

        public sp_RetornaContratoName_Result RetornaContratoName(string nombre_contrato)
        {
            sp_RetornaContratoName_Result resultado = new sp_RetornaContratoName_Result();

            resultado = modeloDB.sp_RetornaContratoName(nombre_contrato).FirstOrDefault();

            return resultado;
        }
    }
}