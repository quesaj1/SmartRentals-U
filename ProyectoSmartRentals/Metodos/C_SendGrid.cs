using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Net.Mime;
using System.Text;

namespace ProyectoSmartRentals.Metodos
{
    public class C_SendGrid
    {

    
            public void sendEmail(string email, string nombre, string link)
            {
                string stImagen;
            

                    System.Net.Mail.MailMessage msg = new System.Net.Mail.MailMessage();
                    msg.To.Add(email);
                    msg.Subject = "Hola " + nombre + ", bienvenido a Smart Rentals";
                    msg.SubjectEncoding = System.Text.Encoding.UTF8;




                    string html = "<br> <br> Su nombre de usuario es:" + email + "<br/>" + "<br/>" +
                        "Para configurar su contraseña, favor ir al siguiente enlace: " + link + "<br/>" + "<br/>" +
                
                        "<img style='padding: 0; display: block' src='cid:imagen' >";
                    AlternateView htmlView = AlternateView.CreateAlternateViewFromString(html, Encoding.UTF8, MediaTypeNames.Text.Html);
                    stImagen = HttpContext.Current.Server.MapPath("~") + @"\images\FIRMA.jpg";
                    LinkedResource img = new LinkedResource(stImagen, MediaTypeNames.Image.Jpeg); img.ContentId = "imagen";
                    htmlView.LinkedResources.Add(img);
                    msg.AlternateViews.Add(htmlView);


                    msg.BodyEncoding = System.Text.Encoding.UTF8;
                    msg.IsBodyHtml = true;
                    msg.From = new System.Net.Mail.MailAddress("info.smartrentals@gmail.com");

                    //Cliente Correo
                    System.Net.Mail.SmtpClient cliente = new System.Net.Mail.SmtpClient();
                    cliente.Credentials = new System.Net.NetworkCredential("info.smartrentals@gmail.com", "Clover20*");
                    cliente.Port = 587;
                    cliente.EnableSsl = true;
                    cliente.Host = "smtp.gmail.com";//Correo diferente mail.dominio.com
                    try
                    {
                        cliente.Send(msg);
                    }
                    catch (Exception error)
                    {

                     
                    }

                
            }
        }

    
}