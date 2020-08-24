<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_TiqueteAsigna.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_TiqueteAsigna" %>
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
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.min.css" rel="stylesheet" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>



    <div id="divForm" style="margin-top: 12%; margin-left: 15%; margin-right: 15%">
        <h1 id="ticketnum" style="text-align: center">Tiquete: <span runat="server" id="num_t"></span></h1>
        <div class="form-row" style="margin-top: 5%; margin-bottom: 5%">
            <asp:HiddenField ID="hdlTiquete" runat="server" />


            <div class="form-group col-md-6">
                <!-- Correo -->
                <label for="txtPrecio">Contrato</label>
                <asp:TextBox ID="txtContrato" type="text" ForeColor="Black" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group col-md-6">
                <!-- Cliente -->
                <label for="txtCliente">Tipo de problema</label>
                <asp:DropDownList ID="DropDownTipo" placeholder="Cliente" DataTextField="Cliente" ForeColor="Black" CssClass="form-control" runat="server" AutoPostBack="True" Enabled="False">
                    <asp:ListItem Value="0">Seleccione un tipo de problema</asp:ListItem>
                    <asp:ListItem Value="1">Eléctrico</asp:ListItem>
                    <asp:ListItem Value="2">Fontaneria</asp:ListItem>
                    <asp:ListItem Value="3">Cerrajeria</asp:ListItem>

                </asp:DropDownList>
            </div>

            <div class="form-group col-md-12">
                <!-- Fecha de inicio -->
                <label for="txtTitulo">Titulo</label>
                <asp:TextBox ID="txtTitulo" type="text" CssClass="form-control" ForeColor="Black" placeholder="Titulo del problema" runat="server" ReadOnly="true" MaxLength="30"></asp:TextBox>
            </div>
            <div class="form-group col-md-12">
                <!-- Fecha de finalización -->
                <label for="txtDescrip">Detalles</label>
                <textarea id="txtDescrip" runat="server" placeholder="Descripción" forecolor="Black" class="form-control" style="color: black" rows="3" readonly="readonly"></textarea>
            </div>
            <div class="form-group col-md-6">
                <!-- Cliente -->
                <label for="txtCliente">Estado</label>
                <asp:DropDownList ReadOnly="true" ID="DropDownEstado" DataTextField="Cliente" ForeColor="Black" CssClass="form-control" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="0">Pendiente</asp:ListItem>
                    <asp:ListItem Value="1">En progreso</asp:ListItem>
                    <asp:ListItem Value="2">Completado</asp:ListItem>


                </asp:DropDownList>
            </div>
            <div class="form-group col-md-6">
                <!-- Correo -->
                <label for="txtFechaInicio">Fecha apertura</label>
                <asp:TextBox ID="txtFechaInicio" type="text" CssClass="form-control" ForeColor="Black" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group col-md-12">
                <!-- Fecha de finalización -->
                <label for="txtNota">Notas</label>
                <textarea ReadOnly="true" id="txtNota" runat="server" placeholder="" class="form-control" forecolor="Black" rows="3" style="color: black"></textarea>
            </div>

            <div class="form-group col-md-12">
                <!-- Correo -->
                <label for="txtPrecio">Precio</label>
                <asp:TextBox ReadOnly="true" ID="txtPrecio" type="text" CssClass="form-control" ForeColor="Black" runat="server"></asp:TextBox>
            </div>





        </div>

        <div class="form-group" style="text-align: center">
            <!-- Submit Button -->
            <asp:Button ID="btnAgregar" runat="server" CssClass="boton_personalizado" Text="Asignar" Font-Size="Medium" Height="49px" Width="111px" OnClick="btnAgregar_Click" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnAtras" runat="server" CssClass="boton_personalizado" Text="Atrás" Font-Size="Medium" Height="49px" Width="111px" PostBackUrl="~/Formularios/frm_TiqueteLista.aspx" />
            <br />
            <br />
            <asp:Label ID="lblResultado" runat="server" Font-Bold="True" ForeColor="#009900"></asp:Label>
        </div>
    </div>
    <br />
    <br />
    <script>
        function alertmeError() {
            swal({
                title: "Error al asignar el tiquete",
                text: "Ha ocurrido un error al asignar el tiquete. Si el problema persiste contacte al administrador del sistema",
                type: "error",
                confirmButtonText: "Ok",
                confirmButtonColor: "#ADC867"
            });
        }

        function alertmeSuccess() {
            swal({
                title: "Se asignó el tiquete",
                text: "El tiquete ha sido asignado satisfactoriamente",
                type: "success",
                confirmButtonText: "Ok",
                confirmButtonColor: "#55407D"
            });
        }
    </script>

</asp:Content>
