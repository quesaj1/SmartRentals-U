using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoSmartRentals.Metodos;
using ProyectoSmartRentals.Modelos;

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_ClienteLista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.CargaDatosGrid();
        }


        #region
        void CargaDatosGrid()
        {

            string cedula = this.txtCedula.Text.ToString();
            string nombre = this.txtNombre.Text.ToString();
            string segundonombre = this.txtSegundoNombre.Text.ToString();
            string primerapellido = this.txtPrimerApellido.Text.ToString();
            string segundoapellido = this.txtSegundoApellido.Text.ToString();
            string TelefonoCasa = this.txtTelefonoCasa.Text.ToString();
            string TelefonoCelular = this.txtTelefonoCelular.Text.ToString();
            string email = this.txtEmail.Text.ToString();


            C_Clientes oAdminRentals = new C_Clientes();
            ///Asignarle la fuente de datos al grid
            this.grdListaClientes.DataSource =
                oAdminRentals.RetornarCliente(cedula, nombre, segundonombre, primerapellido, segundoapellido, TelefonoCasa, TelefonoCelular, email);
            ///indicar al grid que se muestre
            this.grdListaClientes.DataBind();
        }
        #endregion



        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            this.CargaDatosGrid();
        }

        protected void grdListaClientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            ///asignar al grid el nuevo índice de la página del grid
            this.grdListaClientes.PageIndex = e.NewPageIndex;
            ///asignar nuevamente la fuente de datos al grid
            this.CargaDatosGrid();
        }
    }
}