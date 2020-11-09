using System;
using System.Collections.Generic;
using System.Data.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProyectoSmartRentals.Modelos;

namespace ProyectoSmartRentals.Interfaces
{
   public interface IContrato
    {

        //Este metodo Se declara las variables conforme al Store Procedure de la Base datos para realizar el insert

        #region Metodo Insertar Contrato
        bool InsertaContrato(
        
             int fk_cli_cliente,
             string ctr_numeroContrato,
             System.DateTime ctr_fechainicio,
             Nullable<System.DateTime> ctr_fechafinalizacion,
             decimal ctr_monto,
             Nullable<bool> ctr_activo,
             string ctr_file,
             int fk_alq_id_propiedad,
             int fk_id_admin_rentals,
             Nullable<System.DateTime> v_fechaPago);
        #endregion

        #region Metodo Modificar Contrato
        bool ModificarCliente(
             int id_ctr_contrato,
             int fk_cli_cliente,
             string ctr_numeroContrato,
             System.DateTime ctr_fechainicio,
             Nullable<System.DateTime> ctr_fechafinalizacion,
             decimal ctr_monto,
             Nullable<bool> ctr_activo,
             string ctr_file,
             int fk_alq_id_propiedad,
             int fk_id_admin_rentals,
             Nullable<System.DateTime> v_fechaPago);
        #endregion

        #region Metodo Modificar Contrato
        bool EliminarCliente(
             int id_ctr_contrato,
             Nullable<bool> ctr_activo
             );
        #endregion
        //#region Metodo Eliminar Cliente
        //bool EliminalCliente(int cli_Cliente);
        //#endregion


        #region Metodo  Retornar Contrato
        List<sp_RetornaContrato_Result> RetornarContrato(
             int id_ctr_contrato,
             int fk_cli_cliente,
             string ctr_numeroContrato,
             bool ctr_activo,
             int fk_id_admin_rentals);
        #endregion

        #region Metodo  Retornar ID Contrato
        sp_RetornaContratoID_Result RetornaContratoID(int id_contrato);
        #endregion

        #region Metodo  Retornar contrato por nombre
        sp_RetornaContratoName_Result RetornaContratoName(string nombre_contrato);
        #endregion

        sp_BuscaMisContratos2_Result BuscaMisContratos2(int v_ctr_numeroContrato);

        sp_BuscaMisContratos3_Result BuscaMisContratos3(int v_ctr_numeroContrato);

        #region Metodo  Retornar Contrato
        List<sp_RetornaContratoDataGrid_Result> RetornarContratoDataGrid(
             bool ctr_activo, int fk_id_admin_rentals);
        #endregion


        Nullable<int> retornaCantidadContrato(Nullable<bool> ctr_activo, Nullable<int> ctr_cliente);


         List<sp_BuscaContratoDataGrid_Result> BuscaContratoDataGrid(string ctr_contrato);

        //Busca la información para mis contratos
        List<sp_BuscaMisContratos_Result> BuscaMisContratos(string v_ctr_numeroContrato);

        //Busca la información para mis contratos
        

    }
}
