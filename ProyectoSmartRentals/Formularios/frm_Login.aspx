﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_Login.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--/** ESTILOS DEL LOGIN **/--%>




    <style>
        * {
            box-sizing: border-box;
        }

        .container {
            display: flex;
            height: 100vh;
        }

        .left-section {
            overflow: hidden;
            display: flex;
            flex-wrap: wrap;
            flex-direction: column;
            justify-content: center;
            -webkit-animation-name: left-section;
            animation-name: left-section;
            -webkit-animation-duration: 1s;
            animation-duration: 1s;
            -webkit-animation-fill-mode: both;
            animation-fill-mode: both;
            -webkit-animation-delay: 1s;
            animation-delay: 1s;
        }

        .right-section {
            flex: 1;
            background: linear-gradient(to right, #f50629 0%, #fd9d08 100%);
            transition: 1s;
            background-image: url(../images/SMART.png);
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
        }

        .header1 > h1 {
            margin: 0;
            color: #6c7079;
        }

        .header1 > h4 {
            margin-top: 10px;
            font-weight: normal;
            font-size: 15px;
            color: rgba(0, 0, 0, 0.4);
        }

        .form1 {
            max-width: 80%;
            display: flex;
            flex-direction: column;
        }

            .form1 > p {
                text-align: right;
            }

                .form1 > p > a {
                    color: #000;
                    font-size: 14px;
                }

        .form1-field {
            height: 46px;
            padding: 0 16px;
            border: 2px solid #ddd;
            border-radius: 4px;
            outline: 0;
            transition: .2s;
            margin-top: 20px;
        }

            .form1-field:focus {
                border-color: #0f7ef1;
            }


        .animation {
            -webkit-animation-name: move;
            animation-name: move;
            -webkit-animation-duration: .4s;
            animation-duration: .4s;
            -webkit-animation-fill-mode: both;
            animation-fill-mode: both;
            -webkit-animation-delay: 2s;
            animation-delay: 2s;
        }

        .a1 {
            -webkit-animation-delay: 2s;
            animation-delay: 2s;
        }

        .a2 {
            -webkit-animation-delay: 2.1s;
            animation-delay: 2.1s;
        }

        .a3 {
            -webkit-animation-delay: 2.2s;
            animation-delay: 2.2s;
        }

        .a4 {
            -webkit-animation-delay: 2.3s;
            animation-delay: 2.3s;
        }

        .a5 {
            -webkit-animation-delay: 2.4s;
            animation-delay: 2.4s;
        }

        .a6 {
            -webkit-animation-delay: 2.5s;
            animation-delay: 2.5s;
            background: #535c68;
            box-shadow: inset 0px 0px 0px 0.01px rgba(255,255,255,0.6);
            border-style: none;
            color: white;
            border-radius: 25px;
            padding: 9px 10px;
            text-align: center;
            font-size: 16px;
            cursor: pointer;
            -webkit-transition: box-shadow linear 0.5s,color linear 0.5s;
            -moz-transition: box-shadow linear 0.5s,color linear 0.5s;
            transition: box-shadow linear 0.5s,color linear 0.5s;
            outline: none;
        }


            .a6:hover {
                box-shadow: inset 290px 0px 0px 0.01px #adc867;
                border-style: none;
                border-radius: 25px;
                color: white;
                outline: none;
            }


        @keyframes move {
            0% {
                opacity: 0;
                visibility: hidden;
                -webkit-transform: translateY(-40px);
                transform: translateY(-40px);
            }

            100% {
                opacity: 1;
                visibility: visible;
                -webkit-transform: translateY(0);
                transform: translateY(0);
            }
        }

        @keyframes left-section {
            0% {
                opacity: 0;
                width: 0;
            }

            100% {
                opacity: 1;
                padding: 20px 40px;
                width: 440px;
            }
        }

        .error {
            background-color: #df4759;
            font-family: 'Montserrat', sans-serif;
            animation: 1s linear 0s 1 slideInFromTop;
            border: 1px solid;
            box-shadow: 4px 4px 8px 0px rgba(0,0,0,0.31);
            margin: 10px 0px;
            padding: 15px 10px 15px 10px;
            border-style: none;
            border-radius: 20px;
            text-align: center;
        }

        @keyframes slideInFromTop {
            0% {
                transform: translateY(-100%);
            }

            50% {
                transform: translateY(-50%);
            }

            100% {
                transform: translateY(0);
            }
        }
    </style>


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

    <asp:HiddenField ID="hddError" runat="server" />

    <div class="error" style="margin-top: 10%; margin-right: 30%; margin-left: 30%" runat="server" id="banner_error" visible="false">
        <asp:ImageButton ID="ImageButton" runat="server" OnClick="button_X" ImageUrl="~/images/x_button.png" ImageAlign="Left" />
        <h3 style="color: white"><strong>¡ALERTA!</strong>&nbsp; La sesión ha expirado</h3>
        <br />
        <h4 style="color: white">Favor ingrese nuevamente</h4>
        <br />
      
    </div>

    <div class="container">

        <div class="left-section">
            <div class="header1">
                <h1 class="animation a1">¡Bienvenido!</h1>
                <br />
                <h4 class="animation a2">Inicie sesión para ingresar al perfil</h4>
                <br />
            </div>

            <div class="form1">

                <br />

                <label for="txtUsuario" style="font-weight: 500">Usuario</label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsuario" runat="server" ControlToValidate="txtUsuario" ErrorMessage="*Debe ingresar su usuario*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" CssClass="alert-light"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtUsuario" type="text" class="form1-field animation a3" runat="server" placeholder="Ingrese su usuario"></asp:TextBox>
                <br />
                <label for="txtContrasena" style="font-weight: 500">Contraseña</label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorContrasena" runat="server" ControlToValidate="txtContrasena" ErrorMessage="*Debe ingresar su contraseña*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtContrasena" type="password" class="form1-field animation a4" runat="server" placeholder="Ingrese su contraseña"></asp:TextBox>

                <br />
                <br />

                <asp:Button ID="btnLogin" runat="server" Style="letter-spacing: 1px;" CssClass="animation a6" Text="Iniciar Sesión" OnClick="btnAgregar_Click" Font-Bold="True" Font-Size="Medium" />
                &nbsp;&nbsp;&nbsp;&nbsp;

                 <div style="text-align: center">

            <strong>
                <asp:HyperLink ID="hplAgregar" runat="server" NavigateUrl="frm_RestablecerContrasena.aspx" Font-Size="Small">Restablecer contraseña &nbsp</asp:HyperLink>
            </strong>
        </div>
             
            </div>
        </div>

        <div class="right-section"></div>
    </div>

    <asp:Label ID="lblResultado" runat="server" Font-Bold="True" ForeColor="#009900" CssClass="alert-success" Font-Size="Large"></asp:Label>

    <br>
    <br>
    <br>

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



         function alertmeIncorrecto(){
             swal({
                 title: "Credenciales incorrectas",
                 text: "Usuario o contraseña incorrectas. Intente de nuevo.",
                 type: "error",
                 confirmButtonText: "Ok",
                 confirmButtonColor: "#ADC867"
             });
         }

         function alertmenotexisting() {
             swal({
                 title: "Usuario no existe",
                 text: "El usuario ingresado no existe",
                 type: "error",
                 confirmButtonText: "Ok",
                 confirmButtonColor: "#ADC867"
             });
         }


          function alertmeinactive() {
             swal({
                 title: "Usuario inactivo",
                 text: "El usuario ingresado no se encuentra activo. Contacte al administrador.",
                 type: "error",
                 confirmButtonText: "Ok",
                 confirmButtonColor: "#ADC867"
             });
         }
        
     </script>


</asp:Content>
