using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoSmartRentals.Modelos;
using ProyectoSmartRentals.Metodos;

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_ConfContrasena : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Page.Master.FindControl("menu_admin").Visible = false;
            this.Page.Master.FindControl("menu_cliente").Visible = false;
            this.Page.Master.FindControl("menu_proveedor").Visible = false;
            this.Page.Master.FindControl("menu_admin_").Visible = false;
            this.Page.Master.FindControl("menu_cliente_").Visible = false;
            this.Page.Master.FindControl("menu_proveedor_").Visible = false;
            this.Page.Master.FindControl("menu_horizontal").Visible = false;
            this.Page.Master.FindControl("logout").Visible = false;
            this.Page.Master.FindControl("logout_").Visible = false;
            this.Page.Master.FindControl("info_user").Visible = false;

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (this.txtUsuario.Text.Equals(this.txtContrasena.Text))
            {

                Metodos.C_Usuario m = new Metodos.C_Usuario();
                C_PasswordClass p = new C_PasswordClass();
                string user = Session["UserName"].ToString();
                m.ActualizaPassword(user,p.encryptpass(this.txtUsuario.Text));

                
                ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeSuccess()", true);

                Session.Contents.RemoveAll();
                    
                Response.Redirect("frm_Login.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertmeError()", true);
            }
           
        }

     
    }
}