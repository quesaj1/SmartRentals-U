using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProyectoSmartRentals.Modelos;

namespace ProyectoSmartRentals.Interfaces
{
    public interface I_Usuario
    {

        bool obtienesesactiva(string usuario);

        string obtieneultimoiniciosesion(string usuario);

        #region Metodo Insertar Usuario
        bool InsertaUsuario(
             string usuario,
             int tipo,
             int id_principal,
            string password);
        #endregion

        bool ActualizaPassword(
             string usuario,
             string password
            );

        bool OlvidaPassword(
             string usuario,
             string password
            );

        int obtiene_id_principal(string usuario, int tipo);

        #region Metodo Actualiza Ultimo Inicio de Sesion
        bool ModificaInicioSesion(
             string usuario,
             DateTime tipo);
        #endregion

        

    }

}


