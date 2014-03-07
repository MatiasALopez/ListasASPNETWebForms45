<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Listas.Default" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-6">
            <h2>Usuarios existentes</h2>

            <p>
                Lista de los usuarios existentes.
            </p>
            <p>
                <a href="Usuarios" class="btn btn-primary">Ver</a>
            </p>
        </div>
        <div class="col-md-6">
            <h2>Estadísticas de uso</h2>

            <p>
                Lista de estadísticas de uso de usuarios.
            </p>
            <p>
                <a href="EstadisticasDeUso" class="btn btn-primary">Ver</a>
            </p>
        </div>
    </div>
</asp:Content>
