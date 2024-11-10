<%@ Page Title="Acceso" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Acceso.aspx.cs" Inherits="C1_IU.Acceso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-color: #470224; /* Color de fondo de toda la página */
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Contenedor del formulario con la clase para el fondo -->
    <div class="formulario-acceso">
        <h2>Iniciar sesión como Administrador</h2>
        <form method="post" action="Acceso.aspx">
            <asp:Literal ID="LiteralMessage" runat="server"></asp:Literal>
            <div class="mb-3">
                <label for="usuario" class="form-label">Usuario</label>
                <asp:TextBox ID="txtAdmin" CssClass="form-control" runat="server" Placeholder="Usuario"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="contrasena" class="form-label">Contraseña</label>
                <asp:TextBox ID="txtContrasenia" TextMode="Password" CssClass="form-control" runat="server" Placeholder="Contraseña"></asp:TextBox>
            </div>
            <asp:Button ID="ButtonAcceder" CssClass="btn btn-primary" runat="server" Text="Acceder" OnClick="ButtonAcceder_Click" CausesValidation="false" />
        </form>
    </div>
</asp:Content>


