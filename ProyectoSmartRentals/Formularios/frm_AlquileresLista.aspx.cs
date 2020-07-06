using ProyectoSmartRentals.Metodos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_AlquileresLista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
                
            //}
            
            this.CargaDatosGrid();
        }

        
       public void CargaDatosGrid()
        {
            
            C_Alquileres oAlquileres = new C_Alquileres();
            ///Asignarle la fuente de datos al grid
            this.grdListaAlquileres.DataSource =
                oAlquileres.RetornarAlquilerDataGrid(true);
            ///indicar al grid que se muestre
            this.grdListaAlquileres.DataBind();
        }

      
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string texto = this.DropDownList1.SelectedItem.ToString();
            C_Alquileres oAlquileres = new C_Alquileres();
            ///Asignarle la fuente de datos al grid

            if (texto.Equals("Activos"))
            {
                this.grdListaAlquileres.DataSource =
                    oAlquileres.RetornarAlquilerDataGrid(true);
                ///indicar al grid que se muestre
                this.grdListaAlquileres.DataBind();
            }
            else
            {
                this.grdListaAlquileres.DataSource =
              oAlquileres.RetornarAlquilerDataGrid(false);
                ///indicar al grid que se muestre
                this.grdListaAlquileres.DataBind();
            }







        }

        protected void grdListaAlquileres_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}