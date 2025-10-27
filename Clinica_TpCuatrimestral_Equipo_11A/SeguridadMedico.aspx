<%@ Page Title="Seguridad Médico" Language="C#" MasterPageFile="~/MasterMedico.Master" AutoEventWireup="true" CodeBehind="SeguridadMedico.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.SeguridadMedico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container-fluid mt-4">
    <!-- 🔹 Barra superior con menú de navegación -->
    <div class="d-flex justify-content-start align-items-center bg-white p-2 rounded shadow-sm mb-4">
        <ul class="nav nav-pills">
            <li class="nav-item">
                <a class="nav-link text-dark" href="ConfiguracionMedico.aspx">
                    <i class="bi bi-person me-2"></i>Información personal
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="#">
                    <i class="bi bi-lock me-2"></i>Seguridad
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-dark" href="NotificacionesMedico.aspx">
                    <i class="bi bi-bell me-2"></i>Notificaciones
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-dark" href="PrivacidadMedico.aspx">
                    <i class="bi bi-shield-lock me-2"></i>Privacidad
                </a>
            </li>
        </ul>
    </div>

    <!-- 🔹 Contenido principal -->
    <div class="bg-white p-4 rounded shadow-sm">
        <h3 class="fw-bold mb-3">Seguridad</h3>
        <p class="text-muted">
            Actualiza tu contraseña regularmente para mantener tu cuenta segura.
        </p>

        <form>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label fw-semibold">Contraseña actual</label>
                    <input type="password" class="form-control" placeholder="••••••••" />
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label fw-semibold">Nueva contraseña</label>
                    <input type="password" class="form-control" placeholder="••••••••" />
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-semibold">Confirmar nueva contraseña</label>
                    <input type="password" class="form-control" placeholder="••••••••" />
                </div>
            </div>

            <div class="mt-3">
                <button type="submit" class="btn btn-primary me-2">Guardar cambios</button>
                <button type="button" class="btn btn-secondary" onclick="window.location.href='InicioMedico.aspx'">
                    Cancelar
                </button>
            </div>
        </form>
    </div>
</div>
</asp:Content>
