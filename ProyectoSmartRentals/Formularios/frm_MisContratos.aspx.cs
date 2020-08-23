using Google.Apis.Dialogflow.v2.Data;
using ProyectoSmartRentals.Metodos;
using ProyectoSmartRentals.Modelos;

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Metadata.Edm;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_MisContratos : System.Web.UI.Page
    {
        int _pk_cliente = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            _pk_cliente = Convert.ToInt16(Session["ID"]);
            string _rol = Convert.ToString(Session["Tipo"]);
            if (!_rol.Equals("Cliente"))
            {
                Response.Redirect("frm_inicioMenu.aspx?error=zW2aqP", false);
            }
            if (!IsPostBack)
            {               
                
                DropDownContrato(_pk_cliente);
                //this.imgImagen.ImageUrl = "~/Propiedades/img_apartamento.jpg";
                cargaDatos();
                this.Page.Master.FindControl("menu_admin").Visible = false;
                this.Page.Master.FindControl("menu_cliente").Visible = true;
                this.Page.Master.FindControl("menu_proveedor").Visible = false;
                this.Page.Master.FindControl("menu_admin_").Visible = false;
                this.Page.Master.FindControl("menu_cliente_").Visible = true;
                this.Page.Master.FindControl("menu_proveedor_").Visible = false;

             

            }
        }
        
      

        public void cargaDatos()
        {
            ///obtener el valor del parámetro que fue asignado al hidden
            ///en el page_Load
            string llavePrimaria = this.DropDownContratos.SelectedValue; /*this.hdldContrato.Value;*/
            if (!string.IsNullOrEmpty(llavePrimaria))
            {
                int id_Contrato = Convert.ToInt16(this.DropDownContratos.Text.ToString());
                C_Contrato oContrato = new C_Contrato();
                ///Crear la instancia del objeto de retorno
                ///del procedimiento almacenado
                sp_BuscaMisContratos3_Result resultadoSp = oContrato.BuscaMisContratos3(id_Contrato);

                ///validar que el procedimiento retorne un valor
                if (resultadoSp != null)
                {
                    this.imgImagen.ImageUrl = resultadoSp.alq_ImagenURL;
                    this.txtAdmin.Text = resultadoSp.name_admin;
                    this.txtFechaInicio.Text = Convert.ToString(resultadoSp.ctr_fechainicio);
                    this.TextBox1.Text = Convert.ToString(resultadoSp.ctr_fechafinalizacion);
                    this.TxtPago.Text = "₡ "+Convert.ToString(resultadoSp.ctr_monto);
                    this.txtUbicacion.Text = resultadoSp.alq_ubicacionExacta + ", " + resultadoSp.nombre_distrito +", "+resultadoSp.nombre_canton+ ", " +
                        "" + resultadoSp.nombre_provincia;
                    string date = Convert.ToString(resultadoSp.ctr_fechaPago);
                    string dia = date.Substring(0, date.IndexOf("/"));
                    this.txtFechaPago.Text = "Los días de pago son: " + dia;
                    string link = resultadoSp.ctr_file;
                    this.hypContrato.NavigateUrl = link;







                }

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

         private void DropDownContrato(int fk_cliente)
        {
           
         
            DropDownContratos.DataSource = Consultar("select id_ctr_contrato, ctr_numeroContrato " +
                 " from C_Contratos where ctr_activo = 1 and fk_cli_cliente = " + fk_cliente );
            DropDownContratos.DataTextField = "ctr_numeroContrato";
            DropDownContratos.DataValueField = "id_ctr_contrato";
            DropDownContratos.DataBind();
            

        }

       public void test()
        {
            
            C_Contrato oContratos = new C_Contrato();
            sp_BuscaMisContratos2_Result res = oContratos.BuscaMisContratos2(1);
           


       
        }

        protected void DropDownContratos_SelectedIndexChanged(object sender, EventArgs e)
        {
            cargaDatos();
            
        }
    }
}