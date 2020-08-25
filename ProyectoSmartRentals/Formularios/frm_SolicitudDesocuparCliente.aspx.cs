using ProyectoSmartRentals.Metodos;
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
using System.Data.SqlClient;
using System.Data;
using ProyectoSmartRentals.Modelos;

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_SolicitudDesocuparCliente : System.Web.UI.Page
    {
        int _pk_cliente = 0;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
                Response.Redirect("frm_Login.aspx?error=jwP46Q", true);
            else
            {


                _pk_cliente = Convert.ToInt16(Session["ID"]);
                if (!IsPostBack)
                {

                    DropDownContrato(_pk_cliente);
                    this.Page.Master.FindControl("menu_admin").Visible = false;
                    this.Page.Master.FindControl("menu_cliente").Visible = true;
                    this.Page.Master.FindControl("menu_proveedor").Visible = false;
                    this.Page.Master.FindControl("menu_admin_").Visible = false;
                    this.Page.Master.FindControl("menu_cliente_").Visible = true;
                    this.Page.Master.FindControl("menu_proveedor_").Visible = false;

                }

            }

        }


        protected void btnEnviar_Click(object sender, EventArgs e)

        {

            if (this.IsValid)
            {

                string stImagen;
               

                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential("info.smartrentals@gmail.com", "Clover20*");

                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("info.smartrentals@gmail.com", "Smart Rentals Clientes");
                mail.To.Add(new MailAddress("info.smartrentals@gmail.com"));
                mail.CC.Add(new MailAddress(txtOrigen.Text.ToString()));
                mail.Subject = "Solicitud de Desalojo" + " | " + DropDownContratos.SelectedItem.ToString();
                mail.IsBodyHtml = true;
                mail.Body = "Se ha recibido una solicitud de desalojo. Los detalles del cliente y fechas, a continuación:"+ "<br/>" + "<br/>" +
                            "NUMERO DE CONTRATO : " + DropDownContratos.SelectedItem.ToString() + "<br/>" + "<br/>" +
                            "CORREO DE CLIENTE : " + txtOrigen.Text + "<br/>" + "<br/>" +
                            "TELEFONO DE CLIENTE : " + txtTelefono.Text + "<br/>" + "<br/>" +
                            "FECHA DE DESALOJO : "+ txtFechaInicio.Text + "<br/>" + "<br/>"+
                            "<img style='padding: 0; display: block' src='cid:imagen' >";
                AlternateView htmlView = AlternateView.CreateAlternateViewFromString(mail.Body, Encoding.UTF8, MediaTypeNames.Text.Html);
                stImagen = Server.MapPath("~") + @"\images\Logo_SRCR.png";
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

        public DataSet Consultar(string strSQL)
        {
            string strconn = "data source=smartrentals.c97xkwmyluew.us-east-2.rds.amazonaws.com;initial catalog=SmartRentals;persist security info=True;user id=admin;password=SmartRentals20";
            SqlConnection con = new SqlConnection(strconn);
            con.Open();
            SqlCommand cmd = new SqlCommand(strSQL, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            return ds;

        }

        private void DropDownContrato(int fk_cliente)
        {

            if (Session["Tipo"].Equals("Cliente")) { 

            DropDownContratos.DataSource = Consultar("select id_ctr_contrato, ctr_numeroContrato " +
                 " from C_Contratos where ctr_activo = 1 and fk_cli_cliente = " + fk_cliente);
            DropDownContratos.DataTextField = "ctr_numeroContrato";
            DropDownContratos.DataValueField = "id_ctr_contrato";
            DropDownContratos.DataBind();
            DropDownContratos.Items.Insert(0, new ListItem("[Seleccionar]", "0"));

            }
            if (Session["Tipo"].Equals("Administrador"))
            {
                DropDownContratos.DataSource = Consultar("select id_ctr_contrato, ctr_numeroContrato " +
                " from C_Contratos where ctr_activo = 1");
                DropDownContratos.DataTextField = "ctr_numeroContrato";
                DropDownContratos.DataValueField = "id_ctr_contrato";
                DropDownContratos.DataBind();
                DropDownContratos.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
            }


            }
    }
}