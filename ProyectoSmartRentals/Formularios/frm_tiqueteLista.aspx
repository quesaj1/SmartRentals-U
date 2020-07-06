<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_tiqueteLista.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_tiqueteLista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div id="divForm" style="margin-top:12%;">
            <h2 style="text-align: center">Lista de tiquetes</h2>

  
 
        <div  style="text-align: center;">
             
                <strong>
                <asp:HyperLink ID="hplAgregar" runat="server" Visible="false" NavigateUrl="frm_ContratoAgrega.aspx" >Agregar Nuevo Tiquete</asp:HyperLink>
                </strong>

           
         </div>

                   <div class="form-row" style="margin-top:5%; margin-bottom:5%">
                       <div class="form-group col-sm-3">
           
                </div>
              <div class="form-group col-sm-3">
                <!-- Ubicacion -->
                <label for="txtUbicacionExacta">Buscar: </label>
                   <asp:TextBox ID="txtSearch"  CssClass="form-control" onkeyup="Search_Gridview(this, 'ContentPlaceHolder1_grdListaTiquetes')"  runat="server" Height="31px" Width="195px"></asp:TextBox>
            </div>
              <div class="form-group col-sm-3">
                <!-- Tipo Propiedad -->
                <label for="txtTipoPropiedad">Estado</label>
                  <br/>
                

                  <asp:DropDownList ID="DropDownList1" class="custom-select"  CssClass="form-control" runat="server"  AppendDataBoundItems="true" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                      <asp:ListItem Value="0">Todos</asp:ListItem>
                       <asp:ListItem Value="1">Pendiente</asp:ListItem>
                       <asp:ListItem Value="2">En progreso</asp:ListItem>
                       <asp:ListItem Value="3">Completado</asp:ListItem>
                      </asp:DropDownList>
                 
            </div>
               

           
            
        
        </div>

      <div style= "margin-left: 10%">
        <p>
                
                <asp:GridView ID="grdListaTiquetes" CssClass="table" runat="server"  AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="6" Width="90%" GridLines="Horizontal">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                         <asp:BoundField DataField="tqt_id" HeaderText="N° Tiquete"/>
                        <asp:BoundField DataField="ctr_numeroContrato" HeaderText="Contrato" />
                        <asp:BoundField DataField="tqt_tipo_problema" HeaderText="Tipo Problema" />
                        <asp:BoundField DataField="tqt_titulo" HeaderText="Titulo" />
                        <asp:BoundField DataField="tqt_fecha_inicio" HeaderText="Fecha de inicio" />
                        <asp:BoundField DataField="tqt_fecha_finalizacion" HeaderText="Fecha de finalización" />
                        <asp:BoundField DataField="prv_nombrevariable" HeaderText="Proveedor" />
                 <%--       <asp:BoundField DataField="tqt_precio_reparacion" HeaderText="Costo" />--%>
                        <asp:BoundField DataField="tqt_estado" HeaderText="Estado" />
                        <asp:HyperLinkField DataNavigateUrlFields="tqt_id" DataNavigateUrlFormatString="frm_TiqueteModifica?tqt_id={0}" Text="Modificar" />
                      
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
             </div>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />

    <script src="../Scripts/Search.js"></script>
</asp:Content>
