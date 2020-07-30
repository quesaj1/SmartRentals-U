<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_AlquilerAgrega.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_AlquilerAgrega" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <style type="text/css">
      

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


  

    <div id="divForm" style="margin-top: 12%; margin-left: 15%; margin-right: 15%">
        <h1 style="text-align: center">Agregar Alquiler
        </h1>

     


        <div class="form-row" style="margin-top: 5%; margin-bottom: 5%">
            <div class="form-group col-md-6">
                <!-- Ubicacion -->
                <label for="txtUbicacionExacta" >Ubicacion Exacta</label>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorUbicacion" runat="server" ControlToValidate="txtUbicacionExacta" ErrorMessage="*Debe ingresar una ubicación*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" CssClass="alert-light"></asp:RequiredFieldValidator>

                <asp:TextBox ID="txtUbicacionExacta" type="text" CssClass="form-control" runat="server" MaxLength="100" placeholder="Ingrese una ubicación"></asp:TextBox>
                <br />
            </div>

            <div class="form-group col-md-6">
                <!-- Tipo Propiedad -->
                <label for="txtTipoPropiedad">Tipo de Propiedad</label>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorTipo" runat="server" ErrorMessage="*Debe seleccionar un tipo de propiedad*" SetFocusOnError="True" Font-Size="Small" InitialValue="Seleccionar" ControlToValidate="txtTipoPropiedad" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>


                <select id="txtTipoPropiedad" class="custom-select" runat="server" CssClass="form-control">
                    <option style="font-size: small">Seleccionar</option>
                    <option style="font-size: small">Casa</option>
                    <option style="font-size: small">Apartamento</option>
                    <option style="font-size: small">Condominio</option>
                    <option style="font-size: small">Bodega</option>
                    <option style="font-size: small">Quinta</option>

                </select>
                <br />
            </div>


            <div class="form-group col-md-6">
                
                 <!-- Detalles-->
                <label for="txtDetalles">Detalles</label>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDetalle" runat="server" ControlToValidate="txtDetalles" ErrorMessage="*Debe ingresar los detalles*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>

                <asp:TextBox ID="txtDetalles" type="text" CssClass="form-control" runat="server" MaxLength="50" placeholder="Ingrese el detalle"></asp:TextBox>
                <br />
            </div>



            <div class="form-group col-md-6">
                <!-- Provincia -->
                <label for="txtProvincia">Provincia</label>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorProv" runat="server" ControlToValidate="DropDownListProvincia" ErrorMessage="*Debe seleccionar una provincia*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>

                <asp:DropDownList ID="DropDownListProvincia" DataTextField="Provincia" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ProvinciaSeleccion" ForeColor="Black"></asp:DropDownList>
                <br />
            </div>

            <div class="form-group col-md-6">
                <!--  Canton -->
                <label for="txtCanton">Canton</label>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCant" runat="server" ControlToValidate="DropDownListCanton" ErrorMessage="*Debe seleccionar un cantón*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>

                <asp:DropDownList ID="DropDownListCanton" DataTextField="Canton" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="CantonSeleccion" ForeColor="Black"></asp:DropDownList>
                <br>
            </div>

            <div class="form-group col-md-6">
              <!-- Distrito -->
                <label for="txtDistrito">Distrito</label>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDist" runat="server" ControlToValidate="DropDownListDistrito" ErrorMessage="*Debe seleccionar un distrito*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>

                <asp:DropDownList ID="DropDownListDistrito" DataTextField="Distrito" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DistritoSeleccion" ForeColor="Black"></asp:DropDownList>
                <br />
            </div>

            <div class="form-group col-md-6">
                <!-- URL Imagen -->
                <label for="txtImagen">Galería</label><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorImg" runat="server" ControlToValidate="fupImage" ErrorMessage="*Debe cargar una imagen*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>

                <asp:FileUpload ID="fupImage" CssClass="form-control" runat="server" ForeColor="Black" />
                <br />
            </div>
        </div>

        <div class="form-group" style="text-align: center">
            <!-- Submit Button -->

            <asp:Button ID="btnAgregar" runat="server" CssClass="btn btn-primary" Text="Agregar" Font-Size="Medium" Height="49px" Width="111px" OnClick="btnAgregar_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;

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
