using ProyectoSmartRentals.Metodos;
using ProyectoSmartRentals.Modelos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_ContratoModifica : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                DropDownClientes();
                DropDownAlquileres();
                this.hdldContrato.Value = this.Request.QueryString["id_ctr_contrato"];
                cargarDatos();
            }
        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            ///Verificar que todas las validaciones hayan sido
            ///satisfactorias
            if (this.IsValid)
            {
                int id_contrato = 0;

                ///obtener del hiddenField el valor de la llave primaria
                id_contrato = Convert.ToInt16(this.hdldContrato.Value);

                try
                {

                    C_Contrato oContratos = new C_Contrato();
                    DateTime now = DateTime.Now;
                    if (oContratos.ModificarCliente(id_contrato, Convert.ToInt16(this.DropDownListCliente.Text), this.txtContratoNumero.Text,
                       now, now, Convert.ToDecimal(this.txtMonto.Text),true,"aun nada",
                       Convert.ToInt16(this.DropDownPropiedad.Text),1, now)
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
                    this.lblResultado.Text = "No se pudo modificar: " + error;
                }
            }
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
        private void DropDownClientes()
        {
            DropDownListCliente.DataSource = Consultar("select cli_cliente, cli_PrimerApelido + ', '+cli_Nombre as nombre from C_Cliente");
            DropDownListCliente.DataTextField = "nombre";
            DropDownListCliente.DataValueField = "cli_cliente";
            DropDownListCliente.DataBind();
            DropDownListCliente.Items.Insert(0, new ListItem("[Seleccione un cliente]", "0"));

        }

        private void DropDownAlquileres()
        {
            DropDownPropiedad.DataSource = Consultar("select * from C_Alquiler");
            DropDownPropiedad.DataTextField = "alq_UbicacionExacta";
            DropDownPropiedad.DataValueField = "alq_id_Propiedad";
            DropDownPropiedad.DataBind();
            DropDownPropiedad.Items.Insert(0, new ListItem("[Seleccione una propiedad]", "0"));

        }


        public void cargarDatos()
        {
            ///obtener el valor del parámetro que fue asignado al hidden
            ///en el page_Load
            string llavePrimaria = this.hdldContrato.Value;
            if (!string.IsNullOrEmpty(llavePrimaria))
            {
                int id_Contrato = Convert.ToInt16(llavePrimaria);
                C_Contrato oContrato = new C_Contrato();
                ///Crear la instancia del objeto de retorno
                ///del procedimiento almacenado
                sp_RetornaContratoID_Result resultadoSp = oContrato.RetornaContratoID(id_Contrato);

                ///validar que el procedimiento retorne un valor
                if (resultadoSp != null)
                {
                    this.txtContratoNumero.Text = resultadoSp.ctr_numeroContrato;
                    //Falta ver lo de la fecha
                    this.txtFechaFinaliacion.Text = Convert.ToString(resultadoSp.ctr_fechafinalizacion);
                    this.txtFechaInicio.Text = Convert.ToString(resultadoSp.ctr_fechainicio);
                    //this.txtFechaPago.Text = Convert.ToString(resultadoSp)
                    this.txtMonto.Text = (resultadoSp.ctr_monto).ToString("N0");
                 
                    this.DropDownListCliente.Text = resultadoSp.fk_cli_cliente.ToString();
                    this.DropDownPropiedad.Text = resultadoSp.fk_alq_id_propiedad.ToString();




                }

            }
        }

    }
}