<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_ReporteGananciasPerdidas.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_ReporteGananciasPerdidas" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <%-- ESTILOS DE LA ANIMACION --%>
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

    

   <div id="divForm" style="margin-top: 12%; margin-left: 15%; margin-right: 15%">

       <asp:HiddenField  runat="server" id="user" />

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
              
       <h1 style="text-align: center">Reporte de Ganancias y Pérdidas
        </h1><br />
                
            <%--<h1 style="text-align: center">Reporte de Gastos</h1><br />--%>


                 <div style="margin-left:33%" class="form-group col-md-4">
                <!-- Contrato-->
                <label for="DropDownContratos" style="margin-left:32%">Contrato: <span style="color:red;">*</span></label><br />
             <asp:RequiredFieldValidator ID="RequiredFieldValidatorContrato" runat="server" ErrorMessage="*Debe seleccionar un contrato*" SetFocusOnError="True" Font-Size="Small"  ControlToValidate="DropDownContratos" ForeColor="#FF0066" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
             <asp:DropDownList ID="DropDownContratos" ForeColor="Black" DataTextField="Cliente" CssClass="form-control" runat="server" Enabled="true" ></asp:DropDownList>
               
            </div>
            </div><br /><br /><br />
 
     

 
      

      <script>
         $(function () {
             $("#<%=DropDownContratos.ClientID%>").select2({
               selectOnClose: true,
               theme: 'bootstrap',
               height: '100%',
               width: '100%'
           }
           );
       })
     </script>

           <div style="overflow:hidden; padding-left:34%;padding-right:34%; text-align:center">



   
            <div style="text-align:center">   
           <asp:Button  ID="Button2" CssClass="boton_personalizado"  runat="server" Text="Generar Reporte"  OnClick="Button1_Click" />
            </div><br /><br /><br />


       </div>
     
        <asp:Label ID="Label1" runat="server" style="text-align:center" ForeColor="Red"></asp:Label>
        <br />
        <br />
        <br />
        <br />
        
    <div style="text-align:center" id="VisibleReportContent">
        <rsweb:ReportViewer ID="rpvBalance"  runat="server" Width="100%" RightToLeft="YES" CssClass="auto-style1" style="left: 0px; top: 68px; height: 178px">
        </rsweb:ReportViewer>

        </div>
        <br />
        <br />
        <br />
        <br />
        <br />

</asp:Content>
