using ProyectoSmartRentals.Metodos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_SolicitudModContrato : System.Web.UI.Page
    {
        
            protected void Page_Load(object sender, EventArgs e)
            {
                //if (!IsPostBack)
                //{

                //cargardatosGrid();

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
                    oContratos.RetornarContratoDataGrid(true,7);
                ///indicar al grid que se muestre
                this.grdListaContratos.DataBind();

            }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            if (this.IsValid)
            {
               

                ///obtener del hiddenField el valor de la llave primaria
                 string ctr_contrato = this.txtContrato.Text;

                try
                {

                    C_Contrato oContratos = new C_Contrato();
                    this.grdListaContratos.DataSource =
                    oContratos.BuscaContratoDataGrid(ctr_contrato);
                    ///indicar al grid que se muestre
                    this.grdListaContratos.DataBind();
                    cargardatosGrid();
                }
                catch (Exception)
                {
                    
                }
            }
        }


       
    }

}