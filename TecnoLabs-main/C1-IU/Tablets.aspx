<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tablets.aspx.cs" Inherits="C1_IU.Tablets" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Estilo para organizar los contenedores en una fila */
        .container {
            display: flex;
            justify-content: space-around;
            margin-top: 2rem;
        }
        /* Estilo de cada tarjeta de producto */
        .card {
            width: 300px;
            background-color: #ffffff;
            border: 2px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
            padding: 1rem;
        }
        .card img {
            width: 100%;
            border-radius: 10px;
        }
        /* Espaciado y estilo de botones dentro de cada tarjeta */
        .card-buttons {
            margin-top: 1rem;
        }
        .card-buttons .btn {
            width: 100%;
            margin-bottom: 0.5rem;
            font-weight: bold;
        }
        /* Imagen de propaganda al final de la página */
        .propaganda {
            width: 100%;
            margin-top: 2rem;
            position: fixed;
            bottom: 0;
            left: 0;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Contenedores de producto en fila -->
    <div class="container">
        <!-- Primer contenedor -->
        <div class="card">
            <img src="images/producto1.jpg" alt="Producto 1" />
            <div class="card-buttons">
                <asp:Button ID="BtnComprar1" runat="server" Text="Comprar Ahora" CssClass="btn btn-primary" />
                <asp:Button ID="BtnAgregarCarrito1" runat="server" Text="Agregar al Carrito" CssClass="btn btn-secondary" />
            </div>
        </div>

        <!-- Segundo contenedor -->
        <div class="card">
            <img src="images/producto2.jpg" alt="Producto 2" />
            <div class="card-buttons">
                <asp:Button ID="BtnComprar2" runat="server" Text="Comprar Ahora" CssClass="btn btn-primary" />
                <asp:Button ID="BtnAgregarCarrito2" runat="server" Text="Agregar al Carrito" CssClass="btn btn-secondary" />
            </div>
        </div>

        <!-- Tercer contenedor -->
        <div class="card">
            <img src="images/producto3.jpg" alt="Producto 3" />
            <div class="card-buttons">
                <asp:Button ID="BtnComprar3" runat="server" Text="Comprar Ahora" CssClass="btn btn-primary" />
                <asp:Button ID="BtnAgregarCarrito3" runat="server" Text="Agregar al Carrito" CssClass="btn btn-secondary" />
            </div>
        </div>
    </div>

    <!-- Imagen de propaganda fija al borde inferior -->
    <img src="images/propaganda.jpg" alt="Propaganda" class="propaganda" />
</asp:Content>