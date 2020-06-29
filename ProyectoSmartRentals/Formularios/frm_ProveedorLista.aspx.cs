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
    public partial class frm_ProveedorLista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
            this.CargaDatosGrid();
        }


        #region Cargar Grid Proveedor
        void CargaDatosGrid()
        {


            string prv_NombreRepresentante = this.txtNombreRepresentante.Text.ToString();
            string prv_CedulaRepresentante = this.txtCedulaRepresentante.Text.ToString();
            string prv_CedulaJuridica = this.txtCedulaJuridica.Text.ToString();
            string prv_Email = this.txtEmail.Text.ToString();
            C_Proveedor oProveedor = new C_Proveedor();
            ///Asignarle la fuente de datos al grid
            this.grdProveedor.DataSource =
                oProveedor.RetornarProveedor(prv_NombreRepresentante, prv_CedulaRepresentante, prv_CedulaJuridica, prv_Email);
            ///indicar al grid que se muestre
            this.grdProveedor.DataBind();
        }
        #endregion


        protected void grdProveedor_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            ///asignar al grid el nuevo índice de la página del grid
            this.grdProveedor.PageIndex = e.NewPageIndex;
            ///asignar nuevamente la fuente de datos al grid
            this.CargaDatosGrid();
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            this.CargaDatosGrid();
        }
    }
}