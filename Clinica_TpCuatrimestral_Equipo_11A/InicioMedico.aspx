<%@ Page Title="Inicio Médico" Language="C#" MasterPageFile="~/MasterMedico.Master" AutoEventWireup="true" CodeBehind="InicioMedico.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.InicioMedico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container mt-4">
    <h2 class="fw-bold">Agenda de Hoy</h2>
    <p class="text-muted">Lunes, 27 de octubre de 2025</p>

    <div class="row mb-4">
        <div class="col-md-4">
            <div class="card text-center shadow-sm border-0">
                <div class="card-body">
                    <h5 class="fw-bold">Total de Turnos</h5>
                    <h2 class="text-primary">15</h2>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-center shadow-sm border-0">
                <div class="card-body">
                    <h5 class="fw-bold">Pacientes Atendidos</h5>
                    <h2 class="text-success">8 / 15</h2>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-center shadow-sm border-0">
                <div class="card-body">
                    <h5 class="fw-bold">Turnos Pendientes</h5>
                    <h2 class="text-warning">3</h2>
                </div>
            </div>
        </div>
    </div>

    <div class="d-flex justify-content-between align-items-center mb-3">
        <div>
            <button class="btn btn-outline-secondary me-2">Día anterior</button>
            <button class="btn btn-primary">Hoy</button>
            <button class="btn btn-outline-secondary ms-2">Día siguiente</button>
        </div>
        
    </div>

    <div class="card shadow-sm border-0">
        <div class="card-body">
            <div class="d-flex justify-content-between mb-3">
                <h5 class="fw-bold mb-0">Turnos del día</h5>
                <input type="text" class="form-control w-25" placeholder="Buscar paciente..." />
            </div>

            <table class="table align-middle table-hover">
                <thead class="table-light">
                    <tr>
                        <th>Hora</th>
                        <th>Paciente</th>
                        <th>Motivo</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>09:00</td>
                        <td class="bg-info text-white">Paciente Ejemplo</td>
                        <td>Control</td>
                        <td>Programado</td>
                        <td>
                            <!-- 🔹 Botón modificado: lleva al historial -->
                            <a href="HistoriaClinicaMedico.aspx" class="btn btn-outline-primary btn-sm" title="Ver historial del paciente">
                                <i class="bi bi-person"></i>
                            </a>
                            <button class="btn btn-outline-secondary btn-sm" title="Ver detalles del turno">
                                <i class="bi bi-eye"></i>
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</asp:Content>
