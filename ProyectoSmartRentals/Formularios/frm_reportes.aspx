﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_reportes.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_reportes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
        <script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>
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
              opacity: 0.95;
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
                  background-image: -webkit-linear-gradient(top, transparent 0%, 100% );
                  background-image: linear-gradient(to bottom, transparent 0%, 100%);
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
              color: black;
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


          .boton_personalizado {
              font-weight: 500;
              font-size: 15px;
              color: #ffffff;
              padding: 8px 17px;
              border-width: thin;
              background-color: #adc867;
              border-radius: 10px;
          }

              .boton_personalizado:hover {
                  color: #ffffff;
                  background-color: #55407d;
                  border-radius: 10px;
              }
      }
  </style>


    <div style="margin-top: 10%; margin-bottom:5%;margin-left: 5%; margin-right: 5%" >

        <h1 style="text-align: center" class="ml12";  >Smart Rentals</h1><br/><br/><br/><br/>

        <div>


          <main class="main">
            <div >
                <section class="info">
                    <div id="art1" runat="server" visible="false" >
                    <article class="info_columna">

                        <figure class="snip1361" style="box-shadow: 10px 10px 5px  rgba(0,0,0,0.6)" >
 
                        <img src="../Imagenes/img_reporte_mantenimiento.png" alt="" class="info_img"   width="500" height="330"/>
                        <figcaption>
                        <h3>Mantenimientos</h3><br>
                        <p>Este reporte permitira ver los tiquetes que han sido abiertos</p>
                        </figcaption>
                        <a href="frm_ReporteMantenimiento.aspx"></a>
                        </figure>

                    </article>
                        </div>

                    <div id="art2" runat="server" visible="false">
                    <article  class="info_columna">


                        <figure class="snip1361" style="box-shadow: 10px 10px 5px  rgba(0,0,0,0.6)" >
 
                         <img src="../Imagenes/img_reporte_gastos.jpg" alt="" class="info_img"  width="500" height="330"/>
                        <figcaption>
                        <h3>Gastos</h3><br>
                        <p>Este reporte permite ver los gastos de los clientes en los que se han incurrido</p>
                        </figcaption>
                        <a href="frm_ReporteGastos.aspx"></a>
                        </figure>


                    </article>
                    </div>

                     
                   



                </section><br /><br /><br />

                <section class="info">
                     <div id="art3" runat="server" visible="false">
                    <article  class="info_columna">

                          <figure class="snip1361" style="box-shadow: 10px 10px 5px  rgba(0,0,0,0.6)"  ;>
 
                         <img src="../Imagenes/img_reporte_gastosvsperdidas.jpg" alt="" class="info_img" width="500" height="330"/>
                        <figcaption>
                        <h3>Ganancias vs Perdidas</h3><br>
                        <p>Este reporte permite ver los gastos contra las ganancias</p>
                        </figcaption>
                        <a href="frm_ReporteGananciasPerdidas.aspx"></a>
                        </figure>

                    </article>
                    </div>

                      
                     <div id="art4" runat="server" visible="false">
                    <article  class="info_columna">

                          <figure class="snip1361" style="box-shadow: 10px 10px 5px  rgba(0,0,0,0.6)"  ;>
 
                         <img src="../Imagenes/img_ReportePagos.jpg" alt="" class="info_img" width="500" height="330"/>
                        <figcaption>
                        <h3>Pagos</h3><br>
                        <p>Este reporte permite ver los pagos de los clientes realizados</p>
                        </figcaption>
                        <a href="frm_ReporteReportarPagos.aspx"></a>
                        </figure>

                    </article>
                    </div>
                    

                    </section>

               </div>

     </main>



    </div>
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


    <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
  

</asp:Content>
