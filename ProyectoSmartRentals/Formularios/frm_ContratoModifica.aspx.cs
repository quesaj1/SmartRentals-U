﻿using Microsoft.ReportingServices.Interfaces;
using ProyectoSmartRentals.Metodos;
using ProyectoSmartRentals.Modelos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_ContratoModifica : System.Web.UI.Page
    {

        int _pk_admin = 0;
        int _pk_cliente = 0;
        int _pk_proveedor = 0;
        string ruta_file;
        bool flag = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("frm_Login.aspx?error=jwP46Q", true);
            }
            if (!this.IsPostBack)
            {
                menu();
                DropDownClientes();
                DropDownAlquileres();
                this.hdldContrato.Value = this.Request.QueryString["id_ctr_contrato"];
                cargarDatos();
                

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
        protected void btnAgregar_Click(object sender, EventArgs e)
        {

            if (bandera.Text.Equals("true"))
            {
                ///En caso de que vaya a elegir otro contrato
                if (this.IsValid)
                {
                    this.Label2.Text = "";
                    string extension = System.IO.Path.GetExtension(contrato.FileName);
                    string file_name = System.IO.Path.GetFileNameWithoutExtension(contrato.FileName);
                    string ctr_path = "";
                    if (this.contrato.HasFile)
                    {

                        if (extension == ".pdf" || extension == ".docx" || extension == ".docx")
                        {
                            if (!File.Exists(Server.MapPath("~/Contratos/" + contrato.FileName)))
                            {
                                contrato.SaveAs(Server.MapPath("~/Contratos/" + contrato.FileName));
                                ctr_path = "~/Contratos/" + contrato.FileName;
                            }
                            else
                            {
                                contrato.SaveAs(Server.MapPath("~/Contratos/" + file_name + "-Copia" + extension));
                                ctr_path = "~/Contratos/" + file_name + "-Copia" + extension;
                            }

                        int id_contrato = 0;

                        ///obtener del hiddenField el valor de la llave primaria
                        id_contrato = Convert.ToInt16(this.hdldContrato.Value);
                        DateTime fechainicio = Convert.ToDateTime(this.FechaInicio.Value);
                        DateTime fechaFinalizacion = Convert.ToDateTime(this.fechafinalizacion.Value);
                        DateTime fechapago = Convert.ToDateTime(this.datepago.Value);
                        int id_admin = Convert.ToInt32(this.txtAdmin.Text);
                        try
                        {

                            C_Contrato oContratos = new C_Contrato();
                            DateTime now = DateTime.Now;
                            if (oContratos.ModificarCliente(id_contrato, Convert.ToInt16(this.DropDownListCliente.Text), this.txtContratoNumero.Text,
                               fechainicio, fechaFinalizacion, Convert.ToDecimal(this.txtMonto.Text), true, ctr_path,
                               Convert.ToInt16(this.DropDownPropiedad.Text), id_admin, fechapago)
                                )
                            {
                                //this.lblResultado.Text = "Registro Modificado";
                                ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeSuccess()", true);
                            }
                            else
                            {
                                //this.lblResultado.Text = "No se pudo modificar";
                                ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeError()", true);
                            }

                        }
                        catch (Exception error)
                        {
                            //this.lblResultado.Text = "No se pudo modificar: " + error;
                            ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeError()", true);
                        }

                        //termina el link  de si hay archivo
                    }
                        else
                        {
                            this.Label2.Text = "Solo se aceptan archivos .pdf o .docx";
                        }

                    }
                    else
                    {
                        this.Label2.Text = "Debe de subir un archivo";
                    }
                    //Termina el link si es valido
                }

                ///termina el link del flag
                 }
            else { 
            ///Verificar que todas las validaciones hayan sido
            ///satisfactorias
            if (this.IsValid)
            {
                int id_contrato = 0;

                ///obtener del hiddenField el valor de la llave primaria
                id_contrato = Convert.ToInt16(this.hdldContrato.Value);
                DateTime fechainicio = Convert.ToDateTime(this.FechaInicio.Value);
                DateTime fechaFinalizacion = Convert.ToDateTime(this.fechafinalizacion.Value);
                DateTime fechapago = Convert.ToDateTime(this.datepago.Value);
                int id_admin = Convert.ToInt32(this.txtAdmin.Text);
                    try
                    {
                        if (this.lastcontract.Text == this.txtContratoNumero.Text)
                        {
                            C_Contrato oContratos = new C_Contrato();
                            DateTime now = DateTime.Now;
                            if (oContratos.ModificarCliente(id_contrato, Convert.ToInt16(this.DropDownListCliente.Text), this.txtContratoNumero.Text,
                               fechainicio, fechaFinalizacion, Convert.ToDecimal(this.txtMonto.Text), true, this.ruta_archivo.Text,
                               Convert.ToInt16(this.DropDownPropiedad.Text), id_admin, fechapago)
                                )
                            {
                                //this.lblResultado.Text = "Registro Modificado";
                                ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeSuccess()", true);
                            }
                            else
                            {
                                //this.lblResultado.Text = "No se pudo modificar";
                                ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeError()", true);
                            }
                        }
                        else { 
                        if (!contratoexiste(this.txtContratoNumero.Text))
                        {
                            C_Contrato oContratos = new C_Contrato();
                            DateTime now = DateTime.Now;
                            if (oContratos.ModificarCliente(id_contrato, Convert.ToInt16(this.DropDownListCliente.Text), this.txtContratoNumero.Text,
                               fechainicio, fechaFinalizacion, Convert.ToDecimal(this.txtMonto.Text), true, this.ruta_archivo.Text,
                               Convert.ToInt16(this.DropDownPropiedad.Text), id_admin, fechapago)
                                )
                            {
                                //this.lblResultado.Text = "Registro Modificado";
                                ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeSuccess()", true);
                            }
                            else
                            {
                                //this.lblResultado.Text = "No se pudo modificar";
                                ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeError()", true);
                            }

                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeDuplicate()", true);
                        }
                        }
                    }

                    catch (Exception error)
                    {
                        //this.lblResultado.Text = "No se pudo modificar: " + error;
                        ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeError()", true);
                    }
            }
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
        private void DropDownClientes()
        {
            DropDownListCliente.DataSource = Consultar("select cli_cliente, cli_PrimerApelido + ', '+cli_Nombre as nombre from C_Cliente where alq_activo= 1");
            DropDownListCliente.DataTextField = "nombre";
            DropDownListCliente.DataValueField = "cli_cliente";
            DropDownListCliente.DataBind();
            DropDownListCliente.Items.Insert(0, new ListItem("[Seleccione un cliente]", "0"));

        }

        private void DropDownAlquileres()
        {
            DropDownPropiedad.DataSource = Consultar("select * from C_Alquiler");
            DropDownPropiedad.DataTextField = "alq_UbicacionExacta";
            DropDownPropiedad.DataValueField = "alq_id_Propiedad";
            DropDownPropiedad.DataBind();
            DropDownPropiedad.Items.Insert(0, new ListItem("[Seleccione una propiedad]", "0"));

        }


        public void cargarDatos()
        {
            ///obtener el valor del parámetro que fue asignado al hidden
            ///en el page_Load
            string llavePrimaria = this.hdldContrato.Value;
            if (!string.IsNullOrEmpty(llavePrimaria))
            {
                int id_Contrato = Convert.ToInt16(llavePrimaria);
                C_Contrato oContrato = new C_Contrato();
                ///Crear la instancia del objeto de retorno
                ///del procedimiento almacenado
                sp_RetornaContratoID_Result resultadoSp = oContrato.RetornaContratoID(id_Contrato);

                ///validar que el procedimiento retorne un valor
                if (resultadoSp != null)
                {
                    this.txtContratoNumero.Text = resultadoSp.ctr_numeroContrato;
                    //Falta ver lo de la fecha
                    //this.txtFechaFinaliacion.Text = DateTime.;
                    //this.txtFechaInicio.Text = Convert.ToString(resultadoSp.ctr_fechainicio);
                    //this.txtFechaPago.Text = Convert.ToString(resultadoSp.ctr_fechapago);
                    Nullable<DateTime> fecha = resultadoSp.ctr_fechafinalizacion;
                    Nullable<DateTime> fecha2 = resultadoSp.ctr_fechainicio;
                    Nullable<DateTime> fecha3 = resultadoSp.ctr_fechapago;
                    
                   
                    
                    this.datepago.Value = fecha3.HasValue ? fecha3.Value.ToString("yyyy-MM-dd") : "<not available>";
                    this.fechafinalizacion.Value = fecha.HasValue ? fecha.Value.ToString("yyyy-MM-dd") : "<not available>";
                    this.FechaInicio.Value = fecha2.HasValue ? fecha2.Value.ToString("yyyy-MM-dd") : "<not available>";


                    this.txtMonto.Text = (resultadoSp.ctr_monto).ToString("N0");
                    this.txtAdmin.Text = Convert.ToString(resultadoSp.fk_adr_id_admin);
                 
                    this.DropDownListCliente.Text = resultadoSp.fk_cli_cliente.ToString();
                    this.DropDownPropiedad.Text = resultadoSp.fk_alq_id_propiedad.ToString();
                   

                    string link = resultadoSp.ctr_file;
                    this.hypContrato.NavigateUrl = link;
                    this.ruta_file = link;
                    this.ruta_archivo.Text = link;
                    this.lastcontract.Text = resultadoSp.ctr_numeroContrato;




                }

            }
        }

        bool contratoexiste(string user)
        {

            string llavePrimaria = this.txtContratoNumero.Text;
            if (!string.IsNullOrEmpty(llavePrimaria))
            {
                string userid = llavePrimaria;
                Metodos.C_Contrato oUsuario = new Metodos.C_Contrato();
                ///Crear la instancia del objeto de retorno
                ///del procedimiento almacenado
                sp_RetornaContratoName_Result resultadoSp = oUsuario.RetornaContratoName(userid);

                ///validar que el procedimiento retorne un valor
                if (resultadoSp != null)
                {
                    return true;
                }
                else
                {
                    return false;

                }

            }
            else
            {
                return false;
            }
        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            
            this.contrato.Visible = true;
            this.imgFile.Visible = false;
            this.hypContrato.Visible = false;
            this.ImageButton1.Visible = false;
            this.flag = true;
            this.bandera.Text = "true";
        }
    }
}