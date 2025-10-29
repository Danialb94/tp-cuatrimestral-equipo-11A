<%@ Page Title="Historia Clínica" Language="C#" MasterPageFile="~/MasterMedico.Master" AutoEventWireup="true" CodeBehind="HistoriaClinicaMedico.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.HistoriaClinicaMedico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container mt-4">

    <!-- 🔹 Título y botón agregar nuevo historial -->
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h3 class="fw-bold mb-0">Historia Clínica del Paciente</h3>
        <button type="button" class="btn btn-primary">
            <i class="bi bi-plus-circle me-1"></i> Agregar nuevo historial
        </button>
    </div>

    <p class="text-muted mb-4">Aquí puedes visualizar los antecedentes y registros médicos del paciente seleccionado.</p>

    <!-- 🔹 Datos básicos del paciente -->
    <div class="card mb-4 shadow-sm border-0">
        <div class="card-body">
            <h5 class="fw-bold mb-3">Datos del paciente</h5>
            <div class="row">
                <div class="col-md-4">
                    <p><strong>Nombre:</strong> Paciente Ejemplo</p>
                    <p><strong>DNI:</strong> 45.678.910</p>
                </div>
                <div class="col-md-4">
                    <p><strong>Edad:</strong> 45 años</p>
                    <p><strong>Género:</strong> Masculino</p>
                </div>
                <div class="col-md-4">
                    <p><strong>Última consulta:</strong> 10/09/2025</p>
                    <p><strong>Profesional:</strong> Dr. Juan Pérez</p>
                </div>
            </div>
        </div>
    </div>

    <!-- 🔹 Tabla de consultas previas -->
    <div class="card shadow-sm border-0">
        <div class="card-body">
            <h5 class="fw-bold mb-3">Consultas registradas</h5>
            <table class="table table-hover align-middle">
                <thead class="table-light">
                    <tr>
                        <th>Fecha</th>
                        <th>Motivo</th>
                        <th>Diagnóstico</th>
                        <th>Tratamiento</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>10/09/2025</td>
                        <td>Control de presión</td>
                        <td>Hipertensión leve</td>
                        <td>Ajuste de medicación</td>
                    </tr>
                    <tr>
                        <td>15/06/2025</td>
                        <td>Chequeo anual</td>
                        <td>Sin alteraciones</td>
                        <td>Revisión en 6 meses</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <!-- 🔹 Botón volver -->
    <div class="mt-4">
        <button type="button" class="btn btn-secondary" onclick="location.href='InicioMedico.aspx'">Volver</button>
    </div>
</div>
</asp:Content>
