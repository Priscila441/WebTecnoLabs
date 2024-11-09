<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Administrador.aspx.cs" Inherits="C1_IU.Administrador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Estilos para fondo y card */
        body {
            background-image: url('images/FONDO.jpg'); 
            background-size: cover; 
            background-position: center; 
            background-repeat: no-repeat; 
            background-attachment: fixed; 
        }
        .card {
            background-color: #FFB6C1; 
            border: 5px solid #4a3c8c; 
            color: #2271b3;
            margin: 1rem auto; /* Reducir el margen superior */
            max-width: 700px; /* Reducir el ancho del cuadro */
            padding: 1.2rem; /* Reducir el padding */
            border-radius: 12px; /* Bordes más suaves */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .card .card-title {
            font-size: 18px; /* Reducir tamaño de título */
        }
        .grid-container {
            margin: 2rem auto;
            max-width: 800px;
        }
        /* Encabezado */
        .page-header {
            background-color: #572364;
            color: white;
            padding: 1rem;
            border-radius: 10px;
            text-align: center;
        }
        .page-header h2 {
            font-weight: bold;
            font-size: 32px;
        }
        /* Campo de búsqueda */
        .search-container {
            width: 25%; /* Ocupa un cuarto de la página */
            margin: 2rem auto; /* Centrado */
        }
        .search-container .form-control {
            width: 100%; /* El campo de búsqueda ocupa todo el ancho */
        }
        /* Estilo para los TextBox */
        .form-control {
            font-size: 14px; /* Reducir tamaño de fuente en los campos */
            padding: 8px; /* Reducir espacio interno */
        }
        .form-label {
            font-size: 14px; /* Reducir tamaño de las etiquetas */
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-header">
        <h2><i class="fas fa-boxes"></i> Gestión de Productos</h2>
    </div>
    <div class="container">
        <!-- Cuadro de detalles del producto -->
        <div class="card">
            <h4 class="card-title text-center">Detalles del Producto</h4>
            <div class="card-body">
                <div class="mb-3">
                    <asp:Label ID="LabelMarca" runat="server" Text="Marca" CssClass="form-label fw-bold"></asp:Label>
                    <asp:TextBox ID="TxtMarca" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <asp:Label ID="LabelModelo" runat="server" Text="Modelo" CssClass="form-label fw-bold"></asp:Label>
                    <asp:TextBox ID="TxtModelo" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <asp:Label ID="LabelPrecio" runat="server" Text="Precio" CssClass="form-label fw-bold"></asp:Label>
                    <asp:TextBox ID="TxtPrecio" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <asp:Label ID="LabelCategoria" runat="server" Text="Categoría" CssClass="form-label fw-bold"></asp:Label>
                    <asp:TextBox ID="TxtCategoria" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <asp:Label ID="LabelStock" runat="server" Text="Stock" CssClass="form-label fw-bold"></asp:Label>
                    <asp:TextBox ID="TxtStock" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <!-- Botones de acción -->
                <div class="d-grid gap-2 d-md-flex justify-content-md-end mb-4">
                    <asp:Button ID="BtnAgregar" runat="server" Text="Agregar" CssClass="btn btn-primary me-md-2" />
                    <asp:Button ID="BtnEditar" runat="server" Text="Editar" CssClass="btn btn-warning me-md-2" />
                    <asp:Button ID="BntEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger me-md-2"/>
                    <asp:Button ID="BntGuardar" runat="server" Text="Guardar" CssClass="btn btn-success me-md-2"/>
                    <asp:Button ID="BtnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-secondary" />
                </div>
            </div>
        </div>

        <!-- Cuadro de búsqueda debajo de los botones -->
        <div class="search-container">
            <asp:TextBox ID="TxtBuscar" runat="server" CssClass="form-control" Placeholder="Buscar producto..."></asp:TextBox>
            <asp:Button ID="BtnBuscar" runat="server" Text="Buscar" CssClass="btn btn-primary mt-2 w-100" />
        </div>

        <!-- Tabla de productos -->
        <div class="grid-container">
            <asp:GridView ID="gvProductos" runat="server" CssClass="table table-bordered table-hover" CellPadding="3" GridLines="None" AutoGenerateColumns="False" AutoGenerateSelectButton="True" OnSelectedIndexChanged="gvProductos_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="IdProducto" HeaderText="IdProducto"/>
                    <asp:BoundField DataField="Marca" HeaderText="Marca" />
                    <asp:BoundField DataField="Modelo" HeaderText="Modelo" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="IdCategoria" HeaderText="IdCategoría" />
                    <asp:BoundField DataField="Stock" HeaderText="Stock" />
                </Columns>
                <HeaderStyle CssClass="table-primary" />
                <RowStyle CssClass="table-light" />
                <SelectedRowStyle CssClass="table-warning" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>