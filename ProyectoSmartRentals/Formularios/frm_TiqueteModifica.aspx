<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_TiqueteModifica.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_TiqueteModifica" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <style type="text/css">
    .boton_personalizado{
    font-weight: 600;
    font-size: 20px;
    color: #ffffff;
    background-color: #2ECC71;
  }
  .boton_personalizado:hover{
    color: #1883ba;
    background-color: #ffffff;
  }
</style>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.min.js"></script>
      <link href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.min.css" rel="stylesheet"/>
  

    
    

           <div id="divForm" style="margin-top:12%; margin-left:15%; margin-right:15%">
         <h1 id="ticketnum" style="text-align: center">Tiquete: </h1>
        <div class="form-row" style="margin-top:5%; margin-bottom:5%">
              <asp:HiddenField ID="hdlTiquete" runat="server" />
       
            
               <div class="form-group col-md-6">
                <!-- Correo -->
                <label for="txtPrecio">Contrato</label>
                <asp:TextBox ID="txtContrato" type="text" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group col-md-6">
                <!-- Cliente -->
                <label for="txtCliente">Tipo de problema</label>
                  <asp:DropDownList ID="DropDownTipo" placeholder="Cliente" DataTextField="Cliente" CssClass="form-control" runat="server" AutoPostBack="True" Enabled="False">
                    <asp:ListItem Value="0">Seleccione un tipo de problema</asp:ListItem>
                     <asp:ListItem Value="1">Eléctrico</asp:ListItem>
                      <asp:ListItem Value="2">Fontaneria</asp:ListItem>
                      <asp:ListItem Value="3">Cerrajeria</asp:ListItem>

                  </asp:DropDownList>
            </div>
                   
              <div class="form-group col-md-12">
                <!-- Fecha de inicio -->
                <label for="txtTitulo">Titulo</label>
                <asp:TextBox ID="txtTitulo" type="text" CssClass="form-control" placeholder="Titulo del problema" runat="server" ReadOnly="true" MaxLength="30"></asp:TextBox>             
            </div>
             <div class="form-group col-md-12">
                <!-- Fecha de finalización -->
                <label for="txtDescrip">Detalles</label>
                <textarea id="txtDescrip" runat="server" placeholder="Descripción" class="form-control"  rows="3" readonly="readonly" ></textarea>
            </div>
               <div class="form-group col-md-6">
                <!-- Cliente -->
                <label for="txtCliente">Estado</label>
                  <asp:DropDownList ID="DropDownEstado" placeholder="Cliente" DataTextField="Cliente" CssClass="form-control" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="0">Pendiente</asp:ListItem>
                     <asp:ListItem Value="1">En progreso</asp:ListItem>
                      <asp:ListItem Value="2">Completado</asp:ListItem>
                      

                  </asp:DropDownList>
            </div>
            <div class="form-group col-md-6">
                <!-- Correo -->
                <label for="txtFechaInicio">Fecha apertura</label>
                <asp:TextBox ID="txtFechaInicio" type="text" CssClass="form-control"  runat="server" readOnly="true"></asp:TextBox>
            </div>
             <div class="form-group col-md-12">
                <!-- Fecha de finalización -->
                <label for="txtNota">Notas</label>
                <textarea id="txtNota" runat="server" placeholder="" class="form-control"  rows="3"></textarea>
            </div>

              <div class="form-group col-md-12">
                <!-- Correo -->
                <label for="txtPrecio">Precio</label>
                <asp:TextBox ID="txtPrecio" type="text" CssClass="form-control"  runat="server"></asp:TextBox>
            </div>


            

            
    </div>
        
        <div class="form-group" style="text-align:center">
            <!-- Submit Button -->
            <asp:Button ID="btnAgregar" runat="server" CssClass="btn btn-primary"  Text="Modificar" Font-Size="Medium" Height="49px" Width="111px" OnClick="btnAgregar_Click" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnAtras" runat="server" CssClass="btn btn-danger"  Text="Atrás"  Font-Size="Medium" Height="49px" Width="111px" PostBackUrl="~/Formularios/frm_TiqueteLista.aspx" />
            <br />
            <br />
            <asp:Label ID="lblResultado" runat="server" Font-Bold="True" ForeColor="#009900"></asp:Label>
        </div>
        </div>
    <br /><br />

</asp:Content>
