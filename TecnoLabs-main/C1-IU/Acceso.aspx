<%@ Page Title="Acceso" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Acceso.aspx.cs" Inherits="C1_IU.Acceso" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet"> <!-- Font Awesome -->
    <style>
        body {
            background-color: #470224;
        }

        .contenedor-formularios {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            gap: 20px;
            margin-top: 10px;
        }

        .formulario {
            max-width: 400px;
            padding: 20px;
            background-color: #650338;
            border-radius: 8px;
        }

        .formulario .form-control {
            background-color: #4DAB8C;
            color: #FFFFFF;
            border: 1px solid #650338;
            border-radius: 4px;
            width: 100%;
        }

        .btn-acceder, .btn-registrarse {
            background-color: #8F244D;
            color: #fff;
            width: 200px;
            font-size: 14px;
            padding: 8px;
            border: none;
            border-radius: 4px;
            transition: all 0.3s ease;
            display: block;
            margin: 10px auto;
        }

        .btn-acceder:hover, .btn-registrarse:hover {
            background-color: #5A8FBC;
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.3);
            transform: scale(1.05);
        }

        .titulo {
            color: #FFFFFF;
            font-size: 30px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
            font-family: Script MT;
        }

        .footer-image {
            width: 89%;
            height: 150px;
            background-image: url('images/motorola1.jpg');
            background-size: cover;
            background-position: center;
            margin-top: 10px;
            position: absolute;
            right: 0px;
            bottom: 0;
            z-index: -1;
            border-radius: 45px;
            animation: move-forward-backward 3s ease-in-out infinite;
        }

        @keyframes move-forward-backward {
            0% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0); }
        }

        .btn-volver {
            position: absolute;
            right: 10px;
            bottom: 20px;
            background-color: #8F244D;
            color: #fff;
            padding: 10px;
            border-radius: 50%;
            border: none;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
            z-index: 1;
        }

        .btn-volver:hover {
            background-color: #5A8FBC;
            transform: scale(1.1);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Contenedor de botones con iconos -->
<div class="contenedor-botones">
    <!-- Botón Administrador -->
    <asp:Button ID="btnAdmin" CssClass="btn-icon btn-acceder" runat="server" Text="Administrador" OnClick="btnAdmin_Click" />

    <!-- Botón Cliente -->
    <asp:Button ID="btnCliente" CssClass="btn-icon btn-registrarse" runat="server" Text="Cliente" OnClick="btnCliente_Click" />
</div>

    <!-- Contenedor para los formularios de acceso y registro -->
    <div class="contenedor-formularios">
		<!-- Panel para el formulario de inicio de sesión de Administrador -->
		<asp:Panel ID="panelAdmin" CssClass="formulario" runat="server" Visible="false">
			<h2 class="titulo">Iniciar sesión como Administrador</h2>
			<form method="post" action="Acceso.aspx">
				<asp:Literal ID="LiteralMessage" runat="server"></asp:Literal>
				<div class="mb-3">
					<asp:TextBox ID="txtAdmin" CssClass="form-control" runat="server" Placeholder="Usuario"></asp:TextBox>
				</div>
				<div class="mb-3">
					<asp:TextBox ID="txtContrasenia" TextMode="Password" CssClass="form-control" runat="server" Placeholder="Contraseña"></asp:TextBox>
				</div>
				<asp:Button ID="ButtonAcceder" CssClass="btn-acceder" runat="server" Text="Acceder" OnClick="ButtonAcceder_Click" CausesValidation="false" />
			</form>
		</asp:Panel>

		<!-- Panel para el formulario de inicio de sesión de Cliente -->
		<asp:Panel ID="panelCliente" CssClass="formulario" runat="server" Visible="false">
			<h2 class="titulo">Iniciar sesión como Cliente</h2>
			<form method="post" action="AccesoCliente.aspx">
				<asp:Literal ID="LiteralMessageCliente" runat="server"></asp:Literal>
				<div class="mb-3">
					<asp:TextBox ID="txtClienteUsuario" CssClass="form-control" runat="server" Placeholder="Usuario"></asp:TextBox>
				</div>
				<div class="mb-3">
					<asp:TextBox ID="txtClienteContrasenia" TextMode="Password" CssClass="form-control" runat="server" Placeholder="Contraseña"></asp:TextBox>
				</div>
				<asp:Button ID="ButtonAccederCliente" CssClass="btn-acceder" runat="server" Text="Acceder" OnClick="ButtonAccederCliente_Click" CausesValidation="false" />
			</form>
		</asp:Panel>

		<!-- Panel para el formulario de registro de cliente -->
		<asp:Panel ID="panelRegistroCliente" CssClass="formulario" runat="server" Visible="true">
			<h2 class="titulo">Registro del Cliente</h2>
			<asp:Literal ID="LiteralRegistroMessage" runat="server"></asp:Literal>
			<div class="mb-3">
				<asp:TextBox ID="txtNombre" CssClass="form-control" runat="server" Placeholder="Nombre"></asp:TextBox>
			</div>
			<div class="mb-3">
				<asp:TextBox ID="txtApellido" CssClass="form-control" runat="server" Placeholder="Apellido"></asp:TextBox>
			</div>
			<div class="mb-3">
				<asp:TextBox ID="txtEdad" CssClass="form-control" runat="server" Placeholder="Edad"></asp:TextBox>
			</div>
			<div class="mb-3">
				<asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" Placeholder="Email"></asp:TextBox>
			</div>
			<div class="mb-3">
				<asp:TextBox ID="txtDireccion" CssClass="form-control" runat="server" Placeholder="Dirección"></asp:TextBox>
			</div>
			<div class="mb-3">
				<asp:TextBox ID="txtMedioPago" CssClass="form-control" runat="server" Placeholder="Medio de Pago"></asp:TextBox>
			</div>
			<asp:Button ID="btnRegistrarse" CssClass="btn-registrarse" runat="server" Text="Regístrate" OnClick="btnRegistrarse_Click"/>
		</asp:Panel>

    <div class="footer-image"></div>
    <button class="btn-volver" onclick="window.history.back();">
        <i class="fas fa-arrow-left"></i> Volver
    </button>
</asp:Content>
