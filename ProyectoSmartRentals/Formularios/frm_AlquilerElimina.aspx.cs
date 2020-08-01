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
        protected void Page_Load(object sender, EventArgs e)
        {

            this.hdldAlquiler.Value = this.Request.QueryString["alq_id_Propiedad"];
            CargaDatosAlquileres();
            menu();
           

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

                //DropDownListProvincia.DataSource = Consultar("select p.Nombre as Provincia from C_Alquiler a INNER JOIN C_Provincia p ON a.Id_Provincia = p.Id_Provincia WHERE a.alq_id_Propiedad =" + id_Alquiler);
                //DropDownListProvincia.DataBind();


                //DropDownListCanton.DataSource = Consultar("select c.Nombre as Canton from C_Alquiler a INNER JOIN C_Provincia p ON a.Id_Provincia = p.Id_Provincia INNER JOIN C_Canton c ON a.Id_Canton = c.Id_Canton WHERE a.alq_id_Propiedad = " + id_Alquiler);
                //DropDownListCanton.DataBind();


                //DropDownListDistrito.DataSource = Consultar("select d.Nombre as Distrito from C_Alquiler a INNER JOIN C_Provincia p ON a.Id_Provincia = p.Id_Provincia INNER JOIN C_Canton c ON a.Id_Canton = c.Id_Canton INNER JOIN C_Distrito d ON a.Id_Distrito = d.Id_Distrito WHERE a.alq_id_Propiedad =" + id_Alquiler);
                //DropDownListDistrito.DataBind();



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
                    
                }

            }
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


                    if (oAlquileres.ModificaAlquiler(id_contrato,
                        txtUbicacionExacta.Text, txtTipoPropiedad.Text,
                        txtDetalles.Text, Convert.ToInt16(txtDistrito.Text),
                        Convert.ToInt16(txtCanton.Text),
                        Convert.ToInt16(txtProvincia.Text), txtImagen.Text, false))

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
                        "Provincia :" + " &nbsp;&nbsp;&nbsp;&nbsp" + txtProvincia.Text+ "<br/>" +
                        "--------------------------------------------------------" + "<br/>" +
                        "Cantón :" + "  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp " + txtCanton.Text + "<br/>" +
                        "--------------------------------------------------------" + "<br/>" +
                        "Distrito :" + "  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp " + txtDistrito.Text + "<br/>";

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