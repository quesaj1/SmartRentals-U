using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoSmartRentals.Metodos;
using ProyectoSmartRentals.Modelos;
using C_ReportePago = ProyectoSmartRentals.Metodos.C_ReportePago;

namespace ProyectoSmartRentals.Formularios
{
  
    public partial class frm_ArchivarPagos : System.Web.UI.Page
    {
        int _pk_admin = 0;
        int _pk_cliente = 0;
        int _pk_proveedor = 0;
        int ClientesEmail;
        int Clientes ;
        int Contrato ;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.hdldPago.Value = this.Request.QueryString["rpp_IDReportarPago"];
            menu();
            CargaDatosPagos();
            DropDownClientes();
            DropDownContrato();
            DropDownClientesEmail();

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



        void CargaDatosPagos()
        {
            ///obtener el valor del parámetro que fue asignado al hidden
            ///en el page_Load
            string llavePrimaria = this.hdldPago.Value;

            if (!string.IsNullOrEmpty(llavePrimaria))

            {
                int rpp_IDReportarPago = Convert.ToInt16(llavePrimaria);
                C_ReportePago oReportePago = new C_ReportePago();

                ///Crear la instancia del objeto de retorno
                ///del procedimiento almacenado
                ///
                sp_RetornaPagoID_Result resultadoSp = oReportePago.RetornaPagoID(rpp_IDReportarPago);





                ///validar que el procedimiento retorne un valor
                if (resultadoSp != null)
                {
                    this.TexIDPago.Text = resultadoSp.rpp_IDReportarPago.ToString();
                    this.txtClienteEmail.Text = resultadoSp.fk_cli_cliente.ToString();
                    this.txtCliente.Text = resultadoSp.fk_cli_cliente.ToString();
                    this.txtContrato.Text = resultadoSp.fk_ctr_IDContrato.ToString();
                    this.txtFechaPago.Text = resultadoSp.rpp_FechaPagoRecibido.ToString();
                    this.txtDetallesDePago.Value = resultadoSp.rpp_DetallesDePago.ToString();
                    ClientesEmail = Convert.ToInt32(this.txtClienteEmail.Text);
                    Clientes = Convert.ToInt32(this.txtCliente.Text);
                    Contrato = Convert.ToInt32(this.txtContrato.Text);
                }

            }
        }





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

        protected void btnArchivarPago_Click(object sender, EventArgs e)
        {
            if (this.IsValid)
            {

                int rpp_IDReportarPago = 0;

                rpp_IDReportarPago = Convert.ToInt16(this.hdldPago.Value);

                try
                {
                    C_ReportePago oReportePago = new C_ReportePago();


                    if (oReportePago.ArchivarPago(rpp_IDReportarPago, false))

                       
                        ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeSuccess()", true);

                    else
                        
                        ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeError()", true);
                }
                catch (Exception error)
                {
                   
                    ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeError()", true);
                }

            }
        }

        protected void btnAtras_Click(object sender, EventArgs e)
        {

        }

        protected void ShowPopup(object sender, EventArgs e)
        {
            string title = "Archivar registro";
            string body =
                         "Esta seguro de eliminar este alquiler?" + "<br/>" + "<br/>" +
                         "No. Pago :" + "&nbsp" + TexIDPago.Text + "<br/>" +
                         "--------------------------------------------------------" + "<br/>" +
                         "Detalles de Pago :" + "&nbsp;&nbsp " + txtDetallesDePago.Value.ToString() + "<br/>" +
                         "--------------------------------------------------------" + "<br/>" +
                         "Cliente Email  :" + " &nbsp;&nbsp;&nbsp;&nbsp" + this.DropDownListEmail.SelectedItem.ToString() + "<br/>" +
                         "--------------------------------------------------------" + "<br/>" +
                         "Cliente :" + "  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp " + this.DropDownListCliente.SelectedItem.ToString() + "<br/>" +
                         "--------------------------------------------------------" + "<br/>" +
                         "Contrato :" + "  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp " + this.DropDownListContrato.SelectedItem.ToString() + "<br/>";

            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
        }
    }
}