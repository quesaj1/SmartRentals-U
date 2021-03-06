﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_AlquileresLista.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_AlquileresLista" %>

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

        <h2 style="text-align:center">Lista de Alquileres</h2>

        <div class="form-row" style="margin-top:5%; margin-bottom:5%;overflow:hidden; padding-left:33%;padding-right:20%; text-align:center">

            <div  style="text-align:center; padding:1em ;float:left"  >

                <!-- Id-->
                <label for="txt_Id">Buscar: &nbsp <i class="fa fa-search" style="font-size:17px"></i></label><br />
               <asp:TextBox ID="txtSearch"   CssClass="form-control" onkeyup="Search_Gridview(this, 'ContentPlaceHolder1_grdListaAlquileres')" runat="server" Height="35px" Width="195px"></asp:TextBox>
            </div> &nbsp&nbsp
            
           <div style="text-align:center; padding:1em ;float:left"  >
                <!-- Estado -->
                <label for="txtEstado">Estado</label>
                  <br/>
                
                  <asp:DropDownList ID="DropDownList1" Height="35px" Width="195px"  CssClass="form-control"  runat="server"  AppendDataBoundItems="true" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" ForeColor="Black">
                      <asp:ListItem  Value="0">Activos</asp:ListItem>
                       <asp:ListItem Value="1">Desactivados</asp:ListItem>
                    
                      </asp:DropDownList>
            </div>

           
        </div><br>

        <div style="text-align:center">

            <strong>
                <asp:HyperLink ID="hplAgregar" runat="server" NavigateUrl="frm_AlquilerAgrega.aspx" Font-Size="Medium">Agregar Nuevo Alquiler &nbsp <i class="fa fa-plus-circle" style="font-size:19px"></i></asp:HyperLink>
            </strong>
        </div>

    </div>

    <br />
    <div style="margin-left: 10%">
        <p>

            <asp:GridView ID="grdListaAlquileres" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" CssClass="table" BorderColor="#E7E7FF" BorderStyle="None"  BorderWidth="1px" CellPadding="3" PageSize="6" Width="90%" GridLines="Horizontal" OnPageIndexChanging="grdListaAlquileres_PageIndexChanging" OnSelectedIndexChanged="grdListaAlquileres_SelectedIndexChanged">
                     <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:TemplateField HeaderText="Ítem">
                        <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                        </asp:TemplateField>
                    <asp:TemplateField HeaderText="Galería">
                        <ItemTemplate>
                            <asp:Image DataField="alq_ImagenURL" runat="server" CssClass="rounded" ID="ImagenURL" ImageUrl='<%# Eval("alq_ImagenURL") %>' max-width="270px" Width="150" Height="150" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="alq_id_Propiedad" visible=False />
                    <asp:BoundField DataField="alq_UbicacionExacta" HeaderText="Ubicacion Exacta" />
                    <asp:BoundField DataField="alq_TipoPropiedad" HeaderText="Tipo de Propiedad" />
                    <asp:BoundField DataField="alq_Detalles" HeaderText="Detalles" />
                    <asp:BoundField DataField="Distrito" HeaderText="Distrito" />
                    <asp:BoundField DataField="Canton" HeaderText="Canton" />
                    <asp:BoundField DataField="Provincia" HeaderText="Provincia" />
                    <asp:HyperLinkField HeaderText="Acciones" DataNavigateUrlFields="alq_id_Propiedad" DataNavigateUrlFormatString="frm_AlquileresModifica?alq_id_Propiedad={0}" Text='<i class="fa fa-pencil-square" style="font-size:24px"></i>' ItemStyle-Width="25px" />
                    <asp:HyperLinkField DataNavigateUrlFields="alq_id_Propiedad" DataNavigateUrlFormatString="frm_AlquilerElimina?alq_id_Propiedad={0}" Text='<i class="fa fa-trash" style="font-size:25px; color:red"></i>' ItemStyle-Width="25px" />
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



























