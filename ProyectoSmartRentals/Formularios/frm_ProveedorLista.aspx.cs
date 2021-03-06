﻿using System;
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
        int _pk_admin = 0;
        int _pk_cliente = 0;
        int _pk_proveedor = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["UserName"] == null)
            {
                Response.Redirect("frm_Login.aspx?error=jwP46Q", true);
            }
            else
            {
                CargaDatosGrid();
                menu();

            }
          
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
            this.CargaDatos();
        }


        public void CargaDatos()
        {
            string texto = this.DropDownList1.SelectedItem.ToString();
            C_Proveedor oProveedor = new C_Proveedor();
            ///Asignarle la fuente de datos al grid


            if (texto.Equals("Activos"))
            {

                this.grdProveedor.Columns[9].Visible = true;
                this.grdProveedor.Columns[10].Visible = true;
                this.grdProveedor.DataSource =
                    oProveedor.RetornarProveedorDataGrid(true);
                ///indicar al grid que se muestre
                this.grdProveedor.DataBind();



            }
            else
            {
                this.grdProveedor.Columns[9].Visible = false;
                this.grdProveedor.Columns[10].Visible = false;
                this.grdProveedor.DataSource =
              oProveedor.RetornarProveedorDataGrid(false);
                ///indicar al grid que se muestre
                this.grdProveedor.DataBind();

            }

        }




        protected void grdProveedor_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            ///asignar al grid el nuevo índice de la página del grid
            this.grdProveedor.PageIndex = e.NewPageIndex;
            ///asignar nuevamente la fuente de datos al grid
            this.CargaDatos();
        }
    }
}