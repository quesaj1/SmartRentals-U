<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_ReporteReportarPagos.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_ReporteReportarPagos" %>

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
                        <div style="font-weight:600">Reporte de Pagos</div>
                        </div>
                   </div>
              
            
       <br /> <br />
            <div style="text-align:center"  width:30%>
                   <div class="form-row" style="margin-top:5%; margin-bottom:5%">

                       
                <!-- Cliente -->
                <div id="ddcliente" class="form-group col-sm-4" runat="server" >
                <label for="txtcliente">Clientes</label>
              
                <asp:DropDownList ID="DropDownCliente" class="custom-select"  CssClass="form-control" runat="server" AutoPostBack="True" ForeColor="Black"  OnSelectedIndexChanged="DropDownCliente_SelectedIndexChanged">
                
                </asp:DropDownList>
                </div>

                <!-- Contratos -->
                <div id="ddcontratos" class="form-group col-sm-4" runat="server" >
                <label for="txtcontrato">Contratos</label>
              
                <asp:DropDownList ID="DropDownContratos" class="custom-select"  CssClass="form-control" runat="server" AutoPostBack="True" ForeColor="Black" Visible="true" Enabled="false" >
                
                </asp:DropDownList>
                </div>

                
            
       

           
                
            </div>
                <br><br><br>
                 <div style="text-align:center">   
           <asp:Button ID="btnAgregar" runat="server" CssClass="boton_personalizado" Font-Size="Small" Height="49px" Width="135px" Text="Generar Reporte" OnClick="Button2_Click1" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:Button ID="btnGrafico" runat="server" CssClass="boton_personalizado" Font-Size="Small" Height="49px" Width="135px" Text="Generar Grafico" OnClick="Button1_Click" />
                <br />
                <br />
                <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
        <br />
        <br />
        <br />
              


           
                
                </div>
                </div><br /><br /><br />

             </div>


         <div style="text-align: center" id="VisibleReportContent">

            <rsweb:ReportViewer ID="prvReportarPagos" runat="server" Width="100%" RightToLeft="YES"></rsweb:ReportViewer>
        </div>










</asp:Content>
