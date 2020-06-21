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
    public partial class frm_ClienteElimina : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.hdlCliente.Value = this.Request.QueryString["cli_Cliente"];
            CargaDatosCliente();
        }


        void CargaDatosCliente()
        {
            ///obtener el valor del parámetro que fue asignado al hidden
            ///en el page_Load
            string llavePrimaria = this.hdlCliente.Value;
            if (!string.IsNullOrEmpty(llavePrimaria))
            {
                int id_AdminRentals = Convert.ToInt16(llavePrimaria);
                C_Clientes oAdminRentals = new C_Clientes();
                ///Crear la instancia del objeto de retorno
                ///del procedimiento almacenado
                sp_RetornaClienteID_Result resultadoSp = oAdminRentals.RetornaClienteID(id_AdminRentals);

                ///validar que el procedimiento retorne un valor
                if (resultadoSp != null)
                {
                    this.txtCedula.Text = resultadoSp.cli_Cedula;
                    this.txtNombre.Text = resultadoSp.cli_Nombre;
                    this.txtSegundoNombre.Text = resultadoSp.cli_SegundoNombre;
                    this.txtPrimerApellido.Text = resultadoSp.cli_PrimerApelido;
                    this.txtSegundoApellido.Text = resultadoSp.cli_SegundoApellido;
                    this.txtFechaNacimiento.Text = resultadoSp.cli_FechaNacimiento.ToString();
                    this.txtTelefonoCasa.Text = resultadoSp.cli_TelefonoCasa;
                    this.txtTelefonoCelular.Text = resultadoSp.cli_TelefonoCelular;
                    this.txtEmail.Text = resultadoSp.cli_Email;
                }

            }
        }




        protected void btnAtras_Click(object sender, EventArgs e)
        {

        }


        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            EliminarCliente();
        }


        void EliminarCliente()
        {
            try
            {
                C_Clientes oAdminRentals = new C_Clientes();

                bool registroModificado =
                    oAdminRentals.
                    EliminalCliente(
                        Convert.ToInt16(this.hdlCliente.Value));

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