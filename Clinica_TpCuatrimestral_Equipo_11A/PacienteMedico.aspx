<%@ Page Title="Pacientes Médico" Language="C#" MasterPageFile="~/MasterMedico.Master" AutoEventWireup="true" CodeBehind="PacienteMedico.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.PacienteMedico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <h3 class="fw-bold mb-3">Listado de Pacientes</h3>
        <p class="text-muted mb-4">Seleccione un paciente para ver su historial clínico.</p>

        <div class="card shadow-sm border-0">
            <div class="card-body">
                <div class="d-flex justify-content-between mb-3">
                    <h5 class="fw-bold mb-0">Pacientes</h5>
                    <input type="text" class="form-control w-25" placeholder="Buscar paciente..." />
                </div>

                <table class="table align-middle table-hover">
                    <thead class="table-light">
                        <tr>
                            <th>Nombre y Apellido</th>
                            <th>Teléfono</th>
                            <th>Documento</th>
                            <th>Obra Social</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Juan Pérez</td>
                            <td>123456789</td>
                            <td>12.345.678</td>
                            <td>OSDE</td>
                            <td>
                                <a href="HistoriaClinicaMedico.aspx" class="btn btn-outline-primary btn-sm" title="Ver historial del paciente">
                                    <i class="bi bi-person"></i>Ver historial
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>María Gómez</td>
                            <td>987654321</td>
                            <td>87.654.321</td>
                            <td>Galeno</td>
                            <td>
                                <a href="HistoriaClinicaMedico.aspx" class="btn btn-outline-primary btn-sm" title="Ver historial del paciente">
                                    <i class="bi bi-person"></i>Ver historial
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>Carlos Fernández</td>
                            <td>456123789</td>
                            <td>45.612.378</td>
                            <td>Medife</td>
                            <td>
                                <a href="HistoriaClinicaMedico.aspx" class="btn btn-outline-primary btn-sm" title="Ver historial del paciente">
                                    <i class="bi bi-person"></i>Ver historial
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
