<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Detalles.aspx.cs" Inherits="Proyecto_Final.Detalles" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Detalles de Reparación</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Detalles de Reparación</h1>

            <asp:Button ID="btnMenu" runat="server" Text="Volver al menú" PostBackUrl="~/MENU.aspx" />
            <br /><br />

            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
        </div>
    </form>
</body>
</html>