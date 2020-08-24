<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_ClienteElimina.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_ClienteElimina" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

          <%-- Llamado del script de JS para el Modal show y hide --%>

    <script type="text/javascript">
        function ShowPopup(title, body) {
            $("#MyPopup .modal-title").html(title);
            $("#MyPopup .modal-body").html(body);
            $("#MyPopup").modal("show");
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <style>
     .boton_personalizado{
    font-weight: 500;
    font-size: 18px;
    color: #ffffff;
    background-color: #adc867;
    border-width:thin;
    border-radius:8px;
  }
  .boton_personalizado:hover{
    color: #ffffff;
    background-color: #55407d;
   
    border-radius:8px;
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

  </style> 

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    <!-- Modal Popup -->

    <div id="MyPopup" class="modal fade" data-keyboard="false" data-backdrop="static" role="dialog" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">



            <!-- Modal content-->

            <div class="modal-content">
                <div class="modal-header" style="background-color: #55407d">
                    <h4 class="modal-title" style="color: white"></h4>
                    <button type="button" class="close" aria-label="Cancelar" style="color: white" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                </div>
                <div class="modal-footer">
                    <asp:Button runat="server" class="btn btn-primary" Text="Confirmar" OnClick="btnAgregar_Click" />
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal Popup -->


        <div id="divForm" style="margin-top:12%; margin-left:15%; margin-right:15%">
        <h1 style="text-align: center">Eliminar Cliente</h1>
                <asp:HiddenField ID="hdlCliente" runat="server" />
        <div class="form-row" style="margin-top:5%; margin-bottom:5%">
                 <div class="form-group col-md-6">
                <label for="txtIdCliente">Item del Cliente</label><br>
                <asp:TextBox ID="txtIdCliente"  runat="server"  ReadOnly="true" CssClass="form-control" MaxLength="25"></asp:TextBox>
           </div>
             <div class="form-group col-md-6">
                <!-- txtCedula -->
                <label for="txtCedula">Cedula</label>
                <asp:TextBox ID="txtCedula" type="text"  ReadOnly="true" CssClass="form-control" placeholder="Cédula" runat="server" MaxLength="25"></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!-- txtNombre -->
                <label for="txtNombre">Nombre de Cliente</label>
                <asp:TextBox ID="txtNombre" type="text"  ReadOnly="true" CssClass="form-control" placeholder="Nombre" runat="server" MaxLength="50"></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!-- txtSegundoNombre -->
                <label for="txtSegundoNombre">Segundo Nombre</label>
                <asp:TextBox ID="txtSegundoNombre" type="text"  ReadOnly="true" CssClass="form-control" placeholder="Segundo Nombre" runat="server" MaxLength="50"></asp:TextBox>             
            </div>
              <div class="form-group col-md-6">
                <!-- txtPrimerApellido -->
                <label for="txtPrimerApellido">Primer Apellido</label>
                <asp:TextBox ID="txtPrimerApellido" type="text"  ReadOnly="true" CssClass="form-control" placeholder="Primer Apellido" runat="server" MaxLength="50"></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!-- txtSegundoApellido -->
                <label for="txtSegundoApellido">Segundo Apellido</label>
                <asp:TextBox ID="txtSegundoApellido" type="text"  ReadOnly="true" CssClass="form-control" placeholder="Segundo Apellido" runat="server" MaxLength="50"></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!-- txtFechaNacimiento -->
                <label for="txtFechaNacimiento">Fecha Nacimiento</label>
                 <input type="date" class="form-control"   ReadOnly="true" id="fechanacimiento" runat="server" >
                <%--<asp:TextBox ID="txtFechaNacimiento" type="text" ForeColor="Black" ReadOnly="true" CssClass="form-control" placeholder="Fecha Nacimiento" runat="server" MaxLength="50"></asp:TextBox>--%>
            </div>
              <div class="form-group col-md-6">
                <!-- txtTelefonoCasa -->
                <label for="txtTelefonoCasa">Telefono Casa</label>
                <asp:TextBox ID="txtTelefonoCasa" type="text"  ReadOnly="true" CssClass="form-control" placeholder="Telefono Casa" runat="server" MaxLength="50"></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!-- txtTelefonoCelular -->
                <label for="txtTelefonoCelular">Telefono Celular</label>
                <asp:TextBox ID="txtTelefonoCelular" type="text"  ReadOnly="true" CssClass="form-control" placeholder="Telefono Celular" runat="server" MaxLength="50"></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!-- Correo -->
                <label for="txtEmail">Correo Electronico</label>
                <asp:TextBox ID="txtEmail" type="text"  ReadOnly="true" CssClass="form-control" placeholder="Email" runat="server" MaxLength="50"></asp:TextBox>
            </div>
            </div>
            
  
        
           <div class="form-group" style="text-align: center">
        <!-- Submit Button -->


        <asp:Button ID="btnAgregar" runat="server" CssClass="boton_personalizado" Font-Size="Medium" Height="49px" Width="111px" Text="Eliminar" OnClick="ShowPopup"  />


        &nbsp;&nbsp;&nbsp;

            <asp:Button ID="btnAtras" CssClass="boton_personalizado" runat="server" Text="Atras" OnClick="btnAtras_Click" Font-Size="Medium" Height="49px" Width="111px" PostBackUrl="~/Formularios/frm_ClienteLista.aspx" />

        <br />
        <br />
        <asp:Label ID="lblResultado" runat="server" ForeColor="#009900" CssClass="alert-success" Font-Size="Large"></asp:Label>

        <br />
        <br />
        <br>


        </div>
        </div>
   



   <script>
            function alertmeError() {
                swal({
                    title: "Error al eliminar cliente",
                    text: "Ha ocurrido un error al eliminar el cliente. Si el problema persiste contacte al administrador del sistema",
                    type: "error",
                    confirmButtonText: "Ok",
                    confirmButtonColor: "#ADC867"
                });
            }

            function alertmeSuccess() {
                swal({
                    title: "Cliente eliminado",
                    text: "El cliente ha sido eliminado satisfactoriamente",
                    type: "success",
                    confirmButtonText: "Ok",
                    confirmButtonColor: "#ADC867"
                });
            }
        </script>










</asp:Content>
