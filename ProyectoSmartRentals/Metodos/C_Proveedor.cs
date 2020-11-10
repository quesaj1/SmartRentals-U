using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ProyectoSmartRentals.Interfaces;
using ProyectoSmartRentals.Modelos;

namespace ProyectoSmartRentals.Metodos
{
    public class C_Proveedor : I_Proveedor
    {
        SmartRentalsEntities1 modeloDB = new SmartRentalsEntities1();


        #region Metodo Insertar Proveedor
        public bool InsertaProveedor(string prv_NombreVariable, string prv_NombreRepresentante, string prv_PrimerApellido, string prv_SegundoApellido, string prv_CedulaRepresentante, string prv_CedulaJuridica, string prv_Telefono, string prv_Email, string prv_TipoProveedor, int Id_Distrito, int Id_Canton, int Id_Provincia, string prv_OtrasSenas, Nullable<bool> prv_Activo)
        {
            try
            {
                int registrosAfectados = 0;
                registrosAfectados =
                    this.modeloDB.sp_InsertarProveedor(prv_NombreVariable, prv_NombreRepresentante, prv_PrimerApellido, prv_SegundoApellido, prv_CedulaRepresentante
                    , prv_CedulaJuridica, prv_Telefono, prv_Email, prv_TipoProveedor, Id_Distrito, Id_Canton, Id_Provincia, prv_OtrasSenas, prv_Activo);

                if (registrosAfectados > 0)
                    return true;
            }
            catch (Exception)
            {
                throw;
            }
            return false;



        }

      
        #endregion


        #region Metodo Modificar Proveedor
        public bool ModificarProveedor(int prv_IDProveedor, string prv_NombreVariable, string prv_NombreRepresentante, string prv_PrimerApellido, string prv_SegundoApellido, string prv_CedulaRepresentante, string prv_CedulaJuridica, string prv_Telefono, string prv_Email, string prv_TipoProveedor, int Id_Distrito, int Id_Canton, int Id_Provincia, string prv_OtrasSenas, Nullable<bool> prv_Activo)
        {
            try
            {

                int registrosAfectados = 0;
                registrosAfectados =
                    this.modeloDB.sp_ModificarProveedor(prv_IDProveedor, prv_NombreVariable, prv_NombreRepresentante, prv_PrimerApellido, prv_SegundoApellido, prv_CedulaRepresentante
                    , prv_CedulaJuridica, prv_Telefono, prv_Email, prv_TipoProveedor, Id_Distrito, Id_Canton, Id_Provincia, prv_OtrasSenas, prv_Activo);
                if (registrosAfectados > 0)
                    return true;
            }
            catch (Exception)
            {
                throw;
            }
            return false;
        }
        #endregion

        public bool ModificarEliminaProveedor(int prv_IDProveedor, string prv_NombreVariable, string prv_NombreRepresentante, string prv_PrimerApellido, string prv_SegundoApellido, string prv_CedulaRepresentante, string prv_CedulaJuridica, string prv_Telefono, string prv_Email, string prv_TipoProveedor, int Id_Provincia, string prv_OtrasSenas, bool? prv_Activo)
        {
            try
            {

                int registrosAfectados = 0;
                registrosAfectados =
                    this.modeloDB.sp_ModificarProveedor_Elimina(prv_IDProveedor, prv_NombreVariable, prv_NombreRepresentante, prv_PrimerApellido, prv_SegundoApellido, prv_CedulaRepresentante
                    , prv_CedulaJuridica, prv_Telefono, prv_Email, prv_TipoProveedor,Id_Provincia, prv_OtrasSenas, prv_Activo);
                if (registrosAfectados > 0)
                    return true;
            }
            catch (Exception)
            {
                throw;
            }
            return false;
        }


        #region Metodo Retonar Proveedor
        public List<sp_RetornarProveedor_Result> RetornarProveedor(string prv_NombreRepresentante, string prv_CedulaRepresentante, string prv_CedulaJuridica, string prv_Email, bool alq_Activo)
        {
            List<sp_RetornarProveedor_Result> resultado = new List<sp_RetornarProveedor_Result>();
            resultado = this.modeloDB.sp_RetornarProveedor(prv_NombreRepresentante, prv_CedulaRepresentante, prv_CedulaJuridica, prv_Email, alq_Activo).ToList();

            return resultado;
        }
        #endregion

        #region Metodo Retonar Grid Proveedor

        public List<sp_RetornaProveedorDataGrid_Result> RetornarProveedorDataGrid(bool alq_activo)
        {
            List<sp_RetornaProveedorDataGrid_Result> resultado = new List<sp_RetornaProveedorDataGrid_Result>();
            resultado = this.modeloDB.sp_RetornaProveedorDataGrid(alq_activo).ToList();
            return resultado;
        }
        #endregion


        #region Metodo Retornar Proveedor ID
        public sp_RetornaProveedorID_Result RetornarProveedorID(int prv_IDProveedor)
        {
            sp_RetornaProveedorID_Result resultado = new sp_RetornaProveedorID_Result();

            resultado = modeloDB.sp_RetornaProveedorID(prv_IDProveedor).FirstOrDefault();

            return resultado;
        }


        #endregion

        #region Metodo Retornar Eliminar
        public bool EliminarProveedor(int prv_IDProveedor, bool? alq_Activo)
        {
            try
            {
                int registroAfectados = 0;
                registroAfectados = this.modeloDB.sp_EliminarProveedor(prv_IDProveedor, alq_Activo);

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

        #region Metodo Retonar Proveedor Name
        public sp_RetornaProveedorName_Result RetornaProveedorname(string nombre_proveedor)
        {
            sp_RetornaProveedorName_Result resultado = new sp_RetornaProveedorName_Result();

            resultado = modeloDB.sp_RetornaProveedorName(nombre_proveedor).FirstOrDefault();

            return resultado;
        }
        #endregion


    }
}