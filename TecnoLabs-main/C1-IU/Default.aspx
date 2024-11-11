<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="C1_IU.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Estilo para los botones con efecto hover */
        .btn-promo {
            transition: transform 0.3s, box-shadow 0.3s, background-color 0.3s ease, color 0.3s ease;
        }

        /* Efecto hover para los botones */
        .btn-promo:hover {
            transform: scale(1.1);  /* Aumenta el tamaño del botón */
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2); /* Sombra */
            background-color: #FFB400; /* Cambia el color de fondo */
            color: white; /* Cambia el color del texto */
        }

        /* Efecto de subir y bajar para las imágenes */
        .img-subir-bajar {
            animation: bounce-vertical 2s infinite; /* Añade la animación de subir y bajar */
        }

        /* Efecto de subir y bajar */
        @keyframes bounce-vertical {
            0%, 100% {
                transform: translateY(0); /* Posición inicial y final sin movimiento */
            }
            50% {
                transform: translateY(-30px); /* Mueve la imagen 30px hacia arriba en el punto medio */
            }
        }

        /* Estilo de las imágenes promocionales */
        .promo-container img {
            transition: transform 0.3s, opacity 0.3s ease;
        }

        /* Tamaño y posición específicos para la imagen cuotas.png */
        .img-cuotas {
            width: 1500px; /* Tamaño ajustado */
            height: 300px;
            position: absolute;
            right: 500px; /* Alinea la imagen al borde derecho */
            transform: translateX(-10px); /* Ajuste para no pegarla demasiado al borde */
        }

        /* Tamaño, posición y animación para la imagen adelantate.png */
        .img-adelantate {
            width: 900px; /* Tamaño ajustado */
            height: auto;
            position: absolute;
            right: 0; /* Alinea la imagen al borde derecho */
            animation: bounce-vertical 2s infinite; /* Añade la animación de subir y bajar */
        }

        /* Alineación de las imágenes */
        .top-image, .middle-images, .bottom-images {
            display: flex;
            justify-content: space-around;
            margin: 0.8px 0;
        }

        .middle-images {
            position: relative;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="promo-container">
        <div class="top-image">
            <img src="images/adelantate.png" alt="Imagen promocional principal" class="img-subir-bajar">
        </div>
        <div class="middle-images" style="position: relative;">
            <!-- Botón de cupón alineado a la izquierda con efecto hover -->
            <button class="btn btn-warning btn-promo" title="Cupón" 
                    style="position: absolute; left: -290px; top: 50%; transform: translateY(-50%); 
                           padding: 8px 13px; font-size: 1.5rem; background-color: #019DC7; color: #FCFFFF; 
                           border-radius: 20px; display: flex; align-items: center; border: none;">
                <i class="bi bi-ticket-perforated"></i>
            </button>

            <img src="images/envio.jpg" alt="Imagen Envío" class="img-subir-bajar">

            <!-- Botón "Sale" alineado a la derecha con efecto hover -->
            <button class="btn btn-warning btn-promo" title="Sale" 
                    style="position: absolute; right: 550px; top: 50%; transform: translateY(-50%); 
                           padding: 8px 13px; font-size: 1.5rem; background-color: #FFD700; color: #333; 
                           border-radius: 50%; display: flex; align-items: center; justify-content: center; border: none;">
                <i class="bi bi-tag-fill"></i>
            </button>

            <img src="images/cuotas.png" alt="Imagen Cuotas" class="img-subir-bajar">
        </div>
        <div class="bottom-images">
            <img src="images/compu.png" alt="Imagen Notebooks" class="img-subir-bajar">
            <img src="images/moto.jpg" alt="Imagen Celulares" class="img-subir-bajar">
            <img src="images/asus.png" alt="Imagen computadora" class="img-subir-bajar">
            <img src="images/iphone.png" alt="Imagen iphone" class="img-subir-bajar">
        </div>
    </div>
</asp:Content>