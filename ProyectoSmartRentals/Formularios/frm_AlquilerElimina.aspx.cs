using ProyectoSmartRentals.Metodos;
using ProyectoSmartRentals.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_AlquilerElimina : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            this.hdldAlquiler.Value = this.Request.QueryString["alq_id_Propiedad"];
            CargaDatosAlquileres();

        }


        void CargaDatosAlquileres()
        {
            ///obtener el valor del parámetro que fue asignado al hidden
            ///en el page_Load
            string llavePrimaria = this.hdldAlquiler.Value;
           
            if (!string.IsNullOrEmpty(llavePrimaria))
            
            {
                int id_Alquiler = Convert.ToInt16(llavePrimaria);
                C_Alquileres oAlquileres = new C_Alquileres();

                ///Crear la instancia del objeto de retorno
                ///del procedimiento almacenado
                ///
                sp_RetornaAlquilerID_Result resultadoSp = oAlquileres.RetornaAlquilerID(id_Alquiler);

                ///validar que el procedimiento retorne un valor
                if (resultadoSp != null)
                {
                    this.txtUbicacionExacta.Text = resultadoSp.alq_UbicacionExacta;
                    this.txtTipoPropiedad.Text = resultadoSp.alq_TipoPropiedad;
                    this.txtDetalles.Text = resultadoSp.alq_Detalles;
                    this.txtDistrito.Text = resultadoSp.Id_Distrito.ToString();
                    this.txtCanton.Text = resultadoSp.Id_Canton.ToString();
                    this.txtProvincia.Text = resultadoSp.Id_Provincia.ToString();
                    this.txtImagen.Text = resultadoSp.alq_ImagenURL;
                    
                }

            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {   
            
            EliminarAlquiler();
        }

        protected void btnAtras_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Formularios/frm_AlquileresLista.aspx");
        }

     

        void EliminarAlquiler()
        {
            try
            {
                C_Alquileres oAlquileres = new C_Alquileres();

                bool registroModificado =oAlquileres.EliminaAlquiler(
                        Convert.ToInt16(this.hdldAlquiler.Value));

                if (registroModificado)
                    this.lblResultado.Text = "Registro eliminado";
                else
                    this.lblResultado.Text = "No fue posible eliminar";
            }
            catch (Exception error)
            {
                this.lblResultado.Text = "Ocurrió un error:" + error.Message;
            }
        }

        protected void ShowPopup(object sender, EventArgs e)
        {
            
            string title = "Eliminar registro";
            string body =  "Esta seguro de eliminar este registro?";
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
        }
    }
}