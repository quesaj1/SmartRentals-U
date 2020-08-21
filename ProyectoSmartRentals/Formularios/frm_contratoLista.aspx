<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_contratoLista.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_contratoLista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <div id="divForm" style="margin-top:12%;">
            <h2 style="text-align: center">Lista de contratos</h2>

  
 
        <div  style="text-align: center;">
             
                <strong>
                <asp:HyperLink ID="hplAgregar" runat="server" Visible="false" NavigateUrl="frm_ContratoAgregar.aspx" >Agregar Nuevo Contrato</asp:HyperLink>
                </strong>

           
         </div>

                   <div class="form-row" style="margin-top:5%; margin-bottom:5%">
                       <div class="form-group col-sm-3">
           
                </div>
              <div class="form-group col-sm-3">
                <!-- Ubicacion -->
                <label for="txtUbicacionExacta">Buscar: </label>
                   <asp:TextBox ID="txtSearch" ForeColor="Black" CssClass="form-control" onkeyup="Search_Gridview(this, 'ContentPlaceHolder1_grdListaContratos')"  runat="server" Height="31px" Width="195px"></asp:TextBox>
            </div>
              <div class="form-group col-sm-3">
                <!-- Tipo Propiedad -->
                <label for="txtTipoPropiedad">Estado</label>
                  <br/>
                

                  <asp:DropDownList ID="DropDownList1" class="custom-select" ForeColor="Black" CssClass="form-control" runat="server"  AppendDataBoundItems="true" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                      <asp:ListItem Value="0">Activos</asp:ListItem>
                       <asp:ListItem Value="1">Desactivados</asp:ListItem>
                    
                      </asp:DropDownList>
                 
            </div>
               

           
            
        
        </div>

      <div style= "margin-left: 10%">
        <p>
                
                <asp:GridView ID="grdListaContratos" CssClass="table" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="6" Width="90%" GridLines="Horizontal" OnPageIndexChanging="grdListaContratos_PageIndexChanging" OnSelectedIndexChanged="grdListaContratos_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:TemplateField HeaderText="Ítem">
                        <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="id_ctr_contrato" HeaderText="ID" Visible="False" />
                        <asp:BoundField DataField="ctr_numeroContrato" HeaderText="Contrato" />
                        <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                        <asp:BoundField DataField="ctr_fechainicio" dataformatstring="{0:d}" HeaderText="Fecha de inicio" />
                        <asp:BoundField DataField="ctr_fechafinalizacion"  dataformatstring="{0:d}" HeaderText="Fecha de finalización" />
                        <asp:BoundField DataField="ctr_fechaPago"  dataformatstring="{0:d}" HeaderText="Fecha de pagos" />
                        <asp:BoundField DataField="ctr_monto" HeaderText="Valor mensual" />
                       
                        <asp:BoundField DataField="alq_ubicacionExacta" HeaderText="Ubicación"  />
                         <asp:HyperLinkField  DataNavigateUrlFields="ctr_file" Text="Contrato" HeaderText="Contrato"  />
                        <asp:HyperLinkField  HeaderText="Acciones" DataNavigateUrlFields="id_ctr_contrato" DataNavigateUrlFormatString="frm_ContratoModifica?id_ctr_contrato={0}" Text='<i class="fa fa-pencil-square" style="font-size:24px"></i>' ItemStyle-Width="25px" />
                        <asp:HyperLinkField  DataNavigateUrlFields="id_ctr_contrato" DataNavigateUrlFormatString="frm_ContratoElimina?id_ctr_contrato={0}" Text='<i class="fa fa-trash" style="font-size:25px; color:red;"></i>' ItemStyle-Width="25px" />
                           
                        <%--<asp:HyperLinkField DataNavigateUrlFields="id_ctr_contrato" DataNavigateUrlFormatString="frm_ContratoModifica?id_ctr_contrato={0}" Text="Modificar" />
                        <asp:HyperLinkField DataNavigateUrlFields="id_ctr_contrato" DataNavigateUrlFormatString="frm_ContratoElimina?id_ctr_contrato={0}" Text="Eliminar" />--%>
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
    <br />

    <script src="../Scripts/Search.js"></script>
</asp:Content>
