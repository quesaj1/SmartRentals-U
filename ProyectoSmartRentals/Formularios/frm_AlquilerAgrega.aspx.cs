using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoSmartRentals.Metodos;
using ProyectoSmartRentals.Modelos;

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_AlquilerAgrega : System.Web.UI.Page
    {
        int _pk_admin = 0;
        int _pk_cliente = 0;
        int _pk_proveedor = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                IniciarLlenadoDropDown();
                menu();
            }
        }

        void menu()
        {
            string _rol = Convert.ToString(Session["Tipo"]);
            if (_rol.Equals("Cliente"))
            {
                _pk_cliente = 4;
                _pk_admin = 0;
                _pk_proveedor = 0;
                this.Page.Master.FindControl("menu_admin").Visible = false;
                this.Page.Master.FindControl("menu_cliente").Visible = true;
                this.Page.Master.FindControl("menu_proveedor").Visible = false;
                this.Page.Master.FindControl("menu_admin_").Visible = false;
                this.Page.Master.FindControl("menu_cliente_").Visible = true;
                this.Page.Master.FindControl("menu_proveedor_").Visible = false;

            }
            if (_rol.Equals("Proveedor"))
            {
                _pk_cliente = 0;
                _pk_admin = 0;
                _pk_proveedor = 1;
                this.Page.Master.FindControl("menu_admin").Visible = false;
                this.Page.Master.FindControl("menu_cliente").Visible = false;
                this.Page.Master.FindControl("menu_proveedor").Visible = true;
                this.Page.Master.FindControl("menu_admin_").Visible = false;
                this.Page.Master.FindControl("menu_cliente_").Visible = false;
                this.Page.Master.FindControl("menu_proveedor_").Visible = true;
            }
            if (_rol.Equals("Administrador"))
            {
                _pk_cliente = 0;
                _pk_admin = 7;
                _pk_proveedor = 0;
                this.Page.Master.FindControl("menu_admin").Visible = true;
                this.Page.Master.FindControl("menu_cliente").Visible = false;
                this.Page.Master.FindControl("menu_proveedor").Visible = false;
                this.Page.Master.FindControl("menu_admin_").Visible = true;
                this.Page.Master.FindControl("menu_cliente_").Visible = false;
                this.Page.Master.FindControl("menu_proveedor_").Visible = false;
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
            AgregarAlquiler();
        }


        protected void btnAtras_Click(object sender, EventArgs e)
        {

        }

        void AgregarAlquiler()
        {
            if (fupImage.HasFile)
            {

                string URL = fupImage.PostedFile.FileName;
                string filePath = Server.MapPath(@"~/Propiedades/" +URL);
                fupImage.SaveAs(filePath);

          

                {

                    try
                    {

                        string alq_UbicacionExacta = this.txtUbicacionExacta.Text.ToString();
                        string alq_TipoPropiedad = this.txtTipoPropiedad.Value.ToString();
                        string alq_Detalles = this.txtDetalles.Text.ToString();
                        int Id_Provincia = Convert.ToInt16(this.DropDownListProvincia.Text.ToString());
                        int Id_Canton = Convert.ToInt16(this.DropDownListCanton.Text.ToString());
                        int Id_Distrito = Convert.ToInt16(this.DropDownListDistrito.Text.ToString());
                        string alq_Imagen = this.fupImage.FileName.ToString();
                        string alq_ImagenURL = "~/Propiedades/" + alq_Imagen;


                        C_Alquileres oAlquileres = new C_Alquileres();
                        bool AlquilerInsertar =
                            oAlquileres.InsertaAlquiler(alq_UbicacionExacta,
                            alq_TipoPropiedad,
                            alq_Detalles,
                            Id_Distrito,
                            Id_Canton,
                            Id_Provincia,
                            alq_ImagenURL, true);


                        if (AlquilerInsertar)
                            this.lblResultado.Text = "Alquiler agregado";
                        else
                            this.lblResultado.Text = "No se pudo agregar el alquiler";
                    }
                    catch (Exception error)
                    {

                        this.lblResultado.
                            Text = "Ocurrió un error:" + error.Message;
                    }
                }
            }
        }

        protected void ProvinciaSeleccion(object sender, EventArgs e)
        {
            int ProvinciaID = Convert.ToInt32(DropDownListProvincia.SelectedValue);
            DropDownListCanton.DataSource = Consultar("Select * from dbo.C_Canton where Id_Provincia="+ProvinciaID);
            DropDownListCanton.DataTextField = "Nombre";
            DropDownListCanton.DataValueField = "Id_Canton";
            DropDownListCanton.DataBind();
            DropDownListCanton.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
        }

        protected void CantonSeleccion(object sender, EventArgs e)
        {

            int CantonID = Convert.ToInt32(DropDownListCanton.SelectedValue);
            DropDownListDistrito.DataSource = Consultar("Select * from dbo.C_Distrito where Id_Canton="+CantonID);
            DropDownListDistrito.DataTextField = "Nombre";
            DropDownListDistrito.DataValueField = "Id_Distrito";
            DropDownListDistrito.DataBind();
            DropDownListDistrito.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
        }

        protected void DistritoSeleccion(object sender, EventArgs e)
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
    }
}