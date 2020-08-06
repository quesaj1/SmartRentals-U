using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoSmartRentals.Metodos;
using ProyectoSmartRentals.Modelos;
using C_Proveedor = ProyectoSmartRentals.Metodos.C_Proveedor;

namespace ProyectoSmartRentals.Formularios
{
   
    public partial class frm_ProveedorModifica : System.Web.UI.Page
    {
        int _pk_admin = 0;
        int _pk_cliente = 0;
        int _pk_proveedor = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                IniciarLlenadoDropDown();
                this.hdldProveedor.Value = this.Request.QueryString["prv_IDProveedor"];
                CargaDatosProveedor();
                IniciarLlenadoDropDown();
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

        private void IniciarLlenadoDropDown()
        {
            DropDownListProvincia.DataSource = Consultar("Select * from dbo.C_Provincia");
            DropDownListProvincia.DataTextField = "Nombre";
            DropDownListProvincia.DataValueField = "Id_Provincia";
            DropDownListProvincia.DataBind();
            DropDownListProvincia.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
            //DropDownListCanton.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
            //DropDownListDistrito.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
        }


     
        

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            ///Verificar que todas las validaciones hayan sido
            ///satisfactorias
            if (this.IsValid)
            {
                int id_contrato = 0;

                ///obtener del hiddenField el valor de la llave primaria
                id_contrato = Convert.ToInt16(this.hdldProveedor.Value);

                try
                {

                    C_Proveedor oProveedor = new C_Proveedor();
                    DateTime now = DateTime.Now;
                    if (oProveedor.ModificarEliminaProveedor(id_contrato, txtNombreVariable.Text, txtNombreRepresentante.Text,
                       txtPrimerApellido.Text, txtSegundoApellido.Text, txtCedulaRepresentante.Text, txtCedulaJuridica.Text, txtTelefono.Text, txtEmail.Text, txtTipoProveedor.Value.ToString(),
                       Convert.ToInt16(DropDownListProvincia.Text), txtOtrasSenas.Text, true)
                        )
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeSuccess()", true);
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
        }

        protected void btnAtras_Click(object sender, EventArgs e)
        {

        }

        void CargaDatosProveedor()
        {
            ///obtener el valor del parámetro que fue asignado al hidden
            ///en el page_Load
            string llavePrimaria = this.hdldProveedor.Value;
            if (!string.IsNullOrEmpty(llavePrimaria))
            {
                int id_Proveedor = Convert.ToInt16(llavePrimaria);

                C_Proveedor oProveedor = new C_Proveedor();
                ///Crear la instancia del objeto de retorno
                ///del procedimiento almacenado
                sp_RetornaProveedorID_Result resultadoSp = oProveedor.RetornarProveedorID(id_Proveedor);

                ///validar que el procedimiento retorne un valor
                if (resultadoSp != null)


                {
                    this.txtIDProveedor.Text = resultadoSp.prv_IDProveedor.ToString();
                    this.txtNombreVariable.Text = resultadoSp.prv_NombreVariable;
                    this.txtNombreRepresentante.Text = resultadoSp.prv_NombreRepresentante;
                    this.txtPrimerApellido.Text = resultadoSp.prv_PrimerApellido;
                    this.txtSegundoApellido.Text = resultadoSp.prv_SegundoApellido;
                    this.txtCedulaRepresentante.Text = resultadoSp.prv_CedulaRepresentante;
                    this.txtCedulaJuridica.Text = resultadoSp.prv_CedulaJuridica;
                    this.txtTelefono.Text = resultadoSp.prv_Telefono;
                    this.txtEmail.Text = resultadoSp.prv_Email;
                    this.txtTipoProveedor.Value = resultadoSp.prv_TipoProveedor;
                    this.DropDownListProvincia.Text = resultadoSp.Id_Provincia.ToString();
                    this.txtOtrasSenas.Text = resultadoSp.prv_OtrasSenas;


                }

            }
        }



        protected void SeleccionaDistrito(object sender, EventArgs e)
        {

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


    }
}