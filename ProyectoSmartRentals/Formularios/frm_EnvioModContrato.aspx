﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_EnvioModContrato.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_EnvioModContrato" %>
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


    <%--Finaliza las librerias--%>
  

    <div id="divForm" style="margin-top: 12%; margin-left: 15%; margin-right: 15%">
        <h1 style="text-align: center">Envío de Solicitud de Modificación
        </h1><br />
        <p style="text-align:center" margin-left: 15%; margin-right: 15%">Por favor ingrese la información de su contrato que desea revisar para su respectiva revisión</p>
     
        <div class="form-row" style="margin-top: 5%; margin-bottom: 5%">

            <div class="form-group col-md-6">
                <!-- Correo origen-->
                <label for="txtOrigen">De : <span style="color:red;">*</span></label><br />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtOrigen" ErrorMessage="Ingrese un correo electronico" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" ></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator" runat="server" ControlToValidate="txtOrigen" ErrorMessage="Ingrese un correo electronico valido"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RegularExpressionValidator>
                <asp:TextBox ID="txtOrigen" type="text"  CssClass="form-control" placeholder="Ingrese un correo en el formato usuario@gmail.com" runat="server" MaxLength="50"></asp:TextBox>
            </div>


        <div class="form-group col-md-6">
                <!-- Contrato-->
                <label for="txtContrato">Contrato : <span style="color:red;">*</span></label><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorContrato" runat="server" ControlToValidate="txtContrato" ErrorMessage="*Debe ingresar los detalles*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"> </asp:RequiredFieldValidator>
                <asp:TextBox ID="txtContrato" type="text"  CssClass="form-control" placeholder="Ingrese su numero de contrato" runat="server" MaxLength="50" ForeColor="Black" ></asp:TextBox>
            </div>
           
            <div class="form-group col-md-6">
               <%--  Telefono->--%>
                <label for="txtTelefono">Telefono : <span style="color:red;">*</span></label><br />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtTelefono" ErrorMessage="Ingrese un numero telefonico" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic" ></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ControlToValidate="txtTelefono" ErrorMessage="Debe ingresar un numero telefonico de 8 digitos " ValidationExpression="[0-9]{8}" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RegularExpressionValidator>
                <asp:TextBox ID="txtTelefono" type="text" CssClass="form-control" placeholder="Ingrese un telefono seguido y sin guiones" runat="server" MaxLength="50" ForeColor="Black"></asp:TextBox>
            </div>

             <div class="form-group col-md-6">
                <label for="txtElemento">Elemento a modificar: <span style="color:red;">*</span></label><br>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidatorTipo" runat="server" ErrorMessage="*Debe seleccionar un elemento a modificar*" SetFocusOnError="True" Font-Size="Small" InitialValue="Seleccionar" ControlToValidate="txtElemento" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>

                <select id="txtElemento" class="custom-select" runat="server" CssClass="form-control">
                    <option style="font-size: small">Seleccionar</option>
                    <option style="font-size: small">Generar nuevo contrato</option>
                    <option style="font-size: small">Cancelar contrato</option>
                    <option style="font-size: small">Modificar fecha de inicio</option>
                    <option style="font-size: small">Modificar titular (nombre)</option>
                    <option style="font-size: small">Modificar fecha de finalización</option>
                    <option style="font-size: small">Modificar archivo de contrato</option>
                    <option style="font-size: small">Modificar ubicación</option>
                    <option style="font-size: small">Revisar valor mensual</option>
                    <option style="font-size: small">Otros</option>

                </select>
            </div>

            <div class="form-group col-md-6">
                <!-- Comentarios-->
                <label for="txtJustifica">Justificación : <span style="color:red;">*</span></label><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorJustifica" runat="server" ControlToValidate="txtJustifica" ErrorMessage="*Debe ingresar una justificacion*" SetFocusOnError="True" Font-Size="Small" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtJustifica" type="text" TextMode="MultiLine" CssClass="form-control" runat="server" Width="530px" Height="250px" ForeColor="Black" ></asp:TextBox>
            </div>
    
        </div>

        </div>

        <div class="form-group" style="text-align: center">
            <!-- Submit Button -->

            <asp:Button ID="btnAgregar" runat="server" CssClass="boton_personalizado" Text="Enviar" Font-Size="Medium" Height="49px" Width="111px" OnClick="btnEnviar_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;

            <asp:Button ID="btnAtras" CssClass="boton_personalizado" runat="server" CausesValidation="false" Text="Atras" OnClick="btnAtras_Click" Font-Size="Medium" Height="49px" Width="111px" PostBackUrl="~/Formularios/frm_SolicitudModContrato.aspx" />

            <br />
            <br />
            <asp:Label ID="lblResultado" runat="server" Font-Bold="True" ForeColor="#009900" CssClass="alert-success" Font-Size="Large"></asp:Label>
        </div>
        <br>
        <br>    
        <br>
    
   
    
      <script>
          $(function () {
              $("#<%=txtElemento.ClientID%>").select2({
              selectOnClose: true,
              theme: 'bootstrap',
              height: '100%',
              width: '100%'
          }
          );
      })
          

      </script>




</asp:Content>
