<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_ProveedorAgregar.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_ProveedorAgregar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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

     <div id="divForm" style="margin-top:12%; margin-left:15%; margin-right:15%">
         <h1 style="text-align: center">Agregar Proveedor</h1>

        <div class="form-row" style="margin-top:5%; margin-bottom:5%">
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


             <!-- Provincia -->
              <div class="form-group col-md-6">
                <label for="txtProvincia">Provincia</label>
                    <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorProv" runat="server" ControlToValidate="DropDownListProvincia" ErrorMessage="*Debe seleccionar una provincia*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                  <asp:DropDownList ID="DropDownListProvincia"  DataTextField="Provincia" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ProvinciaSeleccion"></asp:DropDownList>
            </div>

              <!--  Canton -->
              <div class="form-group col-md-6">
               <label for="txtCanton">Canton</label>
                  <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCant" runat="server" ControlToValidate="DropDownListCanton" ErrorMessage="*Debe seleccionar un cantón*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                  <asp:DropDownList ID="DropDownListCanton" DataTextField="Canton" CssClass="form-control"  runat="server" AutoPostBack="True" OnSelectedIndexChanged="CantonSeleccion"></asp:DropDownList>
            </div>


            <!-- Distrito -->
              <div class="form-group col-md-6">
               <label for="txtDistrito">Distrito</label>
                  <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDist" runat="server" ControlToValidate="DropDownListDistrito" ErrorMessage="*Debe seleccionar un distrito*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                  <asp:DropDownList ID="DropDownListDistrito" DataTextField="Distrito" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DistritoSeleccion"></asp:DropDownList>
            </div>

             <!--OtrasSenas-->
              <div class="form-group col-md-6">
                <label for="txtOtrasSenas"></label>
                   <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorSenas" runat="server" ControlToValidate="txtOtrasSenas" ErrorMessage="*Debe ingresar una Variable " SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" CssClass="alert-light"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtOtrasSenas" type="text" CssClass="form-control" placeholder="Otras Señas" runat="server" MaxLength="30"></asp:TextBox>             
            </div>

 
    </div>
         <!-- Submit Button -->
        <div class="form-group" style="text-align:center">
            <asp:Button ID="btnAgregar" runat="server"  CssClass="boton_personalizado"  Text="Agregar" Font-Size="Medium" Height="49px" Width="111px" OnClick="btnAgregar_Click"/>
             &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnAtras" CssClass="boton_personalizado"  runat="server" Text="Atras" OnClick="btnAtras_Click" Font-Size="Medium" Height="49px" Width="111px" PostBackUrl="~/Formularios/frm_ProveedorLista.aspx" />
            <br />
            <br />
            <asp:Label ID="lblResultado" runat="server" Font-Bold="True" ForeColor="#009900"></asp:Label>
        </div>
        </div>
</asp:Content>
