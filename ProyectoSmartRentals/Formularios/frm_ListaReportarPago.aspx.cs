using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoSmartRentals.Metodos;

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_ListaReportarPago : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargardatosGrid();
            }

        }

        public void cargardatosGrid()
        {
            C_ReportePago oReportarPago = new C_ReportePago();
            ///Asignarle la fuente de datos al grid
            this.grdListaPagos.DataSource =
                oReportarPago.RetornaPagosRealizadosDataGrid(true);
            ///indicar al grid que se muestre
            this.grdListaPagos.DataBind();

        }



        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string texto = this.DropDownList1.SelectedItem.ToString();
            C_ReportePago oReportarPago = new C_ReportePago();
            ///Asignarle la fuente de datos al grid

            if (texto.Equals("Pagos Realizados"))
            {
                this.grdListaPagos.DataSource =
                    oReportarPago.RetornaPagosRealizadosDataGrid(true);
                ///indicar al grid que se muestre
                this.grdListaPagos.DataBind();
            }
            else
            {
                this.grdListaPagos.DataSource =
              oReportarPago.RetornaPagosRealizadosDataGrid(false);
                ///indicar al grid que se muestre
                this.grdListaPagos.DataBind();
            }
        }

        protected void grdListaPagos_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }

        protected void grdListaPagos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            ///asignar al grid el nuevo índice de la página del grid
            this.grdListaPagos.PageIndex = e.NewPageIndex;
            ///asignar nuevamente la fuente de datos al grid
            this.cargardatosGrid();
        }
    }
}