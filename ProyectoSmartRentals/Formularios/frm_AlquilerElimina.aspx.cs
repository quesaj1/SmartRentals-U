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
    public partial class frm_AlquilerElimina : System.Web.UI.Page
    {


        int _pk_admin = 0;
        int _pk_cliente = 0;
        int _pk_proveedor = 0;
        int _provincia;
        int _canton = 2;
        int _distrito = 0;
        string _img = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            this.hdldAlquiler.Value = this.Request.QueryString["alq_id_Propiedad"];
            CargaDatosAlquileres();
            menu();
            provincia();
            canton();
            distrito();
            img();



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
                ///
                sp_RetornaAlquilerID_Result resultadoSp = oAlquileres.RetornaAlquilerID(id_Alquiler);

              



                ///validar que el procedimiento retorne un valor
                if (resultadoSp != null)
                {
                    this.txtID.Text = resultadoSp.alq_id_Propiedad.ToString();
                    this.txtUbicacionExacta.Text = resultadoSp.alq_UbicacionExacta;
                    this.txtTipoPropiedad.Text = resultadoSp.alq_TipoPropiedad;
                    this.txtDetalles.Text = resultadoSp.alq_Detalles;
                    this.txtDistrito.Text = resultadoSp.Id_Distrito.ToString();
                    this.txtCanton.Text = resultadoSp.Id_Canton.ToString();
                    this.txtProvincia.Text = resultadoSp.Id_Provincia.ToString();
                    this.txtImagen.Text = resultadoSp.alq_ImagenURL;
                    _provincia = Convert.ToInt32(this.txtProvincia.Text);
                    _canton = Convert.ToInt32(this.txtCanton.Text);
                    _distrito = Convert.ToInt32(this.txtDistrito.Text);
                    _img = resultadoSp.alq_ImagenURL;

          


       


                

                }

            }
        }

        public void provincia()
        {
            DropDownListProvincia.DataSource = Consultar("select * from C_Provincia where id_provincia = " + _provincia);
            DropDownListProvincia.DataTextField = "nombre";
            DropDownListProvincia.DataValueField = "id_provincia";
            DropDownListProvincia.DataBind();
            this.txtProvincia.Text = this.DropDownListProvincia.SelectedItem.ToString();
        }

        public void canton()
        {
            DropDownListCanton.DataSource = Consultar(" select * from C_Canton where Id_Canton= " + _canton);
            DropDownListProvincia.DataTextField = "nombre";
            DropDownListProvincia.DataValueField = "Id_Canton";
            DropDownListCanton.DataBind();
            this.txtCanton.Text = this.DropDownListCanton.SelectedItem.ToString();
        }

        public void distrito()
        {
            DropDownListDistrito.DataSource = Consultar("select * from C_Distrito where Id_Distrito = " + _distrito);
            DropDownListProvincia.DataTextField = "nombre";
            DropDownListProvincia.DataValueField = "C_Distrito";
            DropDownListDistrito.DataBind();
            this.txtDistrito.Text = this.DropDownListDistrito.SelectedItem.ToString();
        }


        protected void img()
        {
            this.image.ImageUrl = _img;
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {

            if (this.IsValid)
            {

                int id_contrato = 0;

                id_contrato = Convert.ToInt16(this.hdldAlquiler.Value);

                try
                {
                    C_Alquileres oAlquileres = new C_Alquileres();


                    if (oAlquileres.EliminarAlquiler(id_contrato, false))

                        //this.lblResultado.Text = "Registro eliminado";
                        ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeSuccess()", true);

                    else
                        //this.lblResultado.Text = "No fue posible eliminar";
                        ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeError()", true);
                }
                catch (Exception error)
                {
                    //this.lblResultado.Text = "Ocurrió un error:" + error.Message;
                    ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeError()", true);
                }

            }
        }

        protected void btnAtras_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Formularios/frm_AlquileresLista.aspx");
        }

        protected void ShowPopup(object sender, EventArgs e)
        {
         
           string title = "Eliminar registro";
           string body =  
                        "Esta seguro de eliminar este alquiler?"+ "<br/>"+ "<br/>"+
                        "No. Alquiler :" +"&nbsp" +txtID.Text + "<br/>"+
                        "--------------------------------------------------------" + "<br/>" +
                        "Propiedad :" +"&nbsp;&nbsp " +txtTipoPropiedad.Text +"<br/>" +
                        "--------------------------------------------------------" + "<br/>" +
                        "Provincia :" + " &nbsp;&nbsp;&nbsp;&nbsp" + this.DropDownListProvincia.SelectedItem.ToString() + "<br/>" +
                        "--------------------------------------------------------" + "<br/>" +
                        "Cantón :" + "  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp " + this.DropDownListCanton.SelectedItem.ToString() + "<br/>" +
                        "--------------------------------------------------------" + "<br/>" +
                        "Distrito :" + "  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp " + this.DropDownListDistrito.SelectedItem.ToString() + "<br/>";

            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
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