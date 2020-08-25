using Microsoft.Reporting.WebForms;
using ProyectoSmartRentals.Metodos;
using ProyectoSmartRentals.Modelos;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_ReporteGananciasPerdidas : System.Web.UI.Page
    {
        int _pk_admin = 0;
        int _pk_cliente = 0;
        int _pk_proveedor = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["UserName"] == null)
            {
                Response.Redirect("frm_Login.aspx?error=jwP46Q", true);

            }
            else
            {
                menu();
            }

            if (!this.IsPostBack)
            {
                DropDownContrato();
            }

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
                Response.Redirect("frm_inicioMenu.aspx?error=zW2aqP", false);

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
                Response.Redirect("frm_inicioMenu.aspx?error=zW2aqP", false);
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



        void construirReporte()
        {

            ///indicar la ruta del reporte
            string rutaReporte = "~/Reportes/R_ReporteIngresosvsGastos.rdlc";
            ///construir la ruta física
            string rutaServidor = Server.MapPath(rutaReporte);

            user.Value = Session["Nombre"].ToString();
        /*    ReportParameterCollection reportParameters = new ReportParameterCollection();
            reportParameters.Add(new ReportParameter("ReportParameterUser", user.Value));*/

            ///Validar que la ruta física exista
            if (!File.Exists(rutaServidor))
            {
                this.Label1.Text =
                    "El reporte seleccionado no existe";
                return;
            }
            else
            {

                int contrato = Convert.ToInt32(DropDownContratos.SelectedValue);

                rpvBalance.Visible = true;
                rpvBalance.LocalReport.ReportPath = rutaServidor;
                var infoFuenteDatos = this.rpvBalance.LocalReport.GetDataSourceNames();
                ///limpiar los datos de la fuente de datos
                rpvBalance.LocalReport.DataSources.Clear();
                ///obtener los datos del reporte
                List<sp_RetornaTotalPagosReporte1_Result> datosReporte1 =
                    this.retornaDatosReporte1(contrato);
                ///crear la fuente de datos
                ReportDataSource fuenteDatos1 = new ReportDataSource();
                fuenteDatos1.Name = infoFuenteDatos[0];
                fuenteDatos1.Value = datosReporte1;
                // agregar la fuente de datos al reporte
                this.rpvBalance.LocalReport.DataSources.Add(fuenteDatos1);
                // this.rpvBalance.LocalReport.SetParameters(reportParameters);

                List<sp_RetornaTotalGastosTiquetes1_Result> datosReporte2 =
                    this.retornaDatosReporte2(contrato);

                ReportDataSource fuenteDatos2 = new ReportDataSource();
                fuenteDatos2.Name = infoFuenteDatos[1];
                fuenteDatos2.Value = datosReporte2;

                this.rpvBalance.LocalReport.DataSources.Add(fuenteDatos2);

                List<sp_RetornaGananciasPerdidas1_Result> datosReporte3 =
                    this.retornaDatosReporte3(contrato);

                ReportDataSource fuenteDatos3 = new ReportDataSource();
                fuenteDatos3.Name = infoFuenteDatos[2];
                fuenteDatos3.Value = datosReporte3;

                // agregar la fuente de datos al reporte
               // this.rpvBalance.LocalReport.DataSources.Add(fuenteDatos1);
                
                this.rpvBalance.LocalReport.DataSources.Add(fuenteDatos3);

                /// mostrar los datos en el reporte
                this.rpvBalance.LocalReport.Refresh();
            }
        }
        /// <summary>
        /// Función que retorna la fuente de datos a mostrar en el reporte
        /// </summary>
        /// <param name="pPrimerApellido"></param>
        /// <param name="pNombre"></param>
        /// <returns></returns>
        List<sp_RetornaTotalPagosReporte1_Result> retornaDatosReporte1(
            int id_contrato)
        {
            return

                new Metodos.C_ReportePago().RetornaTotalPagosReporte1(id_contrato,0,"");
        }

        List<sp_RetornaTotalGastosTiquetes1_Result> retornaDatosReporte2(
            int id_contrato)
        {
            return

                new Metodos.C_Tiquetes().RetornaGastosTiquetes1(id_contrato, 0, "",0);
        }

        List<sp_RetornaGananciasPerdidas1_Result> retornaDatosReporte3(
            int id_contrato)
        {
            return

                new Metodos.C_Tiquetes().RetornaGananciasPerdidas1(id_contrato, 0, 0, "", 0, 0, "", 0);
        }

        private void DropDownContrato()
        {

           
                DropDownContratos.DataSource = Consultar("select id_ctr_contrato, ctr_numeroContrato " +
                " from C_Contratos where ctr_activo = 1");
                DropDownContratos.DataTextField = "ctr_numeroContrato";
                DropDownContratos.DataValueField = "id_ctr_contrato";
                DropDownContratos.DataBind();
                DropDownContratos.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
            


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


        /// <summary>
        /// Función que retorna la fuente de datos a mostrar en el reporte
        /// </summary>
        /// <param name="pPrimerApellido"></param>
        /// <param name="pNombre"></param>
        /// <returns></returns>
        List<sp_RetornaGastosCalend_Result> retornaDatosReporteCal(
            DateTime tqt_fecha_inicio, DateTime tqt_fecha_finalizacion)
        {
            return

         
               new C_Tiquetes().RetornarGastosCalend(tqt_fecha_inicio, tqt_fecha_finalizacion);

        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            construirReporte();

        }

      
    }
}