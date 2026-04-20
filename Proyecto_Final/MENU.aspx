<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MENU.aspx.cs" Inherits="Proyecto_Final.MENU" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Menú Principal</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
        }

        /* Header superior */
        .header {
            background-color: #2c3e50;
            color: white;
            padding: 15px;
            text-align: center;
        }

        .subheader {
            font-size: 18px;
            color: #dcdcdc;
            margin-top: 8px;
        }

        /* Contenedor central */
        .contenedor {
            width: 500px;
            margin: 50px auto;
        }

        /* Card */
        .card {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 12px rgba(0,0,0,0.15);
            text-align: center;
        }

        .titulo {
            margin-bottom: 25px;
            color: #1f3b5b;
        }

        /* Botones */
        .grupo-botones {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .boton-menu {
            width: 100%;
            padding: 12px;
            font-size: 18px;
            border: none;
            border-radius: 6px;
            background-color: #2f6fad;
            color: white;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }

        .boton-menu:hover {
            background-color: #1f4f7d;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <!-- Header superior -->
        <div class="header">
            <h1>Sistema de Reparaciones</h1>
            <div class="subheader">
                Proyecto Final Introducción a la Programación
            </div>
        </div>

        <!-- Contenido -->
        <div class="contenedor">
            <div class="card">

                <h2 class="titulo">Menú Principal</h2>

                <div class="grupo-botones">
                    <asp:Button ID="btnUsuarios" runat="server" CssClass="boton-menu" Text="Usuarios" PostBackUrl="~/bodega.aspx" />
                    <asp:Button ID="btnEquipos" runat="server" CssClass="boton-menu" Text="Equipos" PostBackUrl="~/Producto.aspx" />
                    <asp:Button ID="btnTecnicos" runat="server" CssClass="boton-menu" Text="Técnicos" PostBackUrl="~/Tecnicos.aspx" />
                    <asp:Button ID="btnReparaciones" runat="server" CssClass="boton-menu" Text="Reparaciones" PostBackUrl="~/Reparaciones.aspx" />
                    <asp:Button ID="btnAsignaciones" runat="server" CssClass="boton-menu" Text="Asignaciones" PostBackUrl="~/Asignaciones.aspx" />
                    <asp:Button ID="btnDetalles" runat="server" CssClass="boton-menu" Text="Detalles de Reparación" PostBackUrl="~/Detalles.aspx" />
                </div>

            </div>
        </div>

    </form>
</body>
</html>