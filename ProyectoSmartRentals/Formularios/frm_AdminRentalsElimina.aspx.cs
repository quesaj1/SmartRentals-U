using ProyectoSmartRentals.Metodos;
using ProyectoSmartRentals.Modelos;
using System;

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_AdminRentalsElimina : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.hdldAdmin.Value = this.Request.QueryString["adr_id_admin"];
            CargaDatosAdminRentals();
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

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            EliminarAdminRentals();
        }

        protected void btnAtras_Click(object sender, EventArgs e)
        {

        }

        void EliminarAdminRentals()
        {
            try
            {
                C_AdminRentals oAdminRentals = new C_AdminRentals();

                bool registroModificado =
                    oAdminRentals.
                    EliminaAdminRental(
                        Convert.ToInt16(this.hdldAdmin.Value));

                if (registroModificado)
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
}