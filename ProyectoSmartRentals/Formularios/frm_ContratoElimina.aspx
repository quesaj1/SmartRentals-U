<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_ContratoElimina.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_ContratoElimina" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
           <div id="divForm" style="margin-top:12%; margin-left:15%; margin-right:15%">
         <h1 style="text-align: center">Modificar Contrato</h1>
                  <asp:HiddenField ID="hdldContrato" runat="server" />
        <div class="form-row" style="margin-top:5%; margin-bottom:5%">
            <div class="form-group col-md-6">
                <!-- Numero de contrato -->
                <label for="txtContratoNumero"></label>
                <asp:TextBox ID="txtContratoNumero" type="text" ReadOnly="True" CssClass="form-control" placeholder="Número de contrato" runat="server" MaxLength="25"></asp:TextBox>
            </div>
               <div class="form-group col-md-6">
                <!-- Cliente -->
                <label for="txtCliente"></label>
                  <asp:DropDownList ID="DropDownListCliente" ReadOnly="True" placeholder="Cliente" DataTextField="Cliente" CssClass="form-control" runat="server" AutoPostBack="True"></asp:DropDownList>
            </div>
              <div class="form-group col-md-6">
                <!-- Fecha de inicio -->
                <label for="txtFechaInicio"></label>
                <asp:TextBox ID="txtFechaInicio" type="text" ReadOnly="True" CssClass="form-control" placeholder="Fecha de Inicio" runat="server" MaxLength="50"></asp:TextBox>             
            </div>
              <div class="form-group col-md-6">
                <!-- Fecha de finalización -->
                <label for="txtFechaFinaliacion"></label>
                <asp:TextBox ID="txtFechaFinaliacion" type="text" ReadOnly="True" CssClass="form-control" placeholder="Fecha de finalización" runat="server" MaxLength="50"></asp:TextBox>
            </div>
                 <div class="form-group col-md-6">
                <!-- Propiedad -->
                <label for="txtPropiedad">Propiedad</label>
                  <asp:DropDownList ID="DropDownPropiedad"  DataTextField="Propiedad" ReadOnly="True" CssClass="form-control" runat="server" AutoPostBack="True"></asp:DropDownList>
            </div>
              <div class="form-group col-md-6">
                <!-- Monto mensual -->
                <label for="txtMonto"></label>
                <asp:TextBox ID="txtMonto" type="text" CssClass="form-control" ReadOnly="True" placeholder="Monto" runat="server" MaxLength="50"></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!-- URL Contrato -->
                <label for="txtContrato">Contrato</label>
                <asp:FileUpload ID="contrato" CssClass="form-control" ReadOnly="True" runat="server" />
            </div>  
             

            
    </div>
        
        <div class="form-group" style="text-align:center">
            <!-- Submit Button -->
            <asp:Button ID="btnAgregar" runat="server" CssClass="btn btn-primary"  Text="Eliminar" Font-Size="Medium" Height="49px" Width="111px" OnClick="btnEliminar_Click" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnAtras" runat="server" CssClass="btn btn-danger"  Text="Cancelar"  Font-Size="Medium" Height="49px" Width="111px" PostBackUrl="~/Formularios/frm_ContratoLista.aspx" />
            <br />
            <br />
            <asp:Label ID="lblResultado" runat="server" Font-Bold="True" ForeColor="#009900"></asp:Label>
        </div>
        </div>

</asp:Content>
