<%@ Page Title="Operaciones de usuario" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OperacionesDeUsuario.aspx.cs" Inherits="Listas.OperacionesDeUsuario" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Operaciones de usuario</h2>

    <h4><asp:Label runat="server" ID="lblNombreCompleto" /></h4>
        
    <asp:ListView runat="server" ID="lvOperaciones" 
        ItemType="Listas.Operacion" SelectMethod="lvOperaciones_GetData" >
        <LayoutTemplate>
            <ul class="operaciones-list">
                <li runat="server" id="itemPlaceHolder" />
            </ul>
        </LayoutTemplate>
        <ItemTemplate>
            <li runat="server">
                <a href="<%# Item.Url %>" class="btn btn-info"><%# Item.Nombre %></a>
            </li>
        </ItemTemplate>
        <ItemSeparatorTemplate>
            <li>•</li>
        </ItemSeparatorTemplate>
        <EmptyDataTemplate>
            El usuario no tiene ninguna operación asignada.
        </EmptyDataTemplate>
    </asp:ListView>
   
</asp:Content>
