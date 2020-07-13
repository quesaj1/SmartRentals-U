using ProyectoSmartRentals.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProyectoSmartRentals.Interfaces
{
    interface ITiquetes
    {

        #region Método insertar tiquete
        bool InsertaTiquete(
            Nullable<int> v_fk_ctr_contrato, string v_tqt_tipo_problema, Nullable<bool> v_tqt_activo, 
            string v_tqt_descripcion, string v_tqt_nota_reparacion, Nullable<System.DateTime> v_tqt_fecha_inicio,
            Nullable<System.DateTime> v_tqt_fecha_finalizacion, Nullable<int> v_fk_prv_idproveedor, string v_tqt_titulo,
            Nullable<decimal> v_tqt_precio_preparacion, string v_tqt_estado);
        #endregion

        #region Método para obtener la información para el datadrig
        List<sp_RetornaTiquetesDataGrid_Result> RetornarTiqueteDataGrid(
              Nullable<bool> v_tqr_activo, Nullable<int> v_fk_adr_id_admin,
            Nullable<int> v_fk_cli_client, Nullable<int> v_fk_prv_proveedor, string v_tqt_estado);
        #endregion

        #region Método para modificar tiquete
        bool modificaTiquete(Nullable<int> v_tqt_id, Nullable<int> v_id_ctr_contrato, string v_tqt_tipo_problema,
            Nullable<bool> v_tqt_activo, string v_tqt_descripcion, string v_tqt_nota_reparacion, 
            Nullable<System.DateTime> v_tqt_fechainicio, Nullable<System.DateTime> v_tqt_fechafinalizacion,
            Nullable<int> v_fk_prv_idProveedor, string v_tqt_titulo, Nullable<decimal> v_tqt_monto, string v_tqt_estado);
        #endregion

        #region Método para modificar tiquete para un proveedor
        bool ModificaTiqueteProveedor(Nullable<int> v_tqt_id, string v_tqt_nota_reparacion,
            Nullable<System.DateTime> v_tqt_fechafinalizacion,
            Nullable<decimal> v_tqt_monto, string v_tqt_estado);
        #endregion
        #region Método para obtener la info por ID
        sp_RetornaTiqueteID_Result RetornaTiqueteID(int id_tiquete);
        #endregion


        

        #region Método para obtener la info del Reporte de Gastos por Date Picker
        List<sp_RetornaGastosCalend_Result> RetornarGastosCalend(DateTime fecha_Inicio, DateTime fecha_Final);
        #endregion

        #region Método para obtener la info del Reporte de Gastos por Categoria
        List<sp_RetornaGastosCat_Result> RetornarGastosCat(string tqt_tipo_problema);
        #endregion

        #region Método para obtener la información para el reporte de los tiquetes
        List<sp_RetornaReporteAdmin_Result> RetornarReporteTiquetes(
            Nullable<int> v_fk_adr_id_admin, Nullable<int> v_fk_ctr_cliente, Nullable<int> v_fk_prv_proveedor,
            string v_estado, Nullable<System.DateTime> v_fecha_inicio1, Nullable<System.DateTime> v_fecha_inicio2,
            Nullable<System.DateTime> v_fecha_finalizacion1, Nullable<System.DateTime> v_fecha_finalizacion2,
            Nullable<int> v_ctr_contrato);
        #endregion

    }
}
