<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_ReportarPagoAgregar.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_ReportarPagoAgregar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            0% {
                transform: translate3d(0, 100%, 0);
            }

            40%, 60% {
                transform: translate3d(0, 50%, 0);
            }

            100% {
                transform: translate3d(0, 0, 0);
            }
        }

        @keyframes showBottomText {
            0% {
                transform: translate3d(0, -100%, 0);
            }

            100% {
                transform: translate3d(0, 0, 0);
            }
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
            background: #ecf0f1;
            padding: 5px;
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
             display:none !important;
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
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>

    <%--Agregar estas librerias para el select 2--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js" defer></script>
    <link href="../Content/select2-bootstrap.css" rel="stylesheet" />
    <link href="../Content/css/select2.min.css" rel="stylesheet" />
    <script src="../Scripts/select2.min.js"></script>
    <link href="../Content/select2-bootstrap.css" rel="stylesheet" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>

    <%--Finaliza las librerias--%>


    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="../images/icons/favicon.ico" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../styles/RepotarPagoutil.css">
    <link rel="stylesheet" type="text/css" href="../styles/EstilosPagos.css">
    <!--===============================================================================================-->




    <div class="container-contact100">
        <div class="wrap-contact100">
            <div class="contact100-form validate-form" style="margin-top: 5%; margin-bottom: 5%">
                <span class="contact100-form-title">Pago del Cliente de Smart Rentals
                </span>
                   <!-- Contrato -->
                <label class="label-input100" for="first-name">Contrato Relacionado</label>
                <div class="wrap-input100 rs2-wrap-input100 validate-input">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownListContrato" ErrorMessage="*Debe seleccionar una contrato*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
 
                    <asp:DropDownList ID="DropDownListContrato" DataTextField="Contratto" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListContrato_SelectedIndexChanged"></asp:DropDownList>
 
                    <span class="focus-input100"></span>
                </div>
         

                <!-- Cliente -->
                <label class="label-input100" for="first-name">Informacion del Cliente a Pagar</label>
                <div class="wrap-input100 rs1-wrap-input100 validate-input">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownListCliente" ErrorMessage="*Debe seleccionar un cliente*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
 
                    <asp:DropDownList ID="DropDownListCliente" placeholder="Informacion del Cliente a Pagar" DataTextField="Cliente" CssClass="form-control" runat="server" AutoPostBack="True" Visible="true" Enabled="false"></asp:DropDownList>
             
 
                    
                    <span class="focus-input100"></span>
                </div>

                      
                <!-- Email Cliente -->
                <label class="label-input100" for="first-name">Correo del Cliente</label>
                <div class="wrap-input100 rs1-wrap-input100 validate-input">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownListEmail" ErrorMessage="*Debe seleccionar una correo*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
 
                    <asp:DropDownList ID="DropDownListEmail" placeholder="Correo del Cliente" DataTextField="Cliente" CssClass="form-control" runat="server" AutoPostBack="True" Enabled="false"></asp:DropDownList>
 
                    <span class="focus-input100"></span>
                </div>

                 <!-- Monto mensual -->
                <label class="label-input100" for="first-name">Monto a Pagar</label>
                <div class="wrap-input100 rs1-wrap-input100 validate-input">
 
                  <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMonto" ErrorMessage="*Debe seleccionar una Monto a Pagar*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" CssClass="alert-light"></asp:RequiredFieldValidator>--%>
                <%--<asp:TextBox ID="txtMonto" type="text" CssClass="form-control" ForeColor="Black" placeholder="0,0" runat="server" MaxLength="18"></asp:TextBox>--%>
                     <asp:DropDownList ID="ddMonto"    CssClass="form-control" runat="server" AutoPostBack="True" Enabled="false"></asp:DropDownList>

                <span class="focus-input100"></span>
            </div>
          
                <!-- Fecha Pago mensual -->
                <label class="label-input100" for="email">Fecha de Pago realizado</label>
                <div class="wrap-input100 validate-input">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorFechaIni" runat="server" ControlToValidate="txtFechaPago" ErrorMessage="*Debe seleccionar una Fecha de Pago*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" CssClass="alert-light"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtFechaPago" type="date" ForeColor="Black" CssClass="form-control" placeholder="Monto" runat="server" MaxLength="50"></asp:TextBox>
                    <span class="focus-input100"></span>
                </div>


                <!-- Detalles Del Pago -->
                <label class="label-input100" for="email">Detalles de Pago realizado</label>
                <div class="wrap-input100 validate-input">
 
                    <textarea id="txtDetallesDePago" cssclass="form-control" placeholder="" runat="server" maxlength="50"></textarea>
 
                    <span class="focus-input100"></span>
                </div>
                 <br>
                 <br>
                 <br>

                <!-- Submit Button -->
                <div class="container-contact100-form-btn">
                    <asp:Button ID="btnAgregarPago" runat="server" CssClass="boton_personalizado" Text="Notificar Pago" Font-Size="Medium" Height="49px" Width="120px" OnClick="btnAgregarPago_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:Button ID="btnAtras" CssClass="boton_personalizado" runat="server" CausesValidation="false" Text="Atras" Font-Size="Medium" Height="49px" Width="120px" PostBackUrl="~/Formularios/frm_ListaReportarPago.aspx" />
                    <br />
                    <br />
                    <asp:Label ID="lblResultado" runat="server" Font-Bold="True" ForeColor="#009900" CssClass="alert-success" Font-Size="Large"></asp:Label>
                </div>
            </div>

            <div class="contact100-more flex-col-c-m" style="background-image: url('../images/calculo-calculadora-cuentas.jpg');">
                <div class="flex-w size1 p-b-47">
                    <div class="txt1 p-r-25">
                        <span class="lnr lnr-map-marker"></span>
                    </div>

                    <div class="flex-col size2">
                        <span class="txt1 p-b-20">Dirrecion de Contacto 
                        </span>

                        <span class="txt2">Heredia, Costa Rica
                        </span>
                    </div>
                </div>

                <div class="dis-flex size1 p-b-47">
                    <div class="txt1 p-r-25">
                        <span class="lnr lnr-phone-handset"></span>
                    </div>

                    <div class="flex-col size2">
                        <span class="txt1 p-b-20">Numero de contacto
                        </span>

                        <span class="txt3">+506 84813804
                        </span>
                    </div>
                </div>

                <div class="dis-flex size1 p-b-47">
                    <div class="txt1 p-r-25">
                        <span class="lnr lnr-envelope"></span>
                    </div>

                    <div class="flex-col size2">
                        <span class="txt1 p-b-20">Soporte General
                        </span>

                        <span class="txt3">info.smartrentals@gmail.com
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
 

    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <div id="dropDownSelect1"></div>


    <script src="../js/main.js"></script>
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());

        gtag('config', 'UA-23581568-13');
    </script>



    <script>
        $(function () {
            $("#<%=DropDownListContrato.ClientID%>").select2({
                selectOnClose: true,
                theme: 'bootstrap',
                height: '100%',
                width: '100%'
            }
            );
        })
        $(function () {
            $("#<%=DropDownListCliente.ClientID%>").select2({
                selectOnClose: true,
                theme: 'bootstrap',
                height: '100%',
                width: '100%'
            }
            );
        })


        $(function () {
            $("#<%=DropDownListEmail.ClientID%>").select2({
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
                text: "Ha ocurrido un error al agregar el pago. Si el problema persiste contacte al administrador del sistema",
                type: "error",
                confirmButtonText: "Ok",
                confirmButtonColor: "#ADC867"
            });
        }

        function alertmeSuccess() {
            swal({
                title: "Pago agregado",
                text: "El pago ha sido guardado satisfactoriamente, validar el correo eletronico",
                type: "success",
                confirmButtonText: "Ok",
                confirmButtonColor: "#55407D"
            });
        }
    </script>


</asp:Content>
