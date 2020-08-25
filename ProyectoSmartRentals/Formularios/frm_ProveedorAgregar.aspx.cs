using ProyectoSmartRentals.Metodos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoSmartRentals.Modelos;
using C_Proveedor = ProyectoSmartRentals.Metodos.C_Proveedor;
using System;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Text;

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_ProveedorAgregar : System.Web.UI.Page
    {
        int _pk_admin = 0;
        int _pk_cliente = 0;
        int _pk_proveedor = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"] == null)
                {
                    Response.Redirect("frm_Login.aspx?error=jwP46Q", true);
                }
                else
                {
                    IniciarLlenadoDropDown();

                    menu();

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
            DropDownListProvincia.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
            DropDownListCanton.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
            DropDownListDistrito.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            AgregarProveedor();
        }

        void AgregarProveedor()
        {
            try
            {

                string prv_NombreVariable = this.txtNombreVariable.Text.ToString();
                string prv_NombreRepresentante = this.txtNombreRepresentante.Text.ToString();
                string prv_PrimerApellido = this.txtPrimerApellido.Text.ToString();
                string prv_SegundoApellido = this.txtSegundoApellido.Text.ToString();
                string prv_CedulaRepresentante = this.txtCedulaRepresentante.Text.ToString();
                string prv_CedulaJuridica = this.txtCedulaJuridica.Text.ToString();
                string prv_Telefono = this.txtTelefono.Text.ToString();
                string prv_Email = this.txtEmail.Text.ToString();
                string prv_TipoProveedor = this.txtTipoProveedor.Value.ToString();
                int Id_Provincia = Convert.ToInt16(this.DropDownListProvincia.Text.ToString());
                int Id_Canton = Convert.ToInt16(this.DropDownListCanton.Text.ToString());
                int Id_Distrito = Convert.ToInt16(this.DropDownListDistrito.Text.ToString());
                string prv_OtrasSenas = this.txtOtrasSenas.Text.ToString();

                if (!existe(prv_Email))
                {

                    C_Proveedor oProveedor = new C_Proveedor();
                bool ProveedorInsertar =
                    oProveedor.InsertaProveedor(prv_NombreVariable, prv_NombreRepresentante, prv_PrimerApellido, prv_SegundoApellido, prv_CedulaRepresentante,
                    prv_CedulaJuridica, prv_Telefono, prv_Email, prv_TipoProveedor, Id_Distrito, Id_Canton, Id_Provincia, prv_OtrasSenas,true);


                if (ProveedorInsertar)
                {
                  

                    Metodos.C_Usuario oUsuario = new Metodos.C_Usuario();
                    int id = oUsuario.obtiene_id_principal(prv_Email, 3);

                        C_PasswordClass m = new C_PasswordClass();

                        string randompass = m.randompass();

                        oUsuario.InsertaUsuario(prv_Email, 3, id, m.encryptpass(randompass));


                        ///////

                        string stImagen;


                        SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                        smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                        smtp.EnableSsl = true;
                        smtp.UseDefaultCredentials = false;
                        smtp.Credentials = new NetworkCredential("info.smartrentals@gmail.com", "Clover20*");

                        MailMessage mail = new MailMessage();
                        mail.From = new MailAddress("info.smartrentals@gmail.com", "Smart Rentals Clientes");
                        mail.To.Add(new MailAddress(prv_Email));
                        mail.Subject = "Usuario Nuevo Creado - Smart Rentals";
                        mail.IsBodyHtml = true;
                        mail.Body = "Se ha creado un nuevo usuario y contraseña, inicie sesión por primera vez para configurar su contraseña:" + "<br/>" + "<br/>" +
                                    "NOMBRE DE USUARIO : " + prv_Email + "<br/>" + "<br/>" +
                                    "CONTRASEÑA TEMPORAL : " + randompass + "<br/>" + "<br/>" +
                                     "ENLACE: http://smartrentalscr.com/" +

                                    "<img style='padding: 0; display: block' src='cid:imagen' >";
                        AlternateView htmlView = AlternateView.CreateAlternateViewFromString(mail.Body, Encoding.UTF8, MediaTypeNames.Text.Html);
                        stImagen = Server.MapPath("~") + @"\images\Logo_SRCR.png";
                        LinkedResource img = new LinkedResource(stImagen, MediaTypeNames.Image.Jpeg); img.ContentId = "imagen";
                        htmlView.LinkedResources.Add(img);
                        mail.AlternateViews.Add(htmlView);

                        smtp.Send(mail);





                        //////////


                        ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeSuccess()", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeError()", true);
                }

                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeError()", true);
                }

            }
            catch (Exception error)
            {

                    ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeError()", true);
            }
        }

        bool existe(string user)
        {

            string llavePrimaria = this.txtEmail.Text;
            if (!string.IsNullOrEmpty(llavePrimaria))
            {
                string userid = llavePrimaria;
                Metodos.C_Usuario oUsuario = new Metodos.C_Usuario();
                ///Crear la instancia del objeto de retorno
                ///del procedimiento almacenado
                sp_RetornaUsuarioUserID_Result resultadoSp = oUsuario.RetornaUsuarioUserID_Result(userid);

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


        protected void ProvinciaSeleccion(object sender, EventArgs e)
        {
            int ProvinciaID = Convert.ToInt32(DropDownListProvincia.SelectedValue);
            DropDownListCanton.DataSource = Consultar("Select * from dbo.C_Canton where Id_Provincia=" + ProvinciaID);
            DropDownListCanton.DataTextField = "Nombre";
            DropDownListCanton.DataValueField = "Id_Canton";
            DropDownListCanton.DataBind();
            DropDownListCanton.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
        }

        protected void CantonSeleccion(object sender, EventArgs e)
        {

            int CantonID = Convert.ToInt32(DropDownListCanton.SelectedValue);
            DropDownListDistrito.DataSource = Consultar("Select * from dbo.C_Distrito where Id_Canton=" + CantonID);
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

        protected void btnAtras_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Formularios/frm_ProveedorLista.aspx");
        }
    }
}