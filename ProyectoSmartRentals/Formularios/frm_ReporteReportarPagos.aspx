<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_ReporteReportarPagos.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_ReporteReportarPagos" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<style type="text/css">
   .boton_personalizado{
    font-weight: 500;
    font-size: 15px;
    color: #ffffff;
    padding: 8px 17px;
    border-width:thin;
    background-color: #55407d;
    border-radius:10px;
  }
  .boton_personalizado:hover{
    color: #ffffff;
    background-color: #adc867;
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
}*/

/*ESTILOS PARA EL DATE PICKER */


/* Removes the clear button from date inputs */


/* Removes the spin button */
/*input[type="date"]::-webkit-inner-spin-button { 
    display: none;
}*/

/* Always display the drop down caret */
/*input[type="date"]::-webkit-calendar-picker-indicator {
    color: #2c3e50;
}*/

/* A few custom styles for date inputs */
/*input[type="date"] {
  
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


/*Agregar esto para el diseño del select2 de los dropdownlists*/
.select2-selection__rendered {
    line-height: 23px !important;
    font-family: Montserrat, sans-serif; 
    font-size: 16px;
    color: #6c757d !important;
}
.select2-container .select2-selection--single {
    height: 38px !important;
}
.select2-selection__arrow {
    height: 35px !important;
}

.select2-selection { overflow: hidden; }
.select2-selection__rendered { white-space: normal; word-break: break-all; }

/*Finaliza el estilo del select2 dropdownlist */

</style>


     
    <%--Agregar estas librerias para el select 2--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.min.js"></script>
      <link href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.min.css" rel="stylesheet"/>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js" defer></script>
    <link href="../Content/select2-bootstrap.css" rel="stylesheet" />
    <link href="../Content/css/select2.min.css" rel="stylesheet" /> 
    <script src="../Scripts/select2.min.js"></script>
    <link href="../Content/select2-bootstrap.css" rel="stylesheet" />


    <%--Finaliza las librerias--%>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
        <!-- Modal Popup -->

    <div id="MyPopup" class="modal fade" data-keyboard="false" data-backdrop="static" role="dialog" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">



            <!-- Modal content-->

            <div class="modal-content">
                <div class="modal-header" style="background-color: #55407d">
                    <h4 class="modal-title" style="color: white"></h4>
                 <%--   <button type="button" class="close" aria-label="Cancelar" style="color: white" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                    </button>--%>
                </div>
                <div class="modal-body">
                </div>
                <div class="modal-footer">
                    
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" style="background-color:#ADC867;">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal Popup -->

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
                        <div style="font-weight:600">Reporte de Pagos realizados</div>
                        </div>
                   </div>
       <br /> <br />
            <div style="text-align:center"  width:30%>
                   <div class="form-row" style="margin-top:5%; margin-bottom:5%">


         
               <!-- Numero de Contrato -->
                <div id="ddcontratos" class="form-group col-sm-4" runat="server" >
                <label for="txtcontraros">Contratos</label>
                <asp:DropDownList ID="DropDownContratos" class="custom-select"  CssClass="form-control" runat="server" AutoPostBack="True"> 
                </asp:DropDownList>
                </div>
                             
                <!-- Cliente -->
                  <div id="ddclientes" class="form-group col-sm-4" runat="server">
                <label for="txtCliente">Clientes</label>
                <asp:DropDownList ID="DropDownCliente" class="custom-select"  CssClass="form-control" runat="server" AutoPostBack="True">
                </asp:DropDownList>
                </div>
                       <br>
                       <br>
                       <br>
                       <br>
                        <br>
                        <br>
                          <br>
                        <br>
           
          	</div>
                
              <div class="container-contact100-form-btn">

            <asp:Button ID="btnAgregar" runat="server" CssClass="boton_personalizado"  Text="Generar Reporte"  OnClick="Button2_Click1" />
                     &nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:Button ID="Button2" runat="server" CssClass="boton_personalizado"  Text="Generar Grafico"  OnClick="Button1_Click" />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
				</div>
            </div>
                </div>





    
       <br>
       <br>
       <br>
       <br>
    

 
        
            
    <div style="text-align:center" id="VisibleReportContent">
     
        <rsweb:ReportViewer ID="prvReportarPagos" runat="server" Width="100%" RightToLeft="YES"></rsweb:ReportViewer>
        </div>

    <%--   Agregar este script para el select 2--%>
<%--   Cambiar lo que dice dorpdownlistcliente por el nombre del correcto--%>

      <script>
      $(function () {
          $("#<%=DropDownCliente.ClientID%>").select2({
              selectOnClose: true,
              theme: 'bootstrap',
              height: '100%',
              width: '100%'
                     }
          );
          })

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
    
   <script>
        function alertmeError(){
            swal({
                title: "Error al agregar",
                text: "Ha ocurrido un error al agregar el contrato. Si el problema persiste contacte al administrador del sistema",
                type: "error",
                confirmButtonText: "Ok",
                confirmButtonColor: "#ADC867"
       });
        }

        function alertmeSuccess() {
            swal({
                title: "Contrato agregado",
                text: "El contrato ha sido guardado satisfactoriamente",
                type: "success",
                confirmButtonText: "Ok",
                confirmButtonColor: "#55407D"
            });
        }
    </script>
</asp:Content>
