<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_ProveedorLista.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_ProveedorLista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .fa fa-search {
            position: absolute;
            margin-left: -10px;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <div id="divForm" style="margin-top: 12%; margin-left: 15%; margin-right: 15%">

        <h2 style="text-align: center">Lista de Proveedores</h2>




        <div class="form-row" style="margin-top: 5%; margin-bottom: 5%; overflow: hidden; padding-left: 25%; padding-right: 20%; text-align: center">

            <div style="text-align: center; padding: 1em; float: left">

                <!-- Id-->
                <label for="txt_Id">Buscar: &nbsp <i class="fa fa-search" style="font-size: 17px"></i></label>
                <br />
                <asp:TextBox ID="txtSearch" CssClass="form-control" onkeyup="Search_Gridview(this, 'ContentPlaceHolder1_grdProveedor')" runat="server" Height="31px" Width="195px"></asp:TextBox>
            </div>
            &nbsp&nbsp&nbsp&nbsp&nbsp
            
           <div style="text-align: center; padding: 1em; float: left">
               <!-- Estado -->
               <label for="txtEstado">Estado</label>
               <br />
               <asp:DropDownList ID="DropDownList1" class="custom-select" CssClass="form-control" runat="server" AppendDataBoundItems="true" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1" ForeColor="Black">
                   <asp:ListItem Value="0">Activos</asp:ListItem>
                   <asp:ListItem Value="1">Desactivados</asp:ListItem>
               </asp:DropDownList>
           </div>


        </div>
        <br>


        <div style="text-align: center">

            <strong>
                <asp:HyperLink ID="hplAgregar" runat="server" NavigateUrl="frm_ProveedorAgregar.aspx" Font-Size="Medium">Agregar Nuevo Proveedor &nbsp <i class="fa fa-plus-circle" style="font-size:19px"></i></asp:HyperLink>

            </strong>
        </div>




    </div>

    <br />
    <div style="margin-left: 10%">
        <p>
            <!--DataGridView-->

            <asp:GridView ID="grdProveedor" runat="server" AllowPaging="True"  CssClass="table" AutoGenerateColumns="False" BackColor="White"  BorderColor="#E7E7FF" BorderStyle="None"  BorderWidth="1px" CellPadding="3" PageSize="6" Width="90%" GridLines="Horizontal" OnPageIndexChanging="grdProveedor_PageIndexChanging" >
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                     <asp:TemplateField HeaderText="Ítem">
                        <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                     </asp:TemplateField>
                    <asp:BoundField DataField="prv_NombreRepresentante" HeaderText="Nombre Representante" />
                    <asp:BoundField DataField="prv_PrimerApellido" HeaderText="Pirmer Apellido" />
                    <asp:BoundField DataField="prv_CedulaRepresentante" HeaderText="Cedula del Representante" />
                    <asp:BoundField DataField="prv_CedulaJuridica" HeaderText="Cedula Juridica" />
                    <asp:BoundField DataField="prv_Telefono" HeaderText="Telefono" />
                    <asp:BoundField DataField="prv_Email" HeaderText="Email del Proveedor" />
                    <asp:BoundField DataField="prv_TipoProveedor" HeaderText="Tipo de Proveedor" />
                    <asp:BoundField DataField="Provincia" HeaderText="Provincia" />
                     <asp:HyperLinkField HeaderText="Acciones" DataNavigateUrlFields="prv_IDProveedor" DataNavigateUrlFormatString="frm_ProveedorElimina?prv_IDProveedor={0}" Text='<i class="fa fa-pencil-square" style="font-size:24px"></i>' ItemStyle-Width="25px" />
                    <asp:HyperLinkField DataNavigateUrlFields="prv_IDProveedor" DataNavigateUrlFormatString="frm_ProveedorModifica?prv_IDProveedor={0}" Text='<i class="fa fa-trash" style="font-size:25px; color:red"></i>' ItemStyle-Width="25px" />


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






    <script src="../Scripts/Search.js"></script>



</asp:Content>
