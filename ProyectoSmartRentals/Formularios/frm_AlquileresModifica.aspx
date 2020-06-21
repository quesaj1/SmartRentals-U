<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_AlquileresModifica.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_AlquileresModifica" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


       <style type="text/css">
        .boton_personalizado{
    font-weight: 600;
    font-size: 20px;
    color: #ffffff;
    background-color: #2ECC71;
  }
  .boton_personalizado:hover{
    color: #1883ba;
    background-color: #ffffff;
  }
</style>
<div id="divForm" style="margin-top:12%; margin-left:15%; margin-right:15%">
         <h1 style="text-align: center">Modificar Alquiler</h1>

    <asp:HiddenField ID="hdldAlquiler" runat="server" />

    <div class="form-row" style="margin-top:5%; margin-bottom:5%">
            <div class="form-group col-md-6">

             <!-- Ubicacion -->
                <label for="txtUbicacionExacta">Ubicacion Exacta</label>
                <asp:TextBox ID="txtUbicacionExacta" type="text" CssClass="form-control" placeholder="Ubicacion" runat="server" MaxLength="30"></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!-- Tipo Propiedad -->
                <label for="txtTipoPropiedad">Tipo de Propiedad</label>
                   <br/>
               
                  <select ID="txtTipoPropiedad" class="custom-select" runat="server"  CssClass="form-control">

                  <option>Seleccionar una opcion</option>
                  <option >Casa</option>
                  <option >Apartamento</option>
                  <option >Condominio</option>

                  </select>
                
            </div>
              <div class="form-group col-md-6">
                <!-- Detalles-->
                <label for="txtDetalles">Detalles</label>
                <asp:TextBox ID="txtDetalles" type="text" CssClass="form-control" placeholder="Detalles" runat="server" MaxLength="50"></asp:TextBox>             
            </div>
              <div class="form-group col-md-6">
                <!-- Provincia -->
                 <label for="txtProvincia">Provincia</label>
                   <asp:DropDownList ID="DropDownListProvincia" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SeleccionaProvincia"></asp:DropDownList>
            </div>
              <div class="form-group col-md-6">
                <!--  Canton -->
                <label for="txtCanton">Canton</label>
                   <asp:DropDownList ID="DropDownListCanton" CssClass="form-control"  runat="server" AutoPostBack="True" OnSelectedIndexChanged="SeleccionaCanton"></asp:DropDownList>
                  
            </div>
              <div class="form-group col-md-6">
                <!-- Distrito -->
                 <label for="txtDistrito">Distrito</label>
               
                 <asp:DropDownList ID="DropDownListDistrito" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SeleccionaDistrito"></asp:DropDownList>
               
            </div>
               <div class="form-group col-md-6">
                <!-- URL Imagen -->
                <label for="txtImagen">Imagen</label>
                <asp:FileUpload ID="fupImage" CssClass="form-control" runat="server" />
            </div>  
        </div>

     <div class="form-group" style="text-align:center">
            <!-- Submit Button -->

             <asp:Button ID="btnModificar" runat="server" CssClass="boton_personalizado" Text="Modificar" Font-Size="Medium" Height="49px" Width="111px" OnClick="btnAgregar_Click" />
           
            &nbsp;&nbsp;&nbsp;

             <asp:Button ID="btnAtras" CssClass="boton_personalizado" runat="server" Text="Atras" OnClick="btnAtras_Click" Font-Size="Medium" Height="49px" Width="111px" PostBackUrl="~/Formularios/frm_AlquileresLista.aspx" />
           
            <br />
            <br />

            <asp:Label ID="lblResultado" runat="server" Font-Bold="True" ForeColor="#009900"></asp:Label>
        </div>


    </div>




</asp:Content>
