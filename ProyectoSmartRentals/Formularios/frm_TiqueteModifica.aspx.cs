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
    public partial class frm_TiqueteModifica : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
             
                this.hdlTiquete.Value = this.Request.QueryString["tqt_id"];
                
                cargarDatos();
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
                    
                    this.DropDownTipo.Text = resultadoSp.tqt_tipo_problema;
                    this.txtTitulo.Text = resultadoSp.tqt_titulo;
                    this.txtDescrip.InnerText = resultadoSp.tqt_descripcion;
                    this.txtNota.InnerText = resultadoSp.tqt_nota_reparacion;
                    this.DropDownEstado.Text = resultadoSp.tqt_estado;
                    this.txtFechaInicio.Text = Convert.ToString(resultadoSp.tqt_fecha_inicio);
                    this.txtPrecio.Text = Convert.ToString(resultadoSp.tqt_precio_reparacion);
                    this.txtContrato.Text = resultadoSp.ctr_numeroContrato;
                   
                    
                }

            }
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
                    DateTime now = DateTime.Now;
                    string  nota = this.txtNota.Value;
                    decimal monto = Convert.ToDecimal(this.txtPrecio.Text);
                    string _estado = this.DropDownEstado.SelectedItem.ToString();
                    if (oTiquetes.ModificaTiqueteProveedor(id_tiquete,nota,now,monto, _estado))
                    {
                        this.lblResultado.Text = "Registro Modificado";
                    }
                    else
                    {
                        this.lblResultado.Text = "No se pudo modificar";
                    }

                }
                catch (Exception error)
                {
                    this.lblResultado.Text = "No se pudo modificar: " + error;
                }
            }
        }
    }
}