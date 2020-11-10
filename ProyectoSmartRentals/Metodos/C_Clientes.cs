using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ProyectoSmartRentals.Modelos;
using ProyectoSmartRentals.Interfaces;

namespace ProyectoSmartRentals.Metodos
{
    public class C_Clientes : ICliente
    {
        SmartRentalsEntities1 modeloDB = new SmartRentalsEntities1();

        #region Metodo Eliminar Cliente
        public bool EliminarCliente(int cli_Cliente, bool? alq_Activo)
        {
            try
            {
                int registroAfectados = 0;
                registroAfectados = this.modeloDB.sp_EliminarCliente(cli_Cliente, alq_Activo);

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


        #region Metodo Insertar Cliente
        public bool InsertaCliente(string cli_Cedula, string cli_Nombre, string cli_SegundoNombre, string cli_PrimerApelido, string cli_SegundoApellido, Nullable<System.DateTime> cli_FechaNacimiento, string cli_TelefonoCasa, string cli_TelefonoCelular, string cli_Email, Nullable<bool> prv_Activo)
        {
            try
            {
                int registroAfectados = 0;
                registroAfectados = this.modeloDB.sp_InsertarCliente(cli_Cedula, cli_Nombre, cli_SegundoNombre,
                    cli_PrimerApelido, cli_SegundoApellido, cli_FechaNacimiento, cli_TelefonoCasa, cli_TelefonoCelular, cli_Email, prv_Activo);
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


        #region Metodo Modificar Cliente
        public bool ModificarCliente(int cli_Cliente, string cli_Cedula, string cli_Nombre, string cli_SegundoNombre, string cli_PrimerApelido, string cli_SegundoApellido, Nullable<System.DateTime> cli_FechaNacimiento, string cli_TelefonoCasa, string cli_TelefonoCelular, string cli_Email, Nullable<bool> prv_Activo)
        {
            try
            {
                int registroAfectados = 0;
                registroAfectados = this.modeloDB.sp_ModificarCliente(cli_Cliente, cli_Cedula, cli_Nombre, cli_SegundoNombre,
                    cli_PrimerApelido, cli_SegundoApellido, cli_FechaNacimiento, cli_TelefonoCasa, cli_TelefonoCelular, cli_Email, prv_Activo);

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


        #region Metodo Retornar Cliente ID
        public sp_RetornaClienteID_Result RetornaClienteID(int cli_Cliente)
        {
            sp_RetornaClienteID_Result resultado = new sp_RetornaClienteID_Result();
            resultado = modeloDB.sp_RetornaClienteID(cli_Cliente).FirstOrDefault();
            return resultado;
        }

      
        #endregion

        #region Metodo Retornar Cliente
        public List<sp_RetornaCliente_Result> RetornarCliente(string cli_Cedula, string cli_Nombre, string cli_SegundoNombre, string cli_PrimerApelido, string cli_SegundoApellido, string cli_TelefonoCasa, string cli_TelefonoCelular, string cli_Email, bool alq_Activo)
        {
            List<sp_RetornaCliente_Result> resultado = new List<sp_RetornaCliente_Result>();
            resultado = this.modeloDB.sp_RetornaCliente(cli_Cedula, cli_Nombre, cli_SegundoNombre, cli_PrimerApelido, cli_SegundoApellido, cli_TelefonoCasa, cli_TelefonoCelular, cli_Email, alq_Activo).ToList();
            return resultado;
        }


        #endregion

        #region Metodo Retonar Grid Cliente
        public List<sp_RetornaClienteDataGrid_Result> RetornarClienteDataGrid_Result(bool alq_activo)
        {
            List<sp_RetornaClienteDataGrid_Result> resultado = new List<sp_RetornaClienteDataGrid_Result>();
            resultado = this.modeloDB.sp_RetornaClienteDataGrid(alq_activo).ToList();
            return resultado;
        }
        #endregion


        #region Metodo Retonar Cliente Name
        public sp_RetornaClienteName_Result RetornaClientename(string nombre_cliente)
        {
            sp_RetornaClienteName_Result resultado = new sp_RetornaClienteName_Result();

            resultado = modeloDB.sp_RetornaClienteName(nombre_cliente).FirstOrDefault();

            return resultado;
        }
        #endregion
    }
}