using ProyectoSmartRentals.Interfaces;
using ProyectoSmartRentals.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoSmartRentals.Metodos
{
    public class C_Alquileres : I_Alquileres


    {


        SmartRentalsEntities1 modeloDB = new SmartRentalsEntities1();
        //public bool EliminaAlquiler(int alq_id_Propiedad)
        //{

        //    try
        //    {
        //        int registrosAfectados = 0;
        //        registrosAfectados =
        //            this.modeloDB.sp_EliminarAlquiler(
        //                alq_id_Propiedad
        //                );


        //        if (registrosAfectados > 0)
        //            return true;
        //    }
        //    catch (Exception)
        //    {
        //        throw;
        //    }
        //    return false;


        //}

        public bool InsertaAlquiler(string alq_UbicacionExacta, string alq_TipoPropiedad, 
            string alq_Detalles, int Id_Distrito, int Id_Canton, 
            int Id_Provincia, string alq_ImagenURL, 
            Nullable<bool> alq_Activo)
        {
            try
            {

                int registrosAfectados = 0;
                registrosAfectados =
                    this.modeloDB.sp_InsertarAlquiler(
                        alq_UbicacionExacta, alq_TipoPropiedad, alq_Detalles, Id_Distrito,
                        Id_Canton,Id_Provincia,alq_ImagenURL, alq_Activo
                        
                        );

                if (registrosAfectados > 0)
                    return true;
            }
            catch (Exception)
            {
                throw;
            }
            return false;


        }

        public bool InsertaAlquiler(string alq_UbicacionExacta, string alq_TipoPropiedad, string alq_Detalles, int Id_Distrito, int Id_Canton, int Id_Provincia, bool? alq_Activo, string alq_ImagenURL)
        {
            throw new NotImplementedException();
        }

        public bool ModificaAlquiler(int alq_id_Propiedad, 
            string alq_UbicacionExacta, 
            string alq_TipoPropiedad, 
            string alq_Detalles, 
            int Id_Distrito, 
            int Id_Canton, 
            int Id_Provincia, 
            string alq_ImagenURL,
            bool alq_Activo)
        {
            try
            {

                int registrosAfectados = 0;
                registrosAfectados =
                    this.modeloDB.sp_ModificaAlquiler(alq_id_Propiedad, alq_UbicacionExacta, alq_TipoPropiedad, alq_Detalles,
                    Id_Distrito,Id_Canton, Id_Provincia,alq_ImagenURL, alq_Activo);

              
                
                if (registrosAfectados > 0)
                    return true;
            }
            catch (Exception)
            {
                throw;
            }
            return false;


        }

        public bool ModificaAlquiler(int alq_id_Propiedad, string alq_UbicacionExacta, string alq_TipoPropiedad, string alq_Detalles, int Id_Distrito, int Id_Canton, int Id_Provincia, bool? alq_Activo, string alq_ImagenURL)
        {
            throw new NotImplementedException();
        }

        public List<sp_RetornaAlquiler_Result> RetornaAlquiler(int alq_id_Propiedad ,string alq_tipo_Propiedad, int provincia, bool alq_Activo )
        {
            List<sp_RetornaAlquiler_Result> resultado =new List<sp_RetornaAlquiler_Result>();
            resultado = this.modeloDB.sp_RetornaAlquiler(alq_id_Propiedad, alq_tipo_Propiedad, provincia, alq_Activo).ToList();
            return resultado;
        }


        public sp_RetornaAlquilerID_Result RetornaAlquilerID(int alq_id_Propiedad)
        {
            sp_RetornaAlquilerID_Result resultado =new sp_RetornaAlquilerID_Result();

            resultado = modeloDB.sp_RetornaAlquilerID(alq_id_Propiedad).
                FirstOrDefault();

            return resultado;

        }

        public List<sp_RetornaAlquilerDataGrid_Result> RetornarAlquilerDataGrid(bool alq_activo)
        {
            List<sp_RetornaAlquilerDataGrid_Result> resultado = new List<sp_RetornaAlquilerDataGrid_Result>();
            resultado = this.modeloDB.sp_RetornaAlquilerDataGrid(alq_activo).ToList();
            return resultado;
        }
    }

}