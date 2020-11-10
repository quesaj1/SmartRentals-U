<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_ProveedorModifica.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_ProveedorModifica" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        function ShowPopup(title, body) {
            $("#MyPopup .modal-title").html(title);
            $("#MyPopup .modal-body").html(body);
            $("#MyPopup").modal("show");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">





    <style>
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

        .select2-selection {
            overflow: hidden;
        }

        .select2-selection__rendered {
            white-space: normal;
            word-break: break-all;
        }

        /*Finaliza el estilo del select2 dropdownlist */
    </style>

    <%--Agregar estas librerias para el select 2--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.min.css" rel="stylesheet" />
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
                    <button type="button" class="close" aria-label="Cancelar" style="color: white" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                </div>
                <div class="modal-footer">
                    <asp:Button runat="server" class="btn btn-primary" Text="Confirmar" OnClick="btnAgregar_Click" />
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal Popup -->



    <div id="divForm" style="margin-top: 12%; margin-left: 15%; margin-right: 15%">
        <h1 style="text-align: center">Modificar Proveedor</h1>

        <asp:HiddenField ID="hdldProveedor" runat="server" />

        <div class="form-row" style="margin-top: 5%; margin-bottom: 5%">


            <div class="form-row" style="margin-top: 5%; margin-bottom: 5%">
                <div class="form-group col-md-6">

                    <label for="txtIDProveedor">Item del Proveedor</label><br>
                    <asp:TextBox ID="txtIDProveedor" runat="server" ForeColor="Black" ReadOnly="true" CssClass="form-control" MaxLength="25"></asp:TextBox>
                </div>


                <!-- Nombre Variable -->
                <div class="form-group col-md-6">
                    <label for="txtNombreVariable">Nombre Variable del Proveedor<span style="color: red;">*</span></label>
                    <br />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNombreVariable" ErrorMessage="*Ingrese un numero Variable de Proveedor*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtNombreVariable" ForeColor="Black" type="text" CssClass="form-control" placeholder="Variable de Proveedor" runat="server" MaxLength="50"></asp:TextBox>
                </div>

                <!-- Nombre Representante -->
                <div class="form-group col-md-6">
                    <label for="txtNombreRepresentante">Nombre Representante<span style="color: red;">*</span></label>
                    <br />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNombreRepresentante" ErrorMessage="*Ingrese un numero nombre del representante*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtNombreRepresentante" ForeColor="Black" type="text" CssClass="form-control" placeholder="Nombre Representante" runat="server" MaxLength="50"></asp:TextBox>
                </div>


                <!--PrimerApellido-->
                <div class="form-group col-md-6">
                    <label for="txtPrimerApellido">Primer Apellido<span style="color: red;">*</span></label>
                    <br />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPrimerApellido" ErrorMessage="*Ingrese un numero Primer Apellido*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtPrimerApellido" type="text" ForeColor="Black" CssClass="form-control" placeholder="Primer Apellido" runat="server" MaxLength="50"></asp:TextBox>
                </div>


                <!--SegundoApellido-->
                <div class="form-group col-md-6">
                    <label for="txtSegundoApellido">Segundo Apellido<span style="color: red;">*</span></label>
                    <br />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtSegundoApellido" ErrorMessage="Ingrese un numero Segundo Apellido*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtSegundoApellido" type="text" ForeColor="Black" CssClass="form-control" placeholder="Segundo Apellido" runat="server" MaxLength="50"></asp:TextBox>
                </div>

                <!--Cedula Representante-->
                <div class="form-group col-md-6">
                    <label for="txtCedulaRepresentante">Cedula Representante<span style="color: red;">*</span></label>
                    <br />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCedulaRepresentante" ErrorMessage="*Ingrese un numero Cedula*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="txtCedulaRepresentante" ErrorMessage="Debe ingresar un cedula con el formato 0 0000 0000 (9 dígitos, sin cero al inicio ni guiones). " ValidationExpression="[0-9]{9}" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="txtCedulaRepresentante" type="text" ForeColor="Black" CssClass="form-control" placeholder="Cedula Representante" runat="server" MaxLength="12"></asp:TextBox>
                </div>

                <!--Cedula Juridica-->
                <div class="form-group col-md-6">
                    <label for="txtCedulaJuridica">Cedula Juridica<span style="color: red;">*</span></label>
                    <br />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCedulaJuridica" ErrorMessage="*Ingrese un numero Cedula Juridica*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="txtCedulaJuridica" ErrorMessage="Debe ingresar un cedula jurida con el formato 0000000000 (10 dígitos, sin cero al inicio ni guiones). " ValidationExpression="[0-9]{10}" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="txtCedulaJuridica" type="text" ForeColor="Black" CssClass="form-control" placeholder="Cedula Juridica" runat="server" MaxLength="12"></asp:TextBox>
                </div>

                <!--Telefono-->
                <div class="form-group col-md-6">
                    <label for="txtTelefono">Telefono<span style="color: red;">*</span></label>
                    <br />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtTelefono" ErrorMessage="*Ingrese un numero telefonico*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="txtTelefono" ErrorMessage="Debe ingresar un numero telefonico de 8 digitos " ValidationExpression="[0-9]{8}" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="txtTelefono" type="text" ForeColor="Black" CssClass="form-control" placeholder="Telefono" runat="server" MaxLength="15"></asp:TextBox>
                </div>

                <!--Email-->
                <div class="form-group col-md-6">
                    <label for="txtEmail">Correo Electronico<span style="color: red;">*</span></label>
                    <br />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail" ErrorMessage="*Ingrese un correo electronico*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="Ingrese un correo electronico valido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="txtEmail" type="text" ForeColor="Black" CssClass="form-control" placeholder="Email" runat="server" MaxLength="50"></asp:TextBox>
                </div>


                <!--TipoProveedor -->
                <div class="form-group col-md-6">
                    <label for="txtTipoProveedor">Tipo Proveedor<span style="color: red;">*</span></label>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTipo" ForeColor="Black" runat="server" ErrorMessage="*Debe seleccionar un tipo de proveedor*" SetFocusOnError="True" Font-Size="Small" InitialValue="Seleccionar" ControlToValidate="txtTipoProveedor"  Display="Dynamic"></asp:RequiredFieldValidator>
                    <select id="txtTipoProveedor" class="custom-select" runat="server" forecolor="Black" cssclass="form-control">
                        <option style="font-size: small">Seleccionar</option>
                        <option style="font-size: small">Jardinero</option>
                        <option style="font-size: small">Electricidad</option>
                        <option style="font-size: small">Fontanero</option>
                        <option style="font-size: small">Cable/Redes</option>
                        <option style="font-size: small">Telefonia</option>
                    </select>
                </div>

                <div class="form-group col-md-6">
                    <!-- Provincia -->
                    <label for="txtProvincia">Provincia</label><br>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorProv" runat="server" ControlToValidate="DropDownListProvincia" ErrorMessage="*Debe selecccionar una provincia*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                    <asp:DropDownList ID="DropDownListProvincia" ViewStateMode="Enabled" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="SeleccionaProvincia" ForeColor="Black"></asp:DropDownList>
                    <br />
                </div>
                <div class="form-group col-md-6">
                    <!--  Canton -->
                    <label for="txtCanton">Canton</label><br>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorCant" runat="server" ControlToValidate="DropDownListCanton" ErrorMessage="*Debe seleccionar un cantón*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                    <asp:DropDownList ID="DropDownListCanton"  CssClass="form-control" ViewStateMode="Enabled" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SeleccionaCanton" ForeColor="Black"></asp:DropDownList>
                    <br>
                </div>
                <div class="form-group col-md-6">
                    <!-- Distrito -->
                    <label for="txtDistrito">Distrito</label><br>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorDist" runat="server" ControlToValidate="DropDownListDistrito" ErrorMessage="*Debe seleccionar un distrito*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                    <asp:DropDownList ID="DropDownListDistrito" CssClass="form-control" ViewStateMode="Enabled" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SeleccionaDistrito" ForeColor="Black"></asp:DropDownList>
                    <br>
                </div>

                <!--OtrasSenas-->
                <div class="form-group col-md-6">
                    <label for="txtOtrasSenas">Comentarios<span style="color: red;">*</span></label>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorSenas" runat="server" ControlToValidate="txtOtrasSenas" ErrorMessage="*Debe ingresar un comentario* " SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" CssClass="alert-light"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtOtrasSenas" type="text" ForeColor="Black" CssClass="form-control" placeholder="Otras Señas" runat="server" MaxLength="30"></asp:TextBox>
                </div>

            </div>
        </div>


        <%--test--%>
        <div class="form-group col-md-6" runat="server" visible="false">


            <asp:DropDownList ID="DropDownListProvincia1" DataTextField="nombre" DataValueField="id_provincia" CssClass="form-control" runat="server" Visible="true" AutoPostBack="True" ForeColor="Black"></asp:DropDownList>
            <br />
        </div>
        <div class="form-group col-md-6" runat="server" visible="false">
            <!--  Canton -->
            <label for="txtCanton">Canton</label><br>

            <asp:DropDownList ID="DropDownListCanton1" CssClass="form-control" DataTextField="nombre" DataValueField="id_canton" runat="server" AutoPostBack="True" ForeColor="Black"></asp:DropDownList>
            <br>
        </div>
        <div class="form-group col-md-6" runat="server" visible="false">
            <!-- Distrito -->
            <label for="txtDistrito">Distrito</label><br>

            <asp:DropDownList ID="DropDownListDistrito1" CssClass="form-control" DataTextField="nombre" DataValueField="id_distrito" runat="server" AutoPostBack="True" ForeColor="Black"></asp:DropDownList>
            <br>
        </div>



        <div class="form-group" style="text-align: center">
            <!-- Submit Button -->


            <asp:Button ID="btnShowPopup" runat="server" CssClass="boton_personalizado" Font-Size="Medium" Height="49px" Width="111px" Text="Modificar" OnClick="btnAgregar_Click" />


            &nbsp;&nbsp;&nbsp;

             <asp:Button ID="btnAtras" CssClass="boton_personalizado" runat="server" CausesValidation="false" Text="Atras" OnClick="btnAtras_Click" Font-Size="Medium" Height="49px" Width="111px" PostBackUrl="~/Formularios/frm_ProveedorLista.aspx" />

            <br />
            <br />

            <asp:Label ID="lblResultado" runat="server" Font-Bold="True" ForeColor="#009900" CssClass="alert-success" Font-Size="Large"></asp:Label>
        </div>
        <br>
        <br>
        <br>
    </div>



    <script>

        $(function () {
            $("#<%=DropDownListProvincia.ClientID%>").select2({
                selectOnClose: true,
                theme: 'bootstrap',
                height: '100%',
                width: '100%'
            }
            );
        })



    </script>


    <script>
        function alertmeError() {
            swal({
                title: "Error al agregar",
                text: "Ha ocurrido un error al agregar el proveedor. Si el problema persiste contacte al administrador del sistema",
                type: "error",
                confirmButtonText: "Ok",
                confirmButtonColor: "#ADC867"
            });
        }

        function alertmeDuplicate() {
            swal({
                title: "Proveedor duplicado",
                text: "El Proveedor ingresado ya se encuentra registrado",
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
