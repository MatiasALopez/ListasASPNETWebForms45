<%@ Page Title="Usuarios" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="Listas.Usuarios" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Usuarios</h2>

    <div class="form-horizontal">
        <div class="form-group">
            <asp:CheckBox runat="server" ID="chkSoloActivos" Text="Mostrar sólo activos" AutoPostBack="true" />    
        </div>
        <div class="form-group">
            Cantidad de usuarios: <asp:Literal runat="server" ID="litCantidadDeUsuarios" />
        </div>
    </div>
    <asp:ListView runat="server" ID="lvUsuarios"
        ItemType="Listas.Usuario" SelectMethod="lvUsuarios_GetData"
        OnItemCommand="lvUsuarios_ItemCommand" >
        <LayoutTemplate>
            <div class="row">
                <div class="btn-group">
                    <asp:Button runat="server" CssClass="btn btn-default" Text="Ordenar por nombre" CommandName="Sort" CommandArgument="NombreCompleto" />
                    <asp:Button runat="server" CssClass="btn btn-default" Text="Ordenar por fecha creación" CommandName="Sort" CommandArgument="CreadoFecha" />
                </div>
            </div>
            <div class="row">
                <div runat="server" id="itemPlaceHolder" />
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <div runat="server" class="usuario-container">
                <div class="media">
                    <img src="<%# Item.FotoUrl %>" alt="Foto" width="80" height="80" class="pull-left media-object" />
                    <div class="media-body">
                        <h4 class="media-heading"><%# Item.NombreCompleto %></h4>
                        <p>
                            Operaciones disponibles: <a href="/OperacionesDeUsuario?uid=<%# Item.Id %>"><%# Item.Operaciones.Count %></a>
                        </p>
                        <small>Creado: <%# Item.CreadoFecha.ToString("dd/MM/yyyy") %></small>
                        <asp:LinkButton runat="server" ID="btnEliminar" Text="Eliminar" CssClass="pull-right" CommandName="Eliminar" CommandArgument="<%# Item.Id %>" />
                    </div>
                </div>
            </div>
        </ItemTemplate>
        <EmptyDataTemplate>
            No hay usuarios para mostrar.
        </EmptyDataTemplate>
    </asp:ListView>
    <asp:DataPager runat="server" ID="dpUsuarios" PagedControlID="lvUsuarios" PageSize="12" class="btn-group" >
        <Fields>
            <asp:NextPreviousPagerField ButtonType="Link" 
                ShowFirstPageButton="true" ShowPreviousPageButton="true" ShowNextPageButton="false" ShowLastPageButton="false"
                FirstPageText="«" PreviousPageText="<"
                ButtonCssClass="btn btn-default" />
            <asp:NumericPagerField ButtonCount="5" ButtonType="Link"
                CurrentPageLabelCssClass="btn btn-default active" NumericButtonCssClass="btn btn-default" />
            <asp:NextPreviousPagerField ButtonType="Link" 
                ShowFirstPageButton="false" ShowPreviousPageButton="false" ShowNextPageButton="true" ShowLastPageButton="true" 
                NextPageText=">" LastPageText="»" 
                ButtonCssClass="btn btn-default" />
        </Fields>
    </asp:DataPager>
</asp:Content>
