<%@ Page Title="Estadísticas de uso" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EstadisticasDeUso.aspx.cs" Inherits="Listas.EstadisticasDeUso" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Estadísticas de uso</h2>

    <asp:GridView runat="server" ID="gvEstadisticas" 
        AutoGenerateColumns="false"
        AllowPaging="true" PageSize="15" AllowSorting="true"
        ItemType="Listas.UsuarioEstadisticasDeUso" SelectMethod="gvEstadisticas_GetData"
        ShowFooter="true" CssClass="table table-bordered table-condensed">
        <Columns>
            <asp:BoundField DataField="NombreCompleto" HeaderText="Usuario" SortExpression="NombreCompleto" />
            <asp:TemplateField HeaderText="Cant. de ingresos" SortExpression="CantidadDeIngresos" >
                <ItemTemplate>
                    <span class="pull-right"><%# Item.CantidadDeIngresos %></span>
                </ItemTemplate>
                <FooterTemplate>
                    <span class="pull-right">Total: <%# CantidadIngresosTotal %></span>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Ultimo ingreso" SortExpression="UltimoIngreso" >
                <ItemTemplate>
                    <span class="pull-right"><%# Item.UltimoIngreso.ToString("dd/MM/yyyy") %></span>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cant. de operaciones" SortExpression="CantidadDeOperaciones" >
                <ItemTemplate>
                    <a href="/OperacionesDeUsuario?uid=<%# Item.Id %>" class="pull-right"><%# Item.CantidadDeOperaciones %></a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <SortedAscendingHeaderStyle CssClass="asc" />
        <SortedDescendingHeaderStyle CssClass="desc" />
        <SortedAscendingCellStyle CssClass="asc" />
        <SortedDescendingCellStyle CssClass="desc" />
        <PagerSettings Mode="Numeric" PageButtonCount="5" Position="TopAndBottom" /> 
        <PagerStyle CssClass="grid-pager" />
    </asp:GridView>
</asp:Content>
