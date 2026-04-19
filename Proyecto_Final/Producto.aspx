<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Producto.aspx.cs" Inherits="Proyecto_Final.Producto" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Equipos</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Equipos</h1>

            <asp:Button ID="btnMenu" runat="server" Text="Volver al menú" PostBackUrl="~/MENU.aspx" />
            <br /><br />

            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
        </div>
    </form>
</body>
</html>