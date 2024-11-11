<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="C1_IU.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Estilo para los botones con efecto hover */
        .btn-promo {
            transition: transform 0.3s, box-shadow 0.3s, background-color 0.3s ease, color 0.3s ease;
        }

        /* Efecto hover */
        .btn-promo:hover {
            transform: scale(1.1);  /* Aumenta el tamaño del botón */
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2); /* Sombra */
            background-color: #FFB400; /* Cambia el color de fondo */
            color: white; /* Cambia el color del texto */
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="promo-container">
        <div class="top-image">
            <img src="images/adelantate.png" alt="Imagen promocional principal">
        </div>
        <div class="middle-images" style="position: relative;">
            <!-- Botón de cupón alineado a la izquierda con efecto hover -->
            <button class="btn btn-warning btn-promo" title="Cupón" 
                    style="position: absolute; left: -290px; top: 50%; transform: translateY(-50%); 
                           padding: 8px 13px; font-size: 1.5rem; background-color: #019DC7; color: #FCFFFF; 
                           border-radius: 20px; display: flex; align-items: center; border: none;">
                <i class="bi bi-ticket-perforated"></i>
            </button>

            <img src="images/envio.jpg" alt="Imagen Envío">

            <!-- Botón "Sale" alineado a la derecha con efecto hover -->
            <button class="btn btn-warning btn-promo" title="Sale" 
                    style="position: absolute; right: 550px; top: 50%; transform: translateY(-50%); 
                           padding: 8px 13px; font-size: 1.5rem; background-color: #FFD700; color: #333; 
                           border-radius: 50%; display: flex; align-items: center; justify-content: center; border: none;">
                <i class="bi bi-tag-fill"></i>
            </button>

            <img src="images/cuotas.png" alt="Imagen Cuotas">
        </div>
        <div class="bottom-images">
            <img src="images/compu.png" alt="Imagen Notebooks">
            <img src="images/moto.jpg" alt="Imagen Celulares">
            <img src="images/asus.png" alt="Imagen computadora">
            <img src="images/iphone.png" alt="Imagen iphone">
        </div>
    </div>
</asp:Content>