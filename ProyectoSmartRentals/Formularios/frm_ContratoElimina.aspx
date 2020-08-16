<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_ContratoElimina.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_ContratoElimina" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script type="text/javascript">
        function ShowPopup(title, body) {
            $("#MyPopup .modal-title").html(title);
            $("#MyPopup .modal-body").html(body);
            $("#MyPopup").modal("show");
        }
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
       <style type="text/css">
  .boton_personalizado{
    font-weight: 600;
    font-size: 20px;
    color: #ffffff;
    background-color: #adc867;
    border-radius:5px;
  }
  .boton_personalizado:hover{
    color: #ffffff;
    background-color: #55407d;
    border-radius:5px;
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
                    <asp:Button runat="server" class="btn btn-primary" Text="Confirmar" OnClick="btnEliminar_Click" />
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal Popup -->
           <div id="divForm" style="margin-top:12%; margin-left:15%; margin-right:15%">
         <h1 style="text-align: center">Modificar Contrato</h1>
                  <asp:HiddenField ID="hdldContrato" runat="server" />
        <div class="form-row" style="margin-top:5%; margin-bottom:5%">
            <div class="form-group col-md-6">
                <!-- Numero de contrato -->
                <label for="txtContratoNumero">Número de contrato</label>
                <asp:TextBox ID="txtContratoNumero" type="text" ReadOnly="True" CssClass="form-control" ForeColor="Black" placeholder="Número de contrato" runat="server" MaxLength="25"></asp:TextBox>
            </div>
               <div class="form-group col-md-6">
                <!-- Cliente -->
                <label for="txtCliente">Cliente</label>
                  <asp:DropDownList ID="DropDownListCliente" ReadOnly="True" placeholder="Cliente" ForeColor="Black" DataTextField="Cliente" CssClass="form-control" runat="server" AutoPostBack="True"></asp:DropDownList>
            </div>
              <div class="form-group col-md-6">
                <!-- Fecha de inicio -->
                <label for="txtFechaInicio">Fecha de Inicio</label>
                <asp:TextBox ID="txtFechaInicio" type="text" ReadOnly="True" CssClass="form-control" ForeColor="Black" placeholder="Fecha de Inicio" runat="server" MaxLength="50"></asp:TextBox>             
            </div>
              <div class="form-group col-md-6">
                <!-- Fecha de finalización -->
                <label for="txtFechaFinaliacion">Fecha de finalización</label>
                <asp:TextBox ID="txtFechaFinaliacion" type="text" ReadOnly="True" CssClass="form-control" ForeColor="Black" placeholder="Fecha de finalización" runat="server" MaxLength="50"></asp:TextBox>
            </div>
                 <div class="form-group col-md-6">
                <!-- Propiedad -->
                <label for="txtPropiedad">Propiedad</label>
                  <asp:DropDownList ID="DropDownPropiedad"  DataTextField="Propiedad" ReadOnly="True" ForeColor="Black" CssClass="form-control" runat="server" AutoPostBack="True"></asp:DropDownList>
            </div>
              <div class="form-group col-md-6">
                <!-- Monto mensual -->
                <label for="txtMonto">Monto</label>
                <asp:TextBox ID="txtMonto" type="text" CssClass="form-control" ReadOnly="True" ForeColor="Black" placeholder="Monto" runat="server" MaxLength="50"></asp:TextBox>
            </div>
                   <div class="form-group col-md-6">
                
                <label for="txtFechaPago">Fecha de Pago <span style="color:red;">*</span></label> <br />
                <asp:TextBox ID="txtFechaPago"  CssClass="form-control" ReadOnly="True" ForeColor="Black" runat="server" MaxLength="50"></asp:TextBox>
            </div>
              <div class="form-group col-md-6">
                <!-- URL Contrato -->
                <label for="txtContrato">Contrato</label><br />
                  <asp:Image ID="imgFile" runat="server" CssClass="rounded" Width="20px" Height="20px" ImageUrl="../images/document.png" />
                  <asp:HyperLink ID="HyperLink1" runat="server">Contrato</asp:HyperLink>
            </div>  
             

            
    </div>
        
        <div class="form-group" style="text-align:center">
            <!-- Submit Button -->
            <asp:Button ID="btnAgregar" runat="server" CssClass="boton_personalizado"  Text="Eliminar" Font-Size="Medium" Height="49px" Width="111px" OnClick="ShowPopup" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnAtras" runat="server" CssClass="boton_personalizado"  Text="Cancelar"  Font-Size="Medium" Height="49px" Width="111px" PostBackUrl="~/Formularios/frm_ContratoLista.aspx" />
            <br />
            <br />
            <asp:Label ID="lblResultado" runat="server" Font-Bold="True" ForeColor="#009900"></asp:Label>
        </div>
        </div>
        <script>
            function alertmeError() {
                swal({
                    title: "Error al eliminar",
                    text: "Ha ocurrido un error al eliminar el contrato. Si el problema persiste contacte al administrador del sistema",
                    type: "error",
                    confirmButtonText: "Ok",
                    confirmButtonColor: "#ADC867"
                });
            }

            function alertmeSuccess() {
                swal({
                    title: "Contrato eliminado",
                    text: "El contrato ha sido eliminado satisfactoriamente",
                    type: "success",
                    confirmButtonText: "Ok",
                    confirmButtonColor: "#ADC867"
                });
            }
        </script>
</asp:Content>
