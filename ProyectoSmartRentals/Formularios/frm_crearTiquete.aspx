<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_crearTiquete.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_crearTiquete" %>

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

        /*@keyframes showTopText {
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
}*/

        /*ESTILOS PARA EL DATE PICKER */


        /* Removes the clear button from date inputs */


        /* Removes the spin button */
        /*input[type="date"]::-webkit-inner-spin-button { 
    display: none;
}*/

        /* Always display the drop down caret */
        /*input[type="date"]::-webkit-calendar-picker-indicator {
    color: #2c3e50;
}*/

        /* A few custom styles for date inputs */
        /*input[type="date"] {
  
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
}*/


        /*Agregar esto para el diseño del select2 de los dropdownlists*/
        .select2-selection__rendered {
            line-height: 23px !important;
            font-family: Montserrat, sans-serif;
            font-size: 16px;
            color: black !important;
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


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

    <div id="divForm" style="margin-top: 12%; margin-left: 15%; margin-right: 15%">
        <h1 style="text-align: center">Crear Tiquete</h1>
        <div class="form-row" style="margin-top: 5%; margin-bottom: 5%">


            <div class="form-group col-md-6">
                <!-- Cliente -->
                <label for="txtCliente">Contrato</label>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" InitialValue="0" ErrorMessage="*" ControlToValidate="DropDownTipo" SetFocusOnError="True" Font-Size="Small" ForeColor="white" Display="Dynamic" CssClass="alert-light" ValidationGroup="Save"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" InitialValue="0" ErrorMessage="*Debe de seleccionar un contrato*" ControlToValidate="DropDownContratos" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" CssClass="alert-light" ValidationGroup="Save"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="DropDownContratos" ForeColor="Black" DataTextField="Cliente" CssClass="form-control" runat="server" AutoPostBack="True"></asp:DropDownList>
            </div>
            <div class="form-group col-md-6">
                <!-- Cliente -->
                <label for="txtCliente">Tipo de problema</label>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" InitialValue="0" ErrorMessage="." ControlToValidate="DropDownContratos" SetFocusOnError="True" Font-Size="Small" ForeColor="white" Display="Dynamic" CssClass="alert-light" ValidationGroup="Save"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" InitialValue="0" ErrorMessage="*Debe de seleccionar una categoria*" ControlToValidate="DropDownTipo" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" CssClass="alert-light" ValidationGroup="Save"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="DropDownTipo" ForeColor="Black" DataTextField="Cliente" CssClass="form-control" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="0">[Seleccione un tipo de problema]</asp:ListItem>
                    <asp:ListItem Value="1">Eléctrico</asp:ListItem>
                    <asp:ListItem Value="2">Fontaneria</asp:ListItem>
                    <asp:ListItem Value="3">Cerrajeria</asp:ListItem>
                    <asp:ListItem Value="4">Jardineria</asp:ListItem>
                    <asp:ListItem Value="5">Otros</asp:ListItem>

                </asp:DropDownList>
            </div>

            <div class="form-group col-md-12">
                <!-- Fecha de inicio -->
                <label for="txtTitulo">Título</label>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitulo" ErrorMessage="*Debe ingresar un titulo*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" CssClass="alert-light" ValidationGroup="Save"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtTitulo" type="text" CssClass="form-control" ForeColor="Black" placeholder="Titulo del problema" runat="server" MaxLength="30"></asp:TextBox>
            </div>
            <div class="form-group col-md-12">
                <label for="txaMessage">Descripción</label>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txaMessage" ErrorMessage="*Debe ingresar una descripción*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" CssClass="alert-light" ValidationGroup="Save"></asp:RequiredFieldValidator>
                <textarea class="form-control" name="txaMessage" id="txaMessage" style="color: black;" forecolor="Black" rows="5" runat="server"></textarea>
                <div class="text-right"><span id="caracteres" class="valid-text pt-3"></span></div>
            </div>




        </div>

        <div class="form-group" style="text-align: center">
            <!-- Submit Button -->
            <asp:Button ID="btnAgregar" runat="server" CssClass="boton_personalizado" Text="Crear" Font-Size="Medium" Height="49px" Width="111px" OnClick="btnAgregar_Click" ValidationGroup="Save" />
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
        $("#txaMessage").on('keypress', function () {
            var limit = 500;
            $("#txaMessage").attr('maxlength', limit);
            var init = $(this).val().length;

            if (init < limit) {
                init++;
                $('#caracteres').text("Máximo 30 caracteres: " + init);
            }

        });
    </script>

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
