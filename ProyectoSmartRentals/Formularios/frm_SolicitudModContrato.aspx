<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_SolicitudModContrato.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_SolicitudModContrato" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="divForm" style="margin-top: 12%; margin-left: 15%; margin-right: 15%">
        <h2 style="text-align: center">Solicitud de Modificacion de Contrato</h2>
        <asp:HiddenField ID="hdldContrato" runat="server" />
        <br />
        <br />
      
        <div class="form-row" style="margin-top: 5%; margin-bottom: 5%">

         
            
           <div class="form-group col-sm-3">
               <!-- Estado -->
               <label for="txtContrato">Ingrese su numero de contrato :</label><br />
               <asp:TextBox ID="txtContrato" type="text" CssClass="form-control" placeholder="Numero de contrato" runat="server" MaxLength="30"></asp:TextBox><br>
               <asp:Button ID="btnFiltrar" runat="server" OnClick="btnFiltrar_Click" Text="Buscar" />
           </div>
        </div>
        <br>

        
    </div>
      
  

      <div style= "margin-left: 10%">
        <p>
                
                <asp:GridView ID="grdListaContratos" CssClass="table" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="6" Width="90%" GridLines="Horizontal" OnSelectedIndexChanged="grdListaAdminRentals_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                         <asp:BoundField DataField="id_ctr_contrato" HeaderText="ID" Visible="False" />
                        <asp:BoundField DataField="ctr_numeroContrato" HeaderText="Contrato" />
                        <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                        <asp:BoundField DataField="ctr_fechainicio" HeaderText="Fecha de inicio" />
                        <asp:BoundField DataField="ctr_fechafinalizacion" HeaderText="Fecha de finalización" />
                        <asp:BoundField DataField="ctr_monto" HeaderText="Valor mensual" />
                        <asp:BoundField DataField="ctr_file" HeaderText="Contrato" />
                        <asp:BoundField DataField="alq_ubicacionExacta" HeaderText="Ubicación" />
                        <asp:HyperLinkField DataNavigateUrlFields="id_ctr_contrato" DataNavigateUrlFormatString="frm_EnvioModContrato?id_ctr_contrato={0}" Text="Solicitud de Modificar" />
                       
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>

                

            </p>

            </div>
           
    <br />

    <script src="../Scripts/Search.js"></script>

















</asp:Content>
