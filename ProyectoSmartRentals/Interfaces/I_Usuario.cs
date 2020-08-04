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


        sp_RetornaUsuarioUserID_Result RetornaUsuarioUserID_Result
                    (string adr_id_admin);

        #region Metodo Insertar Usuario
        bool InsertaUsuario(
             string usuario,
             int tipo,
             int id_principal);
        #endregion

        int obtiene_id_principal(string usuario, int tipo);
    }

}


