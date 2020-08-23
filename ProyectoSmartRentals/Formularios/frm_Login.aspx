<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_Login.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_Login" %>

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
            /*background-color: #FFBABA;*/
            background-image: url('https://i.imgur.com/GnyDvKN.png');
            font-family: 'Montserrat', sans-serif;
            animation: 1s linear 0s 1 slideInFromTop;
            border: 1px solid;
            box-shadow: 4px 4px 8px 0px rgba(0,0,0,0.31);
            margin: 10px 0px;
            padding: 15px 10px 15px 20px;
            border-style: none;
            border-radius: 20px;
            background-repeat: no-repeat;
            background-position: 1% 3%;
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
    <asp:HiddenField ID="hddError" runat="server" />

    <div class="error" style="margin-top: 10%; margin-right: 38%; margin-left: 38%" runat="server" id="banner_error" visible="false">
        <h3 style="color: white"><strong>¡ALERTA!</strong>&nbsp; La sesión ha expirado</h3>
        <br />
        <h4 style="color: white">Favor ingrese nuevamente</h4>
        <br />
        <%--<a class="btn btn-sm"  href="../Formularios/frm_InicioMenu.aspx"><i class="fa fa-sign-out" style="font-size:34px; color:red" aria-hidden="true"></i></a>--%>
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
             
            </div>
        </div>

        <div class="right-section"></div>
    </div>

    <asp:Label ID="lblResultado" runat="server" Font-Bold="True" ForeColor="#009900" CssClass="alert-success" Font-Size="Large"></asp:Label>

    <br>
    <br>
    <br>
</asp:Content>
