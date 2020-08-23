<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_ContratoAgregar.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_ContratoAgregar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <style type="text/css">
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
    
/*@keyframes showTopText {
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
}*/


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

           <div id="divForm" style="margin-top:12%; margin-left:15%; margin-right:15%">
         <h1 style="text-align: center">Agregar Contrato</h1>
        <div class="form-row" style="margin-top:5%; margin-bottom:5%">
            <div class="form-group col-md-6">
                <!-- Numero de contrato -->
                <label for="txtContratoNumero">Número de contrato <span style="color:red;">*</span></label> <br />
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" InitialValue="0" ErrorMessage= " *" ControlToValidate="DropDownListCliente" SetFocusOnError="True" Font-Size="Small" ForeColor="white" Display="Dynamic" CssClass="alert-light" ValidationGroup="Save"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorContrato" runat="server" ControlToValidate="txtContratoNumero" ErrorMessage="*Debe ingresar un contrato*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" CssClass="alert-light" ValidationGroup="Save"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtContratoNumero" ForeColor="Black" type="text" CssClass="form-control" placeholder="Número de contrato" runat="server" MaxLength="10"></asp:TextBox>
            </div>
               <div class="form-group col-md-6">
                <!-- Cliente -->
                <label for="txtCliente">Cliente <span style="color:red;">*</span></label> <br />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" InitialValue="0" ErrorMessage= "*Debe seleccionar un cliente*" ControlToValidate="DropDownListCliente" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" CssClass="alert-light" ValidationGroup="Save"></asp:RequiredFieldValidator>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtContratoNumero" ErrorMessage="*" SetFocusOnError="True" Font-Size="Small" ForeColor="white" Display="Dynamic" CssClass="alert-light" ValidationGroup="Save"></asp:RequiredFieldValidator>
                   <asp:DropDownList ID="DropDownListCliente" ForeColor="Black" DataTextField="Cliente" CssClass="form-control" runat="server" AutoPostBack="True"></asp:DropDownList>
            </div>
              <div class="form-group col-md-6">
                <!-- Fecha de inicio -->
                <label for="txtFechaInicio">Fecha de inicio <span style="color:red;">*</span></label> <br />
                   <asp:RequiredFieldValidator ID="RequiredFieldValidatorFechaIni" runat="server" ControlToValidate="txtFechaInicio" ErrorMessage="*Debe seleccionar una fecha*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" CssClass="alert-light" ValidationGroup="Save"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtFechaInicio" type="date" ForeColor="Black" CssClass="form-control" placeholder="Fecha de Inicio" runat="server" MaxLength="50"></asp:TextBox>             
            </div>
              <div class="form-group col-md-6">
                <!-- Fecha de finalización -->
                <label for="txtFechaFinaliacion">Fecha de finalización</label> <br />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtFechaInicio" ErrorMessage="*" SetFocusOnError="True" Font-Size="Small" ForeColor="white" Display="Dynamic" CssClass="alert-light" ValidationGroup="Save"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtFechaFinaliacion" type="date" ForeColor="Black" CssClass="form-control"  runat="server" MaxLength="50"></asp:TextBox>
            </div>
                 <div class="form-group col-md-6">
                <!-- Propiedad -->
                <label for="txtPropiedad">Propiedad <span style="color:red;">*</span></label>   <br />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" InitialValue="0" ErrorMessage= "*Debe seleccionar una propiedad*" ControlToValidate="DropDownPropiedad" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" CssClass="alert-light" ValidationGroup="Save"></asp:RequiredFieldValidator>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtMonto" ErrorMessage="*" SetFocusOnError="True" Font-Size="Small" ForeColor="white" Display="Dynamic" CssClass="alert-light" ValidationGroup="Save"></asp:RequiredFieldValidator>
                     <asp:DropDownList ID="DropDownPropiedad"  DataTextField="Propiedad" ForeColor="Black" CssClass="form-control" runat="server" AutoPostBack="True"></asp:DropDownList>
            </div>
              <div class="form-group col-md-6">
                <!-- Monto mensual -->
                <label for="txtMonto">Monto Mensual<span style="color:red;">*</span></label> <br />
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" InitialValue="0" ErrorMessage= "*" ControlToValidate="DropDownPropiedad" SetFocusOnError="True" Font-Size="Small" ForeColor="white" Display="Dynamic" CssClass="alert-light" ValidationGroup="Save"></asp:RequiredFieldValidator>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidatorMonto" runat="server" ControlToValidate="txtMonto" ErrorMessage="*Debe ingresar un monto mensual*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" CssClass="alert-light" ValidationGroup="Save"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtMonto" type="text" CssClass="form-control" ForeColor="Black" placeholder="0,0" runat="server" MaxLength="18"></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                
                <label for="txtFechaPago">Fecha de Pago <span style="color:red;">*</span></label> <br />
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="up_Contrato" ErrorMessage="*" SetFocusOnError="True" Font-Size="Small" ForeColor="white" Display="Dynamic" CssClass="alert-light" ValidationGroup="Save"></asp:RequiredFieldValidator>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFechaPago" ErrorMessage="*Debe seleccionar una fecha*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" CssClass="alert-light" ValidationGroup="Save"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtFechaPago" type="date" CssClass="form-control" ForeColor="Black" runat="server" MaxLength="50"></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!-- URL Contrato -->
                <label for="txtContrato">Contrato <span style="color:red;">*</span></label><br />
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtFechaPago" ErrorMessage="*" SetFocusOnError="True" Font-Size="Small" ForeColor="white" Display="Dynamic" CssClass="alert-light" ValidationGroup="Save"></asp:RequiredFieldValidator>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidatorFile" runat="server" ControlToValidate="up_Contrato" ErrorMessage="*Debe adjuntar un archivo*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" CssClass="alert-light" ValidationGroup="Save"></asp:RequiredFieldValidator>
                <asp:FileUpload ID="up_Contrato" CssClass="form-control" ForeColor="Black" runat="server" />
                   <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="red"></asp:Label>
            </div>  

           
             

            
    </div>
        
        <div class="form-group" style="text-align:center">
            <!-- Submit Button -->
            <asp:Button ID="btnAgregar" runat="server" CssClass="boton_personalizado"  Text="Agregar" Font-Size="Medium" Height="49px" Width="111px" OnClick="btnAgregar_Click"  ValidationGroup="Save" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnAtras" runat="server" CssClass="boton_personalizado"  Text="Atrás"  Font-Size="Medium" Height="49px" Width="111px" PostBackUrl="~/Formularios/frm_ContratoLista.aspx" />
            <br />
            <br />

            
            <asp:Label ID="lblResultado" runat="server" Font-Bold="True" ForeColor="#009900"></asp:Label>
        </div>
        </div>
    <br /><br />
   
<%--   Agregar este script para el select 2--%>
<%--   Cambiar lo que dice dorpdownlistcliente por el nombre del correcto--%>

      <script>
      $(function () {
          $("#<%=DropDownListCliente.ClientID%>").select2({
              selectOnClose: true,
              theme: 'bootstrap',
              height: '100%',
              width: '100%'
                     }
          );
    })
      </script>

          <script>
              $(function () {
                  $("#<%=DropDownPropiedad.ClientID%>").select2({
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
