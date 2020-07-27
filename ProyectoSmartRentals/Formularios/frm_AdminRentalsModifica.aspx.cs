using ProyectoSmartRentals.Metodos;
using ProyectoSmartRentals.Modelos;
using System;

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_AdminRentalsModifica : System.Web.UI.Page
    {
        int _pk_admin = 0;
        int _pk_cliente = 0;
        int _pk_proveedor = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                ///obtener el valor del parámetro envíado desde la lista
                ///debe llamarse igual a lo envíado desde el grid
                this.hdldAdmin.Value = this.Request.QueryString["adr_id_admin"];
                CargaDatosAdminRentals();
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

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            ///Verificar que todas las validaciones hayan sido
            ///satisfactorias
            if (this.IsValid)
            {
                int id_AdminRentals = 0;

                ///obtener del hiddenField el valor de la llave primaria
                id_AdminRentals = Convert.ToInt16(this.hdldAdmin.Value);

                try
                {

                    C_AdminRentals oAdminRentals = new C_AdminRentals();

                    if (oAdminRentals.ModificaAdminRentals(id_AdminRentals, this.txtCedula.Text,
                       this.txtNombre.Text, this.txtSegundoNombre.Text, this.txtPrimerApellido.Text, this.txtSegundoApellido.Text,
                       null, this.txtTelefonoCasa.Text, this.txtTelefonoCelular.Text, this.txtEmail.Text)
                        )
                    {
                        this.lblResultado.Text = "Registro Modificado";
                    }
                    else
                    {
                        this.lblResultado.Text = "No se pudo modificar";
                    }

                }
                catch (Exception error)
                {
                    this.lblResultado.Text = "No se pudo modificar";
                }
            }
        }

        protected void btnAtras_Click(object sender, EventArgs e)
        {

        }

        void CargaDatosAdminRentals()
        {
            ///obtener el valor del parámetro que fue asignado al hidden
            ///en el page_Load
            string llavePrimaria = this.hdldAdmin.Value;
            if (!string.IsNullOrEmpty(llavePrimaria))
            {
                int id_AdminRentals = Convert.ToInt16(llavePrimaria);
                C_AdminRentals oAdminRentals = new C_AdminRentals();
                ///Crear la instancia del objeto de retorno
                ///del procedimiento almacenado
                sp_RetornaAdminRentalID_Result resultadoSp = oAdminRentals.RetornaAdminRentalID(id_AdminRentals);

                ///validar que el procedimiento retorne un valor
                if (resultadoSp != null)
                {
                    this.txtCedula.Text = resultadoSp.adr_Cedula;
                    this.txtNombre.Text = resultadoSp.adr_Nombre;
                    this.txtSegundoNombre.Text = resultadoSp.adr_SegundoNombre;
                    this.txtPrimerApellido.Text = resultadoSp.adr_PrimerApellido;
                    this.txtSegundoApellido.Text = resultadoSp.adr_SegundoApellido;
                    this.txtFechaNacimiento.Text = resultadoSp.adr_FechaNacimiento.ToString();
                    this.txtTelefonoCasa.Text = resultadoSp.adr_TelefonoCasa;
                    this.txtTelefonoCelular.Text = resultadoSp.adr_TelefonoCelular;
                    this.txtEmail.Text = resultadoSp.adr_Email;
                }

            }
        }
    }
}
