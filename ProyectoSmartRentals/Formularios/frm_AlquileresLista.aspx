﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_AlquileresLista.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_AlquileresLista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  

    <div style="margin-top: 12%; text-align: center;">
        <h2>Lista de Alquileres</h2>

        <div class="form-row" style="margin: 5%;">

            <div class="form-group col-md-4" >

                <!-- Id-->
                <label for="txt_Id">Id de Propiedad</label>
                 <asp:DropDownList ID="DropDownListId" DataTextField="alq_id_Propiedad" CssClass="form-control"  runat="server" AutoPostBack="True" OnSelectedIndexChanged="IdSeleccion"></asp:DropDownList> 
            </div> 
            
            <div class="form-group col-md-4">
                <!-- Propiedad-->
                <label for="txtTipoPropiedad">Tipo de Propiedad</label>
            

                <asp:TextBox ID="txtipoPropiedad" type="text" CssClass="form-control" placeholder="Tipo de Propiedad" runat="server" MaxLength="50" ></asp:TextBox>             
            </div>

           
        </div>

        <div>
            <asp:Button ID="btnFiltrar" runat="server" OnClick="btnFiltrar_Click" Text="Filtrar Información" />

            <br />
            <br />

            <strong>
                <asp:HyperLink ID="hplAgregar" runat="server" NavigateUrl="frm_AlquilerAgrega.aspx">Agregar Nuevo Alquiler</asp:HyperLink>
            </strong>
        </div>

    </div>

    <br />
    <div style="margin-left: 10%">
        <p>

            <asp:GridView ID="grdListaAlquileres" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="6" Width="90%" GridLines="Horizontal">
                     <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="alq_id_Propiedad" HeaderText="Id de Propiedad" />
                    <asp:BoundField DataField="alq_UbicacionExacta" HeaderText="Ubicacion Exacta" />
                    <asp:BoundField DataField="alq_TipoPropiedad" HeaderText="Tipo de Propiedad" />
                    <asp:BoundField DataField="alq_Detalles" HeaderText="Detalles" />
                    <asp:BoundField DataField="Id_Distrito" HeaderText="Distrito" />
                    <asp:BoundField DataField="Id_Canton" HeaderText="Canton" />
                    <asp:BoundField DataField="Id_Provincia" HeaderText="Provincia" />
                    <asp:TemplateField HeaderText="Galería">
                        <ItemTemplate>
                            <asp:Image DataField="alq_ImagenURL" runat="server" CssClass="rounded" ID="ImagenURL" ImageUrl='<%# Eval("alq_ImagenURL") %>' Width="150px" Height="140px" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:HyperLinkField DataNavigateUrlFields="alq_id_Propiedad" DataNavigateUrlFormatString="frm_AlquileresModifica?alq_id_Propiedad={0}" Text="Modificar" />
                    <asp:HyperLinkField DataNavigateUrlFields="alq_id_Propiedad" DataNavigateUrlFormatString="frm_AlquilerElimina?alq_id_Propiedad={0}" Text="Eliminar" />
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



























