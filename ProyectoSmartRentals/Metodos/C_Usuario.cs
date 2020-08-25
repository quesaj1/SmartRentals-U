using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ProyectoSmartRentals.Interfaces;
using ProyectoSmartRentals.Modelos;

namespace ProyectoSmartRentals.Metodos
{
    public class C_Usuario : I_Usuario
    {

        SmartRentalsEntities1 modeloDB = new SmartRentalsEntities1();

        public bool InsertaUsuario(string usuario, int tipo, int id_principal,string password)
        {
            try
            {
                int registroAfectados = 0;
                registroAfectados = this.modeloDB.sp_InsertarUsuario1(usuario, tipo, id_principal, password);
                if (registroAfectados > 0)
                    return true;
            }
            catch (Exception error)
            {

                throw error;
            }
            return false;
        }

        public bool ModificaInicioSesion(string usuario, DateTime tipo)
        {
            try
            {
                int registroAfectados = 0;
                registroAfectados = this.modeloDB.sp_ModificaInicioSesion1(usuario, tipo);
                if (registroAfectados > 0)
                    return true;
            }
            catch (Exception error)
            {

                throw error;
            }
            return false;
        }

        public string obtieneultimoiniciosesion(string usuario)
        {
            sp_RetornaUsuarioUserID_Result resultado =
                                 new sp_RetornaUsuarioUserID_Result();

            resultado = modeloDB.
               sp_RetornaUsuarioUserID(usuario).
                FirstOrDefault();
            return resultado.ult_inicio_sesion.ToString();
        }

        public bool obtienesesactiva(string usuario)
        {
            sp_RetornaUsuarioUserID_Result resultado =
                                 new sp_RetornaUsuarioUserID_Result();

            resultado = modeloDB.
               sp_RetornaUsuarioUserID(usuario).
                FirstOrDefault();
            return resultado.sesion_activa;
        }

        public int obtiene_id_principal(string usuario, int tipo)
        {

            int retorna_usuario = 0;

            if (tipo == 1)
            {
                sp_RetornaAdminRental_Result resultado =
                                 new sp_RetornaAdminRental_Result();

                resultado = modeloDB.
                    sp_RetornaAdminRental("", "", "", "", "", usuario).
                    FirstOrDefault();
                retorna_usuario = resultado.adr_id_admin;
            }
            else if (tipo == 2)
            {
                sp_RetornaCliente_Result resultado =
                                 new sp_RetornaCliente_Result();

                resultado = modeloDB.
                    sp_RetornaCliente("", "", "", "", "", "", "", usuario, true).
                    FirstOrDefault();
                retorna_usuario = resultado.cli_Cliente;
            }
            else if (tipo == 3)
            {
                sp_RetornarProveedor_Result resultado =
                                 new sp_RetornarProveedor_Result();

                resultado = modeloDB.
                    sp_RetornarProveedor("", "", "", usuario, true).
                    FirstOrDefault();
                retorna_usuario = resultado.prv_IDProveedor;
            }



            return retorna_usuario;
        }

        public sp_RetornaUsuarioUserID_Result RetornaUsuarioUserID_Result(string usuario)
        {
            sp_RetornaUsuarioUserID_Result resultado =
              new sp_RetornaUsuarioUserID_Result();

            resultado = modeloDB.
                sp_RetornaUsuarioUserID(usuario).
                FirstOrDefault();

            return resultado;
        }

        public bool ActualizaPassword(string usuario, string password)
        {
            try
            {
                int registroAfectados = 0;
                registroAfectados = this.modeloDB.sp_ModificarContraseña(usuario, password);
                if (registroAfectados > 0)
                    return true;
            }
            catch (Exception error)
            {

                throw error;
            }
            return false;
        }
    }
}