using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoSmartRentals.Metodos;

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_ReportarPagoAgregar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                DropDownClientes();
                DropDownContrato();
                DropDownClientesEmail();

            }
        }

        //private void IniciarLlenadoDropDown()
        //{
        //    DropDownListCliente.DataSource = Consultar("Select * from dbo.C_Cliente");
        //    DropDownListCliente.DataTextField = "cli_Cliente";
        //    DropDownListCliente.DataValueField = "cli_Cliente";
        //    DropDownListCliente.DataBind();
        //    DropDownListCliente.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
        //    DropDownListContrato.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
        //}


        //protected void ContratoSeleccion(object sender, EventArgs e)
        //{
        //    int cli_Cliente = Convert.ToInt32(DropDownListCliente.SelectedValue);
        //    DropDownListContrato.DataSource = Consultar("Select * from dbo.C_Contratos where fk_cli_cliente=" + cli_Cliente);
        //    DropDownListContrato.DataTextField = "ctr_numeroContrato";
        //    DropDownListContrato.DataValueField = "id_ctr_contrato";
        //    DropDownListContrato.DataBind();
        //    DropDownListContrato.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
        //}



        //private void DropDownClienteEmail()
        //{

        //    DropDownListEmail.DataSource = Consultar("select  * from C_Cliente");
        //    DropDownListEmail.DataTextField = "cli_Email";
        //    DropDownListEmail.DataValueField = "cli_Cliente";
        //    DropDownListEmail.DataBind();
        //    DropDownListEmail.Items.Insert(0, new ListItem("[Seleccione el mail del usuario]", "0"));


        //}


        private void DropDownClientesEmail()
        {
            DropDownListEmail.DataSource = Consultar("select  * from C_Cliente");
            DropDownListEmail.DataTextField = "cli_Email";
            DropDownListEmail.DataValueField = "cli_Cliente";
            DropDownListEmail.DataBind();
            DropDownListEmail.Items.Insert(0, new ListItem("[Seleccione el mail del usuario]", "0"));

        }

        private void DropDownClientes()
        {
            DropDownListCliente.DataSource = Consultar("select cli_cliente,cli_Cedula +', '+ cli_PrimerApelido+', '+ cli_SegundoApellido + ', '+ cli_nombre as datosCliente from C_Cliente");
            DropDownListCliente.DataTextField = "datosCliente";
            DropDownListCliente.DataValueField = "cli_Cliente";
            DropDownListCliente.DataBind();
            DropDownListCliente.Items.Insert(0, new ListItem("[Seleccione un cliente]", "0"));


        }

        private void DropDownContrato()
        {
            DropDownListContrato.DataSource = Consultar("select * from C_Contratos");
            DropDownListContrato.DataTextField = "ctr_numeroContrato";
            DropDownListContrato.DataValueField = "id_ctr_contrato";
            DropDownListContrato.DataBind();
            DropDownListContrato.Items.Insert(0, new ListItem("[Seleccione el numero de contrato]", "0"));

        }




        public void agregarReportarPago()
        {
            try
            {
                int fk_cli_cliente = Convert.ToInt16(this.DropDownListCliente.Text.ToString());
                int fk_ctr_IDContrato = Convert.ToInt16(this.DropDownListContrato.Text.ToString());
                string rpp_FechaPagoRecibido = this.txtFechaPago.Text.ToString();
                string DetallesDePago = txtDetallesDePago.Value.ToString();
                DateTime now = DateTime.Now;

                //Hay que tomar la fecha con el datepicker


                C_ReportePago oReportePago = new C_ReportePago();
                bool ContratoInsertar =
                    oReportePago.InsertarPago(fk_cli_cliente, fk_ctr_IDContrato, now, true, DetallesDePago);


                if (ContratoInsertar)
                    this.lblResultado.Text = "Pago realizado correctamente";
                   
                else
                    this.lblResultado.Text = "No se pudo agregar el pago,por favor validar los datos";
            }
            catch (Exception error)
            {

                this.lblResultado.
                    Text = "Ocurrió un error:" + error.Message;
            }
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


        public void enviarNotficacionPago()
        {
            string stImagen;
            

        System.Net.Mail.MailMessage msg = new System.Net.Mail.MailMessage();
            msg.To.Add(this.DropDownListEmail.SelectedItem.ToString());
            msg.Subject = "Notificacion de Pago del aquiler en la fecha de:" + " " + this.txtFechaPago.Text.ToString();
            msg.SubjectEncoding = System.Text.Encoding.UTF8;


           

            string html ="<br> <br> Informacion del Cliente:" + this.DropDownListCliente.SelectedItem.ToString() + "<br/>" + "<br/>" +
                "NUMERO DE CONTRATO : " + this.DropDownListContrato.SelectedItem.ToString() + "<br/>" + "<br/>" +
                 "Detalles del Pago Adicionales : " + this.txtDetallesDePago.Value.ToString() + "<br/>" + "<br/>" +
                "<img style='padding: 0; display: block' src='cid:imagen' >";
            AlternateView htmlView = AlternateView.CreateAlternateViewFromString(html, Encoding.UTF8, MediaTypeNames.Text.Html);
            stImagen = Server.MapPath("~") + @"\images\FIRMA.jpg";
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

                this.lblResultado.
                     Text = "Ocurrió un error:" + error.Message;
            }
        }

        protected void btnAgregarPago_Click(object sender, EventArgs e)
        {
            agregarReportarPago();
            enviarNotficacionPago();
        }
    }
}