using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProyectoSmartRentals.Modelos;

namespace ProyectoSmartRentals.Interfaces
{
   public interface ICliente
    {

        //Este metodo Se declara las variables conforme al Store Procedure de la Base datos para realizar el insert

        #region Metodo Insertar Cliente
        bool InsertaCliente(
            string cli_Cedula,
            string cli_Nombre,
            string cli_SegundoNombre,
            string cli_PrimerApelido,
            string cli_SegundoApellido,
            Nullable<System.DateTime> cli_FechaNacimiento,
            string cli_TelefonoCasa,
            string cli_TelefonoCelular,
            string cli_Email,
             Nullable<bool> prv_Activo);
        #endregion

        #region Metodo Modificar Cliente
        bool ModificarCliente(
           int cli_Cliente,
           string cli_Cedula,
           string cli_Nombre,
           string cli_SegundoNombre,
           string cli_PrimerApelido,
           string cli_SegundoApellido,
           Nullable<System.DateTime> cli_FechaNacimiento,
           string cli_TelefonoCasa,
           string cli_TelefonoCelular,
           string cli_Email,
          Nullable<bool> prv_Activo);
        #endregion



        #region Metodo  Retornar Cliente
        List<sp_RetornaCliente_Result> RetornarCliente(string cli_Cedula,
           string cli_Nombre,
           string cli_SegundoNombre,
           string cli_PrimerApelido,
           string cli_SegundoApellido,
           string cli_TelefonoCasa,
           string cli_TelefonoCelular,
           string cli_Email, bool alq_Activo);
        #endregion

        #region Metodo  Retornar ID Cliente
        sp_RetornaClienteID_Result RetornaClienteID(int cli_Cliente);
        #endregion


        #region Metodo  Retornar Grid Cliente
        List<sp_RetornaClienteDataGrid_Result> RetornarClienteDataGrid_Result(bool alq_activo);
        #endregion


        #region Metodo  Eliminar Cliente

        bool EliminarCliente(
             int cli_Cliente,
             Nullable<bool> alq_Activo
             );
        #endregion


    }
}
