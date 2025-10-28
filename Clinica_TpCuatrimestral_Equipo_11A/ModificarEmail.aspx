<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ModificarEmail.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.ModificarEmail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-center align-items-center vh-100 bg-light">
        <div class="card shadow p-4" style="width: 22rem;">
            <div class="mb-3 text-center">
                <img src="https://i.postimg.cc/vT8ZftkZ/photo-2025-10-25-19-40-56.jpg"
                    alt="ClinicApp Logo"
                    class="img-fluid rounded-circle border shadow-sm"
                    style="width: 100px; height: 100px; object-fit: cover;">
            </div>

            <h4 class="text-center mb-4">Actualiza tu dirección de correo electrónico</h4>

            <div class="mb-3">
                <div class="form-text">Por tu seguridad y para asegurarte que vas a recibir todas las notificaciones importantes, ingresá tu correo electrónico.</div>
                <label for="txtEmail" class="form-label">Correo electrónico actual</label>
                <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="Ingresa tu correo electrónico" TextMode="Email" runat="server"></asp:TextBox>

            </div>

            <div class="mb-3">
                <label for="txtEmail" class="form-label">Nuevo correo electrónico</label>
                <asp:TextBox ID="TxtbEmail" CssClass="form-control" placeholder="Ingresa tu nuevo correo electrónico" TextMode="Email" runat="server"></asp:TextBox>

            </div>
            <div class="mb-3">
                <label for="txtEmail" class="form-label">Nuevo correo electrónico</label>
                <asp:TextBox ID="TxtEmail2" CssClass="form-control" placeholder="Ingresa tu nuevo correo electrónico" TextMode="Email" runat="server"></asp:TextBox>

            </div>
            <asp:Button ID="btnSubmitEmail" Text="Actualizar y continuar" CssClass="btn btn-primary w-100" runat="server" />
            <div class="text-center mt-3">
                <a href="Default.aspx" class="text-decoration-none">Volver al inicio</a>
            </div>
        </div>
</asp:Content>
