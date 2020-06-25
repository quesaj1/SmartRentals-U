using ProyectoSmartRentals.Metodos;
using ProyectoSmartRentals.Modelos;
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
    public partial class frm_AlquileresModifica : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.IsPostBack)
            {
                IniciarLlenadoDropDown();
                ///obtener el valor del parámetro envíado desde la lista
                ///debe llamarse igual a lo envíado desde el grid
                this.hdldAlquiler.Value = this.Request.QueryString["alq_id_Propiedad"];
                CargaDatosAlquileres();
                IniciarLlenadoDropDown();
            }
        }

        private void IniciarLlenadoDropDown()
        {
            DropDownListProvincia.DataSource = Consultar("Select * from dbo.C_Provincia");
            DropDownListProvincia.DataTextField = "Nombre";
            DropDownListProvincia.DataValueField = "Id_Provincia";
            DropDownListProvincia.DataBind();
            DropDownListProvincia.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
            DropDownListCanton.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
            DropDownListDistrito.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            ///Verificar que todas las validaciones hayan sido
            ///satisfactorias
            if (this.IsValid)
            {
                int id_Alquiler = 0;

                ///obtener del hiddenField el valor de la llave primaria
                id_Alquiler = Convert.ToInt16(this.hdldAlquiler.Value);

                if (fupImage.HasFile)
                {

                    string URL = fupImage.PostedFile.FileName;
                    string filePath = Server.MapPath(@"~/Propiedades/" + URL);
                    fupImage.SaveAs(filePath);





                    try
                    {

                        string alq_Imagen = this.fupImage.FileName.ToString();
                        string alq_ImagenURL = "~/Propiedades/" + alq_Imagen;

                        C_Alquileres oAlquileres = new C_Alquileres();
                        string alq_TipoPropiedad = this.txtTipoPropiedad.Value.ToString();
                        if (oAlquileres.ModificaAlquiler(id_Alquiler, this.txtUbicacionExacta.Text,
                         alq_TipoPropiedad, this.txtDetalles.Text, Convert.ToInt16(this.DropDownListDistrito.Text),
                          Convert.ToInt16(this.DropDownListCanton.Text),
                          Convert.ToInt16(this.DropDownListProvincia.Text), alq_ImagenURL)
                            )
                        {
                            this.lblResultado.Text = "Registro Modificado";
                        }
                        else
                        {
                            this.lblResultado.Text = "No se pudo modificar";
                        }

                    }
                    catch (Exception)
                    {
                        this.lblResultado.Text = "No se pudo modificar";

                    }

                }
            }
        }

        protected void btnAtras_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Formularios/frm_AlquileresLista.aspx");
        }

        void CargaDatosAlquileres()
        {
            ///obtener el valor del parámetro que fue asignado al hidden
            ///en el page_Load
            string llavePrimaria = this.hdldAlquiler.Value;
            if (!string.IsNullOrEmpty(llavePrimaria))
            {
                int id_Alquiler = Convert.ToInt16(llavePrimaria);

                C_Alquileres oAlquileres = new C_Alquileres();
                ///Crear la instancia del objeto de retorno
                ///del procedimiento almacenado
                sp_RetornaAlquilerID_Result resultadoSp = oAlquileres.RetornaAlquilerID(id_Alquiler);

                ///validar que el procedimiento retorne un valor
                if (resultadoSp != null)


                {
                    


                    this.txtUbicacionExacta.Text = resultadoSp.alq_UbicacionExacta;
                    this.txtTipoPropiedad.Value = resultadoSp.alq_TipoPropiedad;
                    this.txtDetalles.Text = resultadoSp.alq_Detalles;
                    this.DropDownListDistrito.Text = resultadoSp.Id_Distrito.ToString();
                    this.DropDownListCanton.Text = resultadoSp.Id_Canton.ToString();
                    this.DropDownListProvincia.Text = resultadoSp.Id_Provincia.ToString();
                    

                }

            }
        }

        protected void SeleccionaProvincia(object sender, EventArgs e)
        {
            int ProvinciaID = Convert.ToInt32(DropDownListProvincia.SelectedValue);
            DropDownListCanton.DataSource = Consultar("Select * from dbo.C_Canton where Id_Provincia=" + ProvinciaID);
            DropDownListCanton.DataTextField = "Nombre";
            DropDownListCanton.DataValueField = "Id_Canton";
            DropDownListCanton.DataBind();
            DropDownListCanton.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
        }

        protected void SeleccionaCanton(object sender, EventArgs e)
        {

            int CantonID = Convert.ToInt32(DropDownListCanton.SelectedValue);
            DropDownListDistrito.DataSource = Consultar("Select * from dbo.C_Distrito where Id_Canton=" + CantonID);
            DropDownListDistrito.DataTextField = "Nombre";
            DropDownListDistrito.DataValueField = "Id_Distrito";
            DropDownListDistrito.DataBind();
            DropDownListDistrito.Items.Insert(0, new ListItem("[Seleccionar]", "0"));

        }

        protected void SeleccionaDistrito(object sender, EventArgs e)
        {

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

        protected void ShowPopup(object sender, EventArgs e)
        {
            string title = "Modificar registro";
            string body = "Esta seguro de modificar este registro?.  Por favor confirme";

            

            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
        }
    }
}