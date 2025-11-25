<%@ Page Title="Registro Clínico del Paciente" Language="C#" MasterPageFile="~/MasterMedico.Master"
    AutoEventWireup="true" CodeBehind="RegistroConsultaMedico.aspx.cs"
    Inherits="Clinica_TpCuatrimestral_Equipo_11A.RegistroConsultaMedico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .truncate {
            max-width: 130px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            display: inline-block;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">

        <!-- Título y botón -->
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h3 class="fw-bold mb-0">Registro Clínico del Paciente</h3>
            <asp:Button ID="btnNuevaConsulta" runat="server" CssClass="btn btn-primary"
                Text="Agregar nueva consulta médica" OnClick="btnNuevaConsulta_Click" />
        </div>

        <p class="text-muted mb-4">Aquí puedes visualizar los antecedentes y registros médicos del paciente seleccionado.</p>

        <!-- Datos del paciente -->
        <div class="card mb-4 shadow-sm border-0">
            <div class="card-body">
                <h5 class="fw-bold mb-3">Datos del paciente</h5>
                <div class="row">
                    <div class="col-md-4">
                        <p>
                            <strong>Nombre:</strong>
                            <asp:Label ID="lblNombre" runat="server" />
                        </p>
                        <p>
                            <strong>Apellido:</strong>
                            <asp:Label ID="lblApellido" runat="server" />
                        </p>
                    </div>
                    <div class="col-md-4">
                        <p>
                            <strong>Fecha de nacimiento:</strong>
                            <asp:Label ID="lblFechaNac" runat="server" />
                        </p>
                        <p>
                            <strong>Edad:</strong>
                            <asp:Label ID="lblEdad" runat="server" />
                        </p>
                    </div>
                    <div class="col-md-4">
                        <p>
                            <strong>Domicilio:</strong>
                            <asp:Label ID="lblDomicilio" runat="server" />
                        </p>
                        <p>
                            <strong>Profesional:</strong>
                            <asp:Label ID="lblProfesional" runat="server" />
                        </p>
                        <p>
                            <strong>Última consulta:</strong>
                            <asp:Label ID="lblUltimaConsulta" runat="server" />
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Antecedentes -->
        <div class="card mb-4 shadow-sm border-0">
            <div class="card-body">
                <h5 class="fw-bold mb-3">Antecedentes de salud</h5>
                <div class="row">
                    <div class="col-md-6">
                        <p>
                            <strong>Alergias:</strong>
                            <asp:Label ID="lblAlergias" runat="server" />
                        </p>
                    </div>
                    <div class="col-md-6">
                        <p>
                            <strong>Condiciones previas:</strong>
                            <asp:Label ID="lblCondiciones" runat="server" />
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Consultas -->
        <div class="card shadow-sm border-0">
            <div class="card-body">
                <h5 class="fw-bold mb-3">Consultas registradas</h5>
                <asp:GridView ID="gvConsultas" runat="server" AutoGenerateColumns="False"
                    CssClass="table table-hover align-middle"
                    OnRowCommand="gvConsultas_RowCommand">

                    <Columns>

                        <asp:BoundField DataField="IdTurno" HeaderText="ID" Visible="false" />

                        <asp:BoundField DataField="Fecha" HeaderText="Fecha" />

                        <asp:TemplateField HeaderText="Motivo">
                            <ItemTemplate>
                                <span class="truncate"><%# Eval("Motivo") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Diagnóstico">
                            <ItemTemplate>
                                <span class="truncate"><%# Eval("Diagnostico") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Observación">
                            <ItemTemplate>
                                <span class="truncate"><%# Eval("Observacion") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Tratamiento">
                            <ItemTemplate>
                                <span class="truncate"><%# Eval("Tratamiento") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Acciones">
                            <ItemTemplate>
                                <asp:Button ID="btnVer" runat="server" Text="Ver detalle"
                                    CommandName="Ver"
                                    CommandArgument='<%# Eval("IdTurno") %>'
                                    CssClass="btn btn-outline-primary btn-sm me-2" />

                                <asp:Button ID="btnEditar" runat="server" Text="✏️"
                                    CommandName="Editar"
                                    CommandArgument='<%# Eval("IdTurno") %>'
                                    CssClass="btn btn-outline-secondary btn-sm" />
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>

            </div>
        </div>

        <!-- Botón volver -->
        <div class="mt-4">
            <asp:Button ID="btnVolver" runat="server" Text="Volver"
                CssClass="btn btn-secondary" PostBackUrl="~/PacienteMedico.aspx" />
        </div>


        <%--<!-- Modal de advertencia -->
        <div class="modal fade" id="modalErrorTurno" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <div class="modal-header bg-warning">
                        <h5 class="modal-title text-dark fw-bold">⚠ No es posible registrar la consulta</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <div class="modal-body">
                        <p class="mb-0">No existe un turno asignado para este día.</p>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    </div>

                </div>
            </div>
        </div>--%>


    </div>
</asp:Content>
