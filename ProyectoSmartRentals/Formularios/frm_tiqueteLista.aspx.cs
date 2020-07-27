using ProyectoSmartRentals.Metodos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_tiqueteLista : System.Web.UI.Page
    {
        //acá hay que obtener el nombre
        int _pk_admin = 0;
        int _pk_cliente = 4;
        int _pk_proveedor = 0;
        string _estado = null;
        string _rol = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

               
                cargardatosGrid(_pk_admin,_pk_cliente, _pk_proveedor,_estado,_rol);
                menu();
            }
        }

        public void cargardatosGrid(int pk_admin, int pk_cliente, int pk_proveedor, string estado, string rol)
        {
            if (rol.Equals("Cliente"))
            {
                this.hplAgregar.Visible = true;
            }
            C_Tiquetes oTiquetes = new C_Tiquetes();
            ///Asignarle la fuente de datos al grid
            this.grdListaTiquetes.DataSource =
                oTiquetes.RetornarTiqueteDataGrid(true,pk_admin,pk_cliente,pk_proveedor,estado);
            ///indicar al grid que se muestre
            this.grdListaTiquetes.DataBind();

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
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string texto = this.DropDownList1.SelectedItem.ToString();
            this.Label1.Text = texto;

            if (texto.Equals("Todos"))
            {
                cargardatosGrid(_pk_admin, _pk_cliente, _pk_proveedor, null, _rol);
            }
            if (texto.Equals("Pendiente"))
            {
                cargardatosGrid(_pk_admin, _pk_cliente, _pk_proveedor, "Pendiente", _rol);
            }
            if (texto.Equals("Completado"))
            {
                cargardatosGrid(_pk_admin, _pk_cliente, _pk_proveedor, "Completado", _rol);
            }
            if (texto.Equals("En progreso"))
            {
                cargardatosGrid(_pk_admin, _pk_cliente, _pk_proveedor, "En progreso", _rol);
            }


        }
    }
}