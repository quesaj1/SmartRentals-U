using ProyectoSmartRentals.Interfaces;
using ProyectoSmartRentals.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;

namespace ProyectoSmartRentals.Metodos
{
    public class C_AdminRentals : I_AdminRentals
    {

        SmartRentalsEntities1 modeloDB = new SmartRentalsEntities1();

        public bool EliminaAdminRental(int adr_id_admin)
        {
            try
            {
                int registrosAfectados = 0;
                registrosAfectados =
                    this.modeloDB.sp_EliminarAdminRental(
                        adr_id_admin
                        );


                if (registrosAfectados > 0)
                    return true;
            }
            catch (Exception error)
            {
                throw;
            }
            return false;
        }

        public bool InsertaAdminRentals(string adr_Cedula, string adr_Nombre, string adr_SegundoNombre, string adr_PrimerApellido, string adr_SegundoApellido, Nullable<System.DateTime> adr_FechaNacimiento, string adr_TelefonoCasa, string adr_TelefonoCelular, string adr_Email)
        {
            try
            {

                int registrosAfectados = 0;
                registrosAfectados =
                    this.modeloDB.sp_InsertarAdminRental(
                        adr_Cedula, adr_Nombre, adr_SegundoNombre, adr_PrimerApellido,
                        adr_SegundoApellido, adr_FechaNacimiento, adr_TelefonoCasa,
                        adr_TelefonoCelular, adr_Email
                        );



                if (registrosAfectados > 0)
                    return true;
            }
            catch (Exception error)
            {
                throw;
            }
            return false;
        }

        public bool ModificaAdminRentals(int adr_id_admin, string adr_Cedula, string adr_Nombre, string adr_SegundoNombre, string adr_PrimerApellido, string adr_SegundoApellido, Nullable<System.DateTime> adr_FechaNacimiento, string adr_TelefonoCasa, string adr_TelefonoCelular, string adr_Email)
        {
            try
            {

                int registrosAfectados = 0;
                registrosAfectados =
                    this.modeloDB.sp_ModificarAdminRental(adr_id_admin, adr_Cedula, adr_Nombre, adr_SegundoNombre,
                    adr_PrimerApellido, adr_SegundoApellido, adr_FechaNacimiento, adr_TelefonoCasa, adr_TelefonoCelular,
                    adr_Email
                        );

                if (registrosAfectados > 0)
                    return true;
            }
            catch (Exception error)
            {
                throw;
            }
            return false;
        }

        public List<sp_RetornaAdminRental_Result> RetornaAdminRental(string adr_Cedula, string adr_Nombre, string adr_SegundoNombre, string adr_PrimerApellido, string adr_SegundoApellido, string adr_Email)
        {
            List<sp_RetornaAdminRental_Result> resultado =
            new List<sp_RetornaAdminRental_Result>();
            resultado =
                this.modeloDB.sp_RetornaAdminRental(adr_Cedula, adr_Nombre, adr_SegundoNombre,
                adr_PrimerApellido, adr_SegundoApellido, adr_Email).ToList();

            return resultado;
        }

        public sp_RetornaAdminRentalID_Result RetornaAdminRentalID(int adr_id_admin)
        {
            sp_RetornaAdminRentalID_Result resultado =
              new sp_RetornaAdminRentalID_Result();

            resultado = modeloDB.
                sp_RetornaAdminRentalID(adr_id_admin).
                FirstOrDefault();

            return resultado;
        }
    }
}