<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_ProveedorModifica.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_ProveedorModifica" %>
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


    <style type="text/css">
        .boton_personalizado {
            font-weight: 600;
            font-size: 20px;
            color: #ffffff;
            background-color: #2ECC71;
        }

            .boton_personalizado:hover {
                color: #1883ba;
                background-color: #ffffff;
            }
    </style>

   
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

        <asp:HiddenField ID="hdldProveedor" runat="server" />

        <div class="form-row" style="margin-top:5%; margin-bottom:5%">

            
        <div class="form-row" style="margin-top: 5%; margin-bottom: 5%">
            <div class="form-group col-md-6">

                <label for="txtIDProveedor">Id de Alquiler</label><br>
                <asp:TextBox ID="txtIDProveedor" runat="server"  ReadOnly="true" CssClass="form-control" MaxLength="25"></asp:TextBox>
           </div>


              <!-- Nombre Variable -->
            <div class="form-group col-md-6">
                <label for="txtNombreVariable"></label>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorVariable" runat="server" ControlToValidate="txtNombreVariable" ErrorMessage="*Debe ingresar una Variable " SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" CssClass="alert-light"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtNombreVariable" type="text" CssClass="form-control" placeholder="Nombre Variable" runat="server" MaxLength="50"></asp:TextBox>
            </div>

             <!-- Nombre Representante -->
            <div class="form-group col-md-6">
                <label for="txtNombreRepresentante"></label>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorNombreRepresentante" runat="server" ControlToValidate="txtNombreRepresentante" ErrorMessage="*Debe ingresar los detalles*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtNombreRepresentante" type="text" CssClass="form-control" placeholder="Nombre Representante" runat="server" MaxLength="50"></asp:TextBox>
            </div>


              <!--PrimerApellido-->
              <div class="form-group col-md-6">
                <label for="txtPrimerApellido"></label>
                  <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPrimerApellido" runat="server" ControlToValidate="txtPrimerApellido" ErrorMessage="*Debe ingresar los Nombre*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtPrimerApellido" type="text" CssClass="form-control" placeholder="Primer Apellido" runat="server" MaxLength="50"></asp:TextBox>             
            </div>


              <!--SegundoApellido-->
              <div class="form-group col-md-6">
                <label for="txtSegundoApellido"></label>
                  <br />
                   <asp:RequiredFieldValidator ID="RequiredFieldValidatorSApellido" runat="server" ControlToValidate="txtSegundoApellido" ErrorMessage="*Debe ingresar los Nombre*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtSegundoApellido" type="text" CssClass="form-control" placeholder="Segundo Apellido" runat="server" MaxLength="50"></asp:TextBox>             
            </div>

              <!--Cedula Representante-->
              <div class="form-group col-md-6">
                <label for="txtCedulaRepresentante"></label>
                  <br />
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCedulaRepresentante" ErrorMessage="*Debe ingresar los Cedula*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtCedulaRepresentante" type="text" CssClass="form-control" placeholder="Cedula Representante" runat="server" MaxLength="12"></asp:TextBox>             
            </div>

            <!--Cedula Juridica-->
              <div class="form-group col-md-6">
                <label for="txtCedulaJuridica"></label>
                  <br />
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCedulaJuridica" ErrorMessage="*Debe ingresar los Cedula Juridica*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtCedulaJuridica" type="text" CssClass="form-control" placeholder="Cedula Juridica" runat="server" MaxLength="12"></asp:TextBox>             
            </div>

             <!--Telefono-->
              <div class="form-group col-md-6">
                <label for="txtTelefono"></label>
                  <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtTelefono" ErrorMessage="*Debe ingresar eñ Telefono*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtTelefono" type="text" CssClass="form-control" placeholder="Telefono" runat="server" MaxLength="15"></asp:TextBox>             
            </div>

            <!--Email-->
              <div class="form-group col-md-6">
                <label for="txtEmail"></label>
                  <br />
                   <asp:RequiredFieldValidator ID="RequiredFieldValidatorDetalle" runat="server" ControlToValidate="txtEmail" ErrorMessage="*Debe ingresar los Email*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtEmail" type="text" CssClass="form-control" placeholder="Email" runat="server" MaxLength="50"></asp:TextBox>             
            </div>


               <!--TipoProveedor -->
              <div class="form-group col-md-6">
                <label for="txtTipoProveedor"></label>
                  <br/>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidatorTipo" runat="server" ErrorMessage="*Debe seleccionar un tipo de propiedad*" SetFocusOnError="True" Font-Size="Small" InitialValue="Seleccionar" ControlToValidate="txtTipoProveedor" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>            
                  <select id="txtTipoProveedor" class="custom-select" runat="server" CssClass="form-control">
                    <option style="font-size: small">Seleccionar</option>
                    <option style="font-size: small">Jardinero</option>
                    <option style="font-size: small">Electricidad</option>
                    <option style="font-size: small">Fontanero</option>
                    <option style="font-size: small">Cable/Redes</option>
                    <option style="font-size: small">Telefonia</option>
                </select>
            </div>


          <div class="form-group col-md-6">
                <!-- Provincia -->
                <label for="txtProvincia">Provincia</label><br>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorProv" runat="server" ControlToValidate="DropDownListProvincia" ErrorMessage="*Debe selecccionar una provincia*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="DropDownListProvincia" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SeleccionaProvincia"></asp:DropDownList>
                <br />
            </div>
            <div class="form-group col-md-6">
                <!--  Canton -->
                <label for="txtCanton">Canton</label><br>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCant" runat="server" ControlToValidate="DropDownListCanton" ErrorMessage="*Debe seleccionar un cantón*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="DropDownListCanton" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SeleccionaCanton"></asp:DropDownList>
                <br>
            </div>
            <div class="form-group col-md-6">
                <!-- Distrito -->
                <label for="txtDistrito">Distrito</label><br>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDist" runat="server" ControlToValidate="DropDownListDistrito" ErrorMessage="*Debe seleccionar un distrito*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="DropDownListDistrito" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SeleccionaDistrito"></asp:DropDownList>
                <br>
            </div>

             <!--OtrasSenas-->
              <div class="form-group col-md-6">
                <label for="txtOtrasSenas"></label>
                   <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorSenas" runat="server" ControlToValidate="txtOtrasSenas" ErrorMessage="*Debe ingresar una Variable " SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" CssClass="alert-light"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtOtrasSenas" type="text" CssClass="form-control" placeholder="Otras Señas" runat="server" MaxLength="30"></asp:TextBox>             
            </div>

  </div>
    </div>
      


        <div class="form-group" style="text-align: center">
            <!-- Submit Button -->


             <asp:Button ID="btnShowPopup" runat="server" CssClass="boton_personalizado" Font-Size="Medium" Height="49px" Width="111px" Text="Modificar" OnClick="btnAgregar_Click" />

           
            &nbsp;&nbsp;&nbsp;

             <asp:Button ID="btnAtras" CssClass="boton_personalizado" runat="server" CausesValidation="false" Text="Atras" OnClick="btnAtras_Click" Font-Size="Medium" Height="49px" Width="111px" PostBackUrl="~/Formularios/frm_ProveedorLista.aspx" />

            <br />
            <br />

            <asp:Label ID="lblResultado" runat="server" Font-Bold="True" ForeColor="#009900" CssClass="alert-success" Font-Size="Large"></asp:Label>
        </div>
        <br>
        <br>
        <br>
    </div>


</asp:Content>
