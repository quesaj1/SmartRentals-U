<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_AdminRentalsElimina.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_AdminRentalsElimina" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
.boton_personalizado{
    font-weight: 500;
    font-size: 18px;
    color: #ffffff;
    background-color: #adc867;
    border-width:thin;
    border-radius:8px;
  }
  .boton_personalizado:hover{
    color: #ffffff;
    background-color: #55407d;
    
    border-radius:8px;
  }

    </style>

    <div id="divForm" style="margin-top:12%; margin-left:15%; margin-right:15%">
         <h1 style="text-align: center">Eliminar Administrador</h1>

                <asp:HiddenField ID="hdldAdmin" runat="server" />

        <div class="form-row" style="margin-top:5%; margin-bottom:5%">
            <div class="form-group col-md-6">
                <!-- Nombre -->
                <label for="txtCedula">Cedula</label>
                <asp:TextBox ID="txtCedula" type="text" CssClass="form-control" placeholder="Cédula" runat="server" MaxLength="25" Enabled=false></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!-- Correo -->
                <label for="txtNombre">Nombre</label>
                <asp:TextBox ID="txtNombre" type="text" CssClass="form-control" placeholder="Nombre" runat="server" MaxLength="50" Enabled=false></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!-- Correo -->
                <label for="txtSegundoNombre">Segundo Nombre</label>
                <asp:TextBox ID="txtSegundoNombre" type="text" CssClass="form-control" placeholder="Segundo Nombre" runat="server" MaxLength="50" Enabled=false></asp:TextBox>             
            </div>
              <div class="form-group col-md-6">
                <!-- Correo -->
                <label for="txtPrimerApellido">Primer Apellido</label>
                <asp:TextBox ID="txtPrimerApellido" type="text" CssClass="form-control" placeholder="Primer Apellido" runat="server" MaxLength="50" Enabled=false></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!-- Correo -->
                <label for="txtSegundoApellido">Segundo Apellido</label>
                <asp:TextBox ID="txtSegundoApellido" type="text" CssClass="form-control" placeholder="Segundo Apellido" runat="server" MaxLength="50" Enabled=false></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!-- Correo -->
                <label for="txtFechaNacimiento">Fecha Nacimiento</label>
                <asp:TextBox ID="txtFechaNacimiento" type="text" CssClass="form-control" placeholder="Fecha Nacimiento" runat="server" MaxLength="50" Enabled=false></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!-- Correo -->
                <label for="txtTelefonoCasa">Telefono Casa</label>
                <asp:TextBox ID="txtTelefonoCasa" type="text" CssClass="form-control" placeholder="Telefono Casa" runat="server" MaxLength="50" Enabled=false></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!-- Correo -->
                <label for="txtTelefonoCelular">Telefono Celular</label>
                <asp:TextBox ID="txtTelefonoCelular" type="text" CssClass="form-control" placeholder="Telefono Celular" runat="server" MaxLength="50" Enabled=false></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!-- Correo -->
                <label for="txtEmail">Email</label>
                <asp:TextBox ID="txtEmail" type="text" CssClass="form-control" placeholder="Email" runat="server" MaxLength="50" Enabled=false></asp:TextBox>
            </div>

            
    </div>
        
        <div class="form-group" style="text-align:center">
            <!-- Submit Button -->
            <asp:Button ID="btnEliminar" runat="server" CssClass="boton_personalizado" Text="Eliminar" Font-Size="Medium" Height="49px" Width="111px" OnClick="btnAgregar_Click" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnAtras" CssClass="boton_personalizado" runat="server" Text="Atras" OnClick="btnAtras_Click" Font-Size="Medium" Height="49px" Width="111px" PostBackUrl="~/Formularios/frm_AdminRentalsLista.aspx" />
            <br />
            <br />
            <asp:Label ID="lblResultado" runat="server" Font-Bold="True" ForeColor="#009900"></asp:Label>
        </div>
        </div>

</asp:Content>
