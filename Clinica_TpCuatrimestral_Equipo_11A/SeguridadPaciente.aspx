<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPaciente.Master" AutoEventWireup="true" CodeBehind="SeguridadPaciente.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.SeguridadPaciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- 🔹 Barra superior con las opciones -->
    <div class="d-flex justify-content-start align-items-center bg-white p-2 rounded shadow-sm mb-4">
        <ul class="nav nav-pills" >

            <!-- Información personal -->
            <li class="nav-item">
                <a class="nav-link"
                    href="EditarPerfilPaciente.aspx" style="color: black;">
                    <i class="bi bi-lock me-2"></i>Información personal
                </a>
            </li>

            <!-- Seguridad -->
            <li class="nav-item">
                <a class="nav-link"
                    href="SeguridadPaciente.aspx">
                    <b class="bi bi-person me-2" style="color: black;">Seguridad</b>
                </a>
            </li>
        </ul>
    </div>
    <div class="bg-white p-4 rounded shadow-sm">
        <h3 class="fw-bold mb-3">Seguridad</h3>
        <p class="text-muted">
            Actualiza tu contraseña regularmente para mantener tu cuenta segura.
        </p>

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
            <button type="button" class="btn btn-secondary">
                Cancelar
            </button>
        </div>
    </div>


</asp:Content>
