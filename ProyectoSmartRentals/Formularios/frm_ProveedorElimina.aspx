<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_ProveedorElimina.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_ProveedorElimina" %>
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

.select2-selection { overflow: hidden; }
.select2-selection__rendered { white-space: normal; word-break: break-all; }

/*Finaliza el estilo del select2 dropdownlist */
    </style>

          <%--Agregar estas librerias para el select 2--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.min.js"></script>
   <link href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.min.css" rel="stylesheet"/>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js" defer></script>
    <link href="../Content/select2-bootstrap.css" rel="stylesheet" />
    <link href="../Content/css/select2.min.css" rel="stylesheet" /> 
    <script src="../Scripts/select2.min.js"></script>
    <link href="../Content/select2-bootstrap.css" rel="stylesheet" />

      <%--Finaliza las librerias--%>

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




     <div id="divForm" style="margin-top: 12%; margin-left: 15%; margin-right: 15%">
        <h1 style="text-align: center">Eliminar Proveedor</h1>

        <asp:HiddenField ID="hdldProveedor" runat="server" />



        <div class="form-row" style="margin-top: 5%; margin-bottom: 5%">
            <div class="form-group col-md-6">

                <label for="txtIDProveedor"></label><br>
                <asp:TextBox ID="txtIDProveedor" runat="server"  ReadOnly="true" CssClass="form-control" MaxLength="25"></asp:TextBox>
           </div>
            <div class="form-group col-md-6">
                <!-- NombreVariable -->
                <label for="txtNombreVariable"></label><br />
                <asp:TextBox ID="txtNombreVariable" type="text" ForeColor="Black" CssClass="form-control" ReadOnly="true" placeholder="Ubicacion" runat="server" MaxLength="50"></asp:TextBox>
            </div>
             <div class="form-group col-md-6">
                <!-- Ubicacion -->
                <label for="txtNombreRepresentante"></label><br />
                <asp:TextBox ID="txtNombreRepresentante" type="text" ForeColor="Black" CssClass="form-control" ReadOnly="true" placeholder="Ubicacion" runat="server" MaxLength="50"></asp:TextBox>
            </div>
             <div class="form-group col-md-6">
                <!-- Ubicacion -->
                <label for="txtPrimerApellido"></label><br />
                <asp:TextBox ID="txtPrimerApellido" type="text" ForeColor="Black" CssClass="form-control" ReadOnly="true" placeholder="Ubicacion" runat="server" MaxLength="50"></asp:TextBox>
            </div>
                <div class="form-group col-md-6">
                <!-- Ubicacion -->
                <label for="txtSegundoApellido"></label><br />
                <asp:TextBox ID="txtSegundoApellido" type="text" ForeColor="Black" CssClass="form-control" ReadOnly="true" placeholder="Ubicacion" runat="server" MaxLength="50"></asp:TextBox>
            </div>
             <div class="form-group col-md-6">
                <!-- Ubicacion -->
                <label for="txtCedulaRepresentante"></label><br />
                <asp:TextBox ID="txtCedulaRepresentante" type="text" ForeColor="Black" CssClass="form-control" ReadOnly="true" placeholder="Ubicacion" runat="server" MaxLength="50"></asp:TextBox>
            </div>
             <div class="form-group col-md-6">
                <!-- txtCedulaJuridica -->
                <label for="txtCedulaJuridica"></label><br />
                <asp:TextBox ID="txtCedulaJuridica" type="text" ForeColor="Black" CssClass="form-control" ReadOnly="true" placeholder="Ubicacion" runat="server" MaxLength="50"></asp:TextBox>
            </div>
            <div class="form-group col-md-6">
                <!-- txtTelefono -->
                <label for="txtTelefono"></label><br />
                <asp:TextBox ID="txtTelefono" type="text" CssClass="form-control" ReadOnly="true" placeholder="Tipo Propiedad" runat="server" MaxLength="50"></asp:TextBox>
            </div>
            <div class="form-group col-md-6">
                <!-- txtEmail-->
                <label for="txtEmail"></label><br />
                <asp:TextBox ID="txtEmail" type="text" ForeColor="Black" CssClass="form-control" ReadOnly="true" placeholder="Detalles" runat="server" MaxLength="50"></asp:TextBox>
            </div>
             <div class="form-group col-md-6">
                <!-- txtTipoProveedor-->
                <label for="txtTipoProveedor"></label><br />
                <asp:TextBox ID="txtTipoProveedor" type="text" ForeColor="Black" CssClass="form-control" ReadOnly="true" placeholder="Detalles" runat="server" MaxLength="50"></asp:TextBox>
            </div>

            <div class="form-group col-md-6">
                <!--  Provincia -->
                <label for="DropDownListProvincia">Canton</label><br />
                <asp:DropDownList ID="DropDownListProvincia" ForeColor="Black" type="text" CssClass="form-control" ReadOnly="true" placeholder="Canton" runat="server" MaxLength="50"></asp:DropDownList>

            </div>
            <div class="form-group col-md-6">
                <!-- txtOtrasSenas -->
                <label for="txtOtrasSenas"></label><br />
                <asp:TextBox ID="txtOtrasSenas" type="text" ForeColor="Black" CssClass="form-control" ReadOnly="true" placeholder="Distrito" runat="server" MaxLength="50"></asp:TextBox>

            </div>
            

       
    </div>

    <div class="form-group" style="text-align: center">
        <!-- Submit Button -->


        <asp:Button ID="btnAgregar" runat="server" CssClass="boton_personalizado" Font-Size="Medium" Height="49px" Width="111px" Text="Eliminar" OnClick="ShowPopup"  />


        &nbsp;&nbsp;&nbsp;

            <asp:Button ID="btnAtras" CssClass="boton_personalizado" runat="server" Text="Atras" OnClick="btnAtras_Click" Font-Size="Medium" Height="49px" Width="111px" PostBackUrl="~/Formularios/frm_ProveedorLista.aspx" />

        <br />
        <br />
        <asp:Label ID="lblResultado" runat="server" ForeColor="#009900" CssClass="alert-success" Font-Size="Large"></asp:Label>

        <br />
        <br />
        <br>


        </div>
    </div>


        <script>
        function alertmeError(){
            swal({
                title: "Error al eliminar",
                text: "Ha ocurrido un error al eliminar el proveedor. Si el problema persiste contacte al administrador del sistema",
                type: "error",
                confirmButtonText: "Ok",
                confirmButtonColor: "#ADC867"
       });
        }

        function alertmeSuccess() {
            swal({
                title: "Proveedor eliminado",
                text: "El proveedor ha sido eliminado satisfactoriamente",
                type: "success",
                confirmButtonText: "Ok",
                confirmButtonColor: "#55407D"
            });
        }
    </script>







</asp:Content>
