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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                ///obtener el valor del parámetro envíado desde la lista
                ///debe llamarse igual a lo envíado desde el grid
                this.hdlCliente.Value = this.Request.QueryString["cli_Cliente"];
                CargaDatosCliente();
            }
        }

        void CargaDatosCliente()
        {
            /////obtener el valor del parámetro que fue asignado al hidden
            /////en el page_Load
            //string llavePrimaria = this.hdlCliente.Value;
            //if (!string.IsNullOrEmpty(llavePrimaria))
            //{
            //    int id_AdminRentals = Convert.ToInt16(llavePrimaria);
            //    //C_Clientes oAdminRentals = new C_Clientes();
            //    ///Crear la instancia del objeto de retorno
            //    ///del procedimiento almacenado
            //    sp_RetornaClienteID_Result resultadoSp = oAdminRentals.RetornaClienteID(id_AdminRentals);

            //    ///validar que el procedimiento retorne un valor
            //    if (resultadoSp != null)
            //    {
            //        this.txtCedula.Text = resultadoSp.cli_Cedula;
            //        this.txtNombre.Text = resultadoSp.cli_Nombre;
            //        this.txtSegundoNombre.Text = resultadoSp.cli_SegundoNombre;
            //        this.txtPrimerApellido.Text = resultadoSp.cli_PrimerApelido;
            //        this.txtSegundoApellido.Text = resultadoSp.cli_SegundoApellido;
            //        this.txtFechaNacimiento.Text = resultadoSp.cli_FechaNacimiento.ToString();
            //        this.txtTelefonoCasa.Text = resultadoSp.cli_TelefonoCasa;
            //        this.txtTelefonoCelular.Text = resultadoSp.cli_TelefonoCelular;
            //        this.txtEmail.Text = resultadoSp.cli_Email;
            //    }

            //}
        }


        protected void btnModificar_Click(object sender, EventArgs e)
        {
            ///Verificar que todas las validaciones hayan sido
            ///satisfactorias
            if (this.IsValid)
            {
                int id_AdminRentals = 0;

                ///obtener del hiddenField el valor de la llave primaria
                id_AdminRentals = Convert.ToInt16(this.hdlCliente.Value);

                try
                {

                    //C_Clientes oAdminRentals = new C_Clientes();

                    //if (oAdminRentals.ModificarCliente(id_AdminRentals, this.txtCedula.Text,
                    //   this.txtNombre.Text, this.txtSegundoNombre.Text, this.txtPrimerApellido.Text, this.txtSegundoApellido.Text,
                    //   null, this.txtTelefonoCasa.Text, this.txtTelefonoCelular.Text, this.txtEmail.Text)
                    //    )
                    //{
                    //    this.lblResultado.Text = "Registro Modificado";
                    //}
                    //else
                    //{
                    //    this.lblResultado.Text = "No se pudo modificar";
                    //}

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
    }
}