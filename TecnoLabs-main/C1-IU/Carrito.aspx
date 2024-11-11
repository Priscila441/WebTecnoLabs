<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="C1_IU.Carrito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Mantener el fondo y el estilo del título */
        body {
            background-color: #470224;
        }
        .page-header {
            background-color: #470224;
            color: #FFC0C0;
            padding: 1rem;
            border-radius: 10px;
            text-align: left;
            margin-left: 150px;
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

        /* Cuadro de pasos (más pequeño) */
        .steps-container {
            display: flex;
            justify-content: space-between;
            margin-top: 0.5px;
            margin-left: 150px;
            padding: 1px;
            background-color: #FFC0C0;
            border-radius: 10px;
            font-size: 12px; /* Tamaño más pequeño */
        }

        .step {
            text-align: center;
        }

        .step-number {
            width: 25px;  /* Más pequeño */
            height: 25px; /* Más pequeño */
            background-color: #470224;
            color: white;
            border-radius: 50%;
            display: inline-block;
            line-height: 25px;
            margin-bottom: 5px;
        }

        .step.active .step-number {
            background-color: #FFD700;
        }

        /* Imagen centrada en el borde inferior */
        .bottom-image {
            width: 80%;
            height: 115px;
            background-image: url('images/Promos.png');
            background-size: cover;
            background-position: center;
            position: fixed;
            bottom: 0;
            left: 50%;
            transform: translateX(-45%);
            border-radius: 25px;
        }

        /* Estilo del botón "Quitar Producto" en la parte superior */
        .top-buttons-container {
            text-align: left;
            margin-left:275px; /* Alineación a la izquierda */
            margin-top: 20px; /* Separación con el encabezado */
        }

        /* Estilo del botón "Quitar Producto" */
        .top-buttons-container button {
            padding: 10px 20px;
            font-size: 14px;
            background-color: #FFD700; /* Color amarillo */
            color: white; /* Texto oscuro */
            border: none;
            border-radius: 30px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .top-buttons-container button:hover {
            transform: scale(1.05);
            box-shadow: 0 12px 20px rgba(0, 0, 0, 0.2);
        }

        /* Estilo de los botones en la parte inferior */
        .bottom-buttons-container {
            position: fixed;
            bottom: 120px;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
            justify-content: space-between;
            width: 60%;
        }

        /* Estilo de cada botón */
        .bottom-buttons-container button {
            padding: 10px 20px;
            font-size: 14px;
            color: white;
            border: none;
            border-radius: 30px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
            cursor: pointer;
            transition: all 0.3s ease;
            width: 15%;
        }

        /* Efecto hover para los botones */
        .bottom-buttons-container button:hover {
            transform: scale(1.05);
            box-shadow: 0 12px 20px rgba(0, 0, 0, 0.2);
        }

        .bottom-buttons-container button:active {
            transform: scale(1);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
        }

        /* Colores de botones */
        .pay-button {
            background: #dc3545;
        }

        .calculate-button {
            background: #007bff;
        }

        .back-button {
            background: #28a745;
        }

        /* Botón "Volver" en el borde inferior derecho con ícono */
        .back-button-container {
            position: fixed;
            bottom: 120px;
            right: 50px; /* Alineado a la derecha */
        }

        .back-button-container button {
            padding: 10px 20px;
            font-size: 14px;
            color: white;
            background-color: #007bff;
            border: none;
            border-radius: 30px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .back-button-container button i {
            margin-right: 5px;
        }

        .back-button-container button:hover {
            transform: scale(1.05);
            box-shadow: 0 12px 20px rgba(0, 0, 0, 0.2);
        }

             /* Estilo para el cuadro de método de pago (más grande) */
        .payment-method-container {
            margin: 30px auto;
            width: 20%; /* Reducido al 50% */
            padding: 10px;
            background-color: #FFC0C0;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
            position: absolute; /* Agregar posición absoluta */
            right: 0; /* Colocarlo hacia el borde derecho */
            top: 30%; /* Ajusta el valor según sea necesario para que quede a la altura correcta */
        }

        .payment-method-container h3 {
            margin-bottom: 10px; /* Menos espacio */
            color: #470224;
            font-size: 15px; /* Tamaño más pequeño */
        }

        .payment-method-container input[type="text"] {
            width: 50%;
            padding: 8px; /* Menos padding */
            font-size: 10px; /* Más pequeño */
            margin-bottom: 5px; /* Menos espacio */
            border-radius: 30px;
            border: 1px solid #ccc;
            transition: all 0.3s ease;
        }

        .payment-method-container input[type="text"]:focus {
            border-color: #470224;
            outline: none;
        }
                /* Estilo para el cuadro de método de pago (más grande) */
        .payment-method-container input[type="text"] {
            width: 80%; /* Ampliado */
            padding: 10px; /* Aumentado el padding */
            font-size: 12px; /* Tamaño de fuente más grande */
            margin-bottom: 5px; /* Espacio reducido */
            border-radius: 30px;
            border: 1px solid #ccc;
            transition: all 0.3s ease;
        }

              /* Botones debajo del cuadro de método de pago */
        .payment-method-buttons {
            display: flex;
            justify-content: space-evenly; /* Alinea los botones de manera equitativa sin tanto espacio */
            width: 100%; /* 100% para que ocupe todo el espacio disponible */
            margin: 0; /* Elimina el margen para evitar espacios adicionales */
        }
        .payment-method-buttons button {
            padding: 8px 16px; /* Menos padding */
            font-size: 12px; /* Más pequeño */
            color: white;
            border: none;
            border-radius: 30px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
            cursor: pointer;
            transition: all 0.3s ease;
            width: 30%;
        }

        .payment-method-buttons button:hover {
            transform: scale(1.05);
            box-shadow: 0 12px 20px rgba(0, 0, 0, 0.2);
        }

        .payment-method-buttons button:active {
            transform: scale(1);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
        }

        /* Colores específicos para los botones */
        .pay-button {
            background: #dc3545;
        }

        .cancel-button {
            background: #28a745;
        }
          /* Estilos para el cuadro de Inicio de Sesión */
        .login-box {
            position: absolute;
            top: 200px; /* Ajusta la distancia desde el borde superior */
            left: 50%; /* Ajusta esta distancia para moverlo más a la derecha */
            width: 25%; /* Ajusta el tamaño del cuadro */
            padding: 20px;
            background-color: #FFC0C0;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
        }

        .login-box h3 {
            margin-bottom: 15px;
            color: #470224;
            font-size: 18px;
        }

        .login-box input[type="text"], .login-box input[type="password"] {
            width: 80%;
            padding: 10px;
            font-size: 14px;
            margin-bottom: 10px;
            border-radius: 30px;
            border: 1px solid #ccc;
            transition: all 0.3s ease;
        }

        .login-box input[type="text"]:focus, .login-box input[type="password"]:focus {
            border-color: #470224;
            outline: none;
        }

        .forgot-password {
            display: block;
            margin-bottom: 15px;
            font-size: 12px;
            color: #470224;
            cursor: pointer;
        }

        .login-button {
            padding: 10px 20px;
            font-size: 14px;
            color: white;
            background-color: #dc3545;
            border: none;
            border-radius: 30px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
            cursor: pointer;
            transition: all 0.3s ease;
            width: 50%;
        }

        .login-button:hover {
            transform: scale(1.05);
            box-shadow: 0 12px 20px rgba(0, 0, 0, 0.2);
        }

        .register {
            margin-top: 15px;
            font-size: 12px;
            color: #470224;
        }

        .register a {
            color: #470224;
            text-decoration: underline;
            cursor: pointer;
        }
           /* Mantener el fondo y el estilo del título */
        body {
            background-color: #470224;
        }
        
        .page-header, .register-container h3 {
            background-color: #470224;
            color: #FFC0C0;
            padding: 1rem;
            border-radius: 10px;
            text-align: left;
            margin-left: 150px;
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

          /* Estilo del cuadro de registro del cliente */
        .client-registration-box {
            position: absolute;
            top: 200px; /* Ajusta la posición vertical según sea necesario */
            left: 40%;
            transform: translateX(-50%);
            width: 25%; /* Tamaño del cuadro reducido */
            padding: 10px;
            background-color: #FFC0C0;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
            position: absolute;
        }

        .client-registration-box h3 {
            margin-bottom: 8px;
            color: #470224;
            font-size: 18px; /* Título más pequeño */
        }

        .client-registration-box input[type="text"] {
            width: 90%; /* Anchura ajustada */
            padding: 4px; /* Padding reducido */
            font-size: 12px; /* Tamaño de fuente reducido */
            margin-bottom: 8px;
            border-radius: 15px;
            border: 1px solid #ccc;
            transition: all 0.3s ease;
        }

        .client-registration-box input[type="text"]:focus {
            border-color: #470224;
            outline: none;
        }

        .register-button {
            padding: 10px 30px; /* Tamaño del botón reducido */
            font-size: 12px; /* Tamaño de fuente reducido */
            color: white;
            background-color: #dc3545;
            border: none;
            border-radius: 20px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .register-button:hover {
            transform: scale(1.05);
            box-shadow: 0 12px 20px rgba(0, 0, 0, 0.2);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Título y logo de la página -->
    <div class="page-header">
        <h2>
            <img src="images/carrito.jpg" alt="Imagen" />
            CARRITO DE COMPRAS
        </h2>
    </div>

    <!-- Cuadro de pasos -->
    <div class="steps-container">
        <div class="step active">
            <div class="step-number">1</div>
            Artículos
        </div>
        <div class="step">
            <div class="step-number">2</div>
            Registro
        </div>
        <div class="step">
            <div class="step-number">3</div>
            Envío
        </div>
        <div class="step">
            <div class="step-number">4</div>
            Pago
        </div>
    </div>
    
    <!-- Botón para quitar producto -->
    <div class="top-buttons-container">
        <button>Quitar Producto</button>
    </div>

    <!-- Imagen en el borde inferior centrada -->
    <div class="bottom-image"></div>

    <!-- Botones en la parte inferior -->
    <div class="bottom-buttons-container">
        <button class="back-button">Regresar</button>
        <button class="calculate-button">Calcular Total</button>
        <button class="pay-button">Pagar</button>
    </div>

    <!-- Botón Volver en el borde inferior derecho con ícono -->
    <div class="back-button-container">
        <button>
            <i class="fas fa-arrow-left"></i> Volver
        </button>
    </div>
  
    <!-- Contenedor del GridView -->
<div class="grid-container">
		<asp:GridView ID="gvCarrito" runat="server" AutoGenerateColumns="False"
			CssClass="grid-view" BorderColor="#470224" BorderStyle="Solid"
			BorderWidth="1px" CellPadding="8" ForeColor="#470224"
			GridLines="None">
			<Columns>
				<asp:BoundField DataField="IdProducto" HeaderText="IdProducto" />
				<asp:BoundField DataField="Marca" HeaderText="Marca" />
				<asp:BoundField DataField="Modelo" HeaderText="Modelo" />
				<asp:BoundField DataField="Precio" HeaderText="Precio" DataFormatString="{0:C}" />
				<asp:BoundField DataField="IdCategoria" HeaderText="IdCategoría" />
				<asp:BoundField DataField="Stock" HeaderText="Stock" />
			</Columns>
			<HeaderStyle CssClass="table-primary" />
			<RowStyle CssClass="table-light" />
			<SelectedRowStyle CssClass="selected-row" />
		</asp:GridView>
	</div>
  
    <!-- Cuadro de Inicio de Sesión -->
    <div class="login-box">
        <h3>Inicio de Sesión</h3>
        <input type="text" placeholder="Email">
        <input type="password" placeholder="Contraseña">
        <label class="forgot-password">¿Te olvidaste tu contraseña?</label>
        <button class="login-button">Iniciar Sesión</button>
        <label class="register">¿No tienes cuenta? <a href="#">Regístrate</a></label>
    </div>
         <!-- Cuadro de Registro -->
	<div class="client-registration-box">
		<h3>Registro del Cliente</h3>
		<input type="text" id="name" placeholder="Nombre">
		<input type="text" id="lastname" placeholder="Apellido">
		<input type="text" id="age" placeholder="Edad">
		<input type="text" id="email" placeholder="Email">
		<input type="text" id="address" placeholder="Dirección">
		<input type="text" id="payment" placeholder="Medio de Pago">
		<button class="register-button">Regístrate</button>
	</div>
    <!-- Cuadro de selección de método de pago -->
    <div class="payment-method-container">
        <h3>Seleccione un Método de Pago</h3>
        <input type="text" placeholder="Ingrese su método de pago" id="paymentMethod" />
        <div class="payment-method-buttons">
            <button class="pay-button">Pagar</button>
            <button class="cancel-button">Cancelar</button>
        </div>
    </div>
</asp:Content>

