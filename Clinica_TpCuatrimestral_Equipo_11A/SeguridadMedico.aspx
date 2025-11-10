<%@ Page Title="Configuración Médico" Language="C#" MasterPageFile="~/MasterMedico.Master" AutoEventWireup="true" CodeBehind="ConfiguracionMedico.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.ConfiguracionMedico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

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

                <!-- Contenido -->
                <h3 class="fw-bold mb-3">Configuración del perfil médico</h3>
                <p class="text-muted mb-4">
                    Aquí puedes visualizar y actualizar tu información personal y profesional registrada en la clínica.
                </p>

                <asp:Panel ID="PanelDatos" runat="server" CssClass="bg-white p-4 rounded shadow-sm">

                    <!--  Datos personales -->
                    <h5 class="fw-bold mb-3">Datos personales</h5>
                    <div class="row mb-3">
                        <div class="col-md-3">
                            <label class="form-label fw-semibold">Nombre</label>
                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label fw-semibold">Apellido</label>
                            <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label fw-semibold">DNI</label>
                            <asp:TextBox ID="txtDNI" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label fw-semibold">Fecha de nacimiento</label>
                            <asp:TextBox ID="txtFechaNac" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>

                    <!-- Datos de contacto -->
                    <h5 class="fw-bold mb-3 mt-4">Datos de contacto</h5>
                    <div class="row mb-3">
                        <div class="col-md-4">
                            <label class="form-label fw-semibold">Correo electrónico</label>
                            <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label fw-semibold">Teléfono</label>
                            <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label fw-semibold">Dirección</label>
                            <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <!-- Datos profesionales -->
                    <h5 class="fw-bold mb-3 mt-4">Datos profesionales</h5>
                    <div class="row mb-3">
                        <div class="col-md-4">
                            <label class="form-label fw-semibold">Matrícula</label>
                            <asp:TextBox ID="txtMatricula" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label fw-semibold">Especialidad</label>
                            <asp:TextBox ID="txtEspecialidad" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>

                    <!-- Botones -->
                    <div class="mt-4">
                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar cambios" CssClass="btn btn-primary me-2" OnClick="btnGuardar_Click" />
                        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-secondary" PostBackUrl="~/InicioMedico.aspx" />
                    </div>

                    <!-- Mensaje -->
                    <asp:Label ID="lblMensaje" runat="server" CssClass="fw-semibold mt-3 d-block"></asp:Label>
                </asp:Panel>
            </div>
        </div>
    </div>

</asp:Content>
