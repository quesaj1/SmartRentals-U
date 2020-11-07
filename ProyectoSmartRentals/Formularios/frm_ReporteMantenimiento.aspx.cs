using Microsoft.Reporting.WebForms;
using ProyectoSmartRentals.Modelos;
using ProyectoSmartRentals.Metodos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_ReporteMantenimiento : System.Web.UI.Page
    {

        /// <summary>
        /// Variables que se toman de las variables de sesión para determinar
        /// que tipo de su usuario se encuentra logueado, así como su rol.
        /// </summary>
        int _pk_admin = 0;
        int _pk_cliente = 0;
        int _pk_proveedor = 0;
        string _estado = null;
        
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"] == null)
            {
                Response.Redirect("frm_Login.aspx?error=jwP46Q", true);
            }
            cargaDropDown();

            }
        }

        public void cargaDropDown()
        {
           string _rol = Convert.ToString(Session["Tipo"]);
            if (_rol.Equals("Cliente"))
            {
                
                _pk_cliente = Convert.ToInt16(Session["ID"]);
                _pk_admin = 0;
                _pk_proveedor = 0;
                this.ddclientes.Visible = false;
                this.ddcontratos.Visible = true;
                this.ddproveedores.Visible = false;
                this.ddadmin.Visible = false;
                DropDownContratoCliente(_pk_cliente);
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
                _pk_proveedor = Convert.ToInt16(Session["ID"]);
                this.ddclientes.Visible = false;
                this.ddcontratos.Visible = false;
                this.ddproveedores.Visible = false;
                this.ddadmin.Visible = true;
                DropDownAdmmin();
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
                _pk_admin = Convert.ToInt16(Session["ID"]);
                _pk_proveedor = 0;
                this.ddclientes.Visible = true;
                this.ddcontratos.Visible = true;
                this.ddproveedores.Visible = true;
                this.ddadmin.Visible = false;
                DropDownContratoAdmin(0);
                DropDownProveedores();
                DropDownClientes();
                this.Page.Master.FindControl("menu_admin").Visible = true;
                this.Page.Master.FindControl("menu_cliente").Visible = false;
                this.Page.Master.FindControl("menu_proveedor").Visible = false;
                this.Page.Master.FindControl("menu_admin_").Visible = true;
                this.Page.Master.FindControl("menu_cliente_").Visible = false;
                this.Page.Master.FindControl("menu_proveedor_").Visible = false;
            }
        }

        #region Llenado de los dropdown 
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


        private void DropDownContratoCliente(int fk_cliente)
        {


            DropDownContratos.DataSource = Consultar("select id_ctr_contrato, ctr_numeroContrato " +
                 " from C_Contratos where ctr_activo = 1 and fk_cli_cliente = " + fk_cliente);
            DropDownContratos.DataTextField = "ctr_numeroContrato";
            DropDownContratos.DataValueField = "id_ctr_contrato";
            DropDownContratos.DataBind();
            DropDownContratos.Items.Insert(0, new ListItem("[Seleccione un contrato]", "0"));

        }


        private void DropDownContratoAdmin(int fk_admin)
        {


            DropDownContratos.DataSource = Consultar("select id_ctr_contrato, ctr_numeroContrato " +
                 " from C_Contratos where ctr_activo = 1");
            DropDownContratos.DataTextField = "ctr_numeroContrato";
            DropDownContratos.DataValueField = "id_ctr_contrato";
            DropDownContratos.DataBind();
            DropDownContratos.Items.Insert(0, new ListItem("[Seleccione un contrato]", "0"));

        }

        private void DropDownProveedores()
        {


            DropDownproveedores.DataSource = Consultar("select prv_idproveedor, prv_nombrevariable from C_Proveedor where alq_Activo = 1");
            DropDownproveedores.DataTextField = "prv_nombrevariable";
            DropDownproveedores.DataValueField = "prv_idproveedor";
            DropDownproveedores.DataBind();
            DropDownproveedores.Items.Insert(0, new ListItem("[Seleccione un proveedor]", "0"));

        }

        private void DropDownClientes()
        {


            DropDownListClientes.DataSource = Consultar("select cli_cliente, cli_PrimerApelido + ', ' + cli_nombre as 'Nombre' from C_Cliente where alq_Activo = 1");
            DropDownListClientes.DataTextField = "Nombre";
            DropDownListClientes.DataValueField = "cli_cliente";
            DropDownListClientes.DataBind();
            DropDownListClientes.Items.Insert(0, new ListItem("[Seleccione un cliente]", "0"));

        }

        private void DropDownAdmmin()
        {


            DropDownAdministrador.DataSource = Consultar("select adr_id_admin, adr_PrimerApellido + ', ' + adr_Nombre as 'Nombre' from C_Admin_Rentals");
            DropDownAdministrador.DataTextField = "Nombre";
            DropDownAdministrador.DataValueField = "adr_id_admin";
            DropDownAdministrador.DataBind();
            DropDownAdministrador.Items.Insert(0, new ListItem("[Seleccione un administrador]", "0"));

        }

        #endregion

        #region Crear reportes

        void construirReporteAdmin()
        {

            ///indicar la ruta del reporte
            string rutaReporte = "~/Reportes/R_MantenimientoAdministrador.rdlc";
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
                List<sp_RetornaReporteAdmin_Result> datosReporte = null;
                prvMantenimiento.Visible = true;
                prvMantenimiento.LocalReport.ReportPath = rutaServidor;
                var infoFuenteDatos = this.prvMantenimiento.LocalReport.GetDataSourceNames();
                ///limpiar los datos de la fuente de datos
                prvMantenimiento.LocalReport.DataSources.Clear();
                ///obtener los datos del reporte
                int cliente = Convert.ToInt16(this.DropDownListClientes.Text.ToString());
                int proveedor = Convert.ToInt16(this.DropDownproveedores.Text.ToString());
                              
               
               
               
                string estado = null;
                int contrato = Convert.ToInt16(this.DropDownContratos.Text.ToString());
                int id_estado = Convert.ToInt16(this.DropDownTipoReportes.Text.ToString());
               

                if (id_estado != 0)
                {
                    estado = this.DropDownTipoReportes.SelectedItem.ToString();
                }
                else
                {
                    estado = null;
                }

                if(!this.fechainicio1.Text.Equals(""))
                {
                    DateTime inicio = DateTime.ParseExact(this.fechainicio1.Text, "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);
                    DateTime final = DateTime.ParseExact(this.fechafinalizacion.Text, "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);
                     datosReporte = this.retornaDatosReporteMantenimiento(_pk_admin, cliente, proveedor,
                  estado, inicio, final, null, null, contrato);
                }

                else
                {
                  datosReporte = this.retornaDatosReporteMantenimiento(_pk_admin, cliente, _pk_proveedor,
                  estado, null, null, null, null, contrato);
                }
                
              
                ///crear la fuente de datos
                ReportDataSource fuenteDatos = new ReportDataSource();
                fuenteDatos.Name = infoFuenteDatos[0];
                fuenteDatos.Value = datosReporte;
                // agregar la fuente de datos al reporte
                this.prvMantenimiento.LocalReport.DataSources.Add(fuenteDatos);

                /// mostrar los datos en el reporte
                this.prvMantenimiento.LocalReport.Refresh();
            }
        }

        void construirReporteCliente()
        {

            ///indicar la ruta del reporte
            string rutaReporte = "~/Reportes/R_MantenimientoCliente.rdlc";
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
                List<sp_RetornaReporteAdmin_Result> datosReporte = null;
                prvMantenimiento.Visible = true;
                prvMantenimiento.LocalReport.ReportPath = rutaServidor;
                var infoFuenteDatos = this.prvMantenimiento.LocalReport.GetDataSourceNames();
                ///limpiar los datos de la fuente de datos
                prvMantenimiento.LocalReport.DataSources.Clear();
                ///obtener los datos del reporte
              



                string estado = null;
                int contrato = Convert.ToInt16(this.DropDownContratos.Text.ToString());
                int id_estado = Convert.ToInt16(this.DropDownTipoReportes.Text.ToString());

                if (id_estado != 0)
                {
                    estado = this.DropDownTipoReportes.SelectedItem.ToString();
                }
                else
                {
                    estado = null;
                }

                if (!this.fechainicio1.Text.Equals(""))
                {
                    DateTime inicio = DateTime.ParseExact(this.fechainicio1.Text, "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);
                    DateTime final = DateTime.ParseExact(this.fechafinalizacion.Text, "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);
                    datosReporte = this.retornaDatosReporteMantenimiento(0, _pk_cliente, 0,
                 estado, inicio, final, null, null, contrato);
                }

                else
                {
                    datosReporte = this.retornaDatosReporteMantenimiento(0, _pk_cliente, 0,
                    estado, null, null, null, null, contrato);
                }


                ///crear la fuente de datos
                ReportDataSource fuenteDatos = new ReportDataSource();
                fuenteDatos.Name = infoFuenteDatos[0];
                fuenteDatos.Value = datosReporte;
                // agregar la fuente de datos al reporte
                this.prvMantenimiento.LocalReport.DataSources.Add(fuenteDatos);

                /// mostrar los datos en el reporte
                this.prvMantenimiento.LocalReport.Refresh();
            }
        }
        void construirReporteProveedor()
        {

            ///indicar la ruta del reporte
            string rutaReporte = "~/Reportes/R_MantenimientoProveedor.rdlc";
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
                List<sp_RetornaReporteAdmin_Result> datosReporte = null;
                prvMantenimiento.Visible = true;
                prvMantenimiento.LocalReport.ReportPath = rutaServidor;
                var infoFuenteDatos = this.prvMantenimiento.LocalReport.GetDataSourceNames();
                ///limpiar los datos de la fuente de datos
                prvMantenimiento.LocalReport.DataSources.Clear();
                ///obtener los datos del reporte
               




                string estado = null;
                int id_administrador = Convert.ToInt16(this.DropDownAdministrador.Text.ToString());
                int id_estado = Convert.ToInt16(this.DropDownTipoReportes.Text.ToString());

                if (id_estado != 0)
                {
                    estado = this.DropDownTipoReportes.SelectedItem.ToString();
                }
                else
                {
                    estado = null;
                }

                if (!this.fechainicio1.Text.Equals(""))
                {
                    DateTime inicio = DateTime.ParseExact(this.fechainicio1.Text, "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);
                    DateTime final = DateTime.ParseExact(this.fechafinalizacion.Text, "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);
                    datosReporte = this.retornaDatosReporteMantenimiento(id_administrador, 0, 0,
                 estado, inicio, final, null, null, 0);
                }

                else
                {
                    datosReporte = this.retornaDatosReporteMantenimiento(id_administrador, 0, 0,
                    estado, null, null, null, null, 0);
                }


                ///crear la fuente de datos
                ReportDataSource fuenteDatos = new ReportDataSource();
                fuenteDatos.Name = infoFuenteDatos[0];
                fuenteDatos.Value = datosReporte;
                // agregar la fuente de datos al reporte
                this.prvMantenimiento.LocalReport.DataSources.Add(fuenteDatos);

                /// mostrar los datos en el reporte
                this.prvMantenimiento.LocalReport.Refresh();
            }
        }


        List<sp_RetornaReporteAdmin_Result> retornaDatosReporteMantenimiento(
                int? v_fk_adr_id_admin, int? v_fk_ctr_cliente,
            int? v_fk_prv_proveedor, string v_estado, DateTime? v_fecha_inicio1, DateTime? v_fecha_inicio2,
            DateTime? v_fecha_finalizacion1, DateTime? v_fecha_finalizacion2, int? v_ctr_contrato)
        {
            return
                new C_Tiquetes().RetornarReporteTiquetes(v_fk_adr_id_admin, v_fk_ctr_cliente, v_fk_prv_proveedor,
            v_estado, v_fecha_inicio1, v_fecha_inicio2, v_fecha_finalizacion1, v_fecha_finalizacion2, v_ctr_contrato);


        }

        #endregion

        protected void Final_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //this.Label1.Text = this.fechainicio1.Text + " 00:00:00.0000";
            string _rol= Convert.ToString(Session["Tipo"]);
            if (_rol.Equals("Administrador")) {
                construirReporteAdmin();
            }

            if (_rol.Equals("Proveedor"))
            {
                this.construirReporteProveedor();
            }


            if (_rol.Equals("Cliente"))
            {
                this.construirReporteCliente();
            }

        }
    }
}