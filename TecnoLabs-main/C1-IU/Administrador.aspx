<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Administrador.aspx.cs" Inherits="C1_IU.Administrador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
         /* Estilos para fondo y card */
    body {
        background-color:#470224;
    }
    .card {
        background-color: #E86F9E; 
        border: 5px solid #4a3c8c; 
        color: #2271b3;
        margin: 1rem 0 0.1em 0; /* Reducir márgenes */
        max-width: 496px; /* Cuadro más pequeño */
        padding: 0.5rem; /* Reducir el padding */
        border-radius: 12px;
        box-shadow: 0 50px 50px rgba(0, 0, 0, 0.2);
        margin-left: 275px; 
    }

    .card .card-title {
        font-size: 16px; /* Cambiar tamaño de título */
        font-family: 'Arial'; /* Cambiar la fuente */
        font-weight: bold; /* Poner el título en negrita */
        color: #000000; /* Cambiar color del título */
        margin-top: 0.5rem; /* Reducir espacio entre el título y los campos */
        background-color:#FFC0C0;
    }
    .grid-container {
        margin: 2rem auto;
        max-width: 800px;
    }
    /* Encabezado */
    .page-header {
        background-color: #470224;
        color: #FFC0C0;
        padding: 1rem;
        border-radius: 10px;
        text-align: center;
    }
    .page-header h2 {
        font-weight: bold;
        font-size: 30px;
    }
    /* Estilos para el formulario con dos elementos en línea */
    .form-row {
        display: flex;
        justify-content: space-between;
    }
    .form-row .mb-3 {
        width: 48%; /* Dos elementos por fila */
    }
    /* Campo de búsqueda */
    .search-container {
        width: 48%; /* Reducir el tamaño del cuadro de búsqueda */
        margin: 0.5rem auto 0.2rem; /* Reducir el margen inferior */
    }
    .search-container .form-control {
        width: 100%; /* El campo de búsqueda ocupa todo el ancho */
        font-size: 14px; /* Reducir el tamaño del texto en el cuadro */
        padding: 6px; /* Reducir el espacio interno */
    }
    /* Estilo para los TextBox */
    .form-control {
        font-size: 12px; /* Reducir tamaño de fuente en los campos */
        padding: 6px; /* Reducir espacio interno */
        background-color:#D7D7D7;
    }
    /* Estilo para los Label */
    .form-label {
        font-size: 14px;
        font-family: 'Segoe UI';
        font-weight: bold;
        color: #000000;
        margin-bottom: 0.5rem;
        display: block;
    }

    /* Estilo para los Label cuando están en foco */
    .form-label:focus-within {
        color: #000000; /* Cambiar color cuando está en foco */
    }
    
    /* Estilo para los botones */
    .btn-group {
        display: flex;
        justify-content: flex-start; /* Alinear los botones a la izquierda */
        gap: 10px; /* Espacio entre los botones */
        width: 100%;
        transform: scale(1.05);
        box-shadow: 0 12px 20px rgba(0, 0, 0, 0.2);
    }
    .btn-group .btn {
        font-size: 12px; /* Reducir tamaño de los botones */
        padding: 8px 12px; /* Reducir el padding de los botones */
        margin: 0; /* Eliminar márgenes extra */
        width: 48%; /* Ajustar el ancho de los botones */
    }

    /* Estilo para el botón de búsqueda */
    .btn-search {
        width: 48%; /* Ajustar tamaño del botón de búsqueda al de los otros botones */
        font-size: 12px;
        padding: 8px 12px;
        margin-top: 0.5rem; /* Reducir margen superior */
        background-color: blueviolet;
    }

    .filter-card {
        background-color: #E86F9E;
        border: 5px solid #4a3c8c;
        color: #2271b3;
        padding: 2rem;
        border-radius: 12px;
        box-shadow: 0 50px 50px rgba(0, 0, 0, 0.2);
        max-width: 220px; /* Cuadro más pequeño */
        margin-left: -76px; /* Moverlo a la izquierda */
        margin-top: 234px; /* Ajustar la distancia entre los cuadros */
    }
     /* Estilo para mover la imagen y el título hacia la derecha */
    .page-header {
        background-color: #470224;
        color: #FFC0C0;
        padding: 1rem;
        border-radius: 25px;
        text-align: left; /* Alineación a la izquierda */
        margin-left: 150px; /* Añadir un margen izquierdo */
        
    }
    .page-header h2 {
        font-weight: bold;
        font-size: 30px;
        display: flex;
        align-items: center;
    }
    .page-header img {
        width: 300px;
        height: 70px;
        margin-right: 10px;
        vertical-align: middle;
        border-radius: 25px;
    }

    /* Botón de guardar */
    .btn-save {
        background-color: #4CAF50; /* Verde */
        color: white;
        border-radius: 20px;
    }
    /* Botón de editar */
    .btn-edit {
        background-color: #FFA500; /* Naranja */
        color: white;
        border-radius: 20px;
    }
    /* Botón de eliminar */
    .btn-delete {
        background-color: #FF6347; /* Rojo */
        color: white;
        border-radius: 20px;
    }
    /* Botón de buscar */
    .btn-search {
        background-color: #1E90FF; /* Azul */
        color: white;
        border-radius: 20px;
    }
    /* Botón de cancelar */
    .btn-cancel {
        background-color: #8B4513; /* Marrón */
        color: white;
        border-radius: 20px;
    }

    /* Botón Aplicar Filtro */
    .btn-apply-filter {
        background-color: #32CD32; /* Verde claro */
        color: white;
        border-radius: 20px;
    }

    /* Efecto hover para los botones */
    .btn-group .btn:hover, .btn-search:hover, .btn-apply-filter:hover {
        transform: scale(1.05);
        box-shadow: 0 12px 20px rgba(0, 0, 0, 0.2);
    }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-header">
        <h2><img src="images/Admin.jpg" alt="Imagen" style="width: 300px; height: 70px; margin-right: 10px; vertical-align: middle;" /> ADMINISTRADOR</h2>
    </div>
    <div class="container">
        <div class="row">
            <!-- Cuadro de detalles del producto -->
            <div class="col-md-8">
                <div class="card">
                    <h4 class="card-title text-center">Detalles del Producto</h4>
                    <div class="card-body">
                        <div class="form-row">
                            <div class="mb-3">
                                <asp:Label ID="LabelMarca" runat="server" Text="Marca" CssClass="form-label fw-bold"></asp:Label>
                                <asp:TextBox ID="TxtMarca" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <asp:Label ID="LabelModelo" runat="server" Text="Modelo" CssClass="form-label fw-bold"></asp:Label>
                                <asp:TextBox ID="TxtModelo" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="mb-3">
                                <asp:Label ID="LabelPrecio" runat="server" Text="Precio" CssClass="form-label fw-bold"></asp:Label>
                                <asp:TextBox ID="TxtPrecio" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <asp:Label ID="LabelCategoria" runat="server" Text="Categoría" CssClass="form-label fw-bold"></asp:Label>
								<asp:DropDownList ID="dCategorias" runat="server" CssClass="dropdown-item" BackColor="White" Width="170px">
									<asp:ListItem Selected="True">Seleccionar</asp:ListItem>
									<asp:ListItem>Celulares</asp:ListItem>
									<asp:ListItem>Tablets</asp:ListItem>
									<asp:ListItem>Notebooks</asp:ListItem>
								</asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="mb-3">
                                <asp:Label ID="LabelStock" runat="server" Text="Stock" CssClass="form-label fw-bold"></asp:Label>
                                <asp:TextBox ID="TxtStock" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <!-- Botones de acción alineados a la izquierda -->
						<div class="btn-group mb-4">
							<asp:Button ID="BtnAgregar" runat="server" Text="Agregar" CssClass="btn btn-primary me-md-2" OnClick="BtnAgregar_Click" />
							<asp:Button ID="BtnEditar" runat="server" Text="Editar" CssClass="btn btn-warning me-md-2" OnClick="BtnEditar_Click" Enabled="false" />
							<asp:Button ID="BtnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger me-md-2" OnClick="BtnEliminar_Click" Enabled="false" />
							<asp:Button ID="BtnGuardar" runat="server" Text="Guardar" CssClass="btn btn-success me-md-2" OnClick="BtnGuardar_Click" Enabled="false" />
							<asp:Button ID="BtnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-secondary" OnClick="BtnCancelar_Click" />
							<asp:Button ID="btnAceptar" runat="server" Text="Aceptar" OnClick="btnAceptar_Click" Style="display: none;" CssClass="btn btn-custom btn-sm" />
						</div>
                        <!-- Campo de búsqueda ajustado -->
                        <!-- Campo de búsqueda ajustado -->
                        <div class="search-container">
                            <div style="display: flex; justify-content: space-between; width: 100%;">
                                <asp:TextBox ID="TxtBuscar" runat="server" CssClass="form-control" Placeholder="Buscar..."></asp:TextBox>
                                <asp:Button ID="BntBuscar" runat="server" Text="Buscar" CssClass="btn btn-primary btn-search" style="margin-left: 10px; width: 48%;" OnClick="BntBuscar_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Cuadro de filtro al costado -->
            <div class="col-md-4">
                <div class="filter-card">
                    <h4 class="card-title text-center">Filtro</h4>
                    <div class="card-body">
                        <div class="form-row">
                            <div class="mb-3">
                                <asp:Label ID="LabelCategoriaFiltro" runat="server" Text="Categoría" CssClass="form-label fw-bold"></asp:Label>
								<asp:DropDownList ID="dropCategoria" runat="server" CssClass="dropdown-item" BackColor="White" Width="70px">
									<asp:ListItem Selected="True">Seleccionar</asp:ListItem>
									<asp:ListItem>Celulares</asp:ListItem>
									<asp:ListItem>Tablets</asp:ListItem>
									<asp:ListItem>Notebooks</asp:ListItem>
								</asp:DropDownList>
                            </div>
                            <div class="mb-3">
                                <asp:Label ID="LabelPrecioFiltro" runat="server" Text="Precio" CssClass="form-label fw-bold"></asp:Label>
								<asp:DropDownList ID="dropOrden" runat="server" CssClass="dropdown-item" BackColor="White" Width="70px">
									<asp:ListItem Selected="True">Seleccionar</asp:ListItem>
									<asp:ListItem>Menor</asp:ListItem>
									<asp:ListItem>Mayor</asp:ListItem>
								</asp:DropDownList>
							</div>
                        </div>
                        <div class="text-center">
                            <asp:Button ID="BtnAplicarFiltro" runat="server" Text="Aplicar Filtro" CssClass="btn btn-primary" OnClick="BtnAplicarFiltro_Click"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Tabla de productos -->
        <div class="grid-container">
            <asp:GridView ID="gvProductos" runat="server" CssClass="table table-bordered table-hover" CellPadding="3" GridLines="None" AutoGenerateColumns="False" AutoGenerateSelectButton="True" OnSelectedIndexChanged="gvProductos_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="IdProducto" HeaderText="IdProducto"/>
                    <asp:BoundField DataField="Marca" HeaderText="Marca" />
                    <asp:BoundField DataField="Modelo" HeaderText="Modelo" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio"/>
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