<%@ Page Title="Nueva Consulta Médica" Language="C#"
    MasterPageFile="~/MasterMedico.Master" AutoEventWireup="true"
    CodeBehind="NuevoRegistroMedico.aspx.cs"
    Inherits="Clinica_TpCuatrimestral_Equipo_11A.NuevoRegistroMedico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">

        <h3 class="fw-bold mb-3">Registrar nueva consulta médica</h3>
        <p class="text-muted mb-4">Complete la información correspondiente a esta atención.</p>

        <div class="card shadow-sm border-0">
            <div class="card-body">

                <!-- Datos del paciente -->
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label fw-semibold">Paciente</label>
                        <asp:TextBox ID="txtPaciente" runat="server" CssClass="form-control" ReadOnly="true" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label fw-semibold">Fecha de la consulta</label>
                        <asp:TextBox ID="txtFecha" runat="server" CssClass="form-control" TextMode="Date" />
                    </div>
                </div>

                <!-- Motivo -->
                <div class="row mb-3">
                    <div class="col-md-12">
                        <label class="form-label fw-semibold">Motivo de la consulta</label>
                        <asp:TextBox ID="txtMotivo" runat="server" CssClass="form-control" ReadOnly="true" />
                    </div>
                </div>

                <!-- Diagnóstico y Observación -->
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label fw-semibold">Diagnóstico</label>
                        <asp:TextBox ID="txtDiagnostico" runat="server" CssClass="form-control"
                            placeholder="Ej.: Migraña, infección urinaria, hipertensión..." />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label fw-semibold">Observaciones</label>
                        <asp:TextBox ID="txtObservacion" runat="server" CssClass="form-control"
                            TextMode="MultiLine" Rows="3"
                            placeholder="Comentarios clínicos relevantes..." />
                    </div>
                </div>

                <!-- Tratamiento -->
                <div class="row mb-3">
                    <div class="col-md-12">
                        <label class="form-label fw-semibold">Tratamiento</label>
                        <asp:TextBox ID="txtTratamiento" runat="server" CssClass="form-control"
                            TextMode="MultiLine" Rows="3"
                            placeholder="Medicamentos, dosis, frecuencia, recomendaciones..." />
                    </div>
                </div>

                <!-- Botones -->
                <div class="d-flex justify-content-start mt-4">
                    <asp:LinkButton ID="btnGuardarConsulta" runat="server" CssClass="btn btn-primary me-2"
                        OnClick="btnGuardarConsulta_Click">
                        <i class="bi bi-save me-1"></i>Guardar consulta
                    </asp:LinkButton>

                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar"
                        CssClass="btn btn-secondary" PostBackUrl="~/RegistroConsultaMedico.aspx" />
                </div>

            </div>
        </div>

    </div>
</asp:Content>
