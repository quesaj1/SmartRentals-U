<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_crearTiquete.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_crearTiquete" %>
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
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    
    

           <div id="divForm" style="margin-top:12%; margin-left:15%; margin-right:15%">
         <h1 style="text-align: center">Crear Tiquete</h1>
        <div class="form-row" style="margin-top:5%; margin-bottom:5%">

       
             <div class="form-group col-md-6">
                <!-- Cliente -->
                <label for="txtCliente">Contrato</label>
                  <asp:DropDownList ID="DropDownContratos" placeholder="Cliente" DataTextField="Cliente" CssClass="form-control" runat="server" AutoPostBack="True"></asp:DropDownList>
            </div>
            <div class="form-group col-md-6">
                <!-- Cliente -->
                <label for="txtCliente">Tipo de problema</label>
                  <asp:DropDownList ID="DropDownTipo" placeholder="Cliente" DataTextField="Cliente" CssClass="form-control" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="0">Seleccione un tipo de problema</asp:ListItem>
                     <asp:ListItem Value="1">Eléctrico</asp:ListItem>
                      <asp:ListItem Value="2">Fontaneria</asp:ListItem>
                      <asp:ListItem Value="3">Cerrajeria</asp:ListItem>

                  </asp:DropDownList>
            </div>
                   
              <div class="form-group col-md-12">
                <!-- Fecha de inicio -->
                <label for="txtTitulo"></label>
                <asp:TextBox ID="txtTitulo" type="text" CssClass="form-control" placeholder="Titulo del problema" runat="server" MaxLength="30"></asp:TextBox>             
            </div>
             <div class="form-group col-md-12">
               <label for="txaMessage">Descripción</label>
            <textarea class="form-control" name="txaMessage" id="txaMessage" rows="5" runat="server"></textarea>
            <div class="text-right"><span id="caracteres" class="valid-text pt-3" id="txaCount"></span></div>
            </div>

   

            
    </div>
        
        <div class="form-group" style="text-align:center">
            <!-- Submit Button -->
            <asp:Button ID="btnAgregar" runat="server" CssClass="btn btn-primary"  Text="Crear" Font-Size="Medium" Height="49px" Width="111px" OnClick="btnAgregar_Click"  />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnAtras" runat="server" CssClass="btn btn-danger"  Text="Atrás"  Font-Size="Medium" Height="49px" Width="111px" PostBackUrl="~/Formularios/frm_TiqueteLista.aspx" />
            <br />
            <br />
            <asp:Label ID="lblResultado" runat="server" Font-Bold="True" ForeColor="#009900"></asp:Label>
        </div>
        </div>
    <br /><br />

<script>
    $("#txaMessage").on('keypress', function () {
        var limit = 500;
        $("#txaMessage").attr('maxlength', limit);
        var init = $(this).val().length;

        if (init < limit) {
            init++;
            $('#caracteres').text("Máximo 30 caracteres: " + init);
        }

    });
</script>
</asp:Content>
