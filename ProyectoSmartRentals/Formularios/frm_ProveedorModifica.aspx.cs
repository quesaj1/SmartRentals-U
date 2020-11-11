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
using C_Proveedor = ProyectoSmartRentals.Metodos.C_Proveedor;

namespace ProyectoSmartRentals.Formularios
{
   
    public partial class frm_ProveedorModifica : System.Web.UI.Page
    {
        int _pk_admin = 0;
        int _pk_cliente = 0;
        int _pk_proveedor = 0;
        int _provincia;
        int _canton = 2;
        int _distrito = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

                if (Session["UserName"] == null)
                {
                    Response.Redirect("frm_Login.aspx?error=jwP46Q", true);
                }
                else
                {
                    IniciarLlenadoDropDown();
                    this.hdldProveedor.Value = this.Request.QueryString["prv_IDProveedor"];
                    CargaDatosProveedor();
                    menu();
                    provincia();
                    canton();
                    distrito();
                    IniciarLlenadoDropDown();

                }
                
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
            DropDownListProvincia.SelectedIndex = DropDownListProvincia.Items.IndexOf(DropDownListProvincia.Items.FindByValue(Provincia));
            DropDownListCanton.SelectedIndex = DropDownListCanton.Items.IndexOf(DropDownListCanton.Items.FindByValue(Canton));
            DropDownListDistrito.SelectedIndex = DropDownListDistrito.Items.IndexOf(DropDownListDistrito.Items.FindByValue(Distrito));
        }


     
        

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            ///Verificar que todas las validaciones hayan sido
            ///satisfactorias
            if (this.IsValid)
            {
                int id_proveedor = 0;

                ///obtener del hiddenField el valor de la llave primaria
                id_proveedor = Convert.ToInt16(this.hdldProveedor.Value);

                try
                {
                    if (this.lastProveedor.Text == this.txtCedulaRepresentante.Text)
                    {

                        if (this.lastProveedorCJ.Text == this.txtCedulaJuridica.Text)
                        {

                            C_Proveedor oProveedor = new C_Proveedor();
                            string TipoProveedor = this.txtTipoProveedor.Value.ToString();
                            if (oProveedor.ModificarProveedor(id_proveedor, txtNombreVariable.Text, txtNombreRepresentante.Text,
                               txtPrimerApellido.Text, txtSegundoApellido.Text, txtCedulaRepresentante.Text, txtCedulaJuridica.Text, txtTelefono.Text, txtEmail.Text, TipoProveedor, Convert.ToInt16(this.DropDownListDistrito.Text),
                                  Convert.ToInt16(this.DropDownListCanton.Text), Convert.ToInt16(this.DropDownListProvincia.Text), txtOtrasSenas.Text, true)
                                )
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeSuccess()", true);
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeError()", true);
                            }

                        }

                    }
                    else {

                        if (!proveedorexiste(this.txtCedulaRepresentante.Text))
                        {
                            if (!proveedorCJexiste(this.txtCedulaJuridica.Text))
                            {

                                C_Proveedor oProveedor = new C_Proveedor();
                                string TipoProveedor = this.txtTipoProveedor.Value.ToString();
                                if (oProveedor.ModificarProveedor(id_proveedor, txtNombreVariable.Text, txtNombreRepresentante.Text,
                                   txtPrimerApellido.Text, txtSegundoApellido.Text, txtCedulaRepresentante.Text, txtCedulaJuridica.Text, txtTelefono.Text, txtEmail.Text, TipoProveedor, Convert.ToInt16(this.DropDownListDistrito.Text),
                                      Convert.ToInt16(this.DropDownListCanton.Text), Convert.ToInt16(this.DropDownListProvincia.Text), txtOtrasSenas.Text, true)
                                    )
                                {
                                    ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeSuccess()", true);
                                }
                                else
                                {
                                    ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeError()", true);
                                }
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeDuplicateCJ()", true);
                            }
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeDuplicate()", true);
                        }

                    }

                }
                catch (Exception error)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeError()", true);
                }
            }
        }

        protected void btnAtras_Click(object sender, EventArgs e)
        {

        }

        void CargaDatosProveedor()
        {
            ///obtener el valor del parámetro que fue asignado al hidden
            ///en el page_Load
            string llavePrimaria = this.hdldProveedor.Value;
            if (!string.IsNullOrEmpty(llavePrimaria))
            {
                int id_Proveedor = Convert.ToInt16(llavePrimaria);

                C_Proveedor oProveedor = new C_Proveedor();
                ///Crear la instancia del objeto de retorno
                ///del procedimiento almacenado
                sp_RetornaProveedorID_Result resultadoSp = oProveedor.RetornarProveedorID(id_Proveedor);

                ///validar que el procedimiento retorne un valor
                if (resultadoSp != null)


                {
                    this.txtIDProveedor.Text = resultadoSp.prv_IDProveedor.ToString();
                    this.txtNombreVariable.Text = resultadoSp.prv_NombreVariable;
                    this.txtNombreRepresentante.Text = resultadoSp.prv_NombreRepresentante;
                    this.txtPrimerApellido.Text = resultadoSp.prv_PrimerApellido;
                    this.txtSegundoApellido.Text = resultadoSp.prv_SegundoApellido;
                    this.txtCedulaRepresentante.Text = resultadoSp.prv_CedulaRepresentante;
                    this.txtCedulaJuridica.Text = resultadoSp.prv_CedulaJuridica;
                    this.txtTelefono.Text = resultadoSp.prv_Telefono;
                    this.txtEmail.Text = resultadoSp.prv_Email;
                    this.txtTipoProveedor.Value = resultadoSp.prv_TipoProveedor;
                    _provincia = Convert.ToInt32(resultadoSp.Id_Provincia.ToString());
                    _canton = Convert.ToInt32(resultadoSp.Id_Canton.ToString());
                    _distrito = Convert.ToInt32(resultadoSp.Id_Distrito.ToString());
                    this.txtOtrasSenas.Text = resultadoSp.prv_OtrasSenas;
                    this.lastProveedor.Text = resultadoSp.prv_CedulaRepresentante;
                    this.lastProveedorCJ.Text = resultadoSp.prv_CedulaJuridica;

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

        bool proveedorexiste(string user)
        {

            string llavePrimaria = this.txtCedulaRepresentante.Text;
            if (!string.IsNullOrEmpty(llavePrimaria))
            {
                string userid = llavePrimaria;
                Metodos.C_Proveedor oUsuario = new Metodos.C_Proveedor();
                ///Crear la instancia del objeto de retorno
                ///del procedimiento almacenado
                sp_RetornaProveedorName_Result resultadoSp = oUsuario.RetornaProveedorname(userid);

                ///validar que el procedimiento retorne un valor
                if (resultadoSp != null)
                {
                    return true;
                }
                else
                {
                    return false;

                }

            }
            else
            {
                return false;
            }



        }


        bool proveedorCJexiste(string user)
        {

            string llavePrimaria = this.txtCedulaJuridica.Text;
            if (!string.IsNullOrEmpty(llavePrimaria))
            {
                string userid = llavePrimaria;
                Metodos.C_Proveedor oUsuario = new Metodos.C_Proveedor();
                ///Crear la instancia del objeto de retorno
                ///del procedimiento almacenado
                sp_RetornaProveedorCJName_Result resultadoSp = oUsuario.RetornaProveedorCJname(userid);

                ///validar que el procedimiento retorne un valor
                if (resultadoSp != null)
                {
                    return true;
                }
                else
                {
                    return false;

                }

            }
            else
            {
                return false;
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

        public void provincia()
        {
            DropDownListProvincia1.DataSource = Consultar("select * from C_Provincia where Id_provincia = " + _provincia);
            DropDownListProvincia1.DataTextField = "nombre";
            DropDownListProvincia1.DataValueField = "id_provincia";
            DropDownListProvincia1.DataBind();
            this.DropDownListProvincia1.SelectedItem.ToString();
        }

        public void canton()
        {
            DropDownListCanton1.DataSource = Consultar(" select * from C_Canton where Id_Canton= " + _canton);
            DropDownListProvincia1.DataTextField = "nombre";
            DropDownListProvincia1.DataValueField = "Id_Canton";
            DropDownListCanton1.DataBind();
            this.DropDownListCanton1.SelectedItem.ToString();
        }

        public void distrito()
        {
            DropDownListDistrito1.DataSource = Consultar("select * from C_Distrito where Id_Distrito = " + _distrito);
            DropDownListProvincia1.DataTextField = "nombre";
            DropDownListProvincia1.DataValueField = "C_Distrito";
            DropDownListDistrito1.DataBind();
            this.DropDownListDistrito1.SelectedItem.ToString();


        }


    }
}