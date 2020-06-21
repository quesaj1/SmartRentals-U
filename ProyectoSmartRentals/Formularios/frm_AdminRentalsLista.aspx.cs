using ProyectoSmartRentals.Metodos;
using System;
using System.Web.UI.WebControls;

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_AdminRentalLista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.CargaDatosGrid();
        }

        void CargaDatosGrid()
        {

            string cedula = this.txtCedula.Text.ToString();
            string nombre = this.txtNombre.Text.ToString();
            string segundonombre = this.txtSegundoNombre.Text.ToString();
            string primerapellido = this.txtPrimerApellido.Text.ToString();
            string segundoapellido = this.txtSegundoApellido.Text.ToString();
            string email = this.txtEmail.Text.ToString();


            C_AdminRentals oAdminRentals = new C_AdminRentals();
            ///Asignarle la fuente de datos al grid
            this.grdListaAdminRentals.DataSource =
                oAdminRentals.RetornaAdminRental(cedula, nombre, segundonombre, primerapellido, segundoapellido, email);
            ///indicar al grid que se muestre
            this.grdListaAdminRentals.DataBind();
        }

        protected void grdListaAdminRentals_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            ///asignar al grid el nuevo índice de la página del grid
            this.grdListaAdminRentals.PageIndex = e.NewPageIndex;
            ///asignar nuevamente la fuente de datos al grid
            this.CargaDatosGrid();
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            this.CargaDatosGrid();
        }
    }
}