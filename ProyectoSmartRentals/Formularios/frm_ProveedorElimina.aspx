﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_ProveedorElimina.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_ProveedorElimina" %>
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
        <h1 style="text-align: center">Eliminar Proveedor</h1>

        <asp:HiddenField ID="hdldProveedor" runat="server" />



        <div class="form-row" style="margin-top: 5%; margin-bottom: 5%">
            <div class="form-group col-md-6">

                <label for="txtIDProveedor"></label><br>
                <asp:TextBox ID="txtIDProveedor" runat="server"  ReadOnly="true" CssClass="form-control" MaxLength="25"></asp:TextBox>
           </div>
            <div class="form-group col-md-6">
                <!-- Ubicacion -->
                <label for="txtNombreVariable"></label><br />
                <asp:TextBox ID="txtNombreVariable" type="text" CssClass="form-control" ReadOnly="true" placeholder="Ubicacion" runat="server" MaxLength="50"></asp:TextBox>
            </div>
             <div class="form-group col-md-6">
                <!-- Ubicacion -->
                <label for="txtNombreRepresentante"></label><br />
                <asp:TextBox ID="txtNombreRepresentante" type="text" CssClass="form-control" ReadOnly="true" placeholder="Ubicacion" runat="server" MaxLength="50"></asp:TextBox>
            </div>
             <div class="form-group col-md-6">
                <!-- Ubicacion -->
                <label for="txtPrimerApellido"></label><br />
                <asp:TextBox ID="txtPrimerApellido" type="text" CssClass="form-control" ReadOnly="true" placeholder="Ubicacion" runat="server" MaxLength="50"></asp:TextBox>
            </div>
                <div class="form-group col-md-6">
                <!-- Ubicacion -->
                <label for="txtSegundoApellido"></label><br />
                <asp:TextBox ID="txtSegundoApellido" type="text" CssClass="form-control" ReadOnly="true" placeholder="Ubicacion" runat="server" MaxLength="50"></asp:TextBox>
            </div>
             <div class="form-group col-md-6">
                <!-- Ubicacion -->
                <label for="txtCedulaRepresentante"></label><br />
                <asp:TextBox ID="txtCedulaRepresentante" type="text" CssClass="form-control" ReadOnly="true" placeholder="Ubicacion" runat="server" MaxLength="50"></asp:TextBox>
            </div>
             <div class="form-group col-md-6">
                <!-- Ubicacion -->
                <label for="txtCedulaJuridica"></label><br />
                <asp:TextBox ID="txtCedulaJuridica" type="text" CssClass="form-control" ReadOnly="true" placeholder="Ubicacion" runat="server" MaxLength="50"></asp:TextBox>
            </div>
            <div class="form-group col-md-6">
                <!-- Tipo Propiedad -->
                <label for="txtTelefono"></label><br />
                <asp:TextBox ID="txtTelefono" type="text" CssClass="form-control" ReadOnly="true" placeholder="Tipo Propiedad" runat="server" MaxLength="50"></asp:TextBox>
            </div>
            <div class="form-group col-md-6">
                <!-- Detalles-->
                <label for="txtEmail"></label><br />
                <asp:TextBox ID="txtEmail" type="text" CssClass="form-control" ReadOnly="true" placeholder="Detalles" runat="server" MaxLength="50"></asp:TextBox>
            </div>
             <div class="form-group col-md-6">
                <!-- Detalles-->
                <label for="txtTipoProveedor"></label><br />
                <asp:TextBox ID="txtTipoProveedor" type="text" CssClass="form-control" ReadOnly="true" placeholder="Detalles" runat="server" MaxLength="50"></asp:TextBox>
            </div>

            <div class="form-group col-md-6">
                <!--  Canton -->
                <label for="DropDownListProvincia">Canton</label><br />
                <asp:DropDownList ID="DropDownListProvincia" type="text" CssClass="form-control" ReadOnly="true" placeholder="Canton" runat="server" MaxLength="50"></asp:DropDownList>

            </div>
            <div class="form-group col-md-6">
                <!-- Distrito -->
                <label for="txtOtrasSenas">Distrito</label><br />
                <asp:TextBox ID="txtOtrasSenas" type="text" CssClass="form-control" ReadOnly="true" placeholder="Distrito" runat="server" MaxLength="50"></asp:TextBox>

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










</asp:Content>