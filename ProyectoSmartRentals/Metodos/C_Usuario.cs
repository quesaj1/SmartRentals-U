using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ProyectoSmartRentals.Interfaces;
using ProyectoSmartRentals.Modelos;

namespace ProyectoSmartRentals.Metodos
{
    public class C_Usuario
    {

        SmartRentalsEntities1 modeloDB = new SmartRentalsEntities1();

        public sp_RetornaUsuarioUserID_Result RetornaUsuarioUserID_Result(string usuario)
        {
            sp_RetornaUsuarioUserID_Result resultado =
              new sp_RetornaUsuarioUserID_Result();

            resultado = modeloDB.
                sp_RetornaUsuarioUserID(usuario).
                FirstOrDefault();

            return resultado;
        }

    }
}