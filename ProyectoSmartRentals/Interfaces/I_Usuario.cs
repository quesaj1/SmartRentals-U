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


        string obtieneultimoiniciosesion(string usuario);

        #region Metodo Insertar Usuario
        bool InsertaUsuario(
             string usuario,
             int tipo,
             int id_principal);
        #endregion

        int obtiene_id_principal(string usuario, int tipo);

        #region Metodo Actualiza Ultimo Inicio de Sesion
        bool ModificaInicioSesion(
             string usuario,
             DateTime tipo);
        #endregion

        

    }

}


