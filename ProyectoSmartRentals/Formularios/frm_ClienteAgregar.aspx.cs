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
    public partial class frm_ClienteAgregar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            AgregarCliente();
        }

        void AgregarCliente()
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


                C_Clientes oCliente = new C_Clientes();
                bool ClienteInsertar =
                    oCliente.InsertaCliente(adr_Cedula, adr_Nombre, adr_SegundoNombre, adr_PrimerApellido, adr_SegundoApellido, adr_FechaNacimiento, adr_TelefonoCasa, adr_TelefonoCelular, adr_Email,true);


                if (ClienteInsertar)
                    this.lblResultado.Text = "Cliente agregado";
                else
                    this.lblResultado.Text = "No se pudo agregar el Cliente";
            }
            catch (Exception error)
            {

                this.lblResultado.
                    Text = "Ocurrió un error:" + error.Message;
            }
        }

        protected void btnAtras_Click(object sender, EventArgs e)
        {

        }
    }
}