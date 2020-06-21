﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_ClienteElimina.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_ClienteElimina" %>
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
        <h1 style="text-align: center">Eliminar Cliente</h1>
                <asp:HiddenField ID="hdlCliente" runat="server" />
        <div class="form-row" style="margin-top:5%; margin-bottom:5%">
            <div class="form-group col-md-6">
                <!-- Nombre -->
                <label for="txtCedula"></label>
                <asp:TextBox ID="txtCedula" type="text" CssClass="form-control" placeholder="Cédula" runat="server" MaxLength="25"></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!-- Correo -->
                <label for="txtNombre"></label>
                <asp:TextBox ID="txtNombre" type="text" CssClass="form-control" placeholder="Nombre" runat="server" MaxLength="50"></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!-- Correo -->
                <label for="txtSegundoNombre"></label>
                <asp:TextBox ID="txtSegundoNombre" type="text" CssClass="form-control" placeholder="Segundo Nombre" runat="server" MaxLength="50"></asp:TextBox>             
            </div>
              <div class="form-group col-md-6">
                <!-- Correo -->
                <label for="txtPrimerApellido"></label>
                <asp:TextBox ID="txtPrimerApellido" type="text" CssClass="form-control" placeholder="Primer Apellido" runat="server" MaxLength="50"></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!-- Correo -->
                <label for="txtSegundoApellido"></label>
                <asp:TextBox ID="txtSegundoApellido" type="text" CssClass="form-control" placeholder="Segundo Apellido" runat="server" MaxLength="50"></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!-- Correo -->
                <label for="txtFechaNacimiento"></label>
                <asp:TextBox ID="txtFechaNacimiento" type="text" CssClass="form-control" placeholder="Fecha Nacimiento" runat="server" MaxLength="50"></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!-- Correo -->
                <label for="txtTelefonoCasa"></label>
                <asp:TextBox ID="txtTelefonoCasa" type="text" CssClass="form-control" placeholder="Telefono Casa" runat="server" MaxLength="50"></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!-- Correo -->
                <label for="txtTelefonoCelular"></label>
                <asp:TextBox ID="txtTelefonoCelular" type="text" CssClass="form-control" placeholder="Telefono Celular" runat="server" MaxLength="50"></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!-- Correo -->
                <label for="txtEmail"></label>
                <asp:TextBox ID="txtEmail" type="text" CssClass="form-control" placeholder="Email" runat="server" MaxLength="50"></asp:TextBox>
            </div>

            
    </div>
        
        <div class="form-group" style="text-align:center">
            <!-- Submit Button -->
            <asp:Button ID="btnEliminar" runat="server" CssClass="btn btn-primary" Text="Eliminar" OnClick="btnEliminar_Click" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnAtras" CssClass="btn btn-danger" runat="server" Text="Atras" OnClick="btnAtras_Click" PostBackUrl="~/Formularios/frm_ClienteLista.aspx" />
            <br />
            <br />
            <asp:Label ID="lblResultado" runat="server" Font-Bold="True" ForeColor="#009900"></asp:Label>
        </div>
        </div>
   














</asp:Content>
