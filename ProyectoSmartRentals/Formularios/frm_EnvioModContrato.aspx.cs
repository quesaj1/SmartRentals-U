using ProyectoSmartRentals.Metodos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_EnvioModContrato : System.Web.UI.Page
    {

        int _pk_admin = 0;
        int _pk_cliente = 0;
        int _pk_proveedor = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            menu();



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

        protected void btnEnviar_Click(object sender, EventArgs e)

        {
            //string body =
            // "<body>" +
            // "<h1>Gracias por ponerse en contacto con Smart Rentals</h1>" +
            // "<span>Revisaremos su solicitud a la mayor brevedad con nuestros representantes</span>" +
            // "<br/></br><span>Saludos cordiales.</span>" +
            // "</body>";

            string elemento = txtElemento.Value.ToString();

            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.EnableSsl = true;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential(txtOrigen.Text, txtContrasena.Text);

            MailMessage mail = new MailMessage();
            mail.From = new MailAddress(txtOrigen.Text, "Smart Rentals Clientes");
            mail.To.Add(new MailAddress("info.smartrentals@gmail.com"));
            mail.Subject = "Solicitud modificacion de Contrato";
            mail.IsBodyHtml = true;
            mail.Body = "NUMERO DE CONTRATO : " + txtContrato.Text + "<br/>" + "<br/>" +
                        "ELEMENTO A MODIFICAR : " + elemento.ToString() + "<br/>" + "<br/>" +
                        "JUSTIFICACION : " + txtJustifica.Text + "<br/>";
           
            smtp.Send(mail);

            this.lblResultado.
                            Text = "Se ha enviado el correo" ;

        }
            
         

        protected void btnAtras_Click(object sender, EventArgs e)
        {
           
        }

    }
}