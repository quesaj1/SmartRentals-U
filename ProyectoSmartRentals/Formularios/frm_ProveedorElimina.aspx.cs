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
    public partial class frm_ProveedorElimina : System.Web.UI.Page
    {
        int _pk_admin = 0;
        int _pk_cliente = 0;
        int _pk_proveedor = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.hdldProveedor.Value = this.Request.QueryString["prv_IDProveedor"];
            CargaDatosProveedor();
            IniciarLlenadoDropDown();
            cargarDatos();

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

        void CargaDatosProveedor()
        {
            ///obtener el valor del parámetro que fue asignado al hidden
            ///en el page_Load
            string llavePrimaria = this.hdldProveedor.Value;

            if (!string.IsNullOrEmpty(llavePrimaria))

            {
                int id_Alquiler = Convert.ToInt16(llavePrimaria);
                C_Proveedor oAlquileres = new C_Proveedor();

                ///Crear la instancia del objeto de retorno
                ///del procedimiento almacenado
                ///
                sp_RetornaProveedorID_Result resultadoSp = oAlquileres.RetornarProveedorID(id_Alquiler);

                ///validar que el procedimiento retorne un valor
                if (resultadoSp != null)
                {
                    this.txtIDProveedor.Text = resultadoSp.prv_IDProveedor.ToString();
                    this.txtNombreVariable.Text = resultadoSp.prv_NombreVariable;
                    this.txtNombreRepresentante.Text = resultadoSp.prv_NombreRepresentante;
                    this.txtPrimerApellido.Text = resultadoSp.prv_PrimerApellido;
                    this.txtSegundoApellido.Text = resultadoSp.prv_SegundoApellido;
                    this.txtCedulaRepresentante.Text = resultadoSp.prv_SegundoApellido;
                    this.txtCedulaJuridica.Text = resultadoSp.prv_CedulaJuridica;
                    this.txtTelefono.Text = resultadoSp.prv_Telefono;
                    this.txtEmail.Text = resultadoSp.prv_Email;
                    this.txtTipoProveedor.Text = resultadoSp.prv_TipoProveedor;
                    this.DropDownListProvincia.Text = resultadoSp.Id_Provincia.ToString();
                    this.txtOtrasSenas.Text = resultadoSp.prv_OtrasSenas;

                }

            }
        }




        protected void ShowPopup(object sender, EventArgs e)
        {
            string title = "Eliminar registro";
            string body = "Esta seguro de eliminar este registro?";
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (this.IsValid)
            {

                int id_proveedor = 0;

                id_proveedor = Convert.ToInt16(this.hdldProveedor.Value);

                try
                {
                    C_Proveedor oProveedor = new C_Proveedor();


                    if (oProveedor.EliminarProveedor(id_proveedor,  false))

                        this.lblResultado.Text = "Registro eliminado";

                    else
                        this.lblResultado.Text = "No fue posible eliminar";
                }
                catch (Exception error)
                {
                    this.lblResultado.Text = "Ocurrió un error:" + error.Message;
                }

            }
        }

        protected void btnAtras_Click(object sender, EventArgs e)
        {

        }

        private void IniciarLlenadoDropDown()
        {
            DropDownListProvincia.DataSource = Consultar("Select * from dbo.C_Provincia");
            DropDownListProvincia.DataTextField = "Nombre";
            DropDownListProvincia.DataValueField = "Id_Provincia";
            DropDownListProvincia.DataBind();
            DropDownListProvincia.Items.Insert(0, new ListItem("[Seleccionar]", "0"));

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

        protected void ProvinciaSeleccion(object sender, EventArgs e)
        {
            int ProvinciaID = Convert.ToInt32(DropDownListProvincia.SelectedValue);
  
        }




        public void cargarDatos()
        {
            ///obtener el valor del parámetro que fue asignado al hidden
            ///en el page_Load
            string llavePrimaria = this.hdldProveedor.Value;
            if (!string.IsNullOrEmpty(llavePrimaria))
            {
                int id_Contrato = Convert.ToInt16(llavePrimaria);
                C_Proveedor oContrato = new C_Proveedor();
                ///Crear la instancia del objeto de retorno
                ///del procedimiento almacenado
                sp_RetornaProveedorID_Result resultadoSp = oContrato.RetornarProveedorID(id_Contrato);

                ///validar que el procedimiento retorne un valor
                if (resultadoSp != null)
                {
                    
                    this.DropDownListProvincia.Text = resultadoSp.Id_Provincia.ToString();

                }

            }
        }


    }
}