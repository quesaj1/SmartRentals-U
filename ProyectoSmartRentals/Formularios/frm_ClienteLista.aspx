<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_ClienteLista.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_ClienteLista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


          
    <div id="divForm" style="margin-top: 12%; margin-left: 15%; margin-right: 15%">

        <h2 style="text-align:center">Lista de Clientes</h2>

        <div class="form-row" style="margin-top:5%; margin-bottom:5%">

            <div class="form-group col-sm-3" >

                <!-- Id-->
                <label for="txt_Id">Buscar:</label><br />
               <asp:TextBox ID="txtSearch"   CssClass="form-control" onkeyup="Search_Gridview(this, 'ContentPlaceHolder1_grdListaClientes')"  runat="server" Height="31px" Width="195px"></asp:TextBox>    
            </div> &nbsp&nbsp&nbsp&nbsp&nbsp
            
           <div class="form-group col-sm-3" >
                <!-- Estado -->
                <label for="txtEstado">Estado</label>
                  <br/>
                <asp:DropDownList ID="DropDownList1" class="custom-select"  CssClass="form-control" runat="server"  AppendDataBoundItems="true" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" >
                      <asp:ListItem Value="0">Activos</asp:ListItem>
                       <asp:ListItem Value="1">Desactivados</asp:ListItem>
                   
                      </asp:DropDownList>
            </div>

           
        </div><br>

        <div style="text-align:center">

           
            <strong>
                <asp:HyperLink ID="hplAgregar" runat="server" NavigateUrl="frm_ClienteAgregar.aspx">Agregar Nuevo Cliente</asp:HyperLink>
            </strong>
        </div>

    </div>





    <br />
    <div style= "margin-left: 10%">
        <p>
                
                <asp:GridView ID="grdListaClientes" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="6" Width="90%" GridLines="Horizontal">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="cli_Cliente" HeaderText="ID del Cliente" />
                        <asp:BoundField DataField="cli_Cedula" HeaderText="Cedula" />
                        <asp:BoundField DataField="cli_Nombre" HeaderText="Nombre del Cliente" />
                        <asp:BoundField DataField="cli_PrimerApelido" HeaderText="Primer Apellido" />
                        <asp:BoundField DataField="cli_SegundoApellido" HeaderText="Segundo Apellido" />
                        <asp:BoundField DataField="cli_FechaNacimiento" HeaderText="Fecha Nacimiento" />
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
