using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoSmartRentals.Metodos;

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_ProveedorLista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargaDatosGrid();
        }

        public void CargaDatosGrid()
        {

            C_Proveedor oAlquileres = new C_Proveedor();
            ///Asignarle la fuente de datos al grid
            this.grdProveedor.DataSource =
                oAlquileres.RetornarProveedorDataGrid(true);
            ///indicar al grid que se muestre
            this.grdProveedor.DataBind();
        }



        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            string texto = this.DropDownList1.SelectedItem.ToString();
            C_Proveedor oContratos = new C_Proveedor();
            ///Asignarle la fuente de datos al grid


            if (texto.Equals("Activos"))
            {
                this.grdProveedor.DataSource =
                    oContratos.RetornarProveedorDataGrid(true);
                ///indicar al grid que se muestre
                this.grdProveedor.DataBind();
            }
            else
            {
                this.grdProveedor.DataSource =
              oContratos.RetornarProveedorDataGrid(false);
                ///indicar al grid que se muestre
                this.grdProveedor.DataBind();
            }
        }
    }
}