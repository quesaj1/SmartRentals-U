<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_tiqueteLista.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_tiqueteLista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div id="divForm" style="margin-top: 12%; margin-left: 15%; margin-right: 15%">
      


        <h2 style="text-align: center">Lista de Tiquetes</h2>

         <div class="form-row" style="margin-top:5%; margin-bottom:5%;overflow:hidden; padding-left:33%;padding-right:20%; text-align:center">

            <div style="text-align: center; padding: 1em; float: left">

                <!-- Id-->
                <label for="txt_Id">Buscar: &nbsp <i class="fa fa-search" style="font-size: 17px"></i></label>
                <br />
                <asp:TextBox ID="txtSearch" CssClass="form-control" onkeyup="Search_Gridview(this, 'ContentPlaceHolder1_grdListaTiquetes')" runat="server" Height="35px" Width="195px"></asp:TextBox>
            </div>
            &nbsp&nbsp
            
           <div style="text-align: center; padding: 1em; float: left">
               <!-- Estado -->
               <label for="txtEstado">Estado</label>
               <br />

               <asp:DropDownList ID="DropDownList1" Height="35px" Width="195px" CssClass="form-control" runat="server" AppendDataBoundItems="true" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" ForeColor="Black">
                   <asp:ListItem Value="0">Todos</asp:ListItem>
                   <asp:ListItem Value="1">Pendiente</asp:ListItem>
                   <asp:ListItem Value="2">En progreso</asp:ListItem>
                   <asp:ListItem Value="3">Completado</asp:ListItem>

               </asp:DropDownList>
           </div>


        </div>
        <br>

        <div style="text-align: center">

            <strong>
                <asp:HyperLink ID="hplAgregar" runat="server" NavigateUrl="frm_crearTiquete.aspx" Font-Size="Medium">Crear un tiquete &nbsp <i class="fa fa-plus-circle" style="font-size:19px"></i></asp:HyperLink>
            </strong>
        </div>

    </div>

    <br />

    <div style="margin-left: 10%">
        <p>

            <asp:GridView ID="grdListaTiquetes" CssClass="table" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="6" Width="90%" GridLines="Horizontal" OnPageIndexChanging="grdListaTiquetes_PageIndexChanging" OnSelectedIndexChanged="grdListaTiquetes_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:TemplateField HeaderText="Ítem">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="tqt_id" HeaderText="N° Tiquete" />
                    <asp:BoundField DataField="ctr_numeroContrato" HeaderText="Contrato" />
                    <asp:BoundField DataField="tqt_tipo_problema" HeaderText="Tipo Problema" />
                    <asp:BoundField DataField="tqt_titulo" HeaderText="Titulo" />
                    <asp:BoundField DataField="tqt_fecha_inicio" HeaderText="Fecha de inicio" />
                    <asp:BoundField DataField="tqt_fecha_finalizacion" HeaderText="Fecha de finalización" />
                    <asp:BoundField DataField="prv_nombrevariable" HeaderText="Proveedor" />
                    <asp:BoundField DataField="tqt_precio_reparacion" HeaderText="Precio" />
                    <asp:BoundField DataField="tqt_nota_reparacion" HeaderText="Notas" />
                    <%--       <asp:BoundField DataField="tqt_precio_reparacion" HeaderText="Costo" />--%>
                    <asp:BoundField DataField="tqt_estado" HeaderText="Estado" />
                    <%--<asp:HyperLinkField DataNavigateUrlFields="tqt_id" DataNavigateUrlFormatString="frm_TiqueteModifica?tqt_id={0}" Text="Modificar" />--%>
                    <asp:HyperLinkField HeaderText="Acciones" DataNavigateUrlFields="tqt_id" DataNavigateUrlFormatString="frm_TiqueteModifica?tqt_id={0}" Text='<i class="fa fa-info-circle" style="font-size:24px"></i>' ItemStyle-Width="25px" />
                    <asp:HyperLinkField HeaderText="Acciones" DataNavigateUrlFields="tqt_id" DataNavigateUrlFormatString="frm_TiqueteModifica?tqt_id={0}" Text='<i class="fa fa-pencil-square" style="font-size:24px"></i>' ItemStyle-Width="25px" />
                    <%--<asp:HyperLinkField  DataNavigateUrlFields="tqt_id" DataNavigateUrlFormatString="frm_ContratoElimina?id_ctr_contrato={0}" Text='<i class="fa fa-trash" style="font-size:25px; color:red;"></i>' ItemStyle-Width="25px" />--%>
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
