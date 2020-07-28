﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_ReportarPagoAgregar.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_ReportarPagoAgregar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>

    
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

	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="../images/icons/favicon.ico"/>
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

   


	<div class="container-contact100">
		<div class="wrap-contact100">
			<div class="contact100-form validate-form" style="margin-top:5%; margin-bottom:5%">
				<span class="contact100-form-title">
					Pago del Cliente de Smart Rentals
				</span>

                 <!-- Email Cliente -->
				<label class="label-input100" for="first-name">Correo del Cliente</label>
				<div class="wrap-input100 rs1-wrap-input100 validate-input" data-validate="Correo del Cliente" >
                    <asp:DropDownList ID="DropDownListEmail" placeholder="Correo del Cliente" DataTextField="Cliente" CssClass="form-control" runat="server" AutoPostBack="True"></asp:DropDownList>
					<span class="focus-input100"></span>
				</div>

                 <!-- Cliente -->
				<label class="label-input100" for="first-name">Informacion del Cliente a Pagar</label>
				<div class="wrap-input100 rs1-wrap-input100 validate-input" data-validate="Type first name">
                    <asp:DropDownList ID="DropDownListCliente" placeholder="Informacion del Cliente a Pagar" DataTextField="Cliente" CssClass="form-control" runat="server" AutoPostBack="True"></asp:DropDownList>
					<span class="focus-input100"></span>
				</div>
                 <!-- Contrato -->
                <label class="label-input100" for="first-name">Contrato Relacionado</label>
				<div class="wrap-input100 rs2-wrap-input100 validate-input" data-validate="Type last name">
					<asp:DropDownList ID="DropDownListContrato"  DataTextField="Contratto" CssClass="form-control" runat="server" AutoPostBack="True"></asp:DropDownList>
					<span class="focus-input100"></span>
				</div>
                 <!-- Monto mensual -->
				<label class="label-input100" for="email">Fecha de Pago realizado</label>
				<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
					 <asp:TextBox ID="txtFechaPago" type="date" CssClass="form-control" placeholder="Monto" runat="server" MaxLength="50"></asp:TextBox>
					<span class="focus-input100"></span>
				</div>

                
                  <!-- Detalles Del Pago -->
					<label class="label-input100" for="email">Detalles de Pago realizado</label>
				<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
					 <textarea ID="txtDetallesDePago"  CssClass="form-control" placeholder="Monto" runat="server" MaxLength="50"></textarea>
					<span class="focus-input100"></span>
				</div>

                  <!-- Submit Button -->
				<div class="container-contact100-form-btn">
                     <asp:Button ID="btnAgregarPago" runat="server" CssClass="contact100-form-btn" Text="Agregar Pago" Font-Size="Medium" Height="49px" Width="111px" OnClick="btnAgregarPago_Click" />
                     &nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:Button ID="btnAtras" CssClass="contact100-form-btn" runat="server" CausesValidation="false" Text="Atras" Font-Size="Medium" Height="49px" Width="111px" PostBackUrl="~/Formularios/frm_ListaReportarPago.aspx" />
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
						<span class="txt1 p-b-20">
							Dirrecion de Contacto 
						</span>

						<span class="txt2">
						Heredia, Costa Rica
						</span>
					</div>
				</div>

				<div class="dis-flex size1 p-b-47">
					<div class="txt1 p-r-25">
						<span class="lnr lnr-phone-handset"></span>
					</div>

					<div class="flex-col size2">
						<span class="txt1 p-b-20">
							Numero de contacto
						</span>

						<span class="txt3">
							    +506 84813804
						</span>
					</div>
				</div>

				<div class="dis-flex size1 p-b-47">
					<div class="txt1 p-r-25">
						<span class="lnr lnr-envelope"></span>
					</div>

					<div class="flex-col size2">
						<span class="txt1 p-b-20">
							Soporte General
						</span>

						<span class="txt3">
							info.smartrentals@gmail.com
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

<!--===============================================================================================-->
	<script src="../vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="../vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="../vendor/bootstrap/js/popper.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="Fvendor/select2/select2.min.js"></script>
	<script>
		$(".selection-2").select2({
			minimumResultsForSearch: 20,
			dropdownParent: $('#dropDownSelect1')
		});
	</script>
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
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());

	  gtag('config', 'UA-23581568-13');
	</script>


    

</asp:Content>