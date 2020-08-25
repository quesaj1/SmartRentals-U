<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_AdminRentalsLista.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_AdminRentalLista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      
    <div style="margin-top:12%; text-align:center;">
            <h2>Lista de Administradores</h2>


    <div class="form-row" style="margin-top:5%; margin-bottom:5%;overflow:hidden; padding-left:33%;padding-right:20%; text-align:center">        
          <div  style="text-align:center; padding:1em ;float:left"  >

                <!-- Id-->
                 <label for="txt_Id">Buscar: &nbsp <i class="fa fa-search" style="font-size:17px"></i></label><br />
               <asp:TextBox ID="txtSearch"   CssClass="form-control" onkeyup="Search_Gridview(this, 'ContentPlaceHolder1_grdListaAdminRentals')"  runat="server" Height="35px" Width="195px"></asp:TextBox>    
            </div> &nbsp&nbsp&nbsp&nbsp&nbsp
        
        <div style="text-align:center">

            <strong>
                <asp:HyperLink ID="hplAgregar" runat="server" NavigateUrl="frm_AdminRentalsLista.aspx" Font-Size="Medium">Agregar Nuevo Alquiler &nbsp <i class="fa fa-plus-circle" style="font-size:19px"></i></asp:HyperLink>
            </strong>
        </div>
        </div>
    <br />
    <div style= "margin-left: 10%">
        <p>
                
                <asp:GridView ID="grdListaAdminRentals" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="100" Width="90%" GridLines="Horizontal">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:TemplateField HeaderText="Ítem">
                        <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                     </asp:TemplateField>
                        <asp:BoundField DataField="adr_Cedula" HeaderText="Cédula" />
                        <asp:BoundField DataField="adr_Nombre" HeaderText="Nombre" />
                        <asp:BoundField DataField="adr_SegundoNombre" HeaderText="Segundo Nombre" />
                        <asp:BoundField DataField="adr_PrimerApellido" HeaderText="Primer Apellido" />
                        <asp:BoundField DataField="adr_SegundoApellido" HeaderText="Segundo Apellido" />
                        <asp:BoundField DataField="adr_FechaNacimiento" HeaderText="Fecha Nacimiento" />
                        <asp:BoundField DataField="adr_TelefonoCasa" HeaderText="Telefono Casa" />
                        <asp:BoundField DataField="adr_TelefonoCelular" HeaderText="Telefono Celular" />
                        <asp:BoundField DataField="adr_Email" HeaderText="Email" />
                        <asp:HyperLinkField HeaderText="Acciones" DataNavigateUrlFields="adr_id_admin" DataNavigateUrlFormatString="frm_AdminRentalsModifica?adr_id_admin={0}" Text='<i class="fa fa-pencil-square" style="font-size:24px"></i>'>
                       <ItemStyle Width="25px"></ItemStyle>
                         </asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="adr_id_admin" DataNavigateUrlFormatString="frm_AdminRentalsElimina?adr_id_admin={0}" Text='<i class="fa fa-trash" style="font-size:25px; color:red"></i>' >
                    <ItemStyle Width="25px"></ItemStyle>
                         </asp:HyperLinkField>
                    
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

     <script src="../Scripts/Search.js"></script>

</asp:Content>
