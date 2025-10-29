<%@ Page Title="" Language="C#" MasterPageFile="~/MasterRecepcionista.Master" AutoEventWireup="true" CodeBehind="CancelarTurnosRecepcionista.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.CancelarTurnosRecepcionista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="card shadow-sm border-0">
            <div class="card-body">
                <h4 class="fw-bold mb-4">Cancelar agenda</h4>

          
                <div class="row g-3 align-items-end mb-4">
                    <div class="col-md-3">
                        <label class="form-label fw-semibold">Especialidad</label>
                        <asp:DropDownList ID="ddlCancelarRecepcionista" runat="server" CssClass="form-select form-select-sm border-dark-subtle rounded-2"
                            AutoPostBack="true" OnSelectedIndexChanged="ddlCancelarRecepcionista_SelectedIndexChanged">
                            <asp:ListItem Selected hidden>Seleccione</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-3">
                        <label class="form-label fw-semibold">Profesional</label>
                        <asp:DropDownList ID="ddlMedicoCancelar" runat="server" CssClass="form-select form-select-sm border-dark-subtle rounded-2"
                            AutoPostBack="true" OnSelectedIndexChanged="ddlMedicoCancelar_SelectedIndexChanged">
                            <asp:ListItem Selected hidden>Seleccione</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-3">
                        <label class="form-label fw-semibold">Fecha</label>
                        <asp:DropDownList ID="ddlFechaCancelar" runat="server" CssClass="form-select form-select-sm border-dark-subtle rounded-2"
                            AutoPostBack="true" OnSelectedIndexChanged="ddlFechaCancelar_SelectedIndexChanged">
                            <asp:ListItem Selected hidden>Seleccione</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-3 text-end">
                    
                        <button type="button" class="btn btn-sm btn-primary w-100" data-bs-toggle="modal" data-bs-target="#modalCancelarAgenda">
                            Cancelar agenda
                        </button>
                    </div>
                </div>

                <div class="modal fade" id="modalCancelarAgenda" tabindex="-1" aria-labelledby="modalCancelarAgendaLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="modalCancelarAgendaLabel">Confirmar cancelación de agenda</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                            </div>
                            <div class="modal-body">
                                ¿Estás seguro de que deseas cancelar la agenda seleccionada?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary px-4" data-bs-dismiss="modal">No</button>
                                <button type="button" class="btn btn-primary btn-sm px-4">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>

               
                <h5 class="fw-bold mb-3">Turnos del día</h5>
                <table class="table align-middle table-hover table-bordered text-center">
                    <thead class="table-light">
                        <tr>
                            <th>Hora</th>
                            <th>Paciente</th>
                            <th>Profesional</th>
                            <th>Especialidad</th>
                            <th>Estado</th>
                            <th>Acción</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>09:00</td>
                            <td>Lucía Martínez</td>
                            <td>Dr. Juan Pérez</td>
                            <td>Clínica Médica</td>
                            <td class="fw-semibold">Pendiente</td>
                            <td>
                                <button type="button" class="btn btn-sm btn-primary w-100" data-bs-toggle="modal" data-bs-target="#modalCancelarTurno">
                                    Cancelar
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>11:30</td>
                            <td>Carlos Díaz</td>
                            <td>Dr. José García</td>
                            <td>Traumatología</td>
                            <td class="fw-semibold">Pendiente</td>
                            <td>
                                <button type="button" class="btn btn-sm btn-primary w-100" data-bs-toggle="modal" data-bs-target="#modalCancelarTurno">
                                    Cancelar
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>

               
                <div class="modal fade" id="modalCancelarTurno" tabindex="-1" aria-labelledby="modalCancelarTurnoLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="modalCancelarTurnoLabel">Confirmar cancelación</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                            </div>
                            <div class="modal-body">
                                ¿Estás seguro de que deseas cancelar este turno?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary px-4" data-bs-dismiss="modal">No</button>
                                <button type="button" class="btn btn-primary btn-sm px-4">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
