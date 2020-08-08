<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_ListaReportarPago.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_ListaReportarPago" %>
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

       <h2 style="text-align: center">Lista de Reportes de Pagos realizados</h2>

        <div class="form-row" style="margin-top:5%; margin-bottom:5%;overflow:hidden; padding-left:25%;padding-right:20%; text-align:center">

            <div  style="text-align:center; padding:1em ;float:left"  >

                <!-- Id-->
                <label for="txt_Id">Buscar: &nbsp <i class="fa fa-search" style="font-size:17px"></i></label><br />
                 <asp:TextBox ID="txtSearch"  CssClass="form-control" onkeyup="Search_Gridview(this, 'ContentPlaceHolder1_grdListaPagos')"  runat="server" Height="31px" Width="195px" ></asp:TextBox>
            </div> &nbsp&nbsp

            <!-- Estado -->
           <div style="text-align:center; padding:1em ;float:left"  >
                <label for="txtEstadoPagos">Estado de Pagos Realizados</label>
                  <br/>             
                  <asp:DropDownList ID="DropDownList1" class="custom-select"  CssClass="form-control" runat="server"  AppendDataBoundItems="true" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" ForeColor="Black">
                      <asp:ListItem Value="0">Pagos Pendientes</asp:ListItem>
                       <asp:ListItem Value="1">Pagos Realizados</asp:ListItem>
                      </asp:DropDownList>
            </div>

           
        </div><br>

        <div style="text-align:center">

            <strong>
                <asp:HyperLink ID="hplAgregar" runat="server" NavigateUrl="frm_ReportarPagoAgregar.aspx" Font-Size="Medium">Agregar Nuevo Pago &nbsp <i class="fa fa-plus-circle" style="font-size:19px"></i></asp:HyperLink>
            </strong>
        </div>

    </div>


      <div style= "margin-left: 10%">
        <p>
                <asp:GridView ID="grdListaPagos" CssClass="table" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="6" Width="90%" GridLines="Horizontal" OnPageIndexChanging="grdListaPagos_PageIndexChanging" OnSelectedIndexChanging="grdListaPagos_SelectedIndexChanging" >
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:TemplateField HeaderText="Ítem">
                        <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                        </asp:TemplateField>
                         <asp:BoundField DataField="rpp_IDReportarPago" HeaderText="ID Pago" Visible="False" />
                        <asp:BoundField DataField="ctr_numeroContrato" HeaderText="Contrato" />
                        <asp:BoundField DataField="cli_Email" HeaderText="Email del Cliente" />
                        <asp:BoundField DataField="datosCliente" HeaderText="Datos del cliente " />
                        <asp:BoundField DataField="ctr_fechaPago" HeaderText="Fecha de pago" />
                        <asp:BoundField DataField="ctr_monto" HeaderText="Valor mensual" />
                        <asp:BoundField DataField="rpp_FechaPagoRecibido" HeaderText="Fecha de Pago Recibido" />
                         <asp:BoundField DataField="rpp_DetallesDePago" HeaderText="Detalles del Pago" />
                        <asp:HyperLinkField DataNavigateUrlFields="rpp_IDReportarPago" DataNavigateUrlFormatString="frm_ArchivarPagos?rpp_IDReportarPago={0}" HeaderText="Acciones" Text="&lt;i class=&quot;fa fa-archive&quot; style=&quot;font-size:24px&quot;&gt;&lt;/i&gt;" />
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
           
    <br/>
    <script src="../Scripts/Search.js"></script>
</asp:Content>
