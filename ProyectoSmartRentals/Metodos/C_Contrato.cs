using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ProyectoSmartRentals.Modelos;
using ProyectoSmartRentals.Interfaces;

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
             decimal ctr_monto, Nullable<bool> ctr_activo,string ctr_file, int fk_alq_id_propiedad)
        {
            try
            {
                int registroAfectados = 0;
                registroAfectados = this.modeloDB.sp_InsertarContrato(fk_cli_cliente, ctr_numeroContrato,
                    ctr_fechainicio, ctr_fechafinalizacion, ctr_monto, ctr_activo, ctr_file, fk_alq_id_propiedad);
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
             decimal ctr_monto, Nullable<bool> ctr_activo, string ctr_file, int fk_alq_id_propiedad)
        {
            try
            {
                int registroAfectados = 0;
                registroAfectados = this.modeloDB.sp_ModificarContrato(id_ctr_contrato, fk_cli_cliente, ctr_numeroContrato,
                    ctr_fechainicio, ctr_fechafinalizacion, ctr_monto, ctr_activo, ctr_file, fk_alq_id_propiedad);

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
        public List<sp_RetornaContrato_Result> RetornarContrato(int id_ctr_contrato,int fk_cli_cliente, string ctr_numeroContrato, bool activo)
        {
            List<sp_RetornaContrato_Result> resultado = new List<sp_RetornaContrato_Result>();
            resultado = this.modeloDB.sp_RetornaContrato(id_ctr_contrato, fk_cli_cliente, ctr_numeroContrato, activo).ToList();
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

        public List<sp_RetornaContratoDataGrid_Result> RetornarContratoDataGrid(bool ctr_activo)
        {
            List<sp_RetornaContratoDataGrid_Result> resultado = new List<sp_RetornaContratoDataGrid_Result>();
            resultado = this.modeloDB.sp_RetornaContratoDataGrid(ctr_activo).ToList();
            return resultado;
        }



        #endregion
    }
}