﻿using ProyectoSmartRentals.Metodos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Net.Mime;

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

            if (this.IsValid)
            {

                //string body =
                // "<body>" +
                // "<h1>Gracias por ponerse en contacto con Smart Rentals</h1>" +
                // "<span>Revisaremos su solicitud a la mayor brevedad con nuestros representantes</span>" +
                // "<br/></br><span>Saludos cordiales.</span>" +
                // "</body>";
                string stImagen;
                string elemento = txtElemento.Value.ToString();

                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential("info.smartrentals@gmail.com", "Clover20*");

                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("info.smartrentals@gmail.com", "Smart Rentals Clientes");
                mail.To.Add(new MailAddress("info.smartrentals@gmail.com"));
                mail.Subject = "Solicitud modificacion de Contrato" + " | " + txtContrato.Text;
                mail.IsBodyHtml = true;
                mail.Body = "NUMERO DE CONTRATO : " + txtContrato.Text + "<br/>" + "<br/>" +
                            "CORREO DE CLIENTE : " + txtOrigen.Text + "<br/>" + "<br/>" +
                            "TELEFONO DE CLIENTE : " + txtTelefono.Text + "<br/>" + "<br/>" +
                            "ELEMENTO A MODIFICAR : " + elemento.ToString() + "<br/>" + "<br/>" +
                            "JUSTIFICACION : " + txtJustifica.Text + "<br/>" +
                            "<img style='padding: 0; display: block' src='cid:imagen' >";
                AlternateView htmlView = AlternateView.CreateAlternateViewFromString(mail.Body, Encoding.UTF8, MediaTypeNames.Text.Html);
                stImagen = Server.MapPath("~") + @"\images\FIRMA.jpg";
                LinkedResource img = new LinkedResource(stImagen, MediaTypeNames.Image.Jpeg); img.ContentId = "imagen";
                htmlView.LinkedResources.Add(img);
                mail.AlternateViews.Add(htmlView);

                smtp.Send(mail);




                /// this.lblResultado.Text = "Registro Modificado";
                ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeSuccess()", true);

            }
            else
            {
                //this.lblResultado.Text = "No se pudo modificar";
                ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeError()", true);
            }

        }

            protected void btnAtras_Click(object sender, EventArgs e)
        {
           
        }

    }
}