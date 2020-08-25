using ProyectoSmartRentals.Metodos;
using ProyectoSmartRentals.Modelos;
using System;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Text;

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_RestablecerContrasena : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Page.Master.FindControl("menu_admin").Visible = false;
            this.Page.Master.FindControl("menu_cliente").Visible = false;
            this.Page.Master.FindControl("menu_proveedor").Visible = false;
            this.Page.Master.FindControl("menu_admin_").Visible = false;
            this.Page.Master.FindControl("menu_cliente_").Visible = false;
            this.Page.Master.FindControl("menu_proveedor_").Visible = false;
            this.Page.Master.FindControl("menu_horizontal").Visible = false;
            this.Page.Master.FindControl("logout").Visible = false;
            this.Page.Master.FindControl("logout_").Visible = false;
            this.Page.Master.FindControl("info_user").Visible = false;
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {

            if (existe(this.txtUsuario.Text))
            {

                Metodos.C_Usuario m = new Metodos.C_Usuario();
                C_PasswordClass p = new C_PasswordClass();
                string randompass = p.randompass();

                m.OlvidaPassword(this.txtUsuario.Text, p.encryptpass(randompass));

                ///////

                string stImagen;


                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential("info.smartrentals@gmail.com", "Clover2020*");

                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("info.smartrentals@gmail.com", "Smart Rentals Clientes");
                mail.To.Add(new MailAddress(this.txtUsuario.Text));
                mail.Subject = "Nueva Contraseña - Smart Rentals";
                mail.IsBodyHtml = true;
                mail.Body = "Se ha creado una nueva contraseña temporal, inicie sesión para configurar su nueva contraseña:" + "<br/>" + "<br/>" +
                            "NOMBRE DE USUARIO : " + this.txtUsuario.Text + "<br/>" + "<br/>" +
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



                ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeSuccess()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeError()", true);
            }

        }

        bool existe(string user)
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
    }
}