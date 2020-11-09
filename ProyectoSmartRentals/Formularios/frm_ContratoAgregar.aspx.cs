using Microsoft.ReportingServices.ReportProcessing.ExprHostObjectModel;
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
using System.Web.WebPages;
using System.Globalization;

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_ContratoAgregar : System.Web.UI.Page
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
            if (!IsPostBack)
            {
                DropDownClientes();
                DropDownAlquileres();
                menu();

             }
        }

        void menu()
        {
            string _rol = Convert.ToString(Session["Tipo"]);
            if (_rol.Equals("Cliente"))
            {
                _pk_cliente = Convert.ToInt16(Session["ID"]);
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
                _pk_proveedor = Convert.ToInt16(Session["ID"]);
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
                _pk_admin = Convert.ToInt16(Session["ID"]);
                _pk_proveedor = 0;
                this.Page.Master.FindControl("menu_admin").Visible = true;
                this.Page.Master.FindControl("menu_cliente").Visible = false;
                this.Page.Master.FindControl("menu_proveedor").Visible = false;
                this.Page.Master.FindControl("menu_admin_").Visible = true;
                this.Page.Master.FindControl("menu_cliente_").Visible = false;
                this.Page.Master.FindControl("menu_proveedor_").Visible = false;
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
            DropDownPropiedad.DataSource = Consultar("select a.alq_id_propiedad, a.alq_ubicacionexacta + ', ' + b.Nombre + ', ' + c.Nombre as ubicacion from C_alquiler a inner join C_Canton b on a.Id_Canton = b.Id_Canton inner join C_Provincia c on c.Id_Provincia = a.Id_Provincia where a.alq_activo =1");
            DropDownPropiedad.DataTextField = "ubicacion";
            DropDownPropiedad.DataValueField = "alq_id_Propiedad";
            DropDownPropiedad.DataBind();
            DropDownPropiedad.Items.Insert(0, new ListItem("[Seleccione una propiedad]", "0"));

        }

       public void limpiardatos()
        {
            this.txtContratoNumero.Text = null;
            this.txtMonto.Text = null;
            this.txtFechaInicio.Text = null;
            this.txtFechaFinaliacion.Text = null;
            this.txtFechaPago.Text = null;            
        }


        public void agregarContrato()
        {
            this.Label2.Text = "";
            string extension = System.IO.Path.GetExtension(up_Contrato.FileName);
            string file_name = System.IO.Path.GetFileNameWithoutExtension(up_Contrato.FileName);
            string ctr_path = "";

            //Verifica que haya un archivo
            if (this.up_Contrato.HasFile) {

                if (extension == ".pdf" || extension == ".docx" || extension == ".doc") {
                    if (!File.Exists(Server.MapPath("~/Contratos/" + up_Contrato.FileName)))
                    {
                        up_Contrato.SaveAs(Server.MapPath("~/Contratos/" + up_Contrato.FileName));
                        ctr_path = "~/Contratos/" + up_Contrato.FileName;
                    }
                    else
                    {
                        up_Contrato.SaveAs(Server.MapPath("~/Contratos/" + file_name + "-Copia" + extension));
                        ctr_path = "~/Contratos/" + file_name + "-Copia"+extension;
                    }
                    DateTime fechainicio = Convert.ToDateTime(this.txtFechaInicio.Text);
                    DateTime fechaFinalizacion = Convert.ToDateTime(this.txtFechaFinaliacion.Text);
                    DateTime fechapago = Convert.ToDateTime(this.txtFechaPago.Text);

                    
                    //Compara las fechas de los contratos, para asegurarse que la fecha de inicio no es mayor a la de finalización
                     
                    if (DateTime.Compare(fechainicio,fechaFinalizacion)<=0){
                        if (DateTime.Compare(fechainicio, fechapago) <= 0)
                        {
                            


                
                            try
            {
                string contrato = this.txtContratoNumero.Text.ToString();
                                //string fechainicio = this.txtFechaInicio.Text.ToString();
                                //string fechafinal = this.txtFechaFinaliacion.Text.ToString();
                                decimal monto = Convert.ToDecimal(txtMonto.Text);
                                int Id_Ciente = Convert.ToInt16(this.DropDownListCliente.Text.ToString());
                int Id_propiedades = Convert.ToInt16(this.DropDownPropiedad.Text.ToString());
                string ctr_name = this.up_Contrato.FileName.ToString();
                               



                                //Hay que tomar la fecha con el datepicker

                                int admin_id = Convert.ToInt16(Session["ID"]); 
                        C_Contrato oContrato = new C_Contrato();

                
                bool ContratoInsertar =
                    oContrato.InsertaContrato(Id_Ciente, contrato, fechainicio,
                    fechaFinalizacion, monto, true, ctr_path, Id_propiedades, admin_id, fechapago);


                        


                        if (ContratoInsertar) {
                            ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeSuccess()", true);
                           
                    this.limpiardatos();
                        }
                        else{
                            ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeError()", true);
                            
                        }
                   
                                
                            }

                            catch (Exception error)
            {
                        ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeError()", true);
                       
                    }
                }
                    else
                    {
                       
                        this.Label3.Text = "La fecha de inicio es mayor a la fecha de días de pago";
                        this.Label1.Text = "La fecha de inicio es menor a la fecha de días de pago";
                        this.Label5.Text = ".";
                        this.Label4.Text = ".";
                        this.Label4.ForeColor = Color.White;
                    }
                        }
                    else
                    {
                        this.Label3.Text = "La fecha de inicio es mayor a la fecha de finalización";
                        this.Label4.Text = "La fecha de inicio es menor a la fecha de inicio";
                       
                    }
                     }

                else
                {
                    this.Label2.Text = "Solo se aceptan archivos .pdf o .docx";
                }
            //Finaliaz el if Verifica que haya un archivo
            }
            //El else de verificar que haya un archivo
            else
            {
                this.Label2.Text = "Debe de subir un archivo";
            }
        }

        public void agregarContratNull()
        {
            this.Label2.Text = "";
            string extension = System.IO.Path.GetExtension(up_Contrato.FileName);
            string file_name = System.IO.Path.GetFileNameWithoutExtension(up_Contrato.FileName);
            string ctr_path = "";

            //Verifica que haya un archivo
            if (this.up_Contrato.HasFile)
            {

                if (extension == ".pdf" || extension == ".docx" || extension == ".doc")
                {
                    if (!File.Exists(Server.MapPath("~/Contratos/" + up_Contrato.FileName)))
                    {
                        up_Contrato.SaveAs(Server.MapPath("~/Contratos/" + up_Contrato.FileName));
                        ctr_path = "~/Contratos/" + up_Contrato.FileName;
                    }
                    else
                    {
                        up_Contrato.SaveAs(Server.MapPath("~/Contratos/" + file_name + "-Copia" + extension));
                        ctr_path = "~/Contratos/" + file_name + "-Copia" + extension;
                    }
                    DateTime fechainicio = Convert.ToDateTime(this.txtFechaInicio.Text);
                    //DateTime fechaFinalizacion = Convert.ToDateTime(this.txtFechaFinaliacion.Text);
                    DateTime fechapago = Convert.ToDateTime(this.txtFechaPago.Text);


                    //Compara las fechas de los contratos, para asegurarse que la fecha de inicio no es mayor a la de finalización

                    
                        if (DateTime.Compare(fechainicio, fechapago) <= 0)
                        {



                            try
                            {
                                string contrato = this.txtContratoNumero.Text.ToString();
                            //string fechainicio = this.txtFechaInicio.Text.ToString();
                            //string fechafinal = this.txtFechaFinaliacion.Text.ToString();
                            decimal monto = Convert.ToDecimal(txtMonto.Text);
                            int Id_Ciente = Convert.ToInt16(this.DropDownListCliente.Text.ToString());
                                int Id_propiedades = Convert.ToInt16(this.DropDownPropiedad.Text.ToString());
                                string ctr_name = this.up_Contrato.FileName.ToString();

                       
                                


                                //Hay que tomar la fecha con el datepicker

                                int admin_id = Convert.ToInt16(Session["ID"]);
                                C_Contrato oContrato = new C_Contrato();
                                

                             
                                    bool ContratoInsertar =
                                        oContrato.InsertaContrato(Id_Ciente, contrato, fechainicio,
                                        null, monto, true, ctr_path, Id_propiedades, admin_id, fechapago);





                                    if (ContratoInsertar)
                                    {
                                        ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeSuccess()", true);

                                        this.limpiardatos();
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
                        else
                        {

                            this.Label3.Text = "La fecha de inicio es mayor a la fecha de días de pago";
                            this.Label1.Text = "La fecha de inicio es menor a la fecha de días de pago";
                            this.Label5.Text = ".";
                            this.Label4.Text = ".";
                            this.Label4.ForeColor = Color.White;
                        }
                   
                }

                else
                {
                    this.Label2.Text = "Solo se aceptan archivos .pdf o .docx";
                }
                //Finaliaz el if Verifica que haya un archivo
            }
            //El else de verificar que haya un archivo
            else
            {
                this.Label2.Text = "Debe de subir un archivo";
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            String  fechaFinalizacion =  this.txtFechaFinaliacion.Text;
            if (string.IsNullOrEmpty(fechaFinalizacion))
            {
                if (!contratoexiste(this.txtContratoNumero.Text)) { 
                this.agregarContratNull();
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeDuplicate()", true);
                }
            }
            else {
                if (!contratoexiste(this.txtContratoNumero.Text))
                {
                    agregarContrato();
                 }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeDuplicate()", true);
                }
            }
        }

        

        //Verifica si el contrato ya existe
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
        protected void txtMonto_TextChanged(object sender, EventArgs e)
        {
            //string a = this.txtMonto.Text;
            //if (string.IsNullOrEmpty(a)) {
                
            //    decimal preciodecimal = Convert.ToDecimal(a);

            //    string precio = string.Format("{0:c}", preciodecimal);
            //    this.txtMonto.Text = precio;
            //}
            //else
            //{
            //    a = a.Remove(0, 1);
            //    decimal preciodecimal = Convert.ToDecimal(a);

            //    string precio = string.Format("{0:c}", preciodecimal);
            //    this.txtMonto.Text = precio;
            //}

        }

        //public string retornaMonto()
        //{
        //    string monto = "";

        //    monto = txtMonto.Text.Remove(0, 1);
        //    return monto;


        //}
    }
}