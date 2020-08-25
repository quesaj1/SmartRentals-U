using ProyectoSmartRentals.Metodos;
using ProyectoSmartRentals.Modelos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_TiqueteModifica : System.Web.UI.Page
    {
        int _pk_admin = 0;
        int _pk_cliente = 0;
        int _pk_proveedor = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("frm_Login.aspx?error=jwP46Q", true);
            }
            if (!this.IsPostBack)
            {
             
                this.hdlTiquete.Value = this.Request.QueryString["tqt_id"];
                
                cargarDatos();
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
                this.DropDownEstado.Enabled = false;
                this.txtPrecio.ReadOnly = true;
                this.txtNota.Disabled = true;

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
                this.DropDownEstado.Enabled = false;
                this.txtPrecio.ReadOnly = true;
                this.txtNota.Disabled = true;

            }

        }
        public void cargarDatos()
        {
            ///obtener el valor del parámetro que fue asignado al hidden
            ///en el page_Load
            string llavePrimaria = this.hdlTiquete.Value;
            if (!string.IsNullOrEmpty(llavePrimaria))
            {
                int id_tiquete = Convert.ToInt16(llavePrimaria);
                C_Tiquetes oTiquetes = new C_Tiquetes();
                ///Crear la instancia del objeto de retorno
                ///del procedimiento almacenado
                sp_RetornaTiqueteID_Result resultadoSp = oTiquetes.RetornaTiqueteID(id_tiquete);

                ///validar que el procedimiento retorne un valor
                if (resultadoSp != null)
                {
                    this.num_t.InnerText = Convert.ToString(resultadoSp.tqt_id);
                    //this.DropDownTipo.Text = resultadoSp.tqt_tipo_problema;
                    this.DropDownTipo.SelectedIndex = retornaTipoProblema(resultadoSp.tqt_tipo_problema);
                    this.txtTitulo.Text = resultadoSp.tqt_titulo;
                    this.txtDescrip.InnerText = resultadoSp.tqt_descripcion;
                    this.txtNota.InnerText = resultadoSp.tqt_nota_reparacion;
                    this.DropDownEstado.SelectedIndex = retornaEstado(resultadoSp.tqt_estado);
                    this.txtFechaInicio.Text = Convert.ToString(resultadoSp.tqt_fecha_inicio);
                    this.txtPrecio.Text = Convert.ToString(resultadoSp.tqt_precio_reparacion);
                    this.txtContrato.Text = resultadoSp.ctr_numeroContrato;
                   
                    
                }

            }
        }


        public int retornaTipoProblema(String txt)
        {
            int res = 0;
            if (txt.Equals("Eléctrico"))
            {
                res = 1;
            }
            if (txt.Equals("Fontaneria"))
            {
                res = 2;
            }
            if (txt.Equals("Cerrajeria"))
            {
                res = 3;
            }
            if (txt.Equals("Jardineria"))
            {
                res = 4;
            }
            if (txt.Equals("Otros"))
            {
                res = 5;
            }
            return res;

        }

        public int retornaEstado(String txt)
        {
            int res = 0;
            if (txt.Equals("Pendiente"))
            {
                res = 0;
            }
            if (txt.Equals("En progreso"))
            {
                res = 1;
            }
            if (txt.Equals("Completado"))
            {
                res = 2;
            }
            return res;

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            ///Verificar que todas las validaciones hayan sido
            ///satisfactorias
            if (this.IsValid)
            {
                int id_tiquete = 0;

                ///obtener del hiddenField el valor de la llave primaria
                id_tiquete = Convert.ToInt16(this.hdlTiquete.Value);

                try
                {

                    C_Tiquetes oTiquetes = new C_Tiquetes();
                    Nullable < DateTime > now;
                    string  nota = this.txtNota.Value;
                    decimal monto;
                    string _estado = this.DropDownEstado.SelectedItem.ToString();
                    if(_estado.Equals("Completado"))
                    {
                        now = DateTime.Now;
                    }
                    else
                    {
                        now = null;
                    }
                    if (this.txtPrecio.Text.Equals(""))
                    {
                        monto = 0;
                    }
                    else
                    {
                        monto = Convert.ToDecimal(this.txtPrecio.Text);
                    }
                    if (oTiquetes.ModificaTiqueteProveedor(id_tiquete,nota,now,monto, _estado))
                    {
                        //this.lblResultado.Text = "Registro Modificado";
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

        protected void txtPrecio_TextChanged(object sender, EventArgs e)
        {
            //string a = this.txtPrecio.Text;
            //if (string.IsNullOrEmpty(a))
            //{

            //    decimal preciodecimal = Convert.ToDecimal(a);

            //    string precio = string.Format("{0:c}", preciodecimal);
            //    this.txtPrecio.Text = precio;
            //}
            //else
            //{
            //    a = a.Remove(0, 1);
            //    decimal preciodecimal = Convert.ToDecimal(a);

            //    string precio = string.Format("{0:c}", preciodecimal);
            //    this.txtPrecio.Text = precio;
            //}
        }

        //public string retornaMonto()
        //{
        //    string monto = "";

        //    monto = txtPrecio.Text.Remove(0, 1);
        //    return monto;


        //}
    }
}