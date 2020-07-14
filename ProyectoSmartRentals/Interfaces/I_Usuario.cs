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
        sp_RetornaUsuarioUserID_Result RetornaUsuarioUserID
                    (string adr_id_admin);
    }
}
