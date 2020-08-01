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

</style>

 
        <div class="container">
            <div class="left-section">
                <div class="header1">
                <h1 class="animation a1">¡Bienvenido!</h1><br/>
                <h4 class="animation a2">Inicie sesion para ingresar al perfil</h4><br/>
                </div>

                <div class="form1">
                <label for="txtUsuario" >Usuario</label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsuario" runat="server" ControlToValidate="txtUsuario" ErrorMessage="*Debe ingresar su usuario*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" CssClass="alert-light"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtUsuario" type="text" class="form1-field animation a3" runat="server"  placeholder="Ingrese su usuario"></asp:TextBox>
                <br/>           
                <label for="txtContrasena"  >Contraseña</label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorContrasena" runat="server" ControlToValidate="txtContrasena" ErrorMessage="*Debe ingresar su contraseña*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtContrasena" type="password" class="form1-field animation a4" runat="server" placeholder="Ingrese su contraseña"></asp:TextBox>
                
                <br/><br />
                
                <asp:Button ID="btnLogin" runat="server" Style="border:0; color: #fff;  margin-top:10px;  border-radius:5px;background:linear-gradient(to right, #0ba360, #3cba92, #30dd8a, #2bb673); box-shadow: 0 4px 15px 0 rgba(23, 168, 108, 0.75); letter-spacing:1px; padding:12px 10px"   Cssclass="animation a6"   Text="Iniciar Sesión"  OnClick="btnAgregar_Click"  Font-Bold="True"  Font-Size="Medium" />
                &nbsp;&nbsp;&nbsp;&nbsp;
           </div>
          </div>
          <div class="right-section"></div>
        </div>
     
            <asp:Label ID="lblResultado" runat="server"  Font-Bold="True" ForeColor="#009900" CssClass="alert-success" Font-Size="Large"></asp:Label>
        
        <br>
        <br>
        <br>



</asp:Content>
