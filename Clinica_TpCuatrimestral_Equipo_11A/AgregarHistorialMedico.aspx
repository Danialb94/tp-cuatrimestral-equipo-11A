<%@ Page Title="Agregar Historial Médico" Language="C#" MasterPageFile="~/MasterMedico.Master" AutoEventWireup="true" CodeBehind="AgregarHistorialMedico.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.AgregarHistorialMedico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container mt-4">
    <h3 class="fw-bold mb-3">Agregar nuevo historial médico</h3>
    <p class="text-muted mb-4">Complete la información correspondiente al paciente.</p>

    <div class="card shadow-sm border-0">
        <div class="card-body">
            <form>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label fw-semibold">Nombre del paciente</label>
                        <input type="text" class="form-control" placeholder="Ingrese el nombre del paciente" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label fw-semibold">Fecha de la consulta</label>
                        <input type="date" class="form-control" />
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label fw-semibold">Motivo de la consulta</label>
                        <input type="text" class="form-control" placeholder="Ej: Dolor de cabeza, control, revisión general..." />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label fw-semibold">Diagnóstico</label>
                        <input type="text" class="form-control" placeholder="Ej: Migraña, hipertensión, etc." />
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-semibold">Observaciones</label>
                    <textarea class="form-control" rows="4" placeholder="Agregue comentarios adicionales sobre el paciente"></textarea>
                </div>

                <div class="d-flex justify-content-start mt-4">
                    <button type="submit" class="btn btn-primary me-2">
                        <i class="bi bi-save me-1"></i>Guardar historial
                    </button>
                    <asp:Button ID="btnVolver" runat="server" Text="Cancelar" CssClass="btn btn-secondary" PostBackUrl="~/HistoriaClinicaMedico.aspx" />
                </div>
            </form>
        </div>
    </div>
</div>
</asp:Content>
