<%@ Page Title="Inicio Médico" Language="C#" MasterPageFile="~/MasterMedico.Master" AutoEventWireup="true" CodeBehind="InicioMedico.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.InicioMedico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/es.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-4">
        <h2 class="fw-bold mb-3">Agenda del Médico</h2>
        <p class="text-muted">
            <asp:Label ID="lblFechaActual" runat="server" />
        </p>

        <!-- Tarjetas resumen (labels simples) -->
        <div class="row mb-4">
            <div class="col-md-4">
                <div class="card text-center shadow-sm border-0">
                    <div class="card-body">
                        <h5 class="fw-bold">Total de Turnos</h5>
                        <h2 class="text-primary">
                            <asp:Label ID="lblTotalTurnos" runat="server" Text="0" /></h2>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center shadow-sm border-0">
                    <div class="card-body">
                        <h5 class="fw-bold">Pacientes Atendidos</h5>
                        <h2 class="text-success">
                            <asp:Label ID="lblAtendidos" runat="server" Text="0" /></h2>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center shadow-sm border-0">
                    <div class="card-body">
                        <h5 class="fw-bold">Turnos Pendientes</h5>
                        <h2 class="text-warning">
                            <asp:Label ID="lblPendientes" runat="server" Text="0" /></h2>
                    </div>
                </div>
            </div>
        </div>

        <!-- Filtro por fecha -->
        <div class="d-flex align-items-center mb-3">
            <span class="fw-bold me-3">Seleccionar fecha:</span>
            <asp:TextBox ID="txtFecha" runat="server" CssClass="form-control w-auto" />
            <asp:Button ID="btnBuscar" runat="server" Text="Ver Turnos" CssClass="btn btn-primary ms-3" OnClick="btnBuscar_Click" />
        </div>

        <!-- Tabla de turnos -->
        <div class="card shadow-sm border-0">
            <div class="card-body">
                <h5 class="fw-bold mb-3">Turnos del día:
                    <asp:Label ID="lblTurnosFecha" runat="server" />
                </h5>

                <asp:GridView ID="gvTurnos" runat="server" AutoGenerateColumns="False"
                    CssClass="table align-middle table-hover"
                    DataKeyNames="IdTurno"
                    OnRowCommand="gvTurnos_RowCommand">

                    <Columns>
                        <asp:BoundField DataField="Hora" HeaderText="Hora" />
                        <asp:BoundField DataField="Paciente" HeaderText="Paciente" />
                        <asp:BoundField DataField="Motivo" HeaderText="Motivo" />
                        <asp:BoundField DataField="Estado" HeaderText="Estado" />

                        <asp:TemplateField HeaderText="Acciones">
                            <ItemTemplate>

                                <!-- Registro clínico -->
                                <%--<asp:LinkButton ID="btnRegistro" runat="server"
                                    CssClass="btn btn-outline-primary btn-sm me-1 rounded-pill"
                                    CommandName="Registro"
                                    CommandArgument="<%# Container.DataItemIndex %>"
                                    data-bs-toggle="tooltip" title="Registrar atención del paciente">
                                    📝
                                </asp:LinkButton>--%>

                                <!-- Detalles -->
                                <asp:LinkButton ID="btnDetalle" runat="server"
                                    CssClass="btn btn-outline-primary btn-sm me-1 rounded-pill action-btn"
                                    CommandName="Detalle"
                                    CommandArgument="<%# Container.DataItemIndex %>"
                                    data-bs-toggle="tooltip" title="Ver detalles del turno">
            🔍
                                </asp:LinkButton>

                                <!-- Nueva consulta -->
                                <asp:LinkButton ID="btnNuevaConsulta" runat="server"
                                    CssClass="btn btn-outline-primary btn-sm rounded-pill action-btn"
                                    CommandName="NuevaConsulta"
                                    CommandArgument="<%# Container.DataItemIndex %>"
                                    data-bs-toggle="tooltip" title="Agregar nueva consulta médica">
            ➕
                                </asp:LinkButton>

                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>

            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            flatpickr("#<%= txtFecha.ClientID %>", {
                locale: "es",
                dateFormat: "Y-m-d",
                defaultDate: new Date()
            });
        });
    </script>

</asp:Content>
