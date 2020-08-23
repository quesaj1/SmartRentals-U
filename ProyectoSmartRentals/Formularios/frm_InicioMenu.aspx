<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_InicioMenu.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_InicioMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <style>
@import url('https://fonts.googleapis.com/css?family=Oswald');
@import url('https://fonts.googleapis.com/css?family=Quattrocento');

df-messenger {
   --df-messenger-bot-message: #55407d;
   --df-messenger-button-titlebar-color: #adc867;
   --df-messenger-chat-background-color: #fafafa;
   --df-messenger-font-color: white;
   --df-messenger-send-icon: #adc867;
   --df-messenger-user-message: #adc867;
   --df-messenger-chat-icon-max-width: 90%;
   --df-messenger-chat-icon-max-height: 90%;
    
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


@keyframes slideInFromLeft {
  0% {
    transform: translateX(-100%);
  }

  50% {
    transform: translateX(-50%);
  }
  100% {
    transform: translateX(0);
  }
}

header{
animation: 1s linear 0s 1 slideInFromLeft;
}

 .error {
       
         background-color: #df4759;
         /*background-color: #FFBABA;*/
         background-image: url('https://i.imgur.com/GnyDvKN.png');
         font-family:'Montserrat', sans-serif;
         animation: 1s linear 0s 1 slideInFromTop;
         border: 1px solid;
         box-shadow: 4px 4px 8px 0px rgba(0,0,0,0.31);
         margin: 10px 0px;
		 padding: 15px 10px 15px 10px;
         border-style:none;
         border-radius:20px;
		 background-repeat: no-repeat;
		 background-position: 1% 3%;
         text-align:center;
     }

/*ESTILOS DE TITULO ANIMADO*/


.ml12 .letter {
  display: inline-block;
  line-height: 1em;
}

/*ESTILOS DE IMAGENES Y HOVER*/

     .snip1361 {
  font-family: 'Quattrocento', Arial, sans-serif;
  position: relative;
  overflow: hidden;
  margin: 10px;
  min-width: 330px;
  max-width: 480px;
  width: 100%;
  color: #141414;
  text-align: left;
  line-height: 1.4em;
  font-size: 16px;
}
.snip1361 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
}
.snip1361 img {
  max-width: 100%;
  vertical-align: top;
 
 
}
.snip1361 figcaption {
  position: absolute;
  top: calc(77%);
  width: 100%;
  background-color: #ffffff;
  opacity:0.95;
  padding: 15px 25px 65px;

}
.snip1361 figcaption:before {
  position: absolute;
  content: '';
  z-index: 2;
  bottom: 100%;
  left: 0;
  width: 100%;
  height: 80px;
  background-image: -webkit-linear-gradient(top, transparent 0%,  100% );
  background-image: linear-gradient(to bottom, transparent 0%,  100%);
}
.snip1361 h3,
.snip1361 p {
  margin: 0 0 10px;
}
.snip1361 h3 {
  font-weight: 300;
  font-size: 1.6em;
  line-height: 1.2em;
  font-family: 'Oswald', Arial, sans-serif;
  text-transform: uppercase;
}
.snip1361 p {
  font-size: 0.9em;
  letter-spacing: 1px;
  opacity: 1;
  color: black ; 
}
.snip1361 a {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  z-index: 2;
}
.snip1361:hover figcaption,
.snip1361.hover figcaption {
  top: 130px;
}



     @media (min-width: 1024px) {

         .contenedor {
             position: absolute;
             top: 50%;
             left: 50%;
             transform: translateX(-50%) translateY(-50%);
             width: 100%;
             color: #fff;
             text-align: center;
         }

         .info {
             display: flex;
             justify-content: space-between;
             margin-top: -75px;
         }

         .nav {
             position: static;
             width: auto;
         }

         .info_columna {
             padding: 30px;
         }



         .info_titulo {
             font-size: 30px;
             text-align: center;
         }

         img {
             display: block;
             max-width: 100%;
         }


  .boton_personalizado{
     font-weight: 500;
     font-size: 15px;
     color: #ffffff;
     background-color: #2ECC71;
  }
  .boton_personalizado:hover{
    color: #1883ba;
    background-color: #ffffff;
  }
     }


</style>
    <asp:HiddenField ID="hddError" runat="server" />
    <br />
        <div class="error" style="margin-top:10%; margin-right:25%; margin-left:25%" runat="server" id="banner_error" visible="false">
         <h3 style="color:white"><strong>ALERTA!</strong>&nbsp; Parece que no tienes acceso a esa página, por eso te hemos redireccionado al menú principal.</h3><br /> 
              <h4 style="color:white">Si consideras que es un error, favor contactá al administrador del sistema.</h4> <br />
                  <a class="btn btn-sm"  href="../Formularios/frm_InicioMenu.aspx"><i class="fa fa-sign-out" style="font-size:34px; color:white" aria-hidden="true"></i></a>
         </div>
    <div runat="server" id="espacio" style="margin-top:10%;"></div>

    <div style="margin-top: 0%; margin-bottom:5%;margin-left: 5%; margin-right: 5%" >
      
    
        </div>

        <h1 style="text-align: center" class="ml12";  >Smart Rentals</h1><br/><br/><br/><br/>

        <div>
          <main class="main">
            <div >
                <section class="info">
                    <div runat="server" id="menuCliente" visible="false">
                    <article class="info_columna" >

                        <figure class="snip1361" style="box-shadow: 10px 10px 5px  rgba(0,0,0,0.6)" >
 
                        <img src="../Imagenes/img_Clientes.jpg" alt="" class="info_img"   width="500" height="330"/>
                        <figcaption>
                        <h3>CLIENTES</h3><br>
                        <p>Este módulo permite realizar todo el mantenimiento de clientes del sistema de Smart Rentals</p>
                        </figcaption>
                        <a href="frm_ClienteLista.aspx"></a>
                        </figure>

                    </article>
                        </div>

                    <div runat="server" id="menuProveedor"  visible="false">
                    <article class="info_columna">


                        <figure class="snip1361" style="box-shadow: 10px 10px 5px  rgba(0,0,0,0.6)" >
 
                         <img src="../Imagenes/img_Proveedores.png" alt="" class="info_img"  width="500" height="330"/>
                        <figcaption>
                        <h3>PROVEEDORES</h3><br>
                        <p>Este módulo permite realizar todo el mantenimiento de proveedores del sistema de Smart Rentals</p>
                        </figcaption>
                        <a href="frm_proveedorLista.aspx"></a>
                        </figure>


                    </article>
                        </div>

                     
                    <div runat="server" id="menuAlquileres"  visible="false">
                    <article class="info_columna">

                          <figure class="snip1361" style="box-shadow: 10px 10px 5px  rgba(0,0,0,0.2)"  ;>
 
                         <img src="../Imagenes/img_Alquileres.png" alt="" class="info_img" width="500" height="330"/>
                        <figcaption>
                        <h3>ALQUILERES</h3><br>
                        <p>Este módulo permite realizar todo el mantenimiento de los Alquileres del sistema de Smart Rentals</p>
                        </figcaption>
                        <a href="frm_alquilereslista.aspx"></a>
                        </figure>

                    </article>
                        </div>
                         <div runat="server" id="menuAdministradores"  visible="false">
                    <article class="info_columna">
                        <figure class="snip1361" style="box-shadow: 10px 10px 5px  rgba(0,0,0,0.6)" >
 
                         <img src="../Imagenes/img_AdminRental.png" alt="" class="info_img" width="500" height="330"/>
                        <figcaption>
                        <h3>ADMIN RENTALS</h3><br>
                        <p>Este módulo permite realizar todo el mantenimiento de Administradores del sistema de Smart Rentals</p>
                        </figcaption>
                        <a href="frm_AdminRentalsLista.aspx"></a>
                        </figure>

                    </article>
                         </div>


                </section><br /><br /><br />

                    <section class="info">
                        <div runat="server" id="menu_contratos"  visible="false">
                    <article class="info_columna">
                          <figure class="snip1361" style="box-shadow: 10px 10px 5px  rgba(0,0,0,0.6)" >
 
                         <img src="../Imagenes/img_Contratos.png" alt="" class="info_img"  width="500" height="330"/>
                        <figcaption>
                        <h3>CONTRATOS</h3><br>
                        <p>Este módulo permite realizar todo el mantenimiento de contratos del sistema de Smart Rentals</p>
                        </figcaption>
                        <a href="frm_contratolista.aspx"></a>
                        </figure>

                    </article>
                            </div>

                        <div runat="server" id="menuTiquetes"  visible="false">
                    <article class="info_columna">
                         <figure class="snip1361" style="box-shadow: 10px 10px 5px  rgba(0,0,0,0.6)" >
 
                         <img src= "../Imagenes/img_Tiquetes.png" alt="" class="info_img" width="500" height="330"/>
                        <figcaption>
                        <h3>TIQUETES</h3><br>
                        <p>Este módulo permite realizar todo el mantenimiento de tiquetes del sistema de Smart Rentals</p>
                        </figcaption>
                        <a href="frm_tiqueteLista.aspx"></a>
                        </figure>   

                    </article>
                            </div>

                        <div runat="server" id="menuReportes"  visible="false">

                    <article class="info_columna">

                        <figure class="snip1361" style="box-shadow: 10px 10px 5px  rgba(0,0,0,0.6)" >
 
                         <img src="../Imagenes/img_Reportes.png"  alt="" class="info_img" width="500" height="330"/>
                        <figcaption>
                        <h3>REPORTES</h3><br>
                        <p>Este módulo permite realizar todo el manejo de la reportería del sistema de Smart Rentals</p>
                        </figcaption>
                        <a href="frm_reporteMantenimiento"></a>
                        </figure>

                    </article>

                            </div>


                </section><br /><br /><br />

                 <section class="info">

                

                     <div runat="server" id="menuMisContratos"  visible="false">

                    <article class="info_columna">
                        <figure class="snip1361" style="box-shadow: 10px 10px 5px  rgba(0,0,0,0.6)" >
 
                          <img src= "../Imagenes/img_Contratos.png" alt="" class="info_img"  width="500" height="330"/>
                        <figcaption>
                        <h3>Mis contratos</h3><br>
                        <p>Este módulo permite ver los contratos que tienes actualmente.</p>
                        </figcaption>
                        <a href="../frm_MisContratos"></a>
                        </figure>
                    </article>
                        </div>
                     <div runat="server" id="menuDesocupar"  visible="false">
                    <article class="info_columna">

                        <figure class="snip1361" style="box-shadow: 10px 10px 5px  rgba(0,0,0,0.6)" >
 
                           <img src= "../Imagenes/img_Desocupar.png" alt="" class="info_img"  width="500" height="330"/>
                        <figcaption>
                        <h3>SOLICITUD DE DESOCUPAR</h3><br>
                        <p>Este módulo permite llevar el seguimiento y control de las solicitudes de desocupar del sistema de Smart Rentals</p>
                        </figcaption>
                        <a href="../frm_ClienteLista"></a>
                        </figure>
                    </article>
                         </div>

                </section><br /><br /><br />

               </div>

     </main>



    </div>


    <%-- SCRIPTS DE ANIMACION --%>

    <script>
        $(".hover").mouseleave(
            function () {
                $(this).removeClass("hover");
            }
        );
    </script>


    <script type="text/javascript">
        var textWrapper = document.querySelector('.ml12');
        textWrapper.innerHTML = textWrapper.textContent.replace(/\S/g, "<span class='letter'>$&</span>");

        anime.timeline({ loop: true })
            .add({
                targets: '.ml12 .letter',
                translateX: [40, 0],
                translateZ: 0,
                opacity: [0, 1],
                easing: "easeOutExpo",
                duration: 1500,
                delay: (el, i) => 500 + 30 * i
            }).add({
                targets: '.ml12 .letter',
                translateX: [0, -30],
                opacity: [1, 0],
                easing: "easeInExpo",
                duration: 1300,
                delay: (el, i) => 100 + 30 * i
            });


    </script>

    <script>
        function disappear(x) {
            document.getElementById(x).style.display = "none";
        }

        document.getElementById("banner_error").onclick = function () {
            disappear("banner_error")
        };

    </script>

    <%-- CHATBOT SNIPPET DEL BOT DE GUILLERMO--%>
<%--    <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
    
    <df-messenger
        
        chat-icon="../images/smartRound.png"
        intent="WELCOME"
        chat-title="Smart Rentals"
        agent-id="8b4d067c-bb88-43da-a13c-7bef5f3032ab"
        language-code="es">

    </df-messenger>--%>

    <%-- CHATBOT SNIPPET DEL BOT MIGRADO A LA CUENTA DE SMART RENTALS--%>

    <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
  
    <df-messenger

  chat-icon="../images/Chatbot.png"
  intent="WELCOME"
  chat-title="Smart Rentals"
  agent-id="7c0a6021-3969-47b5-8900-f4f08a44ce4c"
  language-code="es">


  </df-messenger>


</asp:Content>