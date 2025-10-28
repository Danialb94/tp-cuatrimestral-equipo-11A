<%@ Page Title="Configuración Médico" Language="C#" MasterPageFile="~/MasterMedico.Master" AutoEventWireup="true" CodeBehind="ConfiguracionMedico.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.ConfiguracionMedico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid mt-4">
        <div class="row">
            <!-- Panel principal -->
            <div class="col-md-12">
                <!-- 🔹 Barra superior con las opciones -->
                <div class="d-flex justify-content-start align-items-center bg-white p-2 rounded shadow-sm mb-4">
                    <ul class="nav nav-pills">

                        <!-- Información personal -->
                        <li class="nav-item">
                            <a class="nav-link <% = Page.Title == "Configuración Médico" ? "active" : "text-dark" %>"
                                href="ConfiguracionMedico.aspx">
                                <i class="bi bi-person me-2"></i>Información personal
                            </a>
                        </li>

                        <!-- Seguridad -->
                        <li class="nav-item">
                            <a class="nav-link <% = Page.Title == "Seguridad Médico" ? "active" : "text-dark" %>"
                                href="SeguridadPaciente.aspx">
                                <i class="bi bi-lock me-2"></i>Seguridad
                            </a>
                        </li>

                        <!-- Notificaciones -->
                        <li class="nav-item">
                            <a class="nav-link <% = Page.Title == "Notificaciones Médico" ? "active" : "text-dark" %>"
                                href="NotificacionesMedico.aspx">
                                <i class="bi bi-bell me-2"></i>Notificaciones
                            </a>
                        </li>

                        <!-- Privacidad -->
                        <li class="nav-item">
                            <a class="nav-link <% = Page.Title == "Privacidad Médico" ? "active" : "text-dark" %>"
                                href="PrivacidadMedico.aspx">
                                <i class="bi bi-shield-lock me-2"></i>Privacidad
                            </a>
                        </li>
                    </ul>
                </div>

                <!-- 🔹 Contenido principal -->
                <h3 class="fw-bold">Información personal</h3>
                <p class="text-muted">
                    Visualiza y actualiza tus datos personales. Para cambiar tu nombre o fecha de nacimiento, por favor contacta directamente con la clínica.
                </p>

                <form>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="txtNombre" class="form-label fw-semibold">Nombre completo</label>
                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Dr. Juan Pérez"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label for="txtFechaNac" class="form-label fw-semibold">Fecha de nacimiento</label>
                            <asp:TextBox ID="txtFechaNac" runat="server" CssClass="form-control" placeholder="01/01/1975"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="txtCorreo" class="form-label fw-semibold">Correo electrónico</label>
                            <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control" placeholder="dr.juanperez@clinica.com"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label for="txtTelefono" class="form-label fw-semibold">Número de teléfono</label>
                            <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" placeholder="(555) 123-4567"></asp:TextBox>
                        </div>
                    </div>



                    <div class="mt-3">
                        <button type="submit" class="btn btn-primary me-2">Guardar cambios</button>
                        <!-- 🔹 Botón Cancelar que redirige al Inicio del médico -->
                        <button type="button" class="btn btn-secondary" onclick="window.location.href='InicioMedico.aspx'">Cancelar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
