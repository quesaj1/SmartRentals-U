<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_ProveedorLista.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_ProveedorLista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



        <div style="margin-top: 12%; text-align:center;">
        <h2>Lista de Proveedores</h2>

        <div class="form-row" style="margin:5%;">
              <!-- Nombre Representante -->
            <div class="form-group col-md-6 text-align:center;">
                <label for="txtNombreRepresentante"></label>
                <asp:TextBox ID="txtNombreRepresentante" type="text" CssClass="form-control" placeholder="Nombre Representante" runat="server" MaxLength="50"></asp:TextBox>
            </div>


            
              <!--Cedula Representante-->
              <div class="form-group col-md-6">
                <label for="txtCedulaRepresentante"></label>               
                <asp:TextBox ID="txtCedulaRepresentante" type="text" CssClass="form-control" placeholder="Cedula Representante" runat="server" MaxLength="12"></asp:TextBox>             
            </div>


              <!--Cedula Juridica-->
              <div class="form-group col-md-6">
                <label for="txtCedulaJuridica"></label>                
                <asp:TextBox ID="txtCedulaJuridica" type="text" CssClass="form-control" placeholder="Cedula Juridica" runat="server" MaxLength="12"></asp:TextBox>             
            </div>


            <!--Email-->
              <div class="form-group col-md-6">
                <label for="txtEmail"></label>                 
                <asp:TextBox ID="txtEmail" type="text" CssClass="form-control" placeholder="Email" runat="server" MaxLength="50"></asp:TextBox>             
            </div>

             <br />
            <br />

            <!--Submit-->
            <div>
            <asp:Button ID="btnFiltrar" runat="server" OnClick="btnFiltrar_Click" Text="Filtrar Información" />

            <br />
            <br />

            <strong>
                <asp:HyperLink ID="hplAgregar" runat="server" NavigateUrl="frm_ProveedorAgregar.aspx">Agregar Nuevo Proveedor</asp:HyperLink>
            </strong>
        </div>

          </div>

           </div>

    <br />
    <div style="margin-left: 10%">
        <p>
             <!--DataGridView-->
            <asp:GridView ID="grdProveedor" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="6" Width="90%" GridLines="Horizontal" OnPageIndexChanging="grdProveedor_PageIndexChanging">
                     <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="prv_NombreVariable" HeaderText="Nombre del Proveedor" />
                    <asp:BoundField DataField="prv_NombreRepresentante" HeaderText="Nombre Representante" />
                    <asp:BoundField DataField="prv_PrimerApellido" HeaderText="Primer Apellido" />
                    <asp:BoundField DataField="prv_SegundoApellido" HeaderText="Segundo Apellido" />
                    <asp:BoundField DataField="prv_CedulaRepresentante" HeaderText="Cedula del Representante" />
                    <asp:BoundField DataField="prv_CedulaJuridica" HeaderText="Cedula Juridica" />
                    <asp:BoundField DataField="prv_Telefono" HeaderText="Telefono" />
                    <asp:BoundField DataField="prv_Email" HeaderText="Email del Proveedor" />
                    <asp:BoundField DataField="prv_TipoProveedor" HeaderText="Tipo de Proveedor" />
                    <asp:BoundField DataField="Id_Provincia" HeaderText="Provincia" />
                    <asp:BoundField DataField="prv_OtrasSenas" HeaderText="Otros Comentarios" />

                    <asp:HyperLinkField DataNavigateUrlFields="prv_IDProveedor" DataNavigateUrlFormatString="frm_ProveedorModifica?prv_IDProveedor={0}" Text="Modificar" />
                    <asp:HyperLinkField DataNavigateUrlFields="prv_IDProveedor" DataNavigateUrlFormatString="frm_ProveedorElimina?prv_IDProveedor={0}" Text="Eliminar" />
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
            &nbsp
        </p>
    </div>

</asp:Content>
