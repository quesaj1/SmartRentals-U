﻿using ProyectoSmartRentals.Metodos;
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

namespace ProyectoSmartRentals.Formularios
{
    public partial class frm_ProveedorAgregar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                IniciarLlenadoDropDown();
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


                C_Proveedor oProveedor = new C_Proveedor();
                bool ProveedorInsertar =
                    oProveedor.InsertaProveedor(prv_NombreVariable, prv_NombreRepresentante, prv_PrimerApellido, prv_SegundoApellido, prv_CedulaRepresentante,
                    prv_CedulaJuridica, prv_Telefono, prv_Email, prv_TipoProveedor, Id_Distrito, Id_Canton, Id_Provincia, prv_OtrasSenas,true);


                if (ProveedorInsertar)
                    this.lblResultado.Text = "Proveedor agregado correctamente";
                else
                    this.lblResultado.Text = "No se pudo agregar el Proveedor,intentalo de nuevo";
            }
            catch (Exception error)
            {

                this.lblResultado.
                    Text = "Ocurrió un error:" + error.Message;
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

        }
    }
}