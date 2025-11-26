<%@ Page Title="" Language="C#" MasterPageFile="~/MasterMedico.Master" AutoEventWireup="true" CodeBehind="DetalleRegistroMedico.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.DetalleRegistroMedico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <h3 class="fw-bold mb-3">Registro médico del paciente</h3>

        <div class="card shadow-sm border-0">
            <div class="card-body">

                <asp:HiddenField ID="hfIdRegistro" runat="server" />

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label fw-semibold">Nombre del paciente</label>
                        <asp:TextBox ID="txtPaciente" runat="server" CssClass="form-control" ReadOnly="true" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label fw-semibold">Fecha de la consulta</label>
                        <asp:TextBox ID="txtFecha" runat="server" CssClass="form-control" ReadOnly="true" />
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-12">
                        <label class="form-label fw-semibold">Motivo de la consulta</label>
                        <asp:TextBox ID="txtMotivo" runat="server" CssClass="form-control" ReadOnly="true" />
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label fw-semibold">Diagnóstico</label>
                        <asp:TextBox ID="txtDiagnostico" runat="server" CssClass="form-control" ReadOnly="true" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label fw-semibold">Observaciones</label>
                        <asp:TextBox ID="txtObservacion" runat="server" CssClass="form-control"
                            TextMode="MultiLine" Rows="3" ReadOnly="true" />
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-12">
                            <label class="form-label fw-semibold">Tratamiento</label>
                            <asp:TextBox ID="txtTratamiento" runat="server" CssClass="form-control"
                                TextMode="MultiLine" Rows="3" ReadOnly="true" />
                        </div>
                    </div>

                </div>

                <div class="mt-4 d-flex gap-2">
                    <asp:Button ID="btnEditar" runat="server" Text="✏️ Editar"
                        CssClass="btn btn-warning"
                        OnClick="btnEditar_Click" />

                    <asp:Button ID="btnGuardar" runat="server" Text="💾 Guardar cambios"
                        CssClass="btn btn-success"
                        OnClick="btnGuardar_Click" Visible="false" />

                    <asp:Button ID="btnCancelar" runat="server" Text="⬅️ Volver"
                        CssClass="btn btn-secondary"
                        PostBackUrl="~/RegistroConsultaMedico.aspx" />

                    <asp:Button ID="btnImprimir" runat="server" Text="🖨️ Imprimir"
                        CssClass="btn btn-outline-dark"
                        OnClick="btnImprimir_Click" />


                </div>
                <!-- Mensaje de resultado -->
                <asp:Label ID="lblResultado" runat="server"
                    CssClass="fw-bold mt-3 d-block"
                    Visible="false" />

            </div>
        </div>
    </div>
</asp:Content>
