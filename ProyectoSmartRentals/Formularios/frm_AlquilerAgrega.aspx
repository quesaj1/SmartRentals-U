<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_AlquilerAgrega.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_AlquilerAgrega" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

 
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

     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>

    <%--Finaliza las librerias--%>

  

    <div id="divForm" style="margin-top: 12%; margin-left: 15%; margin-right: 15%">
        <h1 style="text-align: center">Agregar Alquiler
        </h1>


        <div class="form-row" style="margin-top: 5%; margin-bottom: 5%">
            <div class="form-group col-md-6">
                <!-- Ubicacion -->
                <label for="txtUbicacionExacta" >Ubicacion Exacta <span style="color:red;">*</span> </label>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorUbicacion" runat="server" ControlToValidate="txtUbicacionExacta" ErrorMessage="*Debe ingresar una ubicación*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" CssClass="alert-light"></asp:RequiredFieldValidator>

                <asp:TextBox ID="txtUbicacionExacta" type="text" CssClass="form-control" runat="server" MaxLength="100" placeholder="Ingrese una ubicación" ForeColor="Black"></asp:TextBox>
                <br />
            </div>

            <div class="form-group col-md-6">
                <!-- Tipo Propiedad -->
                <label for="txtTipoPropiedad">Tipo de Propiedad <span style="color:red;">*</span></label>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorTipo" runat="server" ErrorMessage="*Debe seleccionar un tipo de propiedad*" SetFocusOnError="True" Font-Size="Small" InitialValue="Seleccionar" ControlToValidate="txtTipoPropiedad" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>


                <select id="txtTipoPropiedad" class="custom-select" runat="server" CssClass="form-control" ForeColor="Black" >
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
                <label for="txtDetalles">Detalles<span style="color:red;">*</span> </label>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDetalle" runat="server" ControlToValidate="txtDetalles" ErrorMessage="*Debe ingresar los detalles*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>

                <asp:TextBox ID="txtDetalles" type="text" CssClass="form-control" runat="server" MaxLength="50" placeholder="Ingrese el detalle" ForeColor="Black"></asp:TextBox>
                <br />
            </div>



            <div class="form-group col-md-6">
                <!-- Provincia -->
                <label for="txtProvincia">Provincia <span style="color:red;">*</span></label>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorProv" runat="server" ControlToValidate="DropDownListProvincia" ErrorMessage="*Debe seleccionar una provincia*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>

                <asp:DropDownList ID="DropDownListProvincia" DataTextField="Provincia" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ProvinciaSeleccion" ForeColor="Black"></asp:DropDownList>
                <br />
            </div>

            <div class="form-group col-md-6">
                <!--  Canton -->
                <label for="txtCanton">Canton<span style="color:red;">*</span> </label>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCant" runat="server" ControlToValidate="DropDownListCanton" ErrorMessage="*Debe seleccionar un cantón*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>

                <asp:DropDownList ID="DropDownListCanton" DataTextField="Canton" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="CantonSeleccion" ForeColor="Black"></asp:DropDownList>
                <br>
            </div>

            <div class="form-group col-md-6">
              <!-- Distrito -->
                <label for="txtDistrito">Distrito <span style="color:red;">*</span></label>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDist" runat="server" ControlToValidate="DropDownListDistrito" ErrorMessage="*Debe seleccionar un distrito*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>

                <asp:DropDownList ID="DropDownListDistrito" DataTextField="Distrito" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DistritoSeleccion" ForeColor="Black"></asp:DropDownList>
                <br />
            </div>

            <div class="form-group col-md-6">
                <!-- URL Imagen -->
                <label for="txtImagen">Galería <span style="color:red;">*</span></label><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorImg" runat="server" ControlToValidate="fupImage" ErrorMessage="*Debe cargar una imagen*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>

                <asp:FileUpload ID="fupImage" CssClass="form-control" runat="server" ForeColor="Black" />
                <br />
            </div>
        </div>

        <div class="form-group" style="text-align: center">
            <!-- Submit Button -->

            <asp:Button ID="btnAgregar" runat="server" CssClass="boton_personalizado" Text="Agregar" Font-Size="Medium" Height="49px" Width="111px" OnClick="btnAgregar_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;

            <asp:Button ID="btnAtras" CssClass="boton_personalizado" runat="server" CausesValidation="false" Text="Atras" OnClick="btnAtras_Click" Font-Size="Medium" Height="49px" Width="111px" PostBackUrl="~/Formularios/frm_AlquileresLista.aspx" />

            <br />
            <br />
            <asp:Label ID="lblResultado" runat="server" Font-Bold="True" ForeColor="#009900" CssClass="alert-success" Font-Size="Large"></asp:Label>
        </div>
        <br>
        <br>
        <br>
    </div>

    <%--   Agregar este script para el select 2--%>
<%--   Cambiar lo que dice dorpdownlistcliente por el nombre del correcto--%>

      <script>
      $(function () {
          $("#<%=DropDownListDistrito.ClientID%>").select2({
              selectOnClose: true,
              theme: 'bootstrap',
              height: '100%',
              width: '100%'
                     }
          );
      })
          $(function () {
              $("#<%=DropDownListProvincia.ClientID%>").select2({
                  selectOnClose: true,
                  theme: 'bootstrap',
                  height: '100%',
                  width: '100%'
              }
              );
          })


          $(function () {
              $("#<%=DropDownListCanton.ClientID%>").select2({
                  selectOnClose: true,
                  theme: 'bootstrap',
                  height: '100%',
                  width: '100%'
              }
              );
          })


          $(function () {
              $("#<%=txtTipoPropiedad.ClientID%>").select2({
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
                title: "Error al agregar",
                text: "Ha ocurrido un error al agregar el alquiler. Si el problema persiste contacte al administrador del sistema",
                type: "error",
                confirmButtonText: "Ok",
                confirmButtonColor: "#ADC867"
            });
        }

        function alertmeSuccess() {
            swal({
                title: "Alquiler agregado",
                text: "El alquiler ha sido guardado satisfactoriamente",
                type: "success",
                confirmButtonText: "Ok",
                confirmButtonColor: "#55407D"
            });
        }
    </script>

</asp:Content>
