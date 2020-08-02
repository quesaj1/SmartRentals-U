using ProyectoSmartRentals.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProyectoSmartRentals.Interfaces
{
    interface I_Alquileres
    {

        bool InsertaAlquiler(
         string alq_UbicacionExacta,
         string alq_TipoPropiedad,
         string alq_Detalles,
         int Id_Distrito,
         int Id_Canton,
         int Id_Provincia,
         Nullable<bool> alq_Activo,
         string alq_ImagenURL
         );


        bool ModificaAlquiler(
         int alq_id_Propiedad,
         string alq_UbicacionExacta,
         string alq_TipoPropiedad,
         string alq_Detalles,
         int Id_Distrito,
         int Id_Canton,
         int Id_Provincia,
         Nullable<bool> alq_Activo,
         string alq_ImagenURL
            );

        //bool EliminaAlquiler(int alq_id_Propiedad);

        bool EliminarAlquiler(
       int alq_id_Propiedad,
       Nullable<bool> alq_Activo
          );

        List<sp_RetornaAlquiler_Result>
                RetornaAlquiler(
                int alq_id_Propiedad, 
                string alq_tipo_Propiedad, 
                int provincia, 
                bool alq_Activo);

        sp_RetornaAlquilerID_Result RetornaAlquilerID
                    (int alq_id_Propiedad);



      List<sp_RetornaAlquilerDataGrid_Result> RetornarAlquilerDataGrid(
      bool alq_activo);

    }

  
 
   

}
