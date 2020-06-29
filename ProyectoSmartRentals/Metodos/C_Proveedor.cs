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

        #region Metodo Eliminar
        public bool EliminarProveedor(int prv_IDProveedor)
        {
            try
            {
                int registrosAfectados = 0;
                registrosAfectados =
                    this.modeloDB.sp_EliminarProveedor(prv_IDProveedor);


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

        #region Metodo Insertar Proveedor
        public bool InsertaProveedor(string prv_NombreVariable, string prv_NombreRepresentante, string prv_PrimerApellido, string prv_SegundoApellido, string prv_CedulaRepresentante, string prv_CedulaJuridica, string prv_Telefono, string prv_Email, string prv_TipoProveedor, int Id_Distrito, int Id_Canton, int Id_Provincia, string prv_OtrasSenas)
        {
            try
            {
                int registrosAfectados = 0;
                registrosAfectados =
                    this.modeloDB.sp_InsertarProveedor(prv_NombreVariable, prv_NombreRepresentante, prv_PrimerApellido, prv_SegundoApellido, prv_CedulaRepresentante
                    , prv_CedulaJuridica, prv_Telefono, prv_Email, prv_TipoProveedor, Id_Distrito, Id_Canton, Id_Provincia, prv_OtrasSenas);

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
        public bool ModificarProveedor(int prv_IDProveedor, string prv_NombreVariable, string prv_NombreRepresentante, string prv_PrimerApellido, string prv_SegundoApellido, string prv_CedulaRepresentante, string prv_CedulaJuridica, string prv_Telefono, string prv_Email, string prv_TipoProveedor, int Id_Distrito, int Id_Canton, int Id_Provincia, string prv_OtrasSenas)
        {
            try
            {

                int registrosAfectados = 0;
                registrosAfectados =
                    this.modeloDB.sp_ModificarProveedor(prv_IDProveedor, prv_NombreVariable, prv_NombreRepresentante, prv_PrimerApellido, prv_SegundoApellido, prv_CedulaRepresentante
                    , prv_CedulaJuridica, prv_Telefono, prv_Email, prv_TipoProveedor, Id_Distrito, Id_Canton, Id_Provincia, prv_OtrasSenas);
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



        #region Metodo Retornar Proveedor
        public List<sp_RetornarProveedor_Result> RetornarProveedor(string prv_NombreRepresentante, string prv_CedulaRepresentante, string prv_CedulaJuridica, string prv_Email)
        {
            List<sp_RetornarProveedor_Result> resultado = new List<sp_RetornarProveedor_Result>();

            resultado = this.modeloDB.sp_RetornarProveedor(prv_NombreRepresentante, prv_CedulaRepresentante, prv_CedulaJuridica, prv_Email).ToList();

            return resultado;
        }
        #endregion

        #region Metodo Retornar IDProveedor
        public sp_RetornaProveedorID_Result RetornarProveedorID(int prv_IDProveedor)
        {
            throw new NotImplementedException();
        }
        #endregion
    }
}