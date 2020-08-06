<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_ProveedorAgregar.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_ProveedorAgregar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
         <h1 style="text-align: center">Agregar Proveedor</h1>

        <div class="form-row" style="margin-top:5%; margin-bottom:5%">
              <!-- Nombre Variable -->
            <div class="form-group col-md-6">
                <label for="txtNombreVariable"></label>
                <br />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNombreVariable" ErrorMessage="*Ingrese un numero variable del proveedor*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" ></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtNombreVariable" type="text" CssClass="form-control" placeholder="Nombre Variable" runat="server" MaxLength="50"></asp:TextBox>
            </div>

             <!-- Nombre Representante -->
            <div class="form-group col-md-6">
                <label for="txtNombreRepresentante"></label>
                <br />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNombreRepresentante" ErrorMessage="*Ingrese un numero nombre del representante*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" ></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtNombreRepresentante" type="text" CssClass="form-control" placeholder="Nombre Representante" runat="server" MaxLength="50"></asp:TextBox>
            </div>


              <!--PrimerApellido-->
              <div class="form-group col-md-6">
                <label for="txtPrimerApellido"></label>
                  <br />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPrimerApellido" ErrorMessage="*Ingrese un numero Primer Apellido*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" ></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtPrimerApellido" type="text" CssClass="form-control" placeholder="Primer Apellido" runat="server" MaxLength="50"></asp:TextBox>             
            </div>


              <!--SegundoApellido-->
              <div class="form-group col-md-6">
                <label for="txtSegundoApellido"></label>
                  <br />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtSegundoApellido" ErrorMessage="Ingrese un numero Segundo Apellido*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" ></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtSegundoApellido" type="text" CssClass="form-control" placeholder="Segundo Apellido" runat="server" MaxLength="50"></asp:TextBox>             
            </div>

              <!--Cedula Representante-->
              <div class="form-group col-md-6">
                <label for="txtCedulaRepresentante"></label>
                  <br />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCedulaRepresentante" ErrorMessage="*Ingrese un numero Cedula*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" ></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ControlToValidate="txtCedulaRepresentante" ErrorMessage="Debe ingresar un cedula con el formato 0 0000 0000 (9 dígitos, sin cero al inicio ni guiones). " ValidationExpression="[0-9]{9}" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RegularExpressionValidator>
                <asp:TextBox ID="txtCedulaRepresentante" type="text" CssClass="form-control" placeholder="Cedula Representante" runat="server" MaxLength="12"></asp:TextBox>             
            </div>

            <!--Cedula Juridica-->
              <div class="form-group col-md-6">
                <label for="txtCedulaJuridica"></label>
                  <br />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCedulaJuridica" ErrorMessage="*Ingrese un numero Cedula Juridica*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" ></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ControlToValidate="txtCedulaJuridica" ErrorMessage="Debe ingresar un cedula jurida con el formato 0000000000 (10 dígitos, sin cero al inicio ni guiones). " ValidationExpression="[0-9]{10}" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RegularExpressionValidator>
                <asp:TextBox ID="txtCedulaJuridica" type="text" CssClass="form-control" placeholder="Cedula Juridica" runat="server" MaxLength="12"></asp:TextBox>             
            </div>

             <!--Telefono-->
              <div class="form-group col-md-6">
                <label for="txtTelefono"></label>
                  <br />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtTelefono" ErrorMessage="*Ingrese un numero telefonico*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" ></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ControlToValidate="txtTelefono" ErrorMessage="Debe ingresar un numero telefonico de 8 digitos " ValidationExpression="[0-9]{8}" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RegularExpressionValidator>
                <asp:TextBox ID="txtTelefono" type="text" CssClass="form-control" placeholder="Telefono" runat="server" MaxLength="15"></asp:TextBox>             
            </div>

            <!--Email-->
              <div class="form-group col-md-6">
                <label for="txtEmail"></label>
                  <br />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail" ErrorMessage="*Ingrese un correo electronico*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" ></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="Ingrese un correo electronico valido"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RegularExpressionValidator>
                <asp:TextBox ID="txtEmail" type="text" CssClass="form-control" placeholder="Email" runat="server" MaxLength="50"></asp:TextBox>             
            </div>


               <!--TipoProveedor -->
              <div class="form-group col-md-6">
                <label for="txtTipoProveedor"></label>
                  <br/>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorTipo" runat="server" ErrorMessage="*Debe seleccionar un tipo de proveedor*" SetFocusOnError="True" Font-Size="Small" InitialValue="Seleccionar" ControlToValidate="txtTipoProveedor" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>
                  <select id="txtTipoProveedor" class="custom-select" runat="server" CssClass="form-control">
                    <option style="font-size: small">Seleccionar</option>
                    <option style="font-size: small">Jardinero</option>
                    <option style="font-size: small">Electricidad</option>
                    <option style="font-size: small">Fontanero</option>
                    <option style="font-size: small">Cable/Redes</option>
                    <option style="font-size: small">Telefonia</option>
                </select>
            </div>


             <!-- Provincia -->
              <div class="form-group col-md-6">
                <label for="txtProvincia">Provincia</label>
                    <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorProv" runat="server" ControlToValidate="DropDownListProvincia" ErrorMessage="*Debe seleccionar una provincia*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                  <asp:DropDownList ID="DropDownListProvincia"  DataTextField="Provincia" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ProvinciaSeleccion"></asp:DropDownList>
            </div>

              <!--  Canton -->
              <div class="form-group col-md-6">
               <label for="txtCanton">Canton</label>
                  <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCant" runat="server" ControlToValidate="DropDownListCanton" ErrorMessage="*Debe seleccionar un cantón*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                  <asp:DropDownList ID="DropDownListCanton" DataTextField="Canton" CssClass="form-control"  runat="server" AutoPostBack="True" OnSelectedIndexChanged="CantonSeleccion"></asp:DropDownList>
            </div>


            <!-- Distrito -->
              <div class="form-group col-md-6">
               <label for="txtDistrito">Distrito</label>
                  <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDist" runat="server" ControlToValidate="DropDownListDistrito" ErrorMessage="*Debe seleccionar un distrito*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                  <asp:DropDownList ID="DropDownListDistrito" DataTextField="Distrito" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DistritoSeleccion"></asp:DropDownList>
            </div>

             <!--OtrasSenas-->
              <div class="form-group col-md-6">
                <label for="txtOtrasSenas"></label>
                   <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorSenas" runat="server" ControlToValidate="txtOtrasSenas" ErrorMessage="*Debe ingresar un comentario* " SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" CssClass="alert-light"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtOtrasSenas" type="text" CssClass="form-control" placeholder="Otras Señas" runat="server" MaxLength="30"></asp:TextBox>             
            </div>

 
    </div>



         <!-- Submit Button -->
        <div class="form-group" style="text-align:center">
            <asp:Button ID="btnAgregar" runat="server"  CssClass="boton_personalizado"  Text="Agregar" Font-Size="Medium" Height="49px" Width="111px" OnClick="btnAgregar_Click"/>
             &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnAtras" CssClass="boton_personalizado"  runat="server" Text="Atras" OnClick="btnAtras_Click" Font-Size="Medium" Height="49px" Width="111px" PostBackUrl="~/Formularios/frm_ProveedorLista.aspx" />
            <br />
            <br />
            <asp:Label ID="lblResultado" runat="server" Font-Bold="True" ForeColor="#009900"></asp:Label>
        </div>
        </div>



    
      <script>
      $(function () {
          $("#<%=DropDownListDistrito.ClientID%>").select2({
              selectOnClose: true,
              theme: 'bootstrap',
              height: '100%',
              width: '100%'
                     }
          );
      })
          $(function () {
              $("#<%=DropDownListProvincia.ClientID%>").select2({
                  selectOnClose: true,
                  theme: 'bootstrap',
                  height: '100%',
                  width: '100%'
              }
              );
          })


          $(function () {
              $("#<%=DropDownListCanton.ClientID%>").select2({
                  selectOnClose: true,
                  theme: 'bootstrap',
                  height: '100%',
                  width: '100%'
              }
              );
          })


          $(function () {
              $("#<%=txtTipoProveedor.ClientID%>").select2({
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
                text: "Ha ocurrido un error al agregar el proveedor. Si el problema persiste contacte al administrador del sistema",
                type: "error",
                confirmButtonText: "Ok",
                confirmButtonColor: "#ADC867"
       });
        }

        function alertmeSuccess() {
            swal({
                title: "Proveedor agregado",
                text: "El proveedor ha sido guardado satisfactoriamente",
                type: "success",
                confirmButtonText: "Ok",
                confirmButtonColor: "#55407D"
            });
        }
    </script>



</asp:Content>
