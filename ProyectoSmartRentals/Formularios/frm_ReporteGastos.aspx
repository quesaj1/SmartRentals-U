<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_ReporteGastos.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_ReporteGastos" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <div id="divForm" style="margin-top: 12%; margin-left: 15%; margin-right: 15%">
        <br /><br /><br /> <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      
              <br /><br />
            <h1 style="text-align: center">Reporte de Gastos</h1><br />
            <p style="text-align: center">Buscar por</p><br />

            <div style="text-align:center"  width:30%; margin:0 auto>
                <!-- Nombre -->
                <label for="txtCategoria" style="font-weight:bold">Categoría</label><br /><br />
                 <asp:DropDownList ID="DropDownTipo" placeholder="Cliente" DataTextField="Cliente" CssClass="col-xs-5" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="0">Seleccione una categoría</asp:ListItem>
                     <asp:ListItem Value="1">Eléctrico</asp:ListItem>
                      <asp:ListItem Value="2">Fontaneria</asp:ListItem>
                      <asp:ListItem Value="3">Cerrajeria</asp:ListItem>

                  </asp:DropDownList>
            </div><br /><br />

            <div style="text-align:center; width:30%; margin:0 auto" >
                 <label for="txtFecha" style="font-weight:bold">Fecha</label><br /><br />
                <!-- Fecha Inicial -->
                <label for="txtFechaInicio">Fecha Inicio</label><br />
                <asp:Calendar ID="Calendar2" runat="server" CssClass="accordion" Width="100%"  >
                    <TitleStyle BackColor="#55407D" ForeColor="White" />
                </asp:Calendar>
                </div><br /><br />

           <div style="text-align:center; width:30%; margin:0 auto" >
                 <!-- Fecha Final -->
                <label for="txtFechaFinal">Fecha Final</label><br />
               <asp:Calendar ID="Calendar1" runat="server" CssClass="accordion" Width="100%" >
                   <TitleStyle BackColor="#55407D" ForeColor="White" />
                </asp:Calendar>
            </div>
       
            <div style="text-align:center">
                <br /><br />
           <asp:Button  ID="Button1"  runat="server" Text="Generar Reporte" class="btn btn-primary" OnClick="Button1_Click" />
            </div><br /><br />
     
        <asp:Label ID="Label1" runat="server" style="text-align:center" ForeColor="Red"></asp:Label>
    </div>





</asp:Content>
