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
        int _pk_admin = 0;
        int _pk_cliente = 0;
        int _pk_proveedor = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {


                if (Session["UserName"] == null)
                {
                    Response.Redirect("frm_Login.aspx?error=jwP46Q", true);
                }
                else
                {
                    cargardatosGrid(_pk_admin);
                    menu();

                }
               
            }

        }


        public void cargardatosGrid(int pk_admin)
        {
            C_ReportePago oReportarPago = new C_ReportePago();
            ///Asignarle la fuente de datos al grid
            this.grdListaPagos.DataSource =
                oReportarPago.RetornaPagosRealizadosDataGrid(true, pk_admin);
            ///indicar al grid que se muestre
            this.grdListaPagos.DataBind();

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
                Response.Redirect("frm_inicioMenu.aspx?error=zW2aqP", false);

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
                Response.Redirect("frm_inicioMenu.aspx?error=zW2aqP", false);
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

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.CargaDatos();
        }

        protected void grdListaPagos_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }

        public void CargaDatos()
        {
            string texto = this.DropDownList1.SelectedItem.ToString();
            C_ReportePago oReportarPago = new C_ReportePago();
            ///Asignarle la fuente de datos al grid

            if (texto.Equals("Pagos Realizados"))
            {
                this.grdListaPagos.DataSource =
                    oReportarPago.RetornaPagosRealizadosDataGrid(true, _pk_admin);
                ///indicar al grid que se muestre
                this.grdListaPagos.DataBind();
            }
            else
            {
                this.grdListaPagos.DataSource =
              oReportarPago.RetornaPagosRealizadosDataGrid(false, _pk_admin);
                ///indicar al grid que se muestre
                this.grdListaPagos.DataBind();
            }
        }
        protected void grdListaPagos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            ///asignar al grid el nuevo índice de la página del grid
            this.grdListaPagos.PageIndex = e.NewPageIndex;
            ///asignar nuevamente la fuente de datos al grid
            this.cargardatosGrid(_pk_admin);
        }
    }
}