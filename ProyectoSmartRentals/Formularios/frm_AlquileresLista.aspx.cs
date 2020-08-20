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


        int _pk_admin = 0;
        int _pk_cliente = 0;
        int _pk_proveedor = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{

            //}
            menu();
            this.CargaDatosGrid();
        
        }

        void menu()
        {
            string _rol = Convert.ToString(Session["Tipo"]);
            if (_rol.Equals("Cliente"))
            {
                _pk_cliente = 4;
                _pk_admin = 0;
                _pk_proveedor = 0;
                this.Page.Master.FindControl("menu_admin").Visible = false;
                this.Page.Master.FindControl("menu_cliente").Visible = true;
                this.Page.Master.FindControl("menu_proveedor").Visible = false;
                this.Page.Master.FindControl("menu_admin_").Visible = false;
                this.Page.Master.FindControl("menu_cliente_").Visible = true;
                this.Page.Master.FindControl("menu_proveedor_").Visible = false;

            }
            if (_rol.Equals("Proveedor"))
            {
                _pk_cliente = 0;
                _pk_admin = 0;
                _pk_proveedor = 1;
                this.Page.Master.FindControl("menu_admin").Visible = false;
                this.Page.Master.FindControl("menu_cliente").Visible = false;
                this.Page.Master.FindControl("menu_proveedor").Visible = true;
                this.Page.Master.FindControl("menu_admin_").Visible = false;
                this.Page.Master.FindControl("menu_cliente_").Visible = false;
                this.Page.Master.FindControl("menu_proveedor_").Visible = true;
            }
            if (_rol.Equals("Administrador"))
            {
                _pk_cliente = 0;
                _pk_admin = 7;
                _pk_proveedor = 0;
                this.Page.Master.FindControl("menu_admin").Visible = true;
                this.Page.Master.FindControl("menu_cliente").Visible = false;
                this.Page.Master.FindControl("menu_proveedor").Visible = false;
                this.Page.Master.FindControl("menu_admin_").Visible = true;
                this.Page.Master.FindControl("menu_cliente_").Visible = false;
                this.Page.Master.FindControl("menu_proveedor_").Visible = false;
            }

        }


        public void CargaDatosGrid()
        {

            string texto = this.DropDownList1.SelectedItem.ToString();
            C_Alquileres oAlquileres = new C_Alquileres();
            ///Asignarle la fuente de datos al grid

            if (texto.Equals("Activos"))
            {
                this.grdListaAlquileres.Columns[9].Visible = true;
                this.grdListaAlquileres.Columns[10].Visible = true;
                this.grdListaAlquileres.DataSource =
                    oAlquileres.RetornarAlquilerDataGrid(true);
                ///indicar al grid que se muestre
                this.grdListaAlquileres.DataBind();
            }
            else
            {
                this.grdListaAlquileres.Columns[9].Visible = false;
                this.grdListaAlquileres.Columns[10].Visible = false;
                this.grdListaAlquileres.DataSource =
              oAlquileres.RetornarAlquilerDataGrid(false);
                ///indicar al grid que se muestre
                this.grdListaAlquileres.DataBind();
            }

        }


        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.CargaDatosGrid();

        }

        protected void grdListaAlquileres_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

       protected void grdListaAlquileres_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            ///asignar al grid el nuevo índice de la página del grid
            this.grdListaAlquileres.PageIndex = e.NewPageIndex;
            ///asignar nuevamente la fuente de datos al grid
            this.CargaDatosGrid();
        }

    }
}