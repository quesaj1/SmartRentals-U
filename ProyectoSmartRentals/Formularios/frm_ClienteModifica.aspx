<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_ClienteModifica.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_ClienteModifica" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    
 <%-- Llamado del script de JS para el Modal show y hide --%>

    <script type="text/javascript">
        function ShowPopup(title, body) {
            $("#MyPopup .modal-title").html(title);
            $("#MyPopup .modal-body").html(body);
            $("#MyPopup").modal("show");
        }
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <style type="text/css">
            .boton_personalizado{
    font-weight: 600;
    font-size: 20px;
    color: #ffffff;
    background-color: #adc867;
    border-radius:5px;
  }
  .boton_personalizado:hover{
    color: #ffffff;
    background-color: #55407d;
    border-radius:5px;
  }

input.error {
            border: 1px dotted red;
        }
label.error {
            position: static;
            background: url('images/unchecked.gif') no-repeat;
            padding-left: 20px;
            margin-left: .3em;
            vertical-align: middle;
            width: 250px;
            float: right;
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



/*Agregar esto para el diseño del select2 de los dropdownlists */
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
 

             <!-- Modal Popup -->
    <div id="MyPopup" class="modal fade" data-keyboard="false" data-backdrop="static" role="dialog" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <!-- Modal content-->

            <div class="modal-content">
                <div class="modal-header" style="background-color: #55407d">
                    <h4 class="modal-title" style="color: white"></h4>
                    <button type="button" class="close" aria-label="Cancelar" style="color: white" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                    </button>
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
         <h1 style="text-align: center">Modificar Cliente</h1>

                <asp:HiddenField ID="hdlCliente" runat="server" />

        <div class="form-row" style="margin-top:5%; margin-bottom:5%">
                   <div class="form-group col-md-6">

                <label for="txtIdCliente">Item del Cliente</label><br>
                <asp:TextBox ID="txtIdCliente" runat="server" ForeColor="Black" ReadOnly="true" CssClass="form-control" MaxLength="25"></asp:TextBox>
           </div>
       
            <div class="form-group col-md-6">
                <!-- txtCedula -->
                <label for="txtCedula">Cedula<span style="color:red;">*</span></label><br />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCedula" ErrorMessage="*Ingrese un numero Cedula de Representante*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" CssClass="alert-light"  ValidationGroup="Save"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ControlToValidate="txtCedula" ErrorMessage="Debe ingresar una Cedula con el formato 0 0000 0000 (9 dígitos, sin cero al inicio ni guiones)." ValidationExpression="[0-9]{9}" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RegularExpressionValidator>
                <asp:TextBox ID="txtCedula" type="text" ForeColor="Black" CssClass="form-control"  placeholder="Cédula" runat="server" MaxLength="25"></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!-- txtNombre -->
                <label for="txtNombre">Nombre del Cliente<span style="color:red;">*</span></label><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="*Debe ingresar un Nombre*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" CssClass="alert-light" ValidationGroup="Save"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtNombre" type="text" CssClass="form-control" ForeColor="Black" placeholder="Nombre" runat="server" MaxLength="50"></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!-- txtSegundoNombre -->
                <label for="txtSegundoNombre">Segundo Nombre<span style="color:red;">*</span></label><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSegundoNombre" ErrorMessage="*Debe ingresar un Segundo Nombre*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" CssClass="alert-light" ValidationGroup="Save"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtSegundoNombre" type="text" CssClass="form-control" ForeColor="Black" placeholder="Segundo Nombre" runat="server" MaxLength="50"></asp:TextBox>             
            </div>
              <div class="form-group col-md-6">
                <!-- txtPrimerApellido -->
                <label for="txtPrimerApellido">Primer Apellido<span style="color:red;">*</span></label><br />
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPrimerApellido" ErrorMessage="*Debe ingresar un Apellido*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" CssClass="alert-light" ValidationGroup="Save"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtPrimerApellido" type="text" CssClass="form-control" ForeColor="Black" placeholder="Primer Apellido" runat="server" MaxLength="50"></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!-- txtSegundoApellido -->
                <label for="txtSegundoApellido">Segundo Apellido<span style="color:red;">*</span></label><br />
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtSegundoApellido" ErrorMessage="*Debe ingresar un Segundo Apellido*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" CssClass="alert-light" ValidationGroup="Save"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtSegundoApellido" type="text" CssClass="form-control" ForeColor="Black" placeholder="Segundo Apellido" runat="server" MaxLength="50"></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!-- txtFechaNacimiento -->
                <label for="txtFechaNacimiento">Fecha Nacimiento<span style="color:red;">*</span></label><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFechaIni" runat="server" ControlToValidate="txtFechaNacimiento" ErrorMessage="*Debe seleccionar una Fecha de Nacimiento*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" CssClass="alert-light" ValidationGroup="Save"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtFechaNacimiento" type="date" CssClass="form-control" ForeColor="Black" placeholder="Fecha Nacimiento" runat="server" MaxLength="50"></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!-- txtTelefonoCasa -->
                <label for="txtTelefonoCasa">Telefono Casa<span style="color:red;">*</span></label><br />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtTelefonoCasa" ErrorMessage="Ingrese un numero telefonico de casa" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" ></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ControlToValidate="txtTelefonoCasa" ErrorMessage="Debe ingresar un numero telefonico de 8 digitos " ValidationExpression="[0-9]{8}" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" CssClass="alert-light"  ValidationGroup="Save"></asp:RegularExpressionValidator>
                <asp:TextBox ID="txtTelefonoCasa" type="text" CssClass="form-control" ForeColor="Black" placeholder="Telefono Casa" runat="server" MaxLength="50"></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!-- txtTelefonoCelular -->
                <label for="txtTelefonoCelular">Telefono Celular<span style="color:red;">*</span></label><br />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtTelefonoCelular" ErrorMessage="Ingrese un numero telefonico celular" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" ></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ControlToValidate="txtTelefonoCelular" ErrorMessage="Debe ingresar un numero telefonico de 8 digitos " ValidationExpression="[0-9]{8}" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" CssClass="alert-light"  ValidationGroup="Save"></asp:RegularExpressionValidator>
                <asp:TextBox ID="txtTelefonoCelular" ForeColor="Black" type="text" CssClass="form-control" placeholder="Telefono Celular" runat="server" MaxLength="50"></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!-- txtEmail -->
                <label for="txtEmail">Correo Electronico<span style="color:red;">*</span></label><br />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail" ErrorMessage="Ingrese un correo electronico" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" CssClass="alert-light"  ValidationGroup="Save" ></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="Ingrese un correo electronico valido"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RegularExpressionValidator>
                <asp:TextBox ID="txtEmail" type="text" CssClass="form-control" ForeColor="Black" placeholder="Email" runat="server" MaxLength="50"></asp:TextBox>
            </div>

            
    </div>
        
      <div class="form-group" style="text-align: center">
            <!-- Submit Button -->


             <asp:Button ID="btnShowPopup" runat="server" CssClass="boton_personalizado" Font-Size="Medium" Height="49px" Width="111px" Text="Modificar" OnClick="btnAgregar_Click" />

           
            &nbsp;&nbsp;&nbsp;

             <asp:Button ID="btnAtras" CssClass="boton_personalizado" runat="server" CausesValidation="false" Text="Atras" OnClick="btnAtras_Click" Font-Size="Medium" Height="49px" Width="111px" PostBackUrl="~/Formularios/frm_ClienteLista.aspx"  />

            <br />
            <br />

            <asp:Label ID="lblResultado" runat="server" Font-Bold="True" ForeColor="#009900" CssClass="alert-success" Font-Size="Large"></asp:Label>
        </div>
        </div>


    <script>
        function alertmeError(){
            swal({
                title: "Error al modificar el cliente",
                text: "Ha ocurrido un error al modificar el cliente. Si el problema persiste contacte al administrador del sistema",
                type: "error",
                confirmButtonText: "Ok",
                confirmButtonColor: "#ADC867"
       });
        }

        function alertmeSuccess() {
            swal({
                title: "Cliente modificado",
                text: "El contrato ha sido modificado satisfactoriamente",
                type: "success",
                confirmButtonText: "Ok",
                confirmButtonColor: "#55407D"
            });
        }
    </script>







</asp:Content>
