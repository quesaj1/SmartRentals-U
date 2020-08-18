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

        
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        void construirReporte()
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
                List<sp_RetornaGastosCat_Result> datosReporte =
                    this.retornaDatosReporte(this.txtCategoria.Value.ToString());
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