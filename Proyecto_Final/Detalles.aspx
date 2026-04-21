<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Detalles.aspx.cs" Inherits="Proyecto_Final.Detalles" %>
 
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Detalles de Reparación</title>
 
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
        }
 
        .header {
            background-color: #2c3e50;
            color: white;
            padding: 15px;
            text-align: center;
        }
 
        .contenedor {
            width: 80%;
            max-width: 1100px;
            margin: 30px auto;
        }
 
        .card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0,0,0,0.1);
        }
 
        h2 {
            color: #2c3e50;
            margin-bottom: 5px;
        }
 
        .subtitulo {
            color: #666;
            margin-top: 0;
            margin-bottom: 20px;
        }
 
        .btn {
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            margin-bottom: 15px;
            font-weight: bold;
            transition: background-color 0.2s ease;
        }
 
        .btn:hover {
            background-color: #2980b9;
        }
 
        .grid {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            overflow: hidden;
        }
 
        .grid th {
            background-color: #3498db;
            color: white;
            padding: 10px;
            text-align: left;
        }
 
        .grid td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
 
        .grid tr:nth-child(even) {
            background-color: #f2f2f2;
        }
</style>
</head>
 
<body>
<form id="form1" runat="server">
 
        <div class="header">
<h1>Sistema de Reparaciones</h1>
</div>
 
        <div class="contenedor">
<div class="card">
 
                <h2>Detalles de Reparación</h2>
<p class="subtitulo">Consulta de los detalles registrados en cada reparación.</p>
 
                <asp:Button 
                    ID="btnMenu" 
                    runat="server" 
                    Text="Volver al menú"
                    CssClass="btn"
                    PostBackUrl="~/MENU.aspx" 
                />
 
                <asp:GridView 
                    ID="GridView1" 
                    runat="server"
                    CssClass="grid"
                    AutoGenerateColumns="true">
</asp:GridView>
 
            </div>
</div>
 
    </form>
</body>
</html>