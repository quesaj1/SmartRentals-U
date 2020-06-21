<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_AdminRentalsLista.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_AdminRentalLista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      
    <div style="margin-top:12%; text-align:center;">
            <h2>Lista de Administradores</h2>

        <div class="form-row" style="margin:5%;">
             <div class="form-group col-md-4">
        
                <label for="txtCedula">Cedula</label>
                <asp:TextBox ID="txtCedula" type="text" CssClass="form-control" placeholder="Cédula" runat="server" MaxLength="25"></asp:TextBox>
            </div>
              <div class="form-group col-md-4">
           
                <label for="txtNombre">Nombre</label>
                <asp:TextBox ID="txtNombre" type="text" CssClass="form-control" placeholder="Nombre" runat="server" MaxLength="50"></asp:TextBox>
            </div>
              <div class="form-group col-md-4">
           
                <label for="txtSegundoNombre">Segundo Nombre</label>
                <asp:TextBox ID="txtSegundoNombre" type="text" CssClass="form-control" placeholder="Segundo Nombre" runat="server" MaxLength="50"></asp:TextBox>             
            </div>
              <div class="form-group col-md-4">
           
                <label for="txtPrimerApellido">Primer Apellido</label>
                <asp:TextBox ID="txtPrimerApellido" type="text" CssClass="form-control" placeholder="Primer Apellido" runat="server" MaxLength="50"></asp:TextBox>
            </div>
              <div class="form-group col-md-4">
              
                <label for="txtSegundoApellido">Segundo Apellido</label>
                <asp:TextBox ID="txtSegundoApellido" type="text" CssClass="form-control" placeholder="Segundo Apellido" runat="server" MaxLength="50"></asp:TextBox>
            </div>
         <div class="form-group col-md-4">
                
                <label for="txtEmail">Email</label>
                <asp:TextBox ID="txtEmail" type="text" CssClass="form-control" placeholder="Email" runat="server" MaxLength="50"></asp:TextBox>
            </div>
            </div>
 
        <div>
                <asp:Button ID="btnFiltrar" runat="server" OnClick="btnFiltrar_Click" Text="Filtrar Información" />
            <br /><br />
                <strong>
                <asp:HyperLink ID="hplAgregar" runat="server" NavigateUrl="frm_AdminRentalsAgrega.aspx">Agregar Nuevo Administrador</asp:HyperLink>
                </strong>
         </div>
            
        
        </div>
    <br />
    <div style= "margin-left: 10%">
        <p>
                
                <asp:GridView ID="grdListaAdminRentals" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="6" Width="90%" GridLines="Horizontal">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="adr_Cedula" HeaderText="Cédula" />
                        <asp:BoundField DataField="adr_Nombre" HeaderText="Nombre" />
                        <asp:BoundField DataField="adr_SegundoNombre" HeaderText="Segundo Nombre" />
                        <asp:BoundField DataField="adr_PrimerApellido" HeaderText="Primer Apellido" />
                        <asp:BoundField DataField="adr_SegundoApellido" HeaderText="Segundo Apellido" />
                        <asp:BoundField DataField="adr_FechaNacimiento" HeaderText="Fecha Nacimiento" />
                        <asp:BoundField DataField="adr_TelefonoCasa" HeaderText="Telefono Casa" />
                        <asp:BoundField DataField="adr_TelefonoCelular" HeaderText="Telefono Celular" />
                        <asp:BoundField DataField="adr_Email" HeaderText="Email" />
                        <asp:HyperLinkField DataNavigateUrlFields="adr_id_admin" DataNavigateUrlFormatString="frm_AdminRentalsModifica?adr_id_admin={0}" Text="Modificar" />
                        <asp:HyperLinkField DataNavigateUrlFields="adr_id_admin" DataNavigateUrlFormatString="frm_AdminRentalsElimina?adr_id_admin={0}" Text="Eliminar" />
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
           
            <p>
                &nbsp</p>
        </div>

</asp:Content>
