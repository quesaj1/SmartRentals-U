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
                int contr = Convert.ToInt16(Session["ID"]);
              
                DropDownContrato(contr);
             

            }
        }

       


        private void DropDownClientesEmail()
        {
            int c = this.DropDownListContrato.SelectedIndex;
            DropDownListEmail.DataSource = Consultar("select id_ctr_contrato, b.cli_Email as Nombre from c_contratos a inner  join C_Cliente b on a.fk_cli_cliente = b.cli_Cliente where a.id_ctr_contrato = " + c);
            DropDownListEmail.DataTextField = "Nombre";
            DropDownListEmail.DataValueField = "id_ctr_contrato";
            DropDownListEmail.DataBind();
         

        }

        private void DropDownClientes()
        {
            int c = this.DropDownListContrato.SelectedIndex;
            DropDownListCliente.DataSource = Consultar("select b.cli_cliente, b.cli_PrimerApelido +', '+ b.cli_nombre as Nombre from c_contratos a inner join C_Cliente b on a.fk_cli_cliente = b.cli_Cliente where a.id_ctr_contrato = " + c);
            DropDownListCliente.DataTextField = "Nombre";
            DropDownListCliente.DataValueField = "cli_cliente";
            DropDownListCliente.DataBind();
           


        }
        private void DropDownMonto()
        {
            int c = this.DropDownListContrato.SelectedIndex;
            ddMonto.DataSource = Consultar("select id_ctr_contrato, ctr_monto from C_Contratos where id_ctr_contrato =" + c);
            ddMonto.DataTextField = "ctr_monto";
            ddMonto.DataValueField = "id_ctr_contrato";
            ddMonto.DataBind();



        }

        private void DropDownContrato(int _contrato)
        {
            DropDownListContrato.DataSource = Consultar("select * from C_Contratos where fk_adr_id_admin= "+_contrato);
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


                {
                    ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeSuccess()", true);
                    

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
            if (this.IsValid)
            {

                System.Net.Mail.MailMessage msg = new System.Net.Mail.MailMessage();
                msg.To.Add(this.DropDownListEmail.SelectedItem.ToString());
                msg.Subject = "Notificacion de Pago del aquiler en la fecha de:" + " " + this.txtFechaPago.Text.ToString();
                msg.SubjectEncoding = System.Text.Encoding.UTF8;




                string html = "<br> <br> Informacion del Cliente:" + this.DropDownListCliente.SelectedItem.ToString() + "<br/>" + "<br/>" +
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

                     ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeError()", true);
                }

            }
            else
            {


        }
        }


        protected void btnAgregarPago_Click(object sender, EventArgs e)
        {
            agregarReportarPago();
            enviarNotficacionPago();
        }

        protected void DropDownListContrato_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            this.DropDownClientes();
            DropDownClientesEmail();
            DropDownMonto();

        }
    }
}