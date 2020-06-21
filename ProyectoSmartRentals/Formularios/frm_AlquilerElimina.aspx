<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_AlquilerElimina.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_AlquilerElimina" %>
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
         <h1 style="text-align: center">Eliminar Alquiler</h1>

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
                <asp:TextBox ID="txtTipoPropiedad" type="text" CssClass="form-control" placeholder="Tipo Propiedad" runat="server" MaxLength="50"></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!-- Detalles-->
                <label for="txtDetalles">Detalles</label>
                <asp:TextBox ID="txtDetalles" type="text" CssClass="form-control" placeholder="Detalles" runat="server" MaxLength="50"></asp:TextBox>             
            </div>
              <div class="form-group col-md-6">
                <!-- Provincia -->
                <label for="txtProvincia">Provincia</label>
                  <asp:TextBox ID="txtProvincia" type="text" CssClass="form-control" placeholder="Provincia" runat="server" MaxLength="50"></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!--  Canton -->
                <label for="txtCanton">Canton</label>
                  <asp:TextBox ID="txtCanton" type="text" CssClass="form-control" placeholder="Canton" runat="server" MaxLength="50"></asp:TextBox>
                  
            </div>
              <div class="form-group col-md-6">
                <!-- Distrito -->
                <label for="txtDistrito">Distrito</label>
                  <asp:TextBox ID="txtDistrito" type="text" CssClass="form-control" placeholder="Distrito" runat="server" MaxLength="50"></asp:TextBox>
               
            </div>
              <div class="form-group col-md-6">
                <!-- URL Imagen -->
                <label for="txtImagen">Imagen</label>
                <asp:TextBox ID="txtImagen" type="text" CssClass="form-control" placeholder="Imagen" runat="server" MaxLength="50"></asp:TextBox>
            </div>      
                
    </div>
        
        <div class="form-group" style="text-align:center">
            <!-- Submit Button -->


            <asp:Button ID="btnEliminar" runat="server" CssClass="boton_personalizado" Text="Eliminar"  Font-Size="Medium" Height="49px" Width="111px" OnClick="btnAgregar_Click" />
            
            
            &nbsp;&nbsp;&nbsp;

            <asp:Button ID="btnAtras" CssClass="boton_personalizado" runat="server" Text="Atras" OnClick="btnAtras_Click" Font-Size="Medium" Height="49px" Width="111px" PostBackUrl="~/Formularios/frm_AlquileresLista.aspx" />
            
            <br />
            <br />
            <asp:Label ID="lblResultado" runat="server" Font-Bold="True" ForeColor="#009900"></asp:Label>
        </div>


    </div>










 </asp:Content>
