<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_ContratoModifica.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_ContratoModifica" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <%-- <style>

           
@keyframes showTopText {
  0% { transform: translate3d(0, 100%, 0); }
  40%, 60% { transform: translate3d(0, 50%, 0); }
  100% { transform: translate3d(0, 0, 0); }
}
@keyframes showBottomText {
  0% { transform: translate3d(0, -100%, 0); }
  100% { transform: translate3d(0, 0, 0); }
}
.animated-title {
  color: #222;
  height: 40vmin;
  left: 50%;
  position: absolute;
  top: 5%;
  transform: translate(-50%, -50%);
  width: 140vmin;
}
.animated-title > div {
  height: 50%;
  overflow: hidden;
  position: absolute;
  width: 100%;
}
.animated-title > div div {
  font-size: 3vmin;
  padding: 2vmin 0;
  position: absolute;
}
.animated-title > div div span {
  display: block;
}
.animated-title > div.text-top {
  border-bottom: 0.3vmin solid #000;
  top: 0;
}
.animated-title > div.text-top div {
  animation: showTopText 1s;
  animation-delay: 0.5s;
  animation-fill-mode: forwards;
  bottom: 0;
  transform: translate(0, 100%);
}
.animated-title > div.text-top div span:first-child {
  color: #767676;
}
.animated-title > div.text-bottom {
  bottom: 0;
}
.animated-title > div.text-bottom div {
  animation: showBottomText 0.5s;
  animation-delay: 1.75s;
  animation-fill-mode: forwards;
  top: 0;
  transform: translate(0, -100%);
}

/*ESTILOS PARA EL DATE PICKER */


/* Removes the clear button from date inputs */


/* Removes the spin button */
input[type="date"]::-webkit-inner-spin-button { 
    display: none;
}

/* Always display the drop down caret */
input[type="date"]::-webkit-calendar-picker-indicator {
    color: #2c3e50;
}

/* A few custom styles for date inputs */
input[type="date"] {
  
    -webkit-appearance: none;
    color: #95a5a6;
 
    font-size: 15px;
    background:#ecf0f1;
    padding:5px;
    display: inline-block !important;
    visibility: visible !important;
}

input[type="date"], focus {
    color: #000000;
    box-shadow: none;
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
}


    </style>--%>
    
           <div id="divForm" style="margin-top:12%; margin-left:15%; margin-right:15%">
         <h1 style="text-align: center">Modificar Contrato</h1>
                  <asp:HiddenField ID="hdldContrato" runat="server" />
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
                <asp:TextBox ID="txtFechaInicio" type="date" CssClass="form-control" placeholder="Fecha de Inicio" runat="server" MaxLength="50"></asp:TextBox>             
            </div>
              <div class="form-group col-md-6">
                <!-- Fecha de finalización -->
                <label for="txtFechaFinaliacion"></label>
                <asp:TextBox ID="txtFechaFinaliacion" type="date" CssClass="form-control" placeholder="Fecha de finalización" runat="server" MaxLength="50"></asp:TextBox>
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
                
                <label for="txtFechaPago"></label>
                <asp:TextBox ID="txtFechaPago" type="date" CssClass="form-control" placeholder="Monto" runat="server" MaxLength="50"></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!-- URL Contrato -->
                <label for="txtContrato">Contrato</label>
                <asp:FileUpload ID="contrato" CssClass="form-control" runat="server" />
            </div>  
             

            
    </div>
        
        <div class="form-group" style="text-align:center">
            <!-- Submit Button -->
            <asp:Button ID="btnAgregar" runat="server" CssClass="btn btn-primary"  Text="Modificar" Font-Size="Medium" Height="49px" Width="111px" OnClick="btnAgregar_Click" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnAtras" runat="server" CssClass="btn btn-danger"  Text="Cancelar"  Font-Size="Medium" Height="49px" Width="111px" PostBackUrl="~/Formularios/frm_ContratoLista.aspx" />
            <br />
            <br />
            <asp:Label ID="lblResultado" runat="server" Font-Bold="True" ForeColor="#009900"></asp:Label>
        </div>
        </div>
</asp:Content>
