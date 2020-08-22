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

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_ContratoAgregar : System.Web.UI.Page
    {
        int _pk_admin = 0;
        int _pk_cliente = 0;
        int _pk_proveedor = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
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
            DropDownListCliente.DataSource = Consultar("select cli_cliente, cli_PrimerApelido + ', '+cli_Nombre as nombre from C_Cliente");
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
            if (this.up_Contrato.HasFile) {

                if (extension == ".pdf" || extension == ".docx") {
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
                

            try
            {
                string contrato = this.txtContratoNumero.Text.ToString();
                //string fechainicio = this.txtFechaInicio.Text.ToString();
                //string fechafinal = this.txtFechaFinaliacion.Text.ToString();
                decimal monto = Convert.ToDecimal(txtMonto.Text.ToString());
                int Id_Ciente = Convert.ToInt16(this.DropDownListCliente.Text.ToString());
                int Id_propiedades = Convert.ToInt16(this.DropDownPropiedad.Text.ToString());
                string ctr_name = this.up_Contrato.FileName.ToString();
                
                DateTime fechainicio = Convert.ToDateTime(this.txtFechaInicio.Text);
                DateTime fechaFinalizacion = Convert.ToDateTime(this.txtFechaFinaliacion.Text);
                DateTime fechapago = Convert.ToDateTime(this.txtFechaPago.Text);

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
                    this.Label2.Text = "Solo se aceptan archivos .pdf o .docx";
                }    
            }
            else
            {
                this.Label2.Text = "Debe de subir un archivo";
            }
        }

        
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            agregarContrato();
        }

     

   
    }
}