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
    public partial class frm_AlquileresLista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                IniciarLlenadoDropDown();
            }
            
            this.CargaDatosGrid();
        }

        private void IniciarLlenadoDropDown()
        {

       
            DropDownListId.DataSource = Consultar("Select * from dbo.C_Alquiler");
            DropDownListId.DataTextField = "alq_id_Propiedad";
            DropDownListId.DataValueField = "alq_id_Propiedad";
            DropDownListId.DataBind();
            DropDownListId.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
           
        }

        void CargaDatosGrid()
        {
            
            int alq_id_Propiedad = Convert.ToInt16(this.DropDownListId.Text.ToString());
            
            string alq_TipoPropiedad = this.txtipoPropiedad.Text.ToString();




            C_Alquileres oAlquileres = new C_Alquileres();
            ///Asignarle la fuente de datos al grid
            this.grdListaAlquileres.DataSource =
                oAlquileres.RetornaAlquiler(alq_id_Propiedad, alq_TipoPropiedad);
            ///indicar al grid que se muestre
            this.grdListaAlquileres.DataBind();
        }

        protected void grdListaAlquileres_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            ///asignar al grid el nuevo índice de la página del grid
            this.grdListaAlquileres.PageIndex = e.NewPageIndex;
            ///asignar nuevamente la fuente de datos al grid
            this.CargaDatosGrid();
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            this.CargaDatosGrid();
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

        protected void IdSeleccion(object sender, EventArgs e)
        {

        }
    }
}