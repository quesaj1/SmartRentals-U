<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_ContratoAgregar.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_ContratoAgregar" %>
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
     <script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.min.js"></script>
      <link href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.min.css" rel="stylesheet"/>
  

    
    

           <div id="divForm" style="margin-top:12%; margin-left:15%; margin-right:15%">
         <h1 style="text-align: center">Agregar Contrato</h1>
        <div class="form-row" style="margin-top:5%; margin-bottom:5%">
            <div class="form-group col-md-6">
                <!-- Numero de contrato -->
                <label for="txtContratoNumero"></label>
                <asp:TextBox ID="txtContratoNumero" type="text" CssClass="form-control" placeholder="Número de contrato" runat="server" MaxLength="25"></asp:TextBox>
            </div>
               <div class="form-group col-md-6">
                <!-- Cliente -->
                <label for="txtCliente"></label>
                  <asp:DropDownList ID="DropDownListCliente" placeholder="Cliente" DataTextField="Cliente" CssClass="form-control" runat="server" AutoPostBack="True"></asp:DropDownList>
            </div>
              <div class="form-group col-md-6">
                <!-- Fecha de inicio -->
                <label for="txtFechaInicio"></label>
                <asp:TextBox ID="txtFechaInicio" type="text" CssClass="form-control" placeholder="Fecha de Inicio" runat="server" MaxLength="50"></asp:TextBox>             
            </div>
              <div class="form-group col-md-6">
                <!-- Fecha de finalización -->
                <label for="txtFechaFinaliacion"></label>
                <asp:TextBox ID="txtFechaFinaliacion" type="text" CssClass="form-control" placeholder="Fecha de finalización" runat="server" MaxLength="50"></asp:TextBox>
            </div>
                 <div class="form-group col-md-6">
                <!-- Propiedad -->
                <label for="txtPropiedad">Propiedad</label>
                  <asp:DropDownList ID="DropDownPropiedad"  DataTextField="Propiedad" CssClass="form-control" runat="server" AutoPostBack="True"></asp:DropDownList>
            </div>
              <div class="form-group col-md-6">
                <!-- Monto mensual -->
                <label for="txtMonto"></label>
                <asp:TextBox ID="txtMonto" type="text" CssClass="form-control" placeholder="Monto" runat="server" MaxLength="50"></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!-- URL Contrato -->
                <label for="txtContrato">Contrato</label>
                <asp:FileUpload ID="contrato" CssClass="form-control" runat="server" />
            </div>  

             <div class="form-group col-md-6">
                <!-- Monto mensual -->
                <label for="txtFechaPago"></label>
                <asp:TextBox ID="txtFechaPago" type="text" CssClass="form-control" placeholder="Monto" runat="server" MaxLength="50"></asp:TextBox>
            </div>
             

            
    </div>
        
        <div class="form-group" style="text-align:center">
            <!-- Submit Button -->
            <asp:Button ID="btnAgregar" runat="server" CssClass="boton_personalizado"  Text="Agregar" Font-Size="Medium" Height="49px" Width="111px" OnClick="btnAgregar_Click" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnAtras" runat="server" CssClass="boton_personalizado"  Text="Atras"  Font-Size="Medium" Height="49px" Width="111px" PostBackUrl="~/Formularios/frm_ClienteLista.aspx" />
            <br />
            <br />
            <asp:Label ID="lblResultado" runat="server" Font-Bold="True" ForeColor="#009900"></asp:Label>
        </div>
        </div>
    <br /><br />
   
<%--    <script>
        $('#<%=DropDownListCliente.cli_cliente%>').chosen();

    </script>--%>

</asp:Content>
