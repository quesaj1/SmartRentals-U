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

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_ReporteGastos : System.Web.UI.Page
    {

        int _pk_admin = 0;
        int _pk_cliente = 0;
        int _pk_proveedor = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["UserName"] == null) { 
                Response.Redirect("frm_Login.aspx?error=jwP46Q", true);
           
            }
            else
            { 
                menu();
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
            string rutaReporte = "~/Reportes/R_Gastos.rdlc";
            ///construir la ruta física
            string rutaServidor = Server.MapPath(rutaReporte);

            user.Value = Session["Nombre"].ToString();
            ReportParameterCollection reportParameters = new ReportParameterCollection();
            reportParameters.Add(new ReportParameter("ReportParameterUser", user.Value));

            ///Validar que la ruta física exista
            if (!File.Exists(rutaServidor))
            {
                this.Label1.Text =
                    "El reporte seleccionado no existe";
                return;
            }
            else
            {
                rpvGastos.Visible = true;
                rpvGastos.LocalReport.ReportPath = rutaServidor;
                var infoFuenteDatos = this.rpvGastos.LocalReport.GetDataSourceNames();
                ///limpiar los datos de la fuente de datos
                rpvGastos.LocalReport.DataSources.Clear();
                ///obtener los datos del reporte
                List<sp_RetornaGastosCat_Result> datosReporte =
                    this.retornaDatosReporte(this.txtCategoria.Value.ToString());
                ///crear la fuente de datos
                ReportDataSource fuenteDatos = new ReportDataSource();
                fuenteDatos.Name = infoFuenteDatos[0];
                fuenteDatos.Value = datosReporte;
                // agregar la fuente de datos al reporte
                this.rpvGastos.LocalReport.DataSources.Add(fuenteDatos);
                this.rpvGastos.LocalReport.SetParameters(reportParameters);

                /// mostrar los datos en el reporte
                this.rpvGastos.LocalReport.Refresh();
            }
        }
        /// <summary>
        /// Función que retorna la fuente de datos a mostrar en el reporte
        /// </summary>
        /// <param name="pPrimerApellido"></param>
        /// <param name="pNombre"></param>
        /// <returns></returns>
        List<sp_RetornaGastosCat_Result>retornaDatosReporte(
            string tqt_tipo_problema)
        {
            return
                new C_Tiquetes().RetornarGastosCat(tqt_tipo_problema);

        }


        void construirReporteCal()
        {

            ///indicar la ruta del reporte
            string rutaReporte = "~/Reportes/R_Gastos.rdlc";
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
                rpvGastos.Visible = true;
                rpvGastos.LocalReport.ReportPath = rutaServidor;
                var infoFuenteDatos = this.rpvGastos.LocalReport.GetDataSourceNames();
                ///limpiar los datos de la fuente de datos
                rpvGastos.LocalReport.DataSources.Clear();
                ///obtener los datos del reporte
                ///

               
                DateTime inicio = DateTime.ParseExact(this.Inicio.Text, "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);
                DateTime final = DateTime.ParseExact(this.Final.Text, "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);

               

               
                List<sp_RetornaGastosCalend_Result> datosReporte =
                this.retornaDatosReporteCal(inicio, final);
                ///crear la fuente de datos
                ReportDataSource fuenteDatos = new ReportDataSource();
                fuenteDatos.Name = infoFuenteDatos[0];
                fuenteDatos.Value = datosReporte;
                // agregar la fuente de datos al reporte
                this.rpvGastos.LocalReport.DataSources.Add(fuenteDatos);

                /// mostrar los datos en el reporte
                this.rpvGastos.LocalReport.Refresh();
            }
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



            protected void Button2_Click(object sender, EventArgs e)
        {
            construirReporte();
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            construirReporteCal();
        }
    }
}