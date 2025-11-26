<%@ Page Title="Configuración Médico" Language="C#" MasterPageFile="~/MasterMedico.Master" AutoEventWireup="true"
    CodeBehind="ConfiguracionMedico.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.ConfiguracionMedico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .is-invalid {
            border-color: #dc3545 !important;
        }

        .invalid-feedback {
            display: block;
            font-size: 0.875rem;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-12">

                <!-- Barra de navegación -->
                <div class="d-flex justify-content-start align-items-center bg-white p-2 rounded shadow-sm mb-4">
                    <ul class="nav nav-pills">
                        <li class="nav-item">
                            <a class="nav-link <% = Page.Title == "Configuración Médico" ? "active" : "text-dark" %>"
                                href="ConfiguracionMedico.aspx">
                                <i class="bi bi-person me-2"></i>Información personal
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link <% = Page.Title == "Seguridad Médico" ? "active" : "text-dark" %>"
                                href="SeguridadMedico.aspx">
                                <i class="bi bi-lock me-2"></i>Seguridad
                            </a>
                        </li>
                    </ul>
                </div>

                <h3 class="fw-bold mb-3">Configuración del perfil médico</h3>
                <p class="text-muted mb-4">
                    Aquí puedes visualizar y actualizar tu información personal registrada en la clínica.
                </p>

                <asp:Panel ID="PanelDatos" runat="server" CssClass="bg-white p-4 rounded shadow-sm">

                    <!-- Datos personales -->
                    <h5 class="fw-bold mb-3">Datos personales</h5>
                    <div class="row mb-3">
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-semibold">Nombre</label>
                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
                            <asp:Label ID="lblErrorNombre" runat="server" CssClass="invalid-feedback text-danger"></asp:Label>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-semibold">Apellido</label>
                            <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" />
                            <asp:Label ID="lblErrorApellido" runat="server" CssClass="invalid-feedback text-danger"></asp:Label>
                        </div>
                        <!-- Foto de perfil -->
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-semibold">Foto de perfil (URL)</label>
                            <asp:TextBox ID="txtFoto" runat="server" CssClass="form-control" />
                        </div>

                    </div>

                    <!-- Datos de contacto -->
                    <h5 class="fw-bold mb-3 mt-4">Datos de contacto</h5>
                    <div class="row mb-3">
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-semibold">Correo electrónico</label>
                            <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control" />
                            <asp:Label ID="lblErrorCorreo" runat="server" CssClass="invalid-feedback text-danger"></asp:Label>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-semibold">Teléfono</label>
                            <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" />
                            <asp:Label ID="lblErrorTelefono" runat="server" CssClass="invalid-feedback text-danger"></asp:Label>
                        </div>
                    </div>

                    <!-- Información profesional -->
                    <h5 class="fw-bold mb-3 mt-4">Información profesional</h5>
                    <div class="row mb-3">
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-semibold">Matrícula</label>
                            <asp:Label ID="lblMatricula" runat="server" CssClass="form-control-plaintext border bg-light rounded p-2" />
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-semibold">Especialidades</label>
                            <asp:Repeater ID="repEspecialidades" runat="server">
                                <ItemTemplate>
                                    <div class="form-control-plaintext border bg-light rounded p-2 mb-1">
                                        <%# Eval("Descripcion") %>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>

                    <div class="mt-4">
                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar cambios" CssClass="btn btn-primary me-2"
                            OnClick="btnGuardar_Click" />
                        <asp:Button ID="btnVolver" runat="server" Text="⬅️ Volver" CssClass="btn btn-secondary rounded-pill"
                            PostBackUrl="~/InicioMedico.aspx" />
                    </div>

                    <asp:Label ID="lblMensajeGeneral" runat="server" CssClass="fw-semibold mt-3 d-block"></asp:Label>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
