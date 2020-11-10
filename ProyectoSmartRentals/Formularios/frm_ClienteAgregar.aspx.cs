using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoSmartRentals.Metodos;
using ProyectoSmartRentals.Modelos;
using System;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Text;

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_ClienteAgregar : System.Web.UI.Page
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
            }



            
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {

            if (!clienteexiste(this.txtCedula.Text))
            {
                AgregarCliente();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeDuplicate()", true);
            }

            //AgregarCliente();
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
        void AgregarCliente()
        {
            try
            {

                string adr_Cedula = this.txtCedula.Text.ToString();
                string adr_Nombre = this.txtNombre.Text.ToString();
                string adr_SegundoNombre = this.txtSegundoNombre.Text.ToString();
                string adr_PrimerApellido = this.txtPrimerApellido.Text.ToString();
                string adr_SegundoApellido = this.txtSegundoApellido.Text.ToString();
                Nullable<System.DateTime> adr_FechaNacimiento = Convert.ToDateTime(this.txtFechaNacimiento.Text);
                string adr_TelefonoCasa = this.txtTelefonoCasa.Text.ToString();
                string adr_TelefonoCelular = this.txtTelefonoCelular.Text.ToString();
                string adr_Email = this.txtEmail.Text.ToString();

                if (!existe(adr_Email))
                {

                    C_Clientes oCliente = new C_Clientes();
                bool ClienteInsertar =
                    oCliente.InsertaCliente(adr_Cedula, adr_Nombre, adr_SegundoNombre, adr_PrimerApellido, adr_SegundoApellido, adr_FechaNacimiento, adr_TelefonoCasa, adr_TelefonoCelular, adr_Email,true);


                if (ClienteInsertar)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeSuccess()", true);

                    Metodos.C_Usuario oUsuario = new Metodos.C_Usuario();
                    int id = oUsuario.obtiene_id_principal(adr_Email, 2);

                        C_PasswordClass m = new C_PasswordClass();

                        string randompass = m.randompass();

                        oUsuario.InsertaUsuario(adr_Email, 2, id, m.encryptpass(randompass));

                        ///////

                        string stImagen;


                        SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                        smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                        smtp.EnableSsl = true;
                        smtp.UseDefaultCredentials = false;
                        smtp.Credentials = new NetworkCredential("info.smartrentals@gmail.com", "Clover2020*");

                        MailMessage mail = new MailMessage();
                        mail.From = new MailAddress("info.smartrentals@gmail.com", "Smart Rentals Clientes");
                        mail.To.Add(new MailAddress(adr_Email));
                        mail.Subject = "Usuario Nuevo Creado - Smart Rentals";
                        mail.IsBodyHtml = true;
                        mail.Body = "Se ha creado un nuevo usuario y contraseña, inicie sesión por primera vez para configurar su contraseña:" + "<br/>" + "<br/>" +
                                    "NOMBRE DE USUARIO : " + adr_Email + "<br/>" + "<br/>" +
                                    "CONTRASEÑA TEMPORAL : " + randompass + "<br/>" + "<br/>" +
                                      "ENLACE: http://smartrentalscr.com/" +

                                    "<img style='padding: 0; display: block' src='cid:imagen' >";
                        AlternateView htmlView = AlternateView.CreateAlternateViewFromString(mail.Body, Encoding.UTF8, MediaTypeNames.Text.Html);
                        stImagen = Server.MapPath("~") + @"\images\Logo_SRCR.png";
                        LinkedResource img = new LinkedResource(stImagen, MediaTypeNames.Image.Jpeg); img.ContentId = "imagen";
                        htmlView.LinkedResources.Add(img);
                        mail.AlternateViews.Add(htmlView);

                        smtp.Send(mail);





                        //////////

                        this.limpiardatos();
                        ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeSuccess()", true);

                    }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeError()", true);

                }

                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeError()", true);
                }

            }
            catch (Exception error)
            {

                ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeError()", true);
            }
        }

        bool existe(string user)
        {

            string llavePrimaria = this.txtEmail.Text;
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
                    return true;
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


        bool clienteexiste(string user)
        {

            string llavePrimaria = this.txtCedula.Text;
            if (!string.IsNullOrEmpty(llavePrimaria))
            {
                string userid = llavePrimaria;
                Metodos.C_Clientes oUsuario = new Metodos.C_Clientes();
                ///Crear la instancia del objeto de retorno
                ///del procedimiento almacenado
                sp_RetornaClienteName_Result resultadoSp = oUsuario.RetornaClientename(userid);

                ///validar que el procedimiento retorne un valor
                if (resultadoSp != null)
                {
                    return true;
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

        protected void btnAtras_Click(object sender, EventArgs e)
        {

        }
    }
}