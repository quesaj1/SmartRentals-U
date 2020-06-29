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
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{

                cargardatosGrid();

            //}
        }

        protected void grdListaAdminRentals_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        public void cargardatosGrid()
        {
            C_Contrato oContratos = new C_Contrato();
            ///Asignarle la fuente de datos al grid
          
          
            this.grdListaContratos.DataSource =
                oContratos.RetornarContratoDataGrid(true);
            ///indicar al grid que se muestre
            this.grdListaContratos.DataBind();
          
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
         

                C_Contrato oContratos = new C_Contrato();
                ///Asignarle la fuente de datos al grid

                if (this.DropDownList1.DataTextField.Equals("Activos"))
                {
                    this.grdListaContratos.DataSource =
                        oContratos.RetornarContratoDataGrid(true);
                    ///indicar al grid que se muestre
                    this.grdListaContratos.DataBind();
                }
                else
                {
                    this.grdListaContratos.DataSource =
                  oContratos.RetornarContratoDataGrid(false);
                    ///indicar al grid que se muestre
                    this.grdListaContratos.DataBind();
                }
            
        }
    }
}