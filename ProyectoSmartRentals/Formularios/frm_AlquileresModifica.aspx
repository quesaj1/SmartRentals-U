<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_AlquileresModifica.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_AlquileresModifica" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <%-- Llamado del script de JS para el Modal show y hide --%>

    <script type="text/javascript">
        function ShowPopup(title, body) {
            $("#MyPopup .modal-title").html(title);
            $("#MyPopup .modal-body").html(body);
            $("#MyPopup").modal("show");
        }
    </script>


   
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
        <h1 style="text-align: center">Modificar Alquiler</h1>

        <asp:HiddenField ID="hdldAlquiler" runat="server" />

        <div class="form-row" style="margin-top: 5%; margin-bottom: 5%">
            <div class="form-group col-md-6">

                <label for="txtID">Id de Alquiler</label><br>
                <asp:TextBox ID="txtID" runat="server"  ReadOnly="true" CssClass="form-control" MaxLength="25" ForeColor="Black"></asp:TextBox>
           </div>

                <div class="form-group col-md-6">
                <!-- Ubicacion -->
                <label for="txtUbicacionExacta">Ubicacion Exacta</label><br>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorUbic" runat="server" ControlToValidate="txtUbicacionExacta" ErrorMessage="*Debe ingresar una ubicación*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" CssClass="alert-light"></asp:RequiredFieldValidator>

                <asp:TextBox ID="txtUbicacionExacta" type="text" CssClass="form-control" placeholder="Ingrese una ubicación" runat="server" MaxLength="50" ForeColor="Black"></asp:TextBox>
                <br>
            </div>
            <div class="form-group col-md-6">
                <!-- Tipo Propiedad -->
                <label for="txtTipoPropiedad">Tipo de Propiedad</label><br>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorTipo" runat="server" ErrorMessage="*Debe seleccionar un tipo de propiedad*" SetFocusOnError="True" Font-Size="Small" InitialValue="Seleccionar" ControlToValidate="txtTipoPropiedad" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>

                <select id="txtTipoPropiedad" class="custom-select" runat="server" CssClass="form-control">

                    <option style="font-size: small">Seleccionar</option>
                    <option style="font-size: small">Casa</option>
                    <option style="font-size: small">Apartamento</option>
                    <option style="font-size: small">Condominio</option>
                    <option style="font-size: small">Bodega</option>
                    <option style="font-size: small">Quinta</option>

                </select>
                <br>
            </div>
            <div class="form-group col-md-6">
                <!-- Detalles-->
                <label for="txtDetalles">Detalles</label><br>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDet" runat="server" ControlToValidate="txtDetalles" ErrorMessage="*Debe ingresar los detalles*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtDetalles" type="text" CssClass="form-control" placeholder="Ingrese el detalle" runat="server" MaxLength="50" ForeColor="Black"></asp:TextBox>
                <br>
            </div>
            <div class="form-group col-md-6">
                <!-- Provincia -->
                <label for="txtProvincia">Provincia</label><br>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorProv" runat="server" ControlToValidate="DropDownListProvincia" ErrorMessage="*Debe selecccionar una provincia*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="DropDownListProvincia" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SeleccionaProvincia" ForeColor="Black"></asp:DropDownList>
                <br />
            </div>
            <div class="form-group col-md-6">
                <!--  Canton -->
                <label for="txtCanton">Canton</label><br>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCant" runat="server" ControlToValidate="DropDownListCanton" ErrorMessage="*Debe seleccionar un cantón*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="DropDownListCanton" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SeleccionaCanton" ForeColor="Black"></asp:DropDownList>
                <br>
            </div>
            <div class="form-group col-md-6">
                <!-- Distrito -->
                <label for="txtDistrito">Distrito</label><br>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDist" runat="server" ControlToValidate="DropDownListDistrito" ErrorMessage="*Debe seleccionar un distrito*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="DropDownListDistrito" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SeleccionaDistrito" ForeColor="Black"></asp:DropDownList>
                <br>
            </div>
            <div class="form-group col-md-6">
                <!-- URL Imagen -->
                <label for="txtImagen">Galería</label><br>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorImg" runat="server" ControlToValidate="fupImage" ErrorMessage="*Debe cargar una imagen*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:FileUpload ID="fupImage" CssClass="form-control" runat="server" ForeColor="Black" />
                <br>
            </div>
       
         </div>
      


        <div class="form-group" style="text-align: center">
            <!-- Submit Button -->


             <asp:Button ID="btnShowPopup" runat="server" CssClass="btn btn-primary" Font-Size="Medium" Height="49px" Width="111px" Text="Modificar" OnClick="btnAgregar_Click" />

           
            &nbsp;&nbsp;&nbsp;

             <asp:Button ID="btnAtras" CssClass="btn btn-danger" runat="server" CausesValidation="false" Text="Atras" OnClick="btnAtras_Click" Font-Size="Medium" Height="49px" Width="111px" PostBackUrl="~/Formularios/frm_AlquileresLista.aspx" />

            <br />
            <br />

            <asp:Label ID="lblResultado" runat="server" Font-Bold="True" ForeColor="#009900" CssClass="alert-success" Font-Size="Large"></asp:Label>
        </div>
        <br>
        <br>
        <br>
    </div>




</asp:Content>
