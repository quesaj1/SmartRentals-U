using ProyectoSmartRentals.Metodos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_contratoLista : System.Web.UI.Page
    {
        //acá hay que tomar el admin rental de la variable de sesión
        int _fk_admin_rental = 7;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                cargardatosGrid();

            }
        }

        protected void grdListaAdminRentals_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        public void cargardatosGrid()
        {
            C_Contrato oContratos = new C_Contrato();
            ///Asignarle la fuente de datos al grid
          
          
            this.grdListaContratos.DataSource =
                oContratos.RetornarContratoDataGrid(true, _fk_admin_rental);
            ///indicar al grid que se muestre
            this.grdListaContratos.DataBind();
          
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string texto = this.DropDownList1.SelectedItem.ToString();
            C_Contrato oContratos = new C_Contrato();
            ///Asignarle la fuente de datos al grid

            if (texto.Equals("Activos"))
            {
                this.grdListaContratos.DataSource =
                    oContratos.RetornarContratoDataGrid(true, _fk_admin_rental);
                ///indicar al grid que se muestre
                this.grdListaContratos.DataBind();
            }
            else
            {
                this.grdListaContratos.DataSource =
              oContratos.RetornarContratoDataGrid(false, _fk_admin_rental);
                ///indicar al grid que se muestre
                this.grdListaContratos.DataBind();
            }
        }
    }
}