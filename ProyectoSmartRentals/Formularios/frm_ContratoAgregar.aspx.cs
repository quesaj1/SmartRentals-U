using ProyectoSmartRentals.Metodos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_ContratoAgregar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownClientes();
                DropDownAlquileres();

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


        public void agregarContrato()
        {
            try
            {
                string contrato = this.txtContratoNumero.Text.ToString();
                string fechainicio = this.txtFechaInicio.Text.ToString();
                string fechafinal = this.txtFechaFinaliacion.Text.ToString();
                decimal monto = Convert.ToDecimal(txtMonto.Text.ToString());
                int Id_Ciente = Convert.ToInt16(this.DropDownListCliente.Text.ToString());
                int Id_propiedades = Convert.ToInt16(this.DropDownPropiedad.Text.ToString());
                DateTime now = DateTime.Now;

                //Hay que tomar la fecha con el datepicker


                C_Contrato oContrato = new C_Contrato();
                bool ContratoInsertar =
                    oContrato.InsertaContrato(Id_Ciente, contrato, now,
                    now, monto, true, "aún nada", Id_propiedades,7, now);


                if (ContratoInsertar)
                    this.lblResultado.Text = "Contrato agregado";
                else
                    this.lblResultado.Text = "No se pudo agregar el contrato";
            }
            catch (Exception error)
            {

                this.lblResultado.
                    Text = "Ocurrió un error:" + error.Message;
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            agregarContrato();
        }
    }
}