<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tablets.aspx.cs" Inherits="C1_IU.Tablets" %>
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
            width:75%; /* Ajusta el ancho de la imagen */
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
        /* Estilo para la imagen de propaganda */
        .propaganda {
            width: 80%; /* Ajusta el ancho de la imagen */
            margin-top: 2rem;
            position: fixed;
            bottom: 10px;
            left: 55%; /* Centra la imagen horizontalmente */
            transform: translateX(-50%); /* Ajuste para que quede perfectamente centrada */
            border-radius: 35px;
            height: 120px; /* Ajusta la altura */
            transition: transform 0.4s ease, opacity 0.4s ease, filter 0.4s ease;
        }

        /* Efecto glitch al pasar el ratón */
        .propaganda:hover {
            animation: glitch 1s infinite linear; /* Aplica la animación de glitch */
            filter: brightness(1.2); /* Brillo extra para destacar */
            opacity: 1; /* Asegura que la imagen esté visible */
        }

        /* Animación de glitch */
        @keyframes glitch {
            0% {
                transform: translateX(-50%) skew(0deg) scale(1);
                clip-path: inset(0 0 0 0);
                opacity: 1;
            }
            10% {
                transform: translateX(-50%) skew(-10deg) scale(1.05);
                clip-path: inset(0 10% 0 0); /* Distorsión de la imagen */
                opacity: 0.8;
            }
            20% {
                transform: translateX(-50%) skew(10deg) scale(1.1);
                clip-path: inset(0 0 10% 0); /* Más distorsión */
                opacity: 0.6;
            }
            30% {
                transform: translateX(-50%) skew(0deg) scale(1.1);
                clip-path: inset(0 20% 0 0); /* Distorsión y corte */
                opacity: 0.7;
            }
            40% {
                transform: translateX(-50%) skew(-5deg) scale(1.2);
                clip-path: inset(0 0 0 10%); /* Más corte y distorsión */
                opacity: 0.5;
            }
            50% {
                transform: translateX(-50%) skew(0deg) scale(1.3); /* Gran distorsión */
                clip-path: inset(0 15% 10% 0);
                opacity: 0.3;
            }
            60% {
                transform: translateX(-50%) skew(5deg) scale(1.2);
                clip-path: inset(0 5% 0 10%); /* Gran distorsión con traslación */
                opacity: 0.5;
            }
            70% {
                transform: translateX(-50%) skew(-10deg) scale(1.1); /* Distorsión y desplazamiento */
                clip-path: inset(0 10% 0 10%); /* Aumenta la distorsión */
                opacity: 0.7;
            }
            80% {
                transform: translateX(-50%) skew(10deg) scale(1.05);
                clip-path: inset(0 0 5% 5%); /* Vuelve la distorsión */
                opacity: 0.8;
            }
            90% {
                transform: translateX(-50%) skew(0deg) scale(1);
                clip-path: inset(0 0 0 0); /* Restaura la imagen parcialmente */
                opacity: 1;
            }
            100% {
                transform: translateX(-50%) skew(0deg) scale(1); /* Restauración final */
                clip-path: inset(0 0 0 0);
                opacity: 1;
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
                Apple iPad (9º generacion) 10.2” Wi-Fi 64GB  
            </div>
            <img src="images/tablest1.jfif" alt="Producto 1" style="width: 100%; margin-top: 10px;"/>
            <input type="text" class="product-textbox" value="COLOR: Plata" readonly />
            <label class="product-price">$738.990</label>
            <label class="product-discount">$701.954  - 5% OFF</label>
            <label class="product-installment">Mismo precio en 12 cuotas de $149.999</label>
            <label class="product-stock">Llega gratis el JUEVES</label>
            <label class="product-stock">Stock disponible:</label>
            <input type="text" class="product-textbox" value="Cantidad: 1 (+15 disponibles)" readonly />
            <div class="card-buttons">
                <asp:Button ID="BtnComprar1" runat="server" Text="Comprar Ahora" CssClass="btn btn-primary" />
                <asp:Button ID="BtnAgregarCarrito1" runat="server" Text="Agregar al Carrito" CssClass="btn btn-secondary" />
            </div>
        </div>

        <!-- Segundo contenedor -->
        <div class="card">
            <div class="product-title">
               Tablet Lenovo Tab M10 Plus 3rd Gen TB125FU
            </div>
            <img src="images/asus2.jfif" alt="Producto 2" style="width: 100%; margin-top: 10px;"/>
            <input type="text" class="product-textbox" value="COLOR: Negro" readonly />
            <label class="product-price">$649.500</label>
            <label class="product-discount">$579.979 - 15% OFF </label>
            <label class="product-installment">Mismo precio en 6 cuotas de $133.327</label>
            <label class="product-stock">Llega gratis el MIERCOLES</label>
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
                Tablet Samsung Galaxy Tab S S6(2022) Lite 
            </div>
            <img src="images/tablets3.jpg" alt="Producto 3" style="width: 100%; margin-top: 10px;"/>
            <input type="text" class="product-textbox" value="COLOR: Gris" readonly />
            <label class="product-price">$855.357</label>
            <label class="product-discount">$637.500  - 25% OFF</label>
            <label class="product-installment">Mismo precio en 6 cuotas de $146.550</label>
            <label class="product-stock">Llega gratis el JUEVES</label>
            <label class="product-stock">Stock disponible:</label>
            <input type="text" class="product-textbox" value="Cantidad: 1 (+10 disponibles)" readonly />
            <div class="card-buttons">
                <asp:Button ID="BtnComprar3" runat="server" Text="Comprar Ahora" CssClass="btn btn-primary" />
                <asp:Button ID="BtnAgregarCarrito3" runat="server" Text="Agregar al Carrito" CssClass="btn btn-secondary" />
            </div>
        </div>
    </div>

    <!-- Imagen de propaganda centrada -->
    <img src="images/tablets.jpg" alt="Propaganda" class="propaganda" />

    <!-- Botón "Volver" -->
    <button class="btn-volver" onclick="window.history.back();">
        <i class="fas fa-arrow-left"></i> Volver
    </button>
</asp:Content>