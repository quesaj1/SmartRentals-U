using ProyectoSmartRentals.Metodos;
using System;

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_AdminRentals : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
    }
}