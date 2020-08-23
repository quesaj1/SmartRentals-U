using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoSmartRentals.Metodos;
using ProyectoSmartRentals.Modelos;

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_ClienteModifica : System.Web.UI.Page
    {
        int _pk_admin = 0;
        int _pk_cliente = 0;
        int _pk_proveedor = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

          

            if (!this.IsPostBack)
            {


                if (Session["UserName"] == null)
                {
                    Response.Redirect("frm_Login.aspx?error=jwP46Q", true);
                }
                else
                {
                    ///obtener el valor del parámetro envíado desde la lista
                    ///debe llamarse igual a lo envíado desde el grid
                    this.hdlCliente.Value = this.Request.QueryString["cli_Cliente"];
                    CargaDatosCliente();
                    menu();

                }

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

        void CargaDatosCliente()
        {
            ///obtener el valor del parámetro que fue asignado al hidden
            ///en el page_Load
            string llavePrimaria = this.hdlCliente.Value;
            if (!string.IsNullOrEmpty(llavePrimaria))
            {
                int id_Cliente = Convert.ToInt16(llavePrimaria);
                C_Clientes oCliente = new C_Clientes();
                ///Crear la instancia del objeto de retorno
                ///del procedimiento almacenado
                sp_RetornaClienteID_Result resultadoSp = oCliente.RetornaClienteID(id_Cliente);

                ///validar que el procedimiento retorne un valor
                if (resultadoSp != null)
                {
                    this.txtIdCliente.Text = resultadoSp.cli_Cliente.ToString();
                    this.txtCedula.Text = resultadoSp.cli_Cedula;
                    this.txtNombre.Text = resultadoSp.cli_Nombre;
                    this.txtSegundoNombre.Text = resultadoSp.cli_SegundoNombre;
                    this.txtPrimerApellido.Text = resultadoSp.cli_PrimerApelido;
                    this.txtSegundoApellido.Text = resultadoSp.cli_SegundoApellido;
                    Nullable<DateTime> fecha = resultadoSp.cli_FechaNacimiento;
                    this.txtTelefonoCasa.Text = resultadoSp.cli_TelefonoCasa;
                    this.txtTelefonoCelular.Text = resultadoSp.cli_TelefonoCelular;
                    this.txtEmail.Text = resultadoSp.cli_Email;

                    this.fechafinalizacion.Value = fecha.HasValue ? fecha.Value.ToString("yyyy-MM-dd") : "<not available>";
                }

            }
        }


        protected void btnModificar_Click(object sender, EventArgs e)
        {
        
        }

        protected void btnAtras_Click(object sender, EventArgs e)
        {

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            ///Verificar que todas las validaciones hayan sido
            ///satisfactorias
            if (this.IsValid)
            {
                int id_cliente = 0;

                ///obtener del hiddenField el valor de la llave primaria
                id_cliente = Convert.ToInt16(this.hdlCliente.Value);

                try
                {

                    C_Clientes oCliente = new C_Clientes();
                    DateTime fechanacimiento = Convert.ToDateTime(this.fechafinalizacion.Value);
                    DateTime now = DateTime.Now;
                    if (oCliente.ModificarCliente(id_cliente, txtIdCliente.Text, txtNombre.Text, txtSegundoNombre.Text, txtPrimerApellido.Text,
                        txtSegundoApellido.Text, fechanacimiento, txtTelefonoCasa.Text, txtTelefonoCelular.Text, txtEmail.Text, true)
                        )
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeSuccess()", true);
                        this.limpiardatos();
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeError()", true);
                        this.limpiardatos();
                    }

                }
                catch (Exception error)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeError()", true);
                }
            }
        }

        public void limpiardatos()
        {
            this.txtIdCliente.Text = null;
            this.txtNombre.Text = null;
            this.txtSegundoNombre.Text = null;
            this.txtPrimerApellido.Text = null;
            this.txtSegundoApellido.Text = null;
            this.txtTelefonoCasa.Text = null;
            this.txtTelefonoCelular.Text = null;
            this.txtEmail.Text = null;

        }


        protected void ShowPopup(object sender, EventArgs e)
        {
            string title = "Modificar registro";
            string body = "Esta seguro de modificar este registro?.  Por favor confirme";
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
        }
    }
}