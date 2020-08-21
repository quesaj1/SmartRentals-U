<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_ReporteMantenimiento.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_ReporteMantenimiento" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<style>

    .boton_personalizado{
    font-weight: 500;
    font-size: 15px;
    color: #ffffff;
    padding: 8px 17px;
    border-width:thin;
    background-color: #adc867;
    border-radius:10px;
  }
  .boton_personalizado:hover{
    color: #ffffff;
    background-color: #55407d;
    border-radius:10px;
  }

    
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


</style>
    <br />
       <div id="divForm" style="margin-top: 12%; margin-left: 15%; margin-right: 15%">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
              
                           <div class="animated-title">
                             <div class="text-top">
                               <div>
                                   <span style="font-weight:600">Smart</span>
                                  <span style="font-weight:600">Rentals</span>
                               </div>
                             </div>
                           <div class="text-bottom">
                        <div style="font-weight:600">Reporte de Mantenimientos</div>
                        </div>
                   </div>
              
            
       <br /> <br />
            <div style="text-align:center"  width:30%>
                   <div class="form-row" style="margin-top:5%; margin-bottom:5%">
              
                <div id="ddcontratos" class="form-group col-sm-4" runat="server" visible="false">
                <!-- Tipo Propiedad -->
                <label for="txtTipoPropiedad">Contratos</label>
              
                <asp:DropDownList ID="DropDownContratos" class="custom-select"  CssClass="form-control" runat="server" AutoPostBack="True" ForeColor="Black">
                
                </asp:DropDownList>
                </div>

                <div id="ddadmin" class="form-group col-sm-4" runat="server" visible="false">
                <!-- Tipo Propiedad -->
                <label for="txtTipoPropiedad">Administrador</label>
              
                <asp:DropDownList ID="DropDownAdministrador" class="custom-select"  CssClass="form-control" runat="server" AutoPostBack="True" ForeColor="Black">
                
                </asp:DropDownList>
                </div>
                
                <div id="ddclientes" class="form-group col-sm-4" runat="server" visible="false">
                <!-- Tipo Propiedad -->
                <label for="txtTipoPropiedad">Clientes</label>
              
                <asp:DropDownList ID="DropDownListClientes" class="custom-select"  CssClass="form-control" runat="server" AutoPostBack="True" ForeColor="Black">
                
                </asp:DropDownList>
                </div>
                 <div id="ddproveedores" class="form-group col-sm-4" runat="server" visible="false">
                <!-- Tipo Propiedad -->
                <label for="txtTipoPropiedad">Proveedores</label>
              
                <asp:DropDownList ID="DropDownproveedores" class="custom-select"  CssClass="form-control" runat="server" AutoPostBack="True" ForeColor="Black">
                
                </asp:DropDownList>
                </div>
                <div class="form-group col-sm-4">

                <!-- Tipo Propiedad -->
                <label for="txtTipoPropiedad">Estado</label>
              
                <asp:DropDownList ID="DropDownTipoReportes" class="custom-select"  CssClass="form-control" runat="server" AutoPostBack="True" ForeColor="Black">
                    <asp:ListItem Value="0">Seleccione estado</asp:ListItem>
                    <asp:ListItem Value="1">Completado</asp:ListItem>
                    <asp:ListItem Value="2">Pendiente</asp:ListItem>
                    <asp:ListItem Value="3">En progreso</asp:ListItem>
                </asp:DropDownList>
                </div>


                    <div class="form-group col-sm-4">
                <!-- Ubicacion -->
                <label for="txtUbicacionExacta">Fecha de inicio </label>
                   <asp:TextBox ID="fechainicio1"  CssClass="form-control"  type="date"  runat="server" ForeColor="Black"></asp:TextBox>
            </div>

                       <div class="form-group col-sm-4">
                <!-- Ubicacion -->
                <label for="txtUbicacionExacta">Fecha de finalización </label>
                   <asp:TextBox ID="fechafinalizacion"  CssClass="form-control"  type="date"  runat="server"  ForeColor="Black"></asp:TextBox>
            </div>
                </div>
                
            </div>
                </div><br /><br /><br />
 

           
      
   
            <div style="text-align:center">   
           <asp:Button  ID="Button2"  runat="server" Text="Generar Reporte" CssClass="boton_personalizado" OnClick="Button2_Click"  />
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            </div><br /><br /><br />

                    <br />
        <br />
        <br />
        <br />
        
    <div style="text-align:center" id="VisibleReportContent">
        <rsweb:ReportViewer ID="prvMantenimiento" runat="server" Width="100%" RightToLeft="YES" >
        </rsweb:ReportViewer>

        </div>



        

</asp:Content>
