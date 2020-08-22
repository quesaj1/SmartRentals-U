using ProyectoSmartRentals.Metodos;
using ProyectoSmartRentals.Modelos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_AlquileresModifica : System.Web.UI.Page
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

            if (!this.IsPostBack)
            {
                
                ///obtener el valor del parámetro envíado desde la lista
                ///debe llamarse igual a lo envíado desde el grid
                this.hdldAlquiler.Value = this.Request.QueryString["alq_id_Propiedad"];
                CargaDatosAlquileres();
                menu();
                provincia();
                canton();
                distrito();
                img();
                IniciarLlenadoDropDown();

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
                Response.Redirect("frm_inicioMenu.aspx?error=zW2aqP", false);

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
                Response.Redirect("frm_inicioMenu.aspx?error=zW2aqP", false);
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

            DropDownListCanton.DataSource = Consultar("Select * from dbo.C_Canton");
            DropDownListCanton.DataTextField = "Nombre";
            DropDownListCanton.DataValueField = "Id_Canton";
            DropDownListCanton.DataBind();


            DropDownListDistrito.DataSource = Consultar("Select * from dbo.C_Distrito");
            DropDownListDistrito.DataTextField = "Nombre";
            DropDownListDistrito.DataValueField = "Id_Distrito";
            DropDownListDistrito.DataBind();

            DropDownListProvincia.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
            DropDownListCanton.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
            DropDownListDistrito.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
            string Provincia = DropDownListProvincia1.Text.ToString();
            string Canton = DropDownListCanton1.Text.ToString();
            string Distrito = DropDownListDistrito1.Text.ToString();
            DropDownListProvincia.SelectedIndex=DropDownListProvincia.Items.IndexOf(DropDownListProvincia.Items.FindByValue(Provincia));
            DropDownListCanton.SelectedIndex=DropDownListCanton.Items.IndexOf(DropDownListCanton.Items.FindByValue(Canton));
            DropDownListDistrito.SelectedIndex=DropDownListDistrito.Items.IndexOf(DropDownListDistrito.Items.FindByValue(Distrito));
            
            
            //DropDownListProvincia.Items.Insert(0, new ListItem(this.DropDownListProvincia1.SelectedItem.Text, "0"));
            //DropDownListCanton.Items.Insert(0, new ListItem(this.DropDownListCanton1.SelectedItem.Text, "0"));
            //DropDownListDistrito.Items.Insert(0, new ListItem(this.DropDownListDistrito1.SelectedItem.Text, "0"));

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
                    string extension = System.IO.Path.GetExtension(fupImage.FileName);
                    string URL = fupImage.PostedFile.FileName;

                    if (extension == ".jpeg" || extension == ".png" || extension == ".jpg")
                    {
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
                              Convert.ToInt16(this.DropDownListProvincia.Text), alq_ImagenURL, true)
                                )
                            {
                                /// this.lblResultado.Text = "Registro Modificado";
                                ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeSuccess()", true);
                            }
                            else
                            {
                                //this.lblResultado.Text = "No se pudo modificar";
                                ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeError()", true);
                            }

                        }
                        catch (Exception error)
                        {
                            //this.lblResultado.Text = "No se pudo modificar: " + error;
                            ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeError()", true);

                        }
                    }

                    else
                    {
                        this.lblResultado.Text = "Solo se aceptan archivos de imagen .jpg .jpeg o .png";

                    }

                }

                else
                {


                    try
                    {


                        string alq_ImagenURL = this.image.ImageUrl;

                        C_Alquileres oAlquileres = new C_Alquileres();
                        string alq_TipoPropiedad = this.txtTipoPropiedad.Value.ToString();
                        if (oAlquileres.ModificaAlquiler(id_Alquiler, this.txtUbicacionExacta.Text,
                             alq_TipoPropiedad, this.txtDetalles.Text, Convert.ToInt16(this.DropDownListDistrito.Text),
                            Convert.ToInt16(this.DropDownListCanton.Text),
                            Convert.ToInt16(this.DropDownListProvincia.Text), alq_ImagenURL, true)
                        )
                        {
                            /// this.lblResultado.Text = "Registro Modificado";
                            ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeSuccess()", true);
                        }
                        else
                        {
                            //this.lblResultado.Text = "No se pudo modificar";
                            ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeError()", true);
                        }

                    }
                    catch (Exception error)
                    {
                        //this.lblResultado.Text = "No se pudo modificar: " + error;
                        ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeError()", true);

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
                    this.txtID.Text = resultadoSp.alq_id_Propiedad.ToString();
                    this.txtUbicacionExacta.Text = resultadoSp.alq_UbicacionExacta;
                    this.txtTipoPropiedad.Value = resultadoSp.alq_TipoPropiedad;
                    this.txtDetalles.Text = resultadoSp.alq_Detalles;
                    //this.DropDownListDistrito.Text= resultadoSp.Id_Distrito.ToString();
                    //this.DropDownListCanton.Text = resultadoSp.Id_Canton.ToString();
                    //this.DropDownListProvincia.Text = resultadoSp.Id_Provincia.ToString();
                    _provincia = Convert.ToInt32(resultadoSp.Id_Provincia.ToString());
                    _canton = Convert.ToInt32(resultadoSp.Id_Canton.ToString());
                    _distrito = Convert.ToInt32(resultadoSp.Id_Distrito.ToString());
                    _img = resultadoSp.alq_ImagenURL;
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


        public void provincia()
        {
            DropDownListProvincia1.DataSource = Consultar("select * from C_Provincia where id_provincia = " + _provincia);
            DropDownListProvincia1.DataTextField = "nombre";
            DropDownListProvincia1.DataValueField = "id_provincia";
            DropDownListProvincia1.DataBind();
           /* this.DropDownListProvincia.SelectedItem.Text = */this.DropDownListProvincia1.SelectedItem.ToString();
        }

        public void canton()
        {
            DropDownListCanton1.DataSource = Consultar(" select * from C_Canton where Id_Canton= " + _canton);
            DropDownListProvincia1.DataTextField = "nombre";
            DropDownListProvincia1.DataValueField = "Id_Canton";
            DropDownListCanton1.DataBind();
           /* this.DropDownListCanton.SelectedItem.Text = */this.DropDownListCanton1.SelectedItem.ToString();
        }

        public void distrito()
        {
            DropDownListDistrito1.DataSource = Consultar("select * from C_Distrito where Id_Distrito = " + _distrito);
            DropDownListProvincia1.DataTextField = "nombre";
            DropDownListProvincia1.DataValueField = "C_Distrito";
            DropDownListDistrito1.DataBind();
         /*   this.DropDownListDistrito.SelectedItem.Text = */this.DropDownListDistrito1.SelectedItem.ToString();


        }

       
        protected void img()
        {
           this.image.ImageUrl = _img;
        }
    }
}