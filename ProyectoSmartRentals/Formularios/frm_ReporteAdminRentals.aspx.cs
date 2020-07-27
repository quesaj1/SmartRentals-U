using Microsoft.Reporting.WebForms;
using ProyectoSmartRentals.Metodos;
using ProyectoSmartRentals.Modelos;
using System;
using System.Collections.Generic;
using System.IO;

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_ReporteAdminRentals : System.Web.UI.Page
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
        void contruirReporte()
        {

            ///indicar la ruta del reporte
            string rutaReporte = "~/Reportes/R_AdminRental.rdlc";
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
                RpvAdminRentals.Visible = true;
                RpvAdminRentals.LocalReport.ReportPath = rutaServidor;
                var infoFuenteDatos = this.RpvAdminRentals.LocalReport.GetDataSourceNames();
                ///limpiar los datos de la fuente de datos
                RpvAdminRentals.LocalReport.DataSources.Clear();
                ///obtener los datos del reporte
                List<sp_RetornaAdminRental_Result> datosReporte =
                    this.retornaDatosReporte("", this.txtNombre.Text, "", "", "", "");
                ///crear la fuente de datos
                ReportDataSource fuenteDatos = new ReportDataSource();
                fuenteDatos.Name = infoFuenteDatos[0];
                fuenteDatos.Value = datosReporte;
                // agregar la fuente de datos al reporte
                this.RpvAdminRentals.LocalReport.DataSources.Add(fuenteDatos);

                /// mostrar los datos en el reporte
                this.RpvAdminRentals.LocalReport.Refresh();
            }
        }
        /// <summary>
        /// Función que retorna la fuente de datos a mostrar en el reporte
        /// </summary>
        /// <param name="pPrimerApellido"></param>
        /// <param name="pNombre"></param>
        /// <returns></returns>
        List<sp_RetornaAdminRental_Result> retornaDatosReporte(
            string adr_Cedula, string adr_Nombre, string adr_SegundoNombre,
            string adr_PrimerApellido, string adr_SegundoApellido, string adr_Email)
        {
            return
                new C_AdminRentals().RetornaAdminRental(adr_Cedula, adr_Nombre, adr_SegundoNombre,
            adr_PrimerApellido, adr_SegundoApellido, adr_Email);

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            contruirReporte();
        }
    }
}