<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_ReporteReportarPagos.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_ReporteReportarPagos" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style type="text/css">
        .boton_personalizado {
            font-weight: 500;
            font-size: 18px;
            color: #ffffff;
            background-color: #adc867;
            border-width: thin;
            border-radius: 8px;
        }

            .boton_personalizado:hover {
                color: #ffffff;
                background-color: #55407d;
                border-radius: 8px;
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

        .select2-selection {
            overflow: hidden;
        }

        .select2-selection__rendered {
            white-space: normal;
            word-break: break-all;
        }

        /*Finaliza el estilo del select2 dropdownlist */

            
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
    </style>

   

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


    <div id="divForm" style="margin-top: 12%; margin-left: 15%; margin-right: 15%">
     


    <br>
        <div class="form-row" style="margin-top: 5%; margin-bottom: 5%">
             <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                 <div class="animated-title">
                             <div class="text-top">
                               <div>
                                   <span style="font-weight:600">Smart</span>
                                  <span style="font-weight:600">Rentals</span>
                               </div>
                             </div>
                           <div class="text-bottom">
                        <div style="font-weight:600">Reporte de Pagos</div>
                        </div>
                   </div>

         
            <br>
            <br>
            <br>
            <br>
           <div class="form-row" style="margin-top: 5%; margin-bottom: 5%">
            <!-- Numero de Contrato -->
            <div class="form-group col-md-6">
                <label for="txtProvincia">Bucar por Contratos</label>
                <br />
                <asp:DropDownList ID="DropDownContratos" ForeColor="Black" class="custom-select" CssClass="form-control" runat="server" AutoPostBack="True"></asp:DropDownList>
                <br />
            </div>

            <!-- Cliente -->
            <div class="form-group col-md-6">
                <label for="txtCanton">Buscar por cliente</label>
                <br />
                <asp:DropDownList ID="DropDownCliente" ForeColor="Black" class="custom-select" CssClass="form-control" runat="server" AutoPostBack="True"></asp:DropDownList>
                <br>
            </div>

        </div>

         </div>
          <div class="form-group" style="text-align: center">
                <asp:Button ID="btnAgregar" runat="server" CssClass="boton_personalizado" Font-Size="Small" Height="49px" Width="115px" Text="Generar Reporte" OnClick="Button2_Click1" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:Button ID="Button2" runat="server" CssClass="boton_personalizado" Font-Size="Small" Height="49px" Width="115px" Text="Generar Grafico" OnClick="Button1_Click" />
                <br />
                <br />
                <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
            </div>
     </div>

      <br>
            <br>
            <br>
            <br>
        <div style="text-align: center" id="VisibleReportContent">

            <rsweb:ReportViewer ID="prvReportarPagos" runat="server" Width="100%" RightToLeft="YES"></rsweb:ReportViewer>
        </div>

        <%--   Agregar este script para el select 2--%>
        <%--   Cambiar lo que dice dorpdownlistcliente por el nombre del correcto--%>

        <script>
            $(function () {
                $("#<%=DropDownContratos.ClientID%>").select2({
                    selectOnClose: true,
                    theme: 'bootstrap',
                    height: '100%',
                    width: '100%'
                }
                );
            })
            $(function () {
                $("#<%=DropDownCliente.ClientID%>").select2({
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
                    text: "El pago ha sido guardado satisfactoriamente",
                    type: "success",
                    confirmButtonText: "Ok",
                    confirmButtonColor: "#55407D"
                });
            }
        </script>
</asp:Content>
