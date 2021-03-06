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
    public partial class frm_ClienteElimina : System.Web.UI.Page
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
                this.hdlCliente.Value = this.Request.QueryString["cli_Cliente"];
                CargaDatosCliente();
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

        void CargaDatosCliente()
        {
            ///obtener el valor del parámetro que fue asignado al hidden
            ///en el page_Load
            string llavePrimaria = this.hdlCliente.Value;
            if (!string.IsNullOrEmpty(llavePrimaria))
            {
                int id_Cliente = Convert.ToInt16(llavePrimaria);
                C_Clientes oAdminRentals = new C_Clientes();
                ///Crear la instancia del objeto de retorno
                ///del procedimiento almacenado
                sp_RetornaClienteID_Result resultadoSp = oAdminRentals.RetornaClienteID(id_Cliente);

                ///validar que el procedimiento retorne un valor
                if (resultadoSp != null)
                {
                    this.txtIdCliente.Text = resultadoSp.cli_Cliente.ToString();
                    this.txtCedula.Text = resultadoSp.cli_Cedula;
                    this.txtNombre.Text = resultadoSp.cli_Nombre;
                    this.txtSegundoNombre.Text = resultadoSp.cli_SegundoNombre;
                    this.txtPrimerApellido.Text = resultadoSp.cli_PrimerApelido;
                    this.txtSegundoApellido.Text = resultadoSp.cli_SegundoApellido;
                    Nullable<DateTime> fecha = resultadoSp.cli_FechaNacimiento;
                    this.txtTelefonoCasa.Text = resultadoSp.cli_TelefonoCasa;
                    this.txtTelefonoCelular.Text = resultadoSp.cli_TelefonoCelular;
                    this.txtEmail.Text = resultadoSp.cli_Email;
                    this.fechanacimiento.Value = fecha.HasValue ? fecha.Value.ToString("yyyy-MM-dd") : "<not available>";
                }

            }
        }




        protected void btnAtras_Click(object sender, EventArgs e)
        {

        }



        protected void btnAgregar_Click(object sender, EventArgs e)
        {
        
            if (this.IsValid)
            {

                int id_cliente = 0;

                id_cliente = Convert.ToInt16(this.hdlCliente.Value);

                try
                {
                    C_Clientes oClientes = new C_Clientes();


                    if (oClientes.EliminarCliente(id_cliente, false))

                        
                        ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeSuccess()", true);
                  

                    else
                       
                        ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeError()", true);
                }
                catch (Exception error)
                {
                    
                    ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeError()", true);
                }

            }
        }

        public void limpiardatos()
        {
            this.txtCedula.Text = null;
            this.txtNombre.Text = null;
            this.txtSegundoNombre.Text = null;
            this.txtPrimerApellido.Text = null;
            this.txtSegundoApellido.Text = null;
            this.txtTelefonoCasa.Text = null;
            this.txtTelefonoCelular.Text = null;
            this.txtEmail.Text = null;

        }

        protected void ShowPopup(object sender, EventArgs e)
        {
            string title = "Eliminar registro";
            string body =
                         "Esta seguro de eliminar este cliente?" + "<br/>" + "<br/>" +
                         "No. Cliente :" + "&nbsp" + txtIdCliente.Text + "<br/>" +
                         "--------------------------------------------------------" + "<br/>" +
                         "Cedula :" + "&nbsp;&nbsp " + txtCedula.Text + "<br/>" +
                         "--------------------------------------------------------" + "<br/>" +
                          "Nombre :" + "&nbsp;&nbsp " + txtNombre.Text + "<br/>" +
                         "--------------------------------------------------------" + "<br/>" +
                           "Primer Apellido :" + "&nbsp;&nbsp " + txtPrimerApellido.Text + "<br/>" +
                         "--------------------------------------------------------" + "<br/>" +
                           "Segundo Apellido :" + "&nbsp;&nbsp " + txtSegundoApellido.Text + "<br/>" +
                          "--------------------------------------------------------" + "<br/>" +
                           "Fecha Nacimiento :" + "&nbsp;&nbsp " + fechanacimiento.Value + "<br/>"+
                            "--------------------------------------------------------" + "<br/>" +
                            "Telefono Casa :" + "&nbsp;&nbsp " + txtTelefonoCasa.Text + "<br/>" +
                           "--------------------------------------------------------" + "<br/>" +
                            "Celular :" + "&nbsp;&nbsp " + txtTelefonoCelular.Text + "<br/>" +
                            "--------------------------------------------------------" + "<br/>" +
                            "Correo Electronico :" + "&nbsp;&nbsp " + txtEmail.Text + "<br/>" ;



            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
        }
    }
}