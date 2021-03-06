﻿using System;
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
                menu();
                this.CargaDatosGrid();

            }


           
               

            
        }


        #region Carga DatosGrid
      public void CargaDatosGrid()
        {

            C_Clientes oClientes = new C_Clientes();
            ///Asignarle la fuente de datos al grid
            this.grdListaClientes.DataSource =  oClientes.RetornarClienteDataGrid_Result(true);
            ///indicar al grid que se muestre
            this.grdListaClientes.DataBind();
        }
        #endregion



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

        public void CargaDatos()
        {
            string texto = this.DropDownList1.SelectedItem.ToString();
            C_Clientes oCliente = new C_Clientes();
            ///Asignarle la fuente de datos al grid


            if (texto.Equals("Activos"))
            {

                this.grdListaClientes.Columns[9].Visible = true;
                this.grdListaClientes.Columns[10].Visible = true;
                this.grdListaClientes.DataSource =
                    oCliente.RetornarClienteDataGrid_Result(true);
                ///indicar al grid que se muestre
                this.grdListaClientes.DataBind();



            }
            else
            {
                this.grdListaClientes.Columns[9].Visible = false;
                this.grdListaClientes.Columns[10].Visible = false;
                this.grdListaClientes.DataSource =
              oCliente.RetornarClienteDataGrid_Result(false);
                ///indicar al grid que se muestre
                this.grdListaClientes.DataBind();

            }

        }

        protected void grdListaClientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            ///asignar al grid el nuevo índice de la página del grid
            this.grdListaClientes.PageIndex = e.NewPageIndex;
            ///asignar nuevamente la fuente de datos al grid
            this.CargaDatos();
        }

      
    }
}