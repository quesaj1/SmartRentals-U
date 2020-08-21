<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_ArchivarPagos.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_ArchivarPagos" %>

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
    <link rel="stylesheet" type="text/css" href="../vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../styles/RepotarPagoutil.css">
    <link rel="stylesheet" type="text/css" href="../styles/ReportarPago.css">
    <!--===============================================================================================-->
    <style>
        .boton_personalizado {
            font-weight: 600;
            font-size: 20px;
            color: #ffffff;
            background-color: #adc867;
            border-radius: 5px;
        }

            .boton_personalizado:hover {
                color: #ffffff;
                background-color: #55407d;
                border-radius: 5px;
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
                    <asp:Button runat="server" class="btn btn-primary" Text="Confirmar" OnClick="btnArchivarPago_Click" />
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal Popup -->


    <div class="container-contact100">

        <asp:HiddenField ID="hdldPago" runat="server" />
        <div class="wrap-contact100">
            <div class="contact100-form validate-form" style="margin-top: 5%; margin-bottom: 5%">
                <span class="contact100-form-title">Archivar Pago realizados
                </span>
                <!-- ID -->
                <label class="label-input100" for="first-name">Item del Pago</label>
                <div class="wrap-input100 rs1-wrap-input100 validate-input">
                    <asp:TextBox ID="TexIDPago" type="text" CssClass="form-control" ReadOnly="true"  runat="server" MaxLength="50"></asp:TextBox>
                    <span class="focus-input100"></span>
                </div>
                <!-- Email Cliente -->
                <label class="label-input100" for="first-name">Correo del Cliente</label>
                <div class="wrap-input100 rs1-wrap-input100 validate-input">
                    <asp:TextBox ID="txtClienteEmail" type="text" CssClass="form-control" ReadOnly="true" placeholder="Canton" runat="server" MaxLength="50"></asp:TextBox>
                    <span class="focus-input100"></span>
                </div>

                <!-- Cliente -->
                <label class="label-input100" for="first-name">Informacion del Cliente a Pagar</label>
                <div class="wrap-input100 rs1-wrap-input100 validate-input">
                    <asp:TextBox ID="txtCliente" type="text" CssClass="form-control" ReadOnly="true" placeholder="Canton" runat="server" MaxLength="50"></asp:TextBox>
                    <span class="focus-input100"></span>
                </div>
                <!-- Contrato -->
                <label class="label-input100" for="first-name">Contrato Relacionado</label>
                <div class="wrap-input100 rs2-wrap-input100 validate-input">
                    <asp:TextBox ID="txtContrato" type="text" CssClass="form-control" ReadOnly="true" placeholder="Canton" runat="server" MaxLength="50"></asp:TextBox>
                    <span class="focus-input100"></span>
                </div>
                <!-- Fecha Pago mensual -->
                <label class="label-input100" for="email">Fecha de Pago realizado</label>
                <div class="wrap-input100 validate-input">
                    <asp:TextBox ID="txtFechaPago" type="date" CssClass="form-control" placeholder="Monto" runat="server" MaxLength="50"></asp:TextBox>
                    <span class="focus-input100"></span>
                </div>


                <!-- Detalles Del Pago -->
                <label class="label-input100" for="email">Detalles de Pago realizado</label>
                <div class="wrap-input100 validate-input">
                    <textarea id="txtDetallesDePago" cssclass="form-control" placeholder="Monto" runat="server" maxlength="50"></textarea>
                    <span class="focus-input100"></span>
                </div>
                <!-- Submit Button -->
                <div class="container-contact100-form-btn">
                    <asp:Button ID="btnArchivarPago" runat="server" CssClass="boton_personalizado" Text="Archivar Pago" Font-Size="Medium" Height="49px" Width="145px" OnClick="btnArchivarPago_Click"/>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:Button ID="btnAtras" CssClass="boton_personalizado" runat="server" CausesValidation="false" Text="Atras" Font-Size="Medium" Height="49px" Width="145px" PostBackUrl="~/Formularios/frm_ListaReportarPago.aspx" OnClick="btnAtras_Click" />
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

    <%--test--%>
    <div class="form-group col-md-6" runat="server" visible="false">
        <asp:DropDownList ID="DropDownListEmail" DataTextField="nombre" DataValueField="id_provincia" CssClass="form-control" runat="server" Visible="true" AutoPostBack="True" ForeColor="Black"></asp:DropDownList>
        <br />
    </div>
    <div class="form-group col-md-6" runat="server" visible="false">
        <!--  Canton -->
        <label for="txtCanton">Canton</label><br>

        <asp:DropDownList ID="DropDownListCliente" CssClass="form-control" DataTextField="nombre" DataValueField="id_canton" runat="server" AutoPostBack="True" ForeColor="Black"></asp:DropDownList>
        <br>
    </div>
    <div class="form-group col-md-6" runat="server" visible="false">
        <!-- Distrito -->
        <label for="txtDistrito">Distrito</label><br>

        <asp:DropDownList ID="DropDownListContrato" CssClass="form-control" DataTextField="nombre" DataValueField="id_distrito" runat="server" AutoPostBack="True" ForeColor="Black"></asp:DropDownList>
        <br>
    </div>




    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <div id="dropDownSelect1"></div>

    <!--===============================================================================================-->
    <script src="../vendor/jquery/jquery-3.2.1.min.js"></script>
    <!--===============================================================================================-->
    <script src="../vendor/animsition/js/animsition.min.js"></script>
    <!--===============================================================================================-->
    <script src="../vendor/bootstrap/js/popper.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
    <script src="Fvendor/select2/select2.min.js"></script>

    <!--===============================================================================================-->
    <script src="../vendor/daterangepicker/moment.min.js"></script>
    <script src="../vendor/daterangepicker/daterangepicker.js"></script>
    <!--===============================================================================================-->
    <script src="../vendor/countdowntime/countdowntime.js"></script>
    <!--===============================================================================================-->
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
        function alertmeError() {
            swal({
                title: "Error al archivar el pago",
                text: "Ha ocurrido un error al archivar el pago. Si el problema persiste contacte al administrador del sistema",
                type: "error",
                confirmButtonText: "Ok",
                confirmButtonColor: "#ADC867"
            });
        }

        function alertmeSuccess() {
            swal({
                title: "Pago archivado",
                text: "El Pago ha sido archivado satisfactoriamente",
                type: "success",
                confirmButtonText: "Ok",
                confirmButtonColor: "#ADC867"
            });
        }
    </script>









</asp:Content>
