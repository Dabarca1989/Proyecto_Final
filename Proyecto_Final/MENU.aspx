<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MENU.aspx.cs" Inherits="Proyecto_Final.MENU" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Menú Principal</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Sistema de Reparaciones</h1>

            <asp:Button ID="btnUsuarios" runat="server" Text="Usuarios" PostBackUrl="~/bodega.aspx" />
            <br /><br />

            <asp:Button ID="btnEquipos" runat="server" Text="Equipos" PostBackUrl="~/Producto.aspx" />
            <br /><br />

            <asp:Button ID="btnTecnicos" runat="server" Text="Técnicos" PostBackUrl="~/Tecnicos.aspx" />
            <br /><br />

            <asp:Button ID="btnReparaciones" runat="server" Text="Reparaciones" PostBackUrl="~/Reparaciones.aspx" />
            <br /><br />

            <asp:Button ID="btnAsignaciones" runat="server" Text="Asignaciones" PostBackUrl="~/Asignaciones.aspx" />
            <br /><br />

            <asp:Button ID="btnDetalles" runat="server" Text="Detalles de Reparación" PostBackUrl="~/Detalles.aspx" />
        </div>
    </form>
</body>
</html>