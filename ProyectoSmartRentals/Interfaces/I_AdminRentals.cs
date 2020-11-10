using ProyectoSmartRentals.Modelos;
using System;
using System.Collections.Generic;

namespace ProyectoSmartRentals.Interfaces
{
    public interface I_AdminRentals
    {

        bool InsertaAdminRentals(
            string adr_Cedula,
            string adr_Nombre,
            string adr_SegundoNombre,
            string adr_PrimerApellido,
            string adr_SegundoApellido,
            Nullable<System.DateTime> adr_FechaNacimiento,
            string adr_TelefonoCasa,
            string adr_TelefonoCelular,
            string adr_Email
            );


        bool ModificaAdminRentals(
            int adr_id_admin,
            string adr_Cedula,
            string adr_Nombre,
            string adr_SegundoNombre,
            string adr_PrimerApellido,
            string adr_SegundoApellido,
            Nullable<System.DateTime> adr_FechaNacimiento,
            string adr_TelefonoCasa,
            string adr_TelefonoCelular,
            string adr_Email
            );

        bool EliminaAdminRental(int adr_id_admin);

        List<sp_RetornaAdminRental_Result>
                RetornaAdminRental(string adr_Cedula, string adr_Nombre, string adr_SegundoNombre,
                                   string adr_PrimerApellido, string adr_SegundoApellido,
                                   string adr_Email);

        sp_RetornaAdminRentalID_Result RetornaAdminRentalID
                    (int adr_id_admin);


        #region Metodo  Retornar Admin-Rentals por nombre
        sp_RetornaAdminRentalName_Result RetornaAdminName(string nombre_admin);
        #endregion

    }
}
