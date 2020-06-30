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
        protected void Page_Load(object sender, EventArgs e)
        {

        
            
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