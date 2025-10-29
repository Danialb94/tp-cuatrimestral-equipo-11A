<%@ Page Title="Detalle del Turno" Language="C#" MasterPageFile="~/MasterMedico.Master" AutoEventWireup="true" CodeBehind="DetalleTurnoMedico.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.DetalleTurnoMedico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container mt-4">
    <h3 class="fw-bold mb-3">Detalle del turno</h3>
    <p class="text-muted mb-4">Información completa sobre el turno seleccionado.</p>

    <div class="card shadow-sm border-0">
        <div class="card-body">
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label fw-semibold">Paciente:</label>
                    <p class="form-control-plaintext">Paciente Ejemplo</p>
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-semibold">Fecha y hora:</label>
                    <p class="form-control-plaintext">27/10/2025 - 09:00</p>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label fw-semibold">Motivo de la consulta:</label>
                    <p class="form-control-plaintext">Control</p>
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-semibold">Estado:</label>
                    <p class="form-control-plaintext">Programado</p>
                </div>
            </div>

            <div class="mb-3">
                <label class="form-label fw-semibold">Observaciones:</label>
                <p class="form-control-plaintext">Ninguna observación adicional.</p>
            </div>

            <div class="d-flex justify-content-start mt-3">
                <a href="InicioMedico.aspx" class="btn btn-secondary me-2">
                    <i class="bi bi-arrow-left me-1"></i>Volver
                </a>
                <a href="HistoriaClinicaMedico.aspx" class="btn btn-primary">
                    <i class="bi bi-person me-1"></i>Ver historial del paciente
                </a>
            </div>
        </div>
    </div>
</div>
</asp:Content>
