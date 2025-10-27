<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ConfirmarEmail.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.ConfirmarEmail" %>

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

            <h4 class="text-center mb-4">Confirmar correo electrónico</h4>

            <div class="form-text">Un código de 6 dígitos fue enviado a tu casilla de correo. Por favor ingresalo debajo para verificar tu cuenta.</div>


            <div class="d-flex justify-content-center gap-2 my-4">
                <input type="text" maxlength="1" class="form-control text-center shadow-sm"
                    style="width: 45px; height: 50px; border-radius: 8px; border: 1px solid #dee2e6; font-size: 1.25rem;">
                <input type="text" maxlength="1" class="form-control text-center shadow-sm"
                    style="width: 45px; height: 50px; border-radius: 8px; border: 1px solid #dee2e6; font-size: 1.25rem;">
                <input type="text" maxlength="1" class="form-control text-center shadow-sm"
                    style="width: 45px; height: 50px; border-radius: 8px; border: 1px solid #dee2e6; font-size: 1.25rem;">
                <input type="text" maxlength="1" class="form-control text-center shadow-sm"
                    style="width: 45px; height: 50px; border-radius: 8px; border: 1px solid #dee2e6; font-size: 1.25rem;">
                <input type="text" maxlength="1" class="form-control text-center shadow-sm"
                    style="width: 45px; height: 50px; border-radius: 8px; border: 1px solid #dee2e6; font-size: 1.25rem;">
                <input type="text" maxlength="1" class="form-control text-center shadow-sm"
                    style="width: 45px; height: 50px; border-radius: 8px; border: 1px solid #dee2e6; font-size: 1.25rem;">
            </div>




            <asp:Button ID="btnSubmit" Text="Confirmar correo electrónico" CssClass="btn btn-primary w-100" runat="server" OnClick="btnSubmit_Click" />

            <div class="text-center mt-3">
                <span class="text-muted">¿No recibiste el código?</span>
                <a href="#" class="text-decoration-none fw-bold">Reenviar</a>
            </div>
            <div class="text-center mt-3">
                <a href="Default.aspx" class="text-decoration-none">Volver al inicio</a>
            </div>
</asp:Content>
