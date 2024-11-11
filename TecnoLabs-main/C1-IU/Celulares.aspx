<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Celulares.aspx.cs" Inherits="C1_IU.Celulares" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Estilo para fondo de la página */
        body {
            background-color: #470224; /* Color de fondo de toda la página */
        }

        /* Estilo para organizar los contenedores en una fila y alinear a la derecha */
        .container {
            display: flex;
            justify-content: flex-end; /* Alinea los productos al borde derecho */
            margin-top: 0.5rem; /* Se redujo el margen superior */
            gap: 5rem; /* Espacio entre los contenedores */
            flex-wrap: wrap; /* Hace que los productos se ajusten a una nueva línea en pantallas más pequeñas */
        }

        /* Estilo de cada tarjeta de producto */
        .card {
            width: 290px; /* Ancho aumentado para que sea más grande */
            height: 422px; /* Altura aumentada para que los botones quepan dentro */
            background-color: #4DAB8C;
            border: 2px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
            padding: 0.5rem; /* Menos relleno para que sea más compacto */
            transition: transform 0.3s ease;
            margin-bottom: 0.5rem; /* Espacio debajo de las tarjetas */
        }

        .card:hover {
            transform: translateY(-10px); /* Efecto de hover */
        }

        .card img {
            width: 100%; /* Asegura que la imagen ocupe todo el ancho de la tarjeta */
            border-radius: 10px;
            max-height: 155px; /* Aumenté la altura de la imagen */
            object-fit: cover; /* Hace que la imagen no se distorsione */
        }

        /* Espaciado y estilo de botones dentro de cada tarjeta */
        .card-buttons {
            margin-top: 1rem;
        }

        .card-buttons .btn {
            width: 100%;
            margin-bottom: 0.5rem;
            font-weight: bold;
            font-size: 0.6rem; /* Tamaño de fuente más pequeño */
        }

        /* Imagen de propaganda al final de la página */
        .propaganda {
            width:85%; /* Ajusta el ancho de la imagen */
            margin-top: 2rem;
            position: fixed;
            bottom: 10px;
            left: 55%; /* Centra la imagen horizontalmente */
            transform: translateX(-50%); /* Ajuste para que quede perfectamente centrada */
            border-radius: 35px;
            height: 120px; /* Ajusta la altura para que sea más pequeña */
        }

        /* Contenedor del botón "Volver" */
        .btn-volver {
            position: absolute;
            right: 20px;
            bottom: 20px;
            background-color: #8F244D;
            color: #fff;
            padding: 12px;
            border-radius: 50%;
            border: none;
            font-size: 18px;
            cursor: pointer;
            transition: all 0.3s ease;
            z-index: 1;
        }

        .btn-volver:hover {
            background-color: #5A8FBC;
            transform: scale(1.1);
        }

        /* Estilo para el ícono dentro del botón */
        .btn-volver i {
            font-size: 18px;
        }

        /* Estilo de los textos y etiquetas */
        .product-title {
            font-size: 0.7rem; /* Tamaño de letra ajustado */
            font-weight: bold;
            color: black;
        }

        .product-label {
            font-size: 0.6rem;
            margin: 5px 0;
            color: yellow;
            font-weight: bold;
        }

        .product-textbox {
            margin-top: 10px;
            width: 100%;
            padding: 5px;
            font-size: 0.5rem; /* Reducido tamaño de fuente */
            font-weight: bold;
        }

        .product-price {
            font-size: 0.6rem; /* Tamaño de letra ajustado */
            color: yellow;
            font-weight: bold;
        }

        .product-discount {
            font-size: 0.6rem;
            color: red;
            font-weight: bold;
        }

        .product-installment {
            font-size: 0.6rem;
            color: black;
            font-weight: bold;
        }

        .product-stock {
            font-size: 0.6rem;
            color: #0531F8;
            font-weight: bold;
        }

        /* Media query para pantallas pequeñas */
        @media (max-width: 600px) {
            .card {
                width: 100%; /* Las tarjetas ocupan el 100% del ancho en pantallas pequeñas */
            }
            .product-title {
                font-size: 0.8rem; /* Reducir el tamaño de los títulos */
            }
            .product-price, .product-discount, .product-installment {
                font-size: 0.5rem; /* Reducir tamaño de los textos */
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Contenedores de producto en fila -->
    <div class="container">
        <!-- Primer contenedor -->
        <div class="card">
            <div class="product-title">
                Celular Apple iPhone 11 (128 GB) - Blanco
            </div>
            <img src="images/iphone.jfif" alt="Producto 1" style="width: 100%; margin-top: 10px;"/>
            <input type="text" class="product-textbox" value="Color: Negro / Rosa / Blanco / Violeta" readonly />
            <label class="product-price">$1.399.000</label>
            <label class="product-discount">$1.189.150 - 15% OFF</label>
            <label class="product-installment">Mismo precio en 12 cuotas de $99.095</label>
            <label class="product-stock">Llega gratis LUNES</label>
            <label class="product-stock">Stock disponible:</label>
            <input type="text" class="product-textbox" value="Cantidad: 1 (+10 disponibles)" readonly />
            <div class="card-buttons">
                <asp:Button ID="BtnComprar1" runat="server" Text="Comprar Ahora" CssClass="btn btn-primary" />
                <asp:Button ID="BtnAgregarCarrito1" runat="server" Text="Agregar al Carrito" CssClass="btn btn-secondary" />
            </div>
        </div>

        <!-- Segundo contenedor -->
        <div class="card">
            <div class="product-title">
                CELULAR Samsung Galaxy A53 5GB 128GB
            </div>
            <img src="images/celusamsung.jpg" alt="Producto 2" style="width: 100%; margin-top: 10px;"/>
            <input type="text" class="product-textbox" value="COLOR: Blanco / Violeta / Negro / Blanco" readonly />
            <label class="product-price">$530.000</label>
            <label class="product-discount">$629.999 - 10% OFF </label>
            <label class="product-installment">Mismo precio en 6 cuotas de $144.826</label>
            <label class="product-stock">Llega gratis el LUNES</label>
            <label class="product-stock">Stock disponible: </label>
            <input type="text" class="product-textbox" value="Cantidad: 1 (+12 disponibles)" readonly />
            <div class="card-buttons">
                <asp:Button ID="BtnComprar2" runat="server" Text="Comprar Ahora" CssClass="btn btn-primary" />
                <asp:Button ID="BtnAgregarCarrito2" runat="server" Text="Agregar al Carrito" CssClass="btn btn-secondary" />
            </div>
        </div>

        <!-- Tercer contenedor -->
        <div class="card">
            <div class="product-title">
                CELULAR Redmi Note 13 Pro+ 5G Dual SIM 
            </div>
            <img src="images/xiaomi.jpg" alt="Producto 3" style="width: 100%; margin-top: 10px;"/>
            <input type="text" class="product-textbox" value="COLOR: Blanco / Gris" readonly />
            <label class="product-price">$1.399.000</label>
            <label class="product-discount">$943.742 - 10% OFF</label>
            <label class="product-installment">Mismo precio en 9 cuotas de $104.860</label>
            <label class="product-stock">Llega gratis el LUNES</label>
            <label class="product-stock">Stock disponible:</label>
            <input type="text" class="product-textbox" value="Cantidad: 1 (+10 disponibles)" readonly />
            <div class="card-buttons">
                <asp:Button ID="BtnComprar3" runat="server" Text="Comprar Ahora" CssClass="btn btn-primary" />
                <asp:Button ID="BtnAgregarCarrito3" runat="server" Text="Agregar al Carrito" CssClass="btn btn-secondary" />
            </div>
        </div>
    </div>

    <!-- Imagen de propaganda centrada -->
    <img src="images/celulares.jpg" alt="Propaganda" class="propaganda" />

    <!-- Botón "Volver" -->
    <button class="btn-volver" onclick="window.history.back();">
        <i class="fas fa-arrow-left"></i> Volver
    </button>
</asp:Content>