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
    public partial class frm_crearTiquete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //acá debemos de tomar la variable de sesión del cliente para que solo filtre por ellas.
                int v_fk_cliente = 4;
                DropDownContrato(v_fk_cliente);
               
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

        private void DropDownContrato(int fk_cliente)
        {
           
         
            DropDownContratos.DataSource = Consultar("select id_ctr_contrato, ctr_numeroContrato " +
                 " from C_Contratos where ctr_activo = 1 and fk_cli_cliente = " + fk_cliente );
            DropDownContratos.DataTextField = "ctr_numeroContrato";
            DropDownContratos.DataValueField = "id_ctr_contrato";
            DropDownContratos.DataBind();
            DropDownContratos.Items.Insert(0, new ListItem("[Seleccione un contrato]", "0"));

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                int contrato = Convert.ToInt16(this.DropDownContratos.Text.ToString());
                string tipoProblema = this.DropDownTipo.SelectedItem.ToString();
                string descripcionProblema = this.txaMessage.Value;
                string tituloProblema = this.txtTitulo.Text;
                DateTime now = DateTime.Now;
                



                C_Tiquetes oTiquete = new C_Tiquetes();
                bool TiqueteInsertar =
                    oTiquete.InsertaTiquete(contrato,tipoProblema,true, descripcionProblema,null,
                    now, null, null, tituloProblema, null, "Pendiente");


                if (TiqueteInsertar)
                    this.lblResultado.Text = "Tiquete agregado";
                else
                    this.lblResultado.Text = "No se pudo agregar el contrato";
            }
            catch (Exception error)
            {

                this.lblResultado.
                    Text = "Ocurrió un error:" + error.Message;
            }
        }
    }
}