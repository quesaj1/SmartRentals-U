<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/MasterPage/MasterSmartRentals.Master" AutoEventWireup="true" CodeBehind="frm_ReporteAdminRentals.aspx.cs" Inherits="ProyectoSmartRentals.Formularios.frm_ReporteAdminRentals" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <br /><br /><br /> <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
       <div class="form-row" style="margin-top:5%; margin-bottom:5%">
            <div class="form-group col-md-6">
                <!-- Nombre -->
                <label for="txtNombre">Nombre</label>
                <asp:TextBox ID="txtNombre" type="text" CssClass="form-control" placeholder="Nombre" runat="server" MaxLength="25"></asp:TextBox>
            </div>
            <div class="form-group col-md-6">
                <br />
           <asp:Button ID="Button1" runat="server" Text="Generar Reporte" class="btn btn-primary" OnClick="Button1_Click" />
            </div>
           </div>
       
        <rsweb:ReportViewer ID="RpvAdminRentals" runat="server" Height="800px" Width="80%" Visible="False"></rsweb:ReportViewer>

        
     
        <asp:Label ID="Label1" runat="server"  ForeColor="Red"></asp:Label>
    </div>
</asp:Content>
