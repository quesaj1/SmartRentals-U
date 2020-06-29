<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_InicioProveedores.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_InicioProveedores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>

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

    <div style="margin-top: 10%; margin-bottom:5%;margin-left: 5%; margin-right: 5%" >

        <h1 style="text-align: center";  >Proveedores</h1><br/><br/><br/>

        <div>


         <main class="main">
            <div >
                <section class="info">
                    <article class="info_columna">
                        <img src="../Imagenes/img_Clientes.jpg" alt="" class="info_img" style="border-radius:7px" width="500" height="330">
                        <h2 class="info_titulo">CLIENTES</h2>
                        <p class="info_txt">Este módulo permite realizar todo el mantenimiento de clientes del sistema de Smart Rentals.</p>
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="boton_personalizado" OnClientClick="../frm_ClienteLista">Ingresar</asp:LinkButton>
                    </article>
                    <article class="info_columna">
                        <img src="../Imagenes/img_Proveedores.png" alt="" class="info_img" style="border-radius:7px" width="500" height="330">
                        <h2 class="info_titulo">PROVEEDORES</h2>
                        <p class="info_txt">Este módulo permite realizar todo el mantenimiento de proveedores del sistema de Smart Rentals</p>
                        <asp:LinkButton ID="LinkButtonProve" runat="server" CssClass="boton_personalizado" OnClientClick="">Ingresar</asp:LinkButton>
                    </article>
                    <article class="info_columna">
                        <img src="../Imagenes/img_Alquileres.png" alt="" class="info_img" style="border-radius:7px" width="500" height="330">
                        <h2 class="info_titulo">ALQUILERES</h2>
                        <p class="info_txt">Este módulo permite realizar todo el mantenimiento de los Alquileres del sistema de Smart Rentals.</p>
                        <asp:LinkButton ID="LinkButtonAlq" runat="server" CssClass="boton_personalizado" OnClientClick="../frm_AlquileresLista">Ingresar</asp:LinkButton>
                    </article>
                </section><br /><br /><br />

                    <section class="info">
                    <article class="info_columna">
                        <img src="../Imagenes/img_Contratos.png" alt="" class="info_img" style="border-radius:7px" width="500" height="330">
                        <h2 class="info_titulo">CONTRATOS</h2>
                        <p class="info_txt">Este módulo permite realizar todo el mantenimiento de clientes del sistema de Smart Rentals.</p>
                        <asp:LinkButton ID="LinkButtonCont" runat="server" CssClass="boton_personalizado" OnClientClick="">Ingresar</asp:LinkButton>
                    </article>
                    <article class="info_columna">
                        <img src= "../Imagenes/img_Tiquetes.png" alt="" class="info_img" style="border-radius:7px" width="500" height="330">
                        <h2 class="info_titulo">TIQUETES</h2>
                        <p class="info_txt">Este módulo permite realizar todo el mantenimiento de tiquetes del sistema de Smart Rentals</p>
                        <asp:LinkButton ID="LinkButtontTiq" runat="server" CssClass="boton_personalizado" OnClientClick="">Ingresar</asp:LinkButton>
                    </article>
                    <article class="info_columna">
                        <img src="../Imagenes/img_Reportes.png"  alt="" class="info_img" style="border-radius:7px" width="500" height="330">
                        <h2 class="info_titulo">REPORTES</h2>
                        <p class="info_txt">Este módulo permite realizar todo el manejo de la reportería y metricas del sistema de Smart Rentals.</p>
                        <asp:LinkButton ID="LinkButtonRep" runat="server" CssClass="boton_personalizado" OnClientClick="">Ingresar</asp:LinkButton>
                    </article>
                </section><br /><br /><br />

                 <section class="info">
                    <article class="info_columna">
                        <img src="../Imagenes/img_AdminRental.png" alt="" class="info_img" style="border-radius:7px" width="500" height="330">
                        <h2 class="info_titulo">ADMIN RENTALS</h2>
                        <p class="info_txt">Este módulo permite realizar todo el mantenimiento de Administradores del sistema de Smart Rentals.</p>
                        <asp:LinkButton ID="LinkButtonAdmin" runat="server" CssClass="boton_personalizado" OnClientClick="../frm_AdminRentalsLista">Ingresar</asp:LinkButton>
                    </article>
                    <article class="info_columna">
                        <img src= "../Imagenes/img_Dudas.png" alt="" class="info_img" style="border-radius:7px" width="500" height="330">
                        <h2 class="info_titulo">DUDAS DE SERVICIO</h2>
                        <p class="info_txt">Este módulo permite llevar el seguimiento y control de las dudas de servicio al cliente del sistema de Smart Rentals</p>
                        <asp:LinkButton ID="LinkButtonDuda" runat="server" CssClass="boton_personalizado" OnClientClick="">Ingresar</asp:LinkButton>
                    </article>
                    <article class="info_columna">
                        <img src= "../Imagenes/img_Desocupar.png" alt="" class="info_img" style="border-radius:7px" width="500" height="330">
                        <h2 class="info_titulo">SOLICITUD DE DESOCUPAR</h2>
                        <p class="info_txt">Este módulo permite llevar el seguimiento y control de las solicitudes de desocupar del sistema de Smart Rentals</p>
                        <asp:LinkButton ID="LinkButtonDesoc" runat="server" CssClass="boton_personalizado" OnClientClick="">Ingresar</asp:LinkButton>
                    </article>
                </section><br /><br /><br />

               </div>

     </main>

    </div>
 </div>









</asp:Content>
