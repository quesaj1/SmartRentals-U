using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProyectoSmartRentals.Modelos;

namespace ProyectoSmartRentals.Interfaces
{
    public interface I_Proveedor
    {


        #region Metodo Insertar Proveedor
        bool InsertaProveedor(
             string prv_NombreVariable,
             string prv_NombreRepresentante,
             string prv_PrimerApellido,
             string prv_SegundoApellido,
             string prv_CedulaRepresentante,
             string prv_CedulaJuridica,
             string prv_Telefono,
             string prv_Email,
             string prv_TipoProveedor,
             int Id_Distrito,
             int Id_Canton,
             int Id_Provincia,
             string prv_OtrasSenas,
             Nullable<bool> prv_Activo);
        #endregion

        #region Metodo Modificar Proveedor
        bool ModificarProveedor(
            int prv_IDProveedor,
            string prv_NombreVariable,
            string prv_NombreRepresentante,
            string prv_PrimerApellido,
            string prv_SegundoApellido,
            string prv_CedulaRepresentante,
            string prv_CedulaJuridica,
            string prv_Telefono,
            string prv_Email,
            string prv_TipoProveedor,
            int Id_Distrito,
            int Id_Canton,
            int Id_Provincia,
            string prv_OtrasSenas,
             Nullable<bool> prv_Activo);
        #endregion

        #region Metodo Modificar-Eliminar
        bool ModificarEliminaProveedor(
            int prv_IDProveedor,
            string prv_NombreVariable,
            string prv_NombreRepresentante,
            string prv_PrimerApellido,
            string prv_SegundoApellido,
            string prv_CedulaRepresentante,
            string prv_CedulaJuridica,
            string prv_Telefono,
            string prv_Email,
            string prv_TipoProveedor,
            int Id_Provincia,
            string prv_OtrasSenas,
             Nullable<bool> prv_Activo);
        #endregion

        #region Metodo  Retornar Proveedor
        List<sp_RetornarProveedor_Result> RetornarProveedor(string prv_NombreRepresentante, string prv_CedulaRepresentante, string prv_CedulaJuridica,
             string prv_Email, bool alq_Activo);
        #endregion

        #region Metodo  Retornar ID Proveedor
        sp_RetornaProveedorID_Result RetornarProveedorID(int prv_IDProveedor);
        #endregion

        #region Metodo  Retornar Grid Proveedor
        List<sp_RetornaProveedorDataGrid_Result> RetornarProveedorDataGrid(bool alq_activo);
        #endregion


        #region Metodo Elimnar Proveedor
        bool EliminarProveedor(
             int prv_IDProveedor,
             Nullable<bool> alq_Activo
             );
        #endregion


        #region Metodo  Retornar proveedor por nombre
        sp_RetornaProveedorName_Result RetornaProveedorname(string nombre_proveedor);
        #endregion


    }
}
