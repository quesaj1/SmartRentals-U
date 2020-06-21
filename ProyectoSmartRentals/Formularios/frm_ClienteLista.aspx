<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_ClienteLista.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_ClienteLista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


          
    <div style="margin-top:12%; text-align:center;">
            <h2>Lista de Clientes</h2>

        <div class="form-row" style="margin:5%;">
             <div class="form-group col-md-4">
        
                <label for="txtCedula"></label>
                <asp:TextBox ID="txtCedula" type="text" CssClass="form-control" placeholder="Cédula" runat="server" MaxLength="25"></asp:TextBox>
            </div>
              <div class="form-group col-md-4">
           
                <label for="txtNombre"></label>
                <asp:TextBox ID="txtNombre" type="text" CssClass="form-control" placeholder="Nombre" runat="server" MaxLength="50"></asp:TextBox>
            </div>
              <div class="form-group col-md-4">
           
                <label for="txtSegundoNombre"></label>
                <asp:TextBox ID="txtSegundoNombre" type="text" CssClass="form-control" placeholder="Segundo Nombre" runat="server" MaxLength="50"></asp:TextBox>             
            </div>
              <div class="form-group col-md-4">
           
                <label for="txtPrimerApellido"></label>
                <asp:TextBox ID="txtPrimerApellido" type="text" CssClass="form-control" placeholder="Primer Apellido" runat="server" MaxLength="50"></asp:TextBox>
            </div>
              <div class="form-group col-md-4">
              
                <label for="txtSegundoApellido"></label>
                <asp:TextBox ID="txtSegundoApellido" type="text" CssClass="form-control" placeholder="Segundo Apellido" runat="server" MaxLength="50"></asp:TextBox>
            </div>

            <div class="form-group col-md-4">
              
                <label for="txtTelefonoCasa"></label>
                <asp:TextBox ID="txtTelefonoCasa" type="text" CssClass="form-control" placeholder="Telefono Casa" runat="server" MaxLength="50"></asp:TextBox>
            </div>

                <div class="form-group col-md-4">
              
                <label for="txtTelefonoCelular"></label>
                <asp:TextBox ID="txtTelefonoCelular" type="text" CssClass="form-control" placeholder="Telefono Celular" runat="server" MaxLength="50"></asp:TextBox>
            </div>

         <div class="form-group col-md-4">
                
                <label for="txtEmail"></label>
                <asp:TextBox ID="txtEmail" type="text" CssClass="form-control" placeholder="Email" runat="server" MaxLength="50"></asp:TextBox>
            </div>
            </div>
 
        <div>
                <asp:Button ID="btnFiltrar" runat="server" OnClick="btnFiltrar_Click" Text="Filtrar Información" />
            <br /><br />
                <strong>
                <asp:HyperLink ID="hplAgregar" runat="server" NavigateUrl="~/Formularios/frm_ClienteAgregar.aspx">Agregar Nuevo Cliente</asp:HyperLink>
                </strong>
         </div>
            
        
        </div>
    <br />
    <div style= "margin-left: 10%">
        <p>
                
                <asp:GridView ID="grdListaClientes" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="6" Width="90%" GridLines="Horizontal" OnPageIndexChanging="grdListaClientes_PageIndexChanging">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="cli_Cedula" HeaderText="Cédula del Cliente" />
                        <asp:BoundField DataField="cli_Nombre" HeaderText="Nombre del Cliente" />
                        <asp:BoundField DataField="cli_SegundoNombre" HeaderText="Segundo Nombre" />
                        <asp:BoundField DataField="cli_PrimerApelido" HeaderText="Primer Apellido" />
                        <asp:BoundField DataField="cli_SegundoApellido" HeaderText="Segundo Apellido" />
                        <asp:BoundField DataField="cli_TelefonoCasa" HeaderText="Telefono Casa" />
                        <asp:BoundField DataField="cli_TelefonoCelular" HeaderText="Telefono Celular" />
                        <asp:BoundField DataField="cli_Email" HeaderText="Email del Cliente" />
                        <asp:HyperLinkField DataNavigateUrlFields="cli_Cliente" DataNavigateUrlFormatString="frm_ClienteModifica?cli_Cliente={0}" Text="Modificar" />
                        <asp:HyperLinkField DataNavigateUrlFields="cli_Cliente" DataNavigateUrlFormatString="frm_ClienteElimina?cli_Cliente={0}" Text="Eliminar" />
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
