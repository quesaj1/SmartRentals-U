using ProyectoSmartRentals.Metodos;
using System;

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_AdminRentals : System.Web.UI.Page
    {
        int _pk_admin = 0;
        int _pk_cliente = 0;
        int _pk_proveedor = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            menu();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            AgregarAdminRentals();
        }

        protected void btnAtras_Click(object sender, EventArgs e)
        {

        }

        void AgregarAdminRentals()
        {
            try
            {

                string adr_Cedula = this.txtCedula.Text.ToString();
                string adr_Nombre = this.txtNombre.Text.ToString();
                string adr_SegundoNombre = this.txtSegundoNombre.Text.ToString();
                string adr_PrimerApellido = this.txtPrimerApellido.Text.ToString();
                string adr_SegundoApellido = this.txtSegundoApellido.Text.ToString();
                Nullable<System.DateTime> adr_FechaNacimiento = null;
                string adr_TelefonoCasa = this.txtTelefonoCasa.Text.ToString();
                string adr_TelefonoCelular = this.txtTelefonoCelular.Text.ToString();
                string adr_Email = this.txtEmail.Text.ToString();


                C_AdminRentals oAdminRentals = new C_AdminRentals();
                bool AdminRentalsInsertar =
                    oAdminRentals.InsertaAdminRentals(adr_Cedula, adr_Nombre, adr_SegundoNombre, adr_PrimerApellido, adr_SegundoApellido, adr_FechaNacimiento, adr_TelefonoCasa, adr_TelefonoCelular, adr_Email);


                if (AdminRentalsInsertar)
                    this.lblResultado.Text = "Administrador agregado";
                else
                    this.lblResultado.Text = "No se pudo agregar el administrador";
            }
            catch (Exception error)
            {

                this.lblResultado.
                    Text = "Ocurrió un error:" + error.Message;
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
    }
}