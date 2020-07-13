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
                int id_Cliente = Convert.ToInt16(llavePrimaria);
                C_Clientes oAdminRentals = new C_Clientes();
                ///Crear la instancia del objeto de retorno
                ///del procedimiento almacenado
                sp_RetornaClienteID_Result resultadoSp = oAdminRentals.RetornaClienteID(id_Cliente);

                ///validar que el procedimiento retorne un valor
                if (resultadoSp != null)
                {
                    this.txtIdCliente.Text = resultadoSp.cli_Cliente.ToString();
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



        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (this.IsValid)
            {

                int id_cliente = 0;

                id_cliente = Convert.ToInt16(this.hdlCliente.Value);
                DateTime now = DateTime.Now;

                try
                {
                    C_Clientes oClientes = new C_Clientes();


                    if (oClientes.ModificarCliente(id_cliente,txtCedula.Text,txtNombre.Text,txtSegundoNombre.Text,txtPrimerApellido.Text,
                        txtSegundoApellido.Text, now, txtTelefonoCasa.Text,txtTelefonoCelular.Text,txtEmail.Text,false))

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

        protected void ShowPopup(object sender, EventArgs e)
        {
            string title = "Eliminar registro";
            string body = "Esta seguro de eliminar este registro?";
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
        }
    }
}