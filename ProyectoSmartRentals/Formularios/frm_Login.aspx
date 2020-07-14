<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_Login.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


     <style type="text/css">
        .boton_personalizado {
            font-weight: 600;
            font-size: 20px;
            color: #ffffff;
            background-color: #2ECC71;
        }

            .boton_personalizado:hover {
                color: #1883ba;
                background-color: #ffffff;
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


/*ACA VA EL ESTILO DEL CARRUSEL ANIMADO*/

.tarjetas {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 115px;
  height: 77px;
  margin: 0;
  -webkit-perspective: 800px;
		  perspective: 800px;
  -webkit-transform: translate(-50%, -50%);
	  -ms-transform: translate(-50%, -50%);
		  transform: translate(-50%, -50%);
}

.tarjetas__contenido {
  position: absolute;
  width: 100%;
  height: 100%;
  -webkit-transform-style: preserve-3d;
		  transform-style: preserve-3d;
  -webkit-transform: translateZ(-182px) rotateY(0);
		  transform: translateZ(-182px) rotateY(0);
  -webkit-animation: carrusel 10s infinite cubic-bezier(1, 0.015, 0.295, 1.225) forwards;
		  animation: carrusel 10s infinite cubic-bezier(1, 0.015, 0.295, 1.225) forwards;
}

.tarjetas__elemento {
  position: absolute;
  top: 0;
  left: 0;
  width: 115px;
  height: 77px;
  border-radius: 15px;
}

.tarjetas__elemento:nth-child(1) {
  background: #394fd5;
  -webkit-transform: rotateY(0) translateZ(182px);
		  transform: rotateY(0) translateZ(182px);
}
.tarjetas__elemento:nth-child(2) {
  background: #39d570;
  -webkit-transform: rotateY(120deg) translateZ(182px);
		  transform: rotateY(120deg) translateZ(182px);
}
.tarjetas__elemento:nth-child(3) {
  background: #f0091f;
  -webkit-transform: rotateY(240deg) translateZ(182px);
		  transform: rotateY(240deg) translateZ(182px);
}


@-webkit-keyframes carrusel {
  0%,  17.5% {
    -webkit-transform: translateZ(-182px) rotateY(0);
		    transform: translateZ(-182px) rotateY(0);
  }
  27.5%, 45% {
    -webkit-transform: translateZ(-182px) rotateY(-120deg);
		    transform: translateZ(-182px) rotateY(-120deg);
  }
  55%, 72.5% {
    -webkit-transform: translateZ(-182px) rotateY(-240deg);
		    transform: translateZ(-182px) rotateY(-240deg);
  }
  82.5%, 100% {
    -webkit-transform: translateZ(-182px) rotateY(-360deg);
		    transform: translateZ(-182px) rotateY(-360deg);
  }
}

@keyframes carrusel {
  0%,  17.5% {
    -webkit-transform: translateZ(-182px) rotateY(0);
		    transform: translateZ(-182px) rotateY(0);
  }
  27.5%, 45% {
    -webkit-transform: translateZ(-182px) rotateY(-120deg);
		    transform: translateZ(-182px) rotateY(-120deg);
  }
  55%, 72.5% {
    -webkit-transform: translateZ(-182px) rotateY(-240deg);
		    transform: translateZ(-182px) rotateY(-240deg);
  }
  82.5%, 100% {
    -webkit-transform: translateZ(-182px) rotateY(-360deg);
		    transform: translateZ(-182px) rotateY(-360deg);
  }
}





    </style>

  


   <div id="divForm" style="margin-top: 12%; margin-left: 15%; margin-right: 15%">
        <h1 style="text-align: center">Iniciar Sesión</h1><br><br><br><br>

     <div>

             <figure class="tarjetas">
  <div class="tarjetas__contenido">
    <div class="tarjetas__elemento"   > <img src="/Imagenes/img_smartRentals.png" style="border-radius:inherit" /></div>
    <div class="tarjetas__elemento"   > <img src="/Imagenes/img_smartRentals.png" style="border-radius:inherit"/></div>
    <div class="tarjetas__elemento"   > <img src="/Imagenes/img_smartRentals.png" style="border-radius:inherit"/></div>
  </div>
             </figure>  

     </div><br /><br />

        <div class="form-row" style="text-align:center;  margin-top: 5%; margin-bottom: 5%; margin-left:24%">
            <div class="form-group col-md-8">
                <!-- Nombre -->
                <label for="txtUsuario">Usuario</label>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsuario" runat="server" ControlToValidate="txtUsuario" ErrorMessage="*Debe ingresar su usuario*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" CssClass="alert-light"></asp:RequiredFieldValidator>

                <asp:TextBox ID="txtUsuario" type="text" CssClass="form-control" runat="server" MaxLength="100" placeholder="Ingrese su usuario"></asp:TextBox>
                <br />
            </div>

      

            <div class="form-group col-md-8">
                
                 <!-- Primer Apellido-->
                <label for="txtContrasena">Contraseña</label>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorContrasena" runat="server" ControlToValidate="txtContrasena" ErrorMessage="*Debe ingresar su contraseña*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>

                <asp:TextBox ID="txtContrasena" type="password" CssClass="form-control" runat="server" MaxLength="50" placeholder="Ingrese su contraseña"></asp:TextBox>
                <br />
            </div>
            <br />
        <div class="form-group col-md-8" style="text-align: center">
            <!-- Submit Button -->

            <asp:Button ID="btnLogin" runat="server" CssClass="boton_personalizado" Text="Iniciar Sesión" Font-Size="Medium" Height="49px" Width="111px" OnClick="btnAgregar_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;

            <br />
            <br />
            <asp:Label ID="lblResultado" runat="server" Font-Bold="True" ForeColor="#009900" CssClass="alert-success" Font-Size="Large"></asp:Label>
        </div>
        <br>
        <br>
        <br>
    </div>
       </div>


</asp:Content>
