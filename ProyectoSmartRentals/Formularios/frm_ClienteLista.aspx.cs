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
            CargaDatosGrid();
        }


        #region Carga DatosGrid
      public void CargaDatosGrid()
        {

            C_Clientes oClientes = new C_Clientes();
            ///Asignarle la fuente de datos al grid
            this.grdListaClientes.DataSource =
               oClientes.RetornarClienteDataGrid_Result(true);
            ///indicar al grid que se muestre
            this.grdListaClientes.DataBind();
        }
        #endregion



        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            this.CargaDatosGrid();
        }


        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string texto = this.DropDownList1.SelectedItem.ToString();
            C_Clientes oCliente = new C_Clientes();
            ///Asignarle la fuente de datos al grid


            if (texto.Equals("Activos"))
            {
                this.grdListaClientes.DataSource =
                    oCliente.RetornarClienteDataGrid_Result(true);
                ///indicar al grid que se muestre
                this.grdListaClientes.DataBind();
            }
            else
            {
                this.grdListaClientes.DataSource =
              oCliente.RetornarClienteDataGrid_Result(false);
                ///indicar al grid que se muestre
                this.grdListaClientes.DataBind();
            }
        }
    }
}