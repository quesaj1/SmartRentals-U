<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_MisContratos.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_MisContratos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .boton_personalizado {
            font-weight: 600;
            font-size: 20px;
            color: #ffffff;
            background-color: #adc867;
            border-radius: 5px;
            align-content: center;
        }

            .boton_personalizado:hover {
                color: #ffffff;
                background-color: #55407d;
                border-radius: 5px;
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

        #img {
            /* height: 400px;
    width:167px;*/
        }

        #imgImagen {
            max-height: 500px;
            max-width: 500px;
            height: auto;
            width: auto;
        }

        /*Finaliza el estilo del select2 dropdownlist */
    </style>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js" defer></script>
    <link href="../Content/select2-bootstrap.css" rel="stylesheet" />
    <link href="../Content/css/select2.min.css" rel="stylesheet" />
    <script src="../Scripts/select2.min.js"></script>
    <link href="../Content/select2-bootstrap.css" rel="stylesheet" />


    <%--Finaliza las librerias--%>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>

    <div id="divForm" style="margin-top: 8%; margin-left: 15%; margin-right: 15%">
        <h1 style="text-align: center">Mis Contratos</h1>
        <br />
        <div class="container-fluid">
            <div class="row">
                <div id="img" class="col-md-4">
                    <div class="col text-center">
                        <asp:Image ID="imgImagen" runat="server" CssClass="rounded" ImageUrl="~/Propiedades/IMG_5568.JPG" AlternateText="kyocode" />
                        <br />
                        <br />

                        <h4>Contratos:</h4>
                        <asp:DropDownList ID="DropDownContratos" ForeColor="Black" DataTextField="Cliente" CssClass="form-control" Width="600" runat="server" Enabled="true" AutoPostBack="True" OnSelectedIndexChanged="DropDownContratos_SelectedIndexChanged"></asp:DropDownList>
                        <br />
                        <asp:Image ID="imgFile" runat="server" CssClass="rounded" Width="20px" Height="20px" ImageUrl="../images/document.png" />
                        <asp:HyperLink ID="hypContrato" runat="server">Contrato</asp:HyperLink>
                    </div>
                </div>
                <br />
                <br />
                <div class="col-md-4" style="margin-top: 21px;">
                    <div class="page-header">

                        <div class="col text-center">
                            <h3>¿Necesitas modificar el contrato?
                                <br />
                                <small>¡Acá lo puedes solicitar!</small>
                            </h3>
                            <br />
                            <asp:Button ID="btnModificar" CssClass="boton_personalizado" runat="server" CausesValidation="false" Text="Solicitar" CommandArgument='<%#Eval("ctr_numeroContrato")%>' Font-Size="Medium" Height="49px" Width="111px" PostBackUrl="~/Formularios/frm_EnvioModContrato.aspx" />
                        </div>




                    </div>
                </div>
                <br />
                <br />
                <div class="col-md-4" style="margin-top: 1px;">
                    <div class="page-header">
                        <div class="col text-center">
                            <br />
                            <h3>¿Necesitas desalojar? <small>Acá puedes hacer la solicitud para desalojar el inmueble.</small>

                            </h3>
                            <br />
                            <asp:Button ID="btnDesalojar" CssClass="boton_personalizado" runat="server" CausesValidation="false" Text="Solicitar" Font-Size="Medium" Height="49px" Width="111px" PostBackUrl="~/Formularios/frm_SolicitudDesocuparCliente.aspx"/>
                        </div>
                    </div>
                </div>
                <br />
                <br />
            </div>
        </div>
        <br />
        <br />
        <div class="form-row" style="margin-bottom: 50px;">



            <div class="form-group col-md-6">
                <!-- Cliente -->
                <label for="txtCliente">Administrador</label>
                <br />
                <asp:TextBox ID="txtAdmin" type="text" CssClass="form-control" ForeColor="Black" runat="server" MaxLength="50" ReadOnly="true"></asp:TextBox>

            </div>

            <div class="form-group col-md-6">
                <!-- Cliente -->
                <label for="txtCliente">Fecha de Inicio</label>
                <br />
                <asp:TextBox ID="txtFechaInicio" type="text" CssClass="form-control" ForeColor="Black" runat="server" MaxLength="50" ReadOnly="true"></asp:TextBox>

            </div>
            <div class="form-group col-md-6">
                <!-- Cliente -->
                <label for="txtCliente">Fecha de finalización</label>
                <br />
                <asp:TextBox ID="TextBox1" type="text" CssClass="form-control" ForeColor="Black" runat="server" MaxLength="50" ReadOnly="true"></asp:TextBox>

            </div>
            <div class="form-group col-md-6">
                <!-- Cliente -->
                <label for="txtCliente">Monto de pago</label>
                <br />
                <asp:TextBox ID="TxtPago" type="text" CssClass="form-control" ForeColor="Black" runat="server" MaxLength="50" ReadOnly="true"></asp:TextBox>

            </div>
            <div class="form-group col-md-6">
                <!-- Cliente -->
                <label for="txtCliente">Día de pago</label>
                <br />
                <asp:TextBox ID="txtFechaPago" type="text" CssClass="form-control" ForeColor="Black" runat="server" MaxLength="50" ReadOnly="true"></asp:TextBox>

            </div>

            <%--  Acá hay que ver si vamos a poner algo para que diga que está al día o no--%>
            <%-- <div class="form-group col-md-6">
                <!-- Cliente -->
                <label for="txtCliente">Estado</label> <br />
                  <asp:TextBox ID="txtEstado" type="text" CssClass="form-control" ForeColor="Black" runat="server" MaxLength="50" readOnly="true"></asp:TextBox>
                    
            </div>--%>

            <div class="form-group col-md-6">
                <!-- Cliente -->
                <label for="txtCliente">Ubicación</label>
                <br />
                <asp:TextBox ID="txtUbicacion" type="text" CssClass="form-control" ForeColor="Black" runat="server" MaxLength="50" ReadOnly="true"></asp:TextBox>

            </div>



        </div>







    </div>


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
    </script>

    <script>
        function alertmeError() {
            swal({
                title: "Error al crear el ticket",
                text: "Ha ocurrido un error al crear el tiquete. Si el problema persiste contacte al administrador del sistema",
                type: "error",
                confirmButtonText: "Ok",
                confirmButtonColor: "#ADC867"
            });
        }

        function alertmeSuccess() {
            swal({
                title: "Se creo el tiquete",
                text: "El tiquete ha sido guardado satisfactoriamente",
                type: "success",
                confirmButtonText: "Ok",
                confirmButtonColor: "#55407D"
            });
        }
    </script>
</asp:Content>
