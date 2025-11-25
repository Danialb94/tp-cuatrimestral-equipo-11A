<%@ Page Title="Detalle del Turno" Language="C#"
    MasterPageFile="~/MasterMedico.Master"
    AutoEventWireup="true"
    CodeBehind="DetalleTurnoMedico.aspx.cs"
    Inherits="Clinica_TpCuatrimestral_Equipo_11A.DetalleTurnoMedico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-4">

        <h3 class="fw-bold mb-3">Detalle del turno</h3>
        <p class="text-muted mb-4">Información completa sobre el turno seleccionado.</p>

        <div class="card shadow-sm border-0">
            <div class="card-body">

                <h5 class="fw-bold mb-3">
                    <i class="bi bi-calendar-event me-2"></i>Información del turno
                </h5>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label fw-semibold">Paciente:</label>
                        <p class="form-control-plaintext">
                            <asp:Label ID="lblPaciente" runat="server" />
                        </p>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label fw-semibold">Fecha y hora:</label>
                        <p class="form-control-plaintext">
                            <asp:Label ID="lblFechaHora" runat="server" />
                        </p>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label fw-semibold">Motivo de la consulta:</label>
                        <p class="form-control-plaintext">
                            <asp:Label ID="lblMotivo" runat="server" />
                        </p>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label fw-semibold">Estado:</label>
                        <p class="form-control-plaintext">
                            <asp:Label ID="lblEstado" runat="server" />
                        </p>
                    </div>
                </div>

            </div>
        </div>

        <!-- BOTONES -->
        <div class="d-flex justify-content-start mt-3">
            <a href="InicioMedico.aspx" class="btn btn-secondary me-2">
                <i class="bi bi-arrow-left me-1"></i>Volver
            </a>

            <a href="RegistroConsultaMedico.aspx" class="btn btn-primary">
                <i class="bi bi-card-text me-1"></i>Ver registro clínico
            </a>
        </div>

    </div>

</asp:Content>
