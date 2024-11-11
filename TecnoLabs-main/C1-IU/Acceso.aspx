<%@ Page Title="Acceso" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Acceso.aspx.cs" Inherits="C1_IU.Acceso" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet"> <!-- Font Awesome -->
    <style>
        body {
            background-color: #470224; /* Color de fondo de toda la página */
        }

        /* Contenedor para los formularios de acceso y registro */
        .contenedor-formularios {
            display: flex;
            justify-content: center; /* Alineación al centro */
            align-items: flex-start; /* Alineación al inicio */
            gap: 20px; /* Espacio entre formularios */
            margin-top: 10px;
        }

        /* Estilo base del formulario */
        .formulario {
            max-width: 400px;
            padding: 20px;
            background-color: #650338; /* Fondo del formulario */
            border-radius: 8px;
        }

        /* Estilo para los TextBox */
        .formulario .form-control {
            background-color: #4DAB8C; /* Fondo de los TextBox */
            color: #FFFFFF; /* Color del texto dentro del TextBox */
            border: 1px solid #650338; /* Borde de los TextBox */
            border-radius: 4px;
            width: 100%; /* Asegura que los TextBox ocupen todo el ancho del formulario */
        }

        /* Estilo base para el botón de acceso */
        .btn-acceder, .btn-registrarse {
            background-color: #8F244D; /* Color de fondo más suave para acceso */
            color: #fff;
            width: 200px;
            font-size: 14px;
            padding: 8px;
            border: none;
            border-radius: 4px;
            transition: all 0.3s ease;
            display: block;
            margin: 10px auto; /* Centra el botón dentro del formulario */
        }

        /* Efecto hover para todos los botones */
        .btn-acceder:hover, .btn-registrarse:hover {
            background-color: #5A8FBC; /* Nuevo color de fondo al pasar el ratón */
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.3); /* Sombra */
            transform: scale(1.05); /* Aumento de tamaño al pasar el ratón */
        }

        /* Estilo para los títulos */
        .titulo {
            color: #FFFFFF;
            font-size: 30px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
            font-family: Script MT;
        }

        /* Estilo para los botones con iconos */
        .btn-icon i {
            margin-right: 10px;
        }

        /* Contenedor de los botones */
        .contenedor-botones {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }

        /* Estilo para la imagen en el borde inferior */
        .footer-image {
            width: 100%; /* Ajusta el ancho al 100% del contenedor */
            height: 200px; /* Altura ajustable de la imagen */
            background-image: url('images/motorola1.jpg'); /* Reemplaza con la ruta de tu imagen */
            background-size: cover; /* Hace que la imagen cubra todo el área */
            background-position: center; /* Centra la imagen */
            margin-top: 30px; /* Espacio superior */
            position: relative; /* Para permitir posicionamiento absoluto de los elementos dentro */
        }

        /* Contenedor del botón "Volver" */
        .btn-volver {
            position: absolute;
            right: 10px; /* Mueve el botón hacia el borde derecho */
            bottom: 20px; /* Colócalo cerca de la parte inferior */
            background-color: #8F244D;
            color: #fff;
            padding: 10px;
            border-radius: 50%;
            border: none;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        /* Efecto hover para el botón "Volver" */
        .btn-volver:hover {
            background-color: #5A8FBC;
            transform: scale(1.1);
        }
                 /* Estilo para la imagen en el borde inferior */
        .footer-image {
            width: 89%; /* La imagen ocupará todo el ancho de la pantalla */
            height: 150px; /* Ajusta la altura de la imagen (más pequeña) */
            background-image: url('images/motorola1.jpg'); /* Ruta correcta de la imagen */
            background-size: cover; /* La imagen cubrirá todo el área sin distorsionarse */
            background-position: center; /* Centra la imagen */
            margin-top: 10px; /* Espacio superior */
            position: absolute; /* Para permitir posicionamiento absoluto */
            right: 0px; /* Coloca la imagen a la derecha */
            bottom: 0; /* Coloca la imagen en el borde inferior */
            z-index: -1; /* Asegura que la imagen quede detrás del contenido */
            border-radius: 45px; /* Bordes redondeados, si deseas mantenerlos */
        }

        /* Contenedor del botón "Volver" */
        .btn-volver {
            position: absolute;
            right: 10px; /* Mueve el botón hacia el borde derecho */
            bottom: 20px; /* Colócalo cerca de la parte inferior */
            background-color: #8F244D;
            color: #fff;
            padding: 10px;
            border-radius: 50%;
            border: none;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
            z-index: 1; /* Asegura que el botón esté sobre la imagen */
        }

        /* Efecto hover para el botón "Volver" */
        .btn-volver:hover {
            background-color: #5A8FBC;
            transform: scale(1.1);
        }
        /* Estilo para la imagen en el borde inferior */
        .footer-image {
            width: 89%; /* La imagen ocupará todo el ancho de la pantalla */
            height: 150px; /* Ajusta la altura de la imagen */
            background-image: url('images/motorola1.jpg'); /* Ruta correcta de la imagen */
            background-size: cover; /* La imagen cubrirá todo el área sin distorsionarse */
            background-position: center; /* Centra la imagen */
            margin-top: 10px; /* Espacio superior */
            position: absolute; /* Para permitir posicionamiento absoluto */
            right: 0px; /* Coloca la imagen a la derecha */
            bottom: 0; /* Coloca la imagen en el borde inferior */
            z-index: -1; /* Asegura que la imagen quede detrás del contenido */
            border-radius: 45px; /* Bordes redondeados */
            animation: move-forward-backward 3s ease-in-out infinite; /* Animación de movimiento */
        }

        /* Definición de la animación de "ir y volver" */
        @keyframes move-forward-backward {
            0% {
                transform: translateY(0); /* Posición inicial */
            }
            50% {
                transform: translateY(-10px); /* Movimiento hacia arriba */
            }
            100% {
                transform: translateY(0); /* Vuelve a la posición original */
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <!-- Contenedor de botones con iconos -->
   <div class="contenedor-botones">
       <!-- Botón Administrador -->
       <button class="btn-icon btn-acceder"> <!-- Aplica la clase btn-acceder -->
           <i class="fas fa-user-shield"></i> Administrador
       </button>

       <!-- Botón Cliente -->
       <button class="btn-icon btn-registrarse"> <!-- Aplica la clase btn-registrarse -->
           <i class="fas fa-user"></i> Cliente
       </button>
   </div>

    <!-- Contenedor para los formularios de acceso y registro -->
    <div class="contenedor-formularios">
        <!-- Formulario de acceso -->
        <div class="formulario">
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
        </div>

        <!-- Formulario de registro -->
        <div class="formulario">
            <h2 class="titulo">Registro del Cliente</h2>
            <form method="post" action="Registro.aspx">
                <div class="mb-3">
                    <input type="text" class="form-control" placeholder="Nombre" />
                </div>
                <div class="mb-3">
                    <input type="text" class="form-control" placeholder="Apellido" />
                </div>
                <div class="mb-3">
                    <input type="text" class="form-control" placeholder="Edad" />
                </div>
                <div class="mb-3">
                    <input type="text" class="form-control" placeholder="Email" />
                </div>
                <div class="mb-3">
                    <input type="text" class="form-control" placeholder="Dirección" />
                </div>
                <div class="mb-3">
                    <input type="text" class="form-control" placeholder="Medio de Pago" />
                </div>
                <button type="submit" class="btn-registrarse">Regístrate</button>
            </form>
        </div>
    </div>

   <!-- Imagen de pie de página y botón volver -->
    <div class="footer-image"></div> <!-- Imagen de fondo en el borde inferior -->
    <button class="btn-volver" onclick="window.history.back();">
        <i class="fas fa-arrow-left"></i> Volver
    </button>
</asp:Content>