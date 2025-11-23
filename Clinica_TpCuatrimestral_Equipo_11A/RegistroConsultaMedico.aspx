<%@ Page Title="Registro Clínico del Paciente" Language="C#" MasterPageFile="~/MasterMedico.Master"
    AutoEventWireup="true" CodeBehind="RegistroConsultaMedico.aspx.cs"
    Inherits="Clinica_TpCuatrimestral_Equipo_11A.RegistroConsultaMedico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

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
                        <asp:BoundField DataField="Motivo" HeaderText="Motivo" />
                        <asp:BoundField DataField="Diagnostico" HeaderText="Diagnóstico" />
                        <asp:BoundField DataField="Observacion" HeaderText="Observación" />
                        <asp:BoundField DataField="Tratamiento" HeaderText="Tratamiento" />

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
    </div>
</asp:Content>
