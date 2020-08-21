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
    public partial class frm_Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Page.Master.FindControl("menu_horizontal").Visible = false;
            this.Page.Master.FindControl("logout").Visible = false;
            this.Page.Master.FindControl("logout_").Visible = false;
            this.Page.Master.FindControl("info_user").Visible = false;
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            validacredenciales();
        }

        void validacredenciales()
        {

            string pass = retornaencpass(this.txtUsuario.Text);
            bool status = retornastatus(this.txtUsuario.Text);
            int tipo = retornatipousuario(this.txtUsuario.Text);

            if (pass != null)
            {
                if (pass == this.txtContrasena.Text)
                {
                    if (status)
                    {

                        Session["UserName"] = this.txtUsuario.Text;
                        Session["ID"] = retornaidprincipal(this.txtUsuario.Text);
                        Session["Nombre"] = retornanombre(tipo, retornaidprincipal(this.txtUsuario.Text));

                        Session["Tipo"] = "";

                        if (tipo == 1)
                        {
                            Session["Tipo"] = "Administrador";
                        }
                        else if (tipo == 2)
                        {
                            Session["Tipo"] = "Cliente";
                        }
                        else if (tipo == 3)
                        {
                            Session["Tipo"] = "Proveedor";
                        }
                        else
                        {
                            Session["Tipo"] = "Unknown";
                        }

                        Response.Redirect("frm_InicioMenu.aspx");

                    }
                    else
                    {
                        this.lblResultado.Text = "Usuario inactivo";
                    }
                }
                else
                {
                    this.lblResultado.Text = "Credenciales incorrectas";
                }
            }
            else
            {
                this.lblResultado.Text = "Usuario ingresado no existe";
            }
        }

        string retornaencpass(string user)
        {

            string llavePrimaria = this.txtUsuario.Text;
            if (!string.IsNullOrEmpty(llavePrimaria))
            {
                string userid = llavePrimaria;
                Metodos.C_Usuario oUsuario = new Metodos.C_Usuario();
                ///Crear la instancia del objeto de retorno
                ///del procedimiento almacenado
                sp_RetornaUsuarioUserID_Result resultadoSp = oUsuario.RetornaUsuarioUserID_Result(userid);

                ///validar que el procedimiento retorne un valor
                if (resultadoSp != null)
                {
                    return resultadoSp.enc_password;
                }
                else
                {
                    return null;
                }

            }
            else
            {
                return null;
            }
        }

        int retornatipousuario(string user)
        {

            string llavePrimaria = this.txtUsuario.Text;
            if (!string.IsNullOrEmpty(llavePrimaria))
            {
                string userid = llavePrimaria;
                Metodos.C_Usuario oUsuario = new Metodos.C_Usuario();
                ///Crear la instancia del objeto de retorno
                ///del procedimiento almacenado
                sp_RetornaUsuarioUserID_Result resultadoSp = oUsuario.RetornaUsuarioUserID_Result(userid);

                ///validar que el procedimiento retorne un valor
                if (resultadoSp != null)
                {
                    return resultadoSp.tipo;
                }
                else
                {
                    return 0;
                }

            }
            else
            {
                return 0;
            }
        }

        bool retornastatus(string user)
        {

            string llavePrimaria = this.txtUsuario.Text;
            if (!string.IsNullOrEmpty(llavePrimaria))
            {
                string userid = llavePrimaria;
                Metodos.C_Usuario oUsuario = new Metodos.C_Usuario();
                ///Crear la instancia del objeto de retorno
                ///del procedimiento almacenado
                sp_RetornaUsuarioUserID_Result resultadoSp = oUsuario.RetornaUsuarioUserID_Result(userid);

                ///validar que el procedimiento retorne un valor
                if (resultadoSp != null)
                {
                    return resultadoSp.activo;
                }
                else
                {
                    return false;
                }

            }
            else
            {
                return false;
            }
        }

        int retornaidprincipal(string user)
        {

            string llavePrimaria = this.txtUsuario.Text;
            if (!string.IsNullOrEmpty(llavePrimaria))
            {
                string userid = llavePrimaria;
                Metodos.C_Usuario oUsuario = new Metodos.C_Usuario();
                ///Crear la instancia del objeto de retorno
                ///del procedimiento almacenado
                sp_RetornaUsuarioUserID_Result resultadoSp = oUsuario.RetornaUsuarioUserID_Result(userid);

                ///validar que el procedimiento retorne un valor
                if (resultadoSp != null)
                {
                    return resultadoSp.id_principal;
                }
                else
                {
                    return 0;
                }

            }
            else
            {
                return 0;
            }
        }

        string retornanombre(int tipousuario, int idprinc)
        {
            string nombre = "";
            int llavePrimaria = idprinc;
         
                int id = llavePrimaria;
            
            if(tipousuario == 1)
            {

                Metodos.C_AdminRentals oadr  = new Metodos.C_AdminRentals();
    
                sp_RetornaAdminRentalID_Result resultadoSp = oadr.RetornaAdminRentalID(id);
                nombre = resultadoSp.adr_PrimerApellido +" "+ resultadoSp.adr_SegundoApellido + " , "+ resultadoSp.adr_Nombre;

            }else if(tipousuario == 2)
            {

                Metodos.C_Clientes ocl = new Metodos.C_Clientes();

                sp_RetornaClienteID_Result resultadoSp = ocl.RetornaClienteID(id);
                nombre = resultadoSp.cli_PrimerApelido + " " + resultadoSp.cli_SegundoApellido + " , " + resultadoSp.cli_Nombre;

            }else if(tipousuario == 3)
            {

                Metodos.C_Proveedor oprv = new Metodos.C_Proveedor();

                sp_RetornaProveedorID_Result resultadoSp = oprv.RetornarProveedorID(id);
                nombre = resultadoSp.prv_PrimerApellido + " " + resultadoSp.prv_SegundoApellido + " , " + resultadoSp.prv_NombreRepresentante;

            }

            return nombre;
         

        }

    }
}