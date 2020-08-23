using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoSmartRentals.Modelos;
using ProyectoSmartRentals.Metodos;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using Microsoft.Reporting.WebForms;
using C_ReportePago = ProyectoSmartRentals.Metodos.C_ReportePago;

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_ReporteReportarPagos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                DropDownClientes();

            }
        }

     


        #region Llenado de los dropdown Reporte Pagos
        //conexion a la base de datos para los dropdown list
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


    

        private void DropDownClientes()
        {
            DropDownCliente.DataSource = Consultar(" select cli_cliente, cli_PrimerApelido+', '+ cli_SegundoApellido+ ', ' + cli_nombre as datosCliente from C_Cliente");
            DropDownCliente.DataTextField = "datosCliente";
            DropDownCliente.DataValueField = "cli_cliente";
            DropDownCliente.DataBind();
            DropDownCliente.Items.Insert(0, new ListItem("[Seleccione un cliente]", "0"));

        }

        private void DropDownContrato()
        {
            string c = this.DropDownCliente.SelectedValue;
            DropDownContratos.DataSource = Consultar("select a.id_ctr_contrato, a.ctr_numerocontrato from C_Contratos a inner join C_Cliente b on a.fk_cli_cliente = b.cli_Cliente where fk_cli_cliente = " + c);
            DropDownContratos.DataTextField = "ctr_numeroContrato";
            DropDownContratos.DataValueField = "id_ctr_contrato";
            DropDownContratos.DataBind();



        }




        #endregion


        #region Crear reportes

        void contruirReporte()
        {

            ///indicar la ruta del reporte
            string rutaReporte = "~/Reportes/R_ReportarPagosClientes.rdlc";
            ///construir la ruta física
            string rutaServidor = Server.MapPath(rutaReporte);
            ///Validar que la ruta física exista
            if (!File.Exists(rutaServidor))
            {
                this.Label1.Text =
                    "El reporte seleccionado no existe";
                return;
            }
            else
            {

                int fk_cli_cliente = Convert.ToInt16(this.DropDownCliente.Text.ToString());
                int fk_ctr_IDContrato = Convert.ToInt16(this.DropDownCliente.Text.ToString());

                DateTime now = DateTime.Now;
                prvReportarPagos.Visible = true;
                prvReportarPagos.LocalReport.ReportPath = rutaServidor;
                var infoFuenteDatos = this.prvReportarPagos.LocalReport.GetDataSourceNames();
                ///limpiar los datos de la fuente de datos
                prvReportarPagos.LocalReport.DataSources.Clear();
                ///obtener los datos del reporte
                List<sp_RetornaReportarPago_Result> datosReporte =
                    this.retornaDatosReportePagos(0, fk_cli_cliente, fk_ctr_IDContrato, now, true,"");
                ///crear la fuente de datos
                ReportDataSource fuenteDatos = new ReportDataSource();
                fuenteDatos.Name = infoFuenteDatos[0];
                fuenteDatos.Value = datosReporte;
                // agregar la fuente de datos al reporte
                this.prvReportarPagos.LocalReport.DataSources.Add(fuenteDatos);

                /// mostrar los datos en el reporte
                this.prvReportarPagos.LocalReport.Refresh();
            }
        }

        List<sp_RetornaReportarPago_Result> retornaDatosReportePagos(int rpp_IDReportarPago, int fk_cli_cliente, int fk_ctr_IDContrato, 
            DateTime? rpp_FechaPagoRecibido, bool rpp_estadoDePago, string rpp_DetallesDePago)
        {
            return
                new C_ReportePago().RetornarReportarPago(rpp_IDReportarPago, fk_cli_cliente, fk_ctr_IDContrato, rpp_FechaPagoRecibido, rpp_estadoDePago, rpp_DetallesDePago);


        }
        #endregion

        #region Crear Grafico

        void contruirReporteGrafico()
        {

            ///indicar la ruta del reporte
            string rutaReporte = "~/Reportes/R_RepotarPagosGrafico.rdlc";
            ///construir la ruta física
            string rutaServidor = Server.MapPath(rutaReporte);
            ///Validar que la ruta física exista
            if (!File.Exists(rutaServidor))
            {
                this.Label1.Text =
                    "El reporte seleccionado no existe";
                return;
            }
            else
            {
                DateTime now = DateTime.Now;
                prvReportarPagos.Visible = true;
                prvReportarPagos.LocalReport.ReportPath = rutaServidor;
                var infoFuenteDatos = this.prvReportarPagos.LocalReport.GetDataSourceNames();
                ///limpiar los datos de la fuente de datos
                prvReportarPagos.LocalReport.DataSources.Clear();
                ///obtener los datos del reporte
                ///


                int fk_cli_cliente = Convert.ToInt32(this.DropDownCliente.Text.ToString());
                int fk_ctr_IDContrato = Convert.ToInt32(this.DropDownContratos.Text.ToString());
                List<sp_RetornaReportarPago_Result> datosReporte =
                    this.retornaDatosReportePagosGF(0, fk_cli_cliente, fk_ctr_IDContrato, now, true, "");
                ///crear la fuente de datos
                ReportDataSource fuenteDatos = new ReportDataSource();
                fuenteDatos.Name = infoFuenteDatos[0];
                fuenteDatos.Value = datosReporte;
                // agregar la fuente de datos al reporte
                this.prvReportarPagos.LocalReport.DataSources.Add(fuenteDatos);

                /// mostrar los datos en el reporte
                this.prvReportarPagos.LocalReport.Refresh();
            }
        }

        List<sp_RetornaReportarPago_Result> retornaDatosReportePagosGF(int rpp_IDReportarPago, int fk_cli_cliente, int fk_ctr_IDContrato,
            DateTime? rpp_FechaPagoRecibido, bool rpp_estadoDePago, string rpp_DetallesDePago)
        {
            return
                new C_ReportePago().RetornarReportarPago(rpp_IDReportarPago, fk_cli_cliente, fk_ctr_IDContrato, rpp_FechaPagoRecibido, rpp_estadoDePago, rpp_DetallesDePago);


        }
        #endregion

        protected void Button2_Click1(object sender, EventArgs e)
        {
            contruirReporte();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            contruirReporteGrafico();
        }

        protected void DropDownCliente_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.DropDownContrato();
 
        }
    }
}