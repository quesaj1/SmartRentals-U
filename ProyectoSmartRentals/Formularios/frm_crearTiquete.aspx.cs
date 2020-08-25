    using ProyectoSmartRentals.Metodos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_crearTiquete : System.Web.UI.Page
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
                menu();
                //acá debemos de tomar la variable de sesión del cliente para que solo filtre por ellas.
                int v_fk_cliente = Convert.ToInt16(Session["ID"]);
                string _rol = Convert.ToString(Session["Tipo"]);
                if (_rol.Equals("Administrador"))
                {
                    DropDownContratoAdmin();
                }
                else
                {
                    DropDownContrato(v_fk_cliente);
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
                //Response.Redirect("frm_inicioMenu.aspx?error=zW2aqP", false);
            }

        }
        private void DropDownContrato(int fk_cliente)
        {
           
         
            DropDownContratos.DataSource = Consultar("select id_ctr_contrato, ctr_numeroContrato " +
                 " from C_Contratos where ctr_activo = 1 and fk_cli_cliente = " + fk_cliente );
            DropDownContratos.DataTextField = "ctr_numeroContrato";
            DropDownContratos.DataValueField = "id_ctr_contrato";
            DropDownContratos.DataBind();
            DropDownContratos.Items.Insert(0, new ListItem("[Seleccione un contrato]", "0"));

        }

        private void DropDownContratoAdmin()
        {


            DropDownContratos.DataSource = Consultar("select id_ctr_contrato, ctr_numeroContrato " +
                 " from C_Contratos where ctr_activo = 1");
            DropDownContratos.DataTextField = "ctr_numeroContrato";
            DropDownContratos.DataValueField = "id_ctr_contrato";
            DropDownContratos.DataBind();
            DropDownContratos.Items.Insert(0, new ListItem("[Seleccione un contrato]", "0"));

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                int contrato = Convert.ToInt16(this.DropDownContratos.Text.ToString());
                string tipoProblema = this.DropDownTipo.SelectedItem.ToString();
                string descripcionProblema = this.txaMessage.Value;
                string tituloProblema = this.txtTitulo.Text;
                DateTime now = DateTime.Now;
                



                C_Tiquetes oTiquete = new C_Tiquetes();
                bool TiqueteInsertar =
                    oTiquete.InsertaTiquete(contrato,tipoProblema,true, descripcionProblema,null,
                    now, null, 25, tituloProblema, null, "Pendiente");


                if (TiqueteInsertar) { 
                    //this.lblResultado.Text = "Tiquete agregado";
                    limpiar();
                    ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeSuccess()", true);
                }

                else { 
                            //this.lblResultado.Text = "No se pudo agregar el contrato";
                            ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeError()", true);
                }
            }
            catch (Exception error)
            {

                ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeError()", true);
                //this.lblResultado.
                //    Text = "Ocurrió un error:" + error.Message;
            }
        }

        public void limpiar()
        {
            this.txtTitulo.Text = "";
            this.txaMessage.InnerText = "";
            this.DropDownContratos.SelectedIndex = 0;
            this.DropDownTipo.SelectedIndex = 0;
        }
    }
}