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
        //int _fk_admin_rental = 7;
        int _pk_admin = 0;
        int _pk_cliente = 0;
        int _pk_proveedor = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("frm_Login.aspx?error=jwP46Q", true);
            }
            if (!IsPostBack)
            {
                menu();
                cargardatosGrid();

            }
        }

        protected void grdListaAdminRentals_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        void menu()
        {
            string _rol = Convert.ToString(Session["Tipo"]);
            if (_rol.Equals("Cliente"))
            {
                _pk_cliente = Convert.ToInt16(Session["ID"]);
                _pk_admin = 0;
                _pk_proveedor = 0;
                this.Page.Master.FindControl("menu_admin").Visible = false;
                this.Page.Master.FindControl("menu_cliente").Visible = true;
                this.Page.Master.FindControl("menu_proveedor").Visible = false;
                this.Page.Master.FindControl("menu_admin_").Visible = false;
                this.Page.Master.FindControl("menu_cliente_").Visible = true;
                this.Page.Master.FindControl("menu_proveedor_").Visible = false;
                Response.Redirect("frm_inicioMenu.aspx?error=zW2aqP", false);

            }
            if (_rol.Equals("Proveedor"))
            {
                _pk_cliente = 0;
                _pk_admin = 0;
                _pk_proveedor = Convert.ToInt16(Session["ID"]);
                this.Page.Master.FindControl("menu_admin").Visible = false;
                this.Page.Master.FindControl("menu_cliente").Visible = false;
                this.Page.Master.FindControl("menu_proveedor").Visible = true;
                this.Page.Master.FindControl("menu_admin_").Visible = false;
                this.Page.Master.FindControl("menu_cliente_").Visible = false;
                this.Page.Master.FindControl("menu_proveedor_").Visible = true;
                Response.Redirect("frm_inicioMenu.aspx?error=zW2aqP", false);
            }
            if (_rol.Equals("Administrador"))
            {
                _pk_cliente = 0;
                _pk_admin = Convert.ToInt16(Session["ID"]);
                _pk_proveedor = 0;
                this.Page.Master.FindControl("menu_admin").Visible = true;
                this.Page.Master.FindControl("menu_cliente").Visible = false;
                this.Page.Master.FindControl("menu_proveedor").Visible = false;
                this.Page.Master.FindControl("menu_admin_").Visible = true;
                this.Page.Master.FindControl("menu_cliente_").Visible = false;
                this.Page.Master.FindControl("menu_proveedor_").Visible = false;
                this.hplAgregar.Visible = true;
            }

        }
        public void cargardatosGrid()
        {
            C_Contrato oContratos = new C_Contrato();
            ///Asignarle la fuente de datos al grid
          
          
            this.grdListaContratos.DataSource =
                oContratos.RetornarContratoDataGrid(true, 0);
            ///indicar al grid que se muestre
            this.grdListaContratos.DataBind();
          
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.carga();
        }

        protected void grdListaContratos_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.carga();
        }

        protected void grdListaContratos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            ///asignar al grid el nuevo índice de la página del grid
            this.grdListaContratos.PageIndex = e.NewPageIndex;
            ///asignar nuevamente la fuente de datos al grid
            this.carga();
        }

        public void carga()
        {
            string texto = this.DropDownList1.SelectedItem.ToString();
            C_Contrato oContratos = new C_Contrato();
            ///Asignarle la fuente de datos al grid
            int test = Convert.ToInt16(Session["ID"]); 
            if (texto.Equals("Activos"))
            {
                this.grdListaContratos.Columns[9].Visible = true;
                this.grdListaContratos.Columns[10].Visible = true;
                this.grdListaContratos.DataSource =
                    oContratos.RetornarContratoDataGrid(true, 0);
                ///indicar al grid que se muestre
                this.grdListaContratos.DataBind();
            }
            else
            {
                this.grdListaContratos.Columns[9].Visible = false;
                this.grdListaContratos.Columns[10].Visible = false;
                this.grdListaContratos.DataSource =
              oContratos.RetornarContratoDataGrid(false, 0);
                ///indicar al grid que se muestre
                this.grdListaContratos.DataBind();

            }
        }
    }
}