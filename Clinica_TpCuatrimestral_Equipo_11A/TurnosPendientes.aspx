<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPaciente.Master" AutoEventWireup="true" CodeBehind="TurnosPendientes.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.TurnosPendientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="card shadow-sm border-0">
            <div class="card-body">
                <div class="d-flex justify-content-between mb-3">
                    <h5 class="fw-bold mb-0">Turnos Próximos</h5>
                </div>

                <table class="table align-middle table-hover">
                    <thead class="table-light">
                        <tr>
                            <th>Hora</th>
                            <th>Día</th>
                            <th>Médico</th>
                            <th>Especialidad</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>09:00</td>
                            <td>Viernes 31/10</td>
                            <td class="bg-info text-white">Dr. Juan Perez</td>
                            <td>Clínica Médica</td>
                            <td>
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                    Cancelar
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>18:30</td>
                            <td>Martes 11/11</td>
                            <td class="bg-info text-white">Dr. Carlos Gomez</td>
                            <td>Traumatología</td>
                            <td>
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                    Cancelar
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>11:00</td>
                            <td>Martes 25/11</td>
                            <td class="bg-info text-white">Dr. José García</td>
                            <td>Nutrición</td>
                            <td>
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                    Cancelar
                                </button>
                            </td>
                        </tr>
                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Atención!</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        ¿Estás seguro de cancelar este turno?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                                        <button type="button" class="btn btn-primary">Cancelar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
