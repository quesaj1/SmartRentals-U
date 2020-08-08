 <%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_AlquileresModifica.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_AlquileresModifica" %>

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
        <h1 style="text-align: center">Modificar Alquiler</h1>

          <div style="margin-top: 5%; margin-left: 15%; margin-right: 15%; text-align:center" >
               
                   <asp:Image  runat="server" CssClass="rounded"  ID="image"  Width="220px"  Height="220px" BorderStyle="Solid" BorderWidth="2px"  />
                    
                 </div>

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
                <asp:DropDownList ID="DropDownListProvincia" ViewStateMode="Enabled" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="SeleccionaProvincia" ForeColor="Black"></asp:DropDownList>
                <br />
            </div>
            <div class="form-group col-md-6">
                <!--  Canton -->
                <label for="txtCanton">Canton</label><br>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCant" runat="server" ControlToValidate="DropDownListCanton" ErrorMessage="*Debe seleccionar un cantón*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="DropDownListCanton" CssClass="form-control" ViewStateMode="Enabled" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SeleccionaCanton" ForeColor="Black"></asp:DropDownList>
                <br>
            </div>
            <div class="form-group col-md-6">
                <!-- Distrito -->
                <label for="txtDistrito">Distrito</label><br>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDist" runat="server" ControlToValidate="DropDownListDistrito" ErrorMessage="*Debe seleccionar un distrito*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="DropDownListDistrito" CssClass="form-control" ViewStateMode="Enabled" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SeleccionaDistrito" ForeColor="Black"></asp:DropDownList>
                <br>
            </div>
            <div class="form-group col-md-6">
                <!-- URL Imagen -->
                <label for="txtImagen">Galería</label><br>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorImg" runat="server" ControlToValidate="fupImage" ErrorMessage="*Debe cargar una imagen*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:FileUpload ID="fupImage" CssClass="form-control" runat="server" ForeColor="Black" />

              

                <br>
            </div>
            
              

             <%--test--%>
            <div class="form-group col-md-6" runat="server" visible="false">
                
               
                <asp:DropDownList ID="DropDownListProvincia1" DataTextField="nombre" DataValueField="id_provincia" CssClass="form-control" runat="server" Visible="true" AutoPostBack="True"  ForeColor="Black"></asp:DropDownList>
                <br />
            </div>
            <div class="form-group col-md-6" runat="server" visible="false">
                <!--  Canton -->
                <label for="txtCanton">Canton</label><br>
                
                <asp:DropDownList ID="DropDownListCanton1" CssClass="form-control" DataTextField="nombre" DataValueField="id_canton" runat="server" AutoPostBack="True"  ForeColor="Black"></asp:DropDownList>
                <br>
            </div>
            <div class="form-group col-md-6" runat="server" visible="false">
                <!-- Distrito -->
                <label for="txtDistrito">Distrito</label><br>
                
                <asp:DropDownList ID="DropDownListDistrito1" CssClass="form-control" DataTextField="nombre" DataValueField="id_distrito" runat="server" AutoPostBack="True"   ForeColor="Black"></asp:DropDownList>
                <br>
            </div>

       
         </div>
      
        <div class="form-group" style="text-align: center">
            <!-- Submit Button -->


             <asp:Button ID="btnShowPopup" runat="server" CssClass="boton_personalizado" Font-Size="Medium" Height="49px" Width="111px" Text="Modificar" OnClick="btnAgregar_Click" />

           
            &nbsp;&nbsp;&nbsp;

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
                title: "Error al modificar el alquiler",
                text: "Ha ocurrido un error al modificar el alquiler. Si el problema persiste contacte al administrador del sistema",
                type: "error",
                confirmButtonText: "Ok",
                confirmButtonColor: "#ADC867"
            });
        }

        function alertmeSuccess() {
            swal({
                title: "Alquiler modificado",
                text: "El alquiler ha sido modificado satisfactoriamente",
                type: "success",
                confirmButtonText: "Ok",
                confirmButtonColor: "#55407D"
            });
        }
    </script>

 </asp:Content>
