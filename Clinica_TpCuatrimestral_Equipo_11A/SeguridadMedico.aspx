<%@ Page Title="Seguridad Médico" Language="C#" MasterPageFile="~/MasterMedico.Master" AutoEventWireup="true" CodeBehind="SeguridadMedico.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.SeguridadMedico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        // 🔹 Mostrar / ocultar contraseña (funciona para los 3 campos)
        function togglePassword(idTxt, idIcon) {
            var input = document.getElementById(idTxt);
            var icon = document.getElementById(idIcon);
            if (input.type === "password") {
                input.type = "text";
                icon.classList.remove("bi-eye");
                icon.classList.add("bi-eye-slash");
            } else {
                input.type = "password";
                icon.classList.remove("bi-eye-slash");
                icon.classList.add("bi-eye");
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-12">

                <!-- 🔹 Barra de navegación -->
                <div class="d-flex justify-content-start align-items-center bg-white p-2 rounded shadow-sm mb-4">
                    <asp:Panel runat="server" CssClass="nav nav-pills">
                        <asp:HyperLink runat="server" NavigateUrl="ConfiguracionMedico.aspx" CssClass="nav-link text-dark">
                            <i class="bi bi-person me-2"></i>Información personal
                        </asp:HyperLink>
                        <asp:HyperLink runat="server" NavigateUrl="SeguridadMedico.aspx" CssClass="nav-link active">
                            <i class="bi bi-lock me-2"></i>Seguridad
                        </asp:HyperLink>
                    </asp:Panel>
                </div>

                <!-- 🔹 Contenido -->
                <asp:Label ID="lblTitulo" runat="server" Text="Seguridad de la cuenta" CssClass="fw-bold h3 mb-3 d-block"></asp:Label>
                <asp:Label ID="lblDescripcion" runat="server"
                    Text="Aquí puedes actualizar tu contraseña de acceso al sistema."
                    CssClass="text-muted mb-4 d-block"></asp:Label>

                <asp:Panel ID="PanelSeguridad" runat="server" CssClass="bg-white p-4 rounded shadow-sm">

                    <!-- Contraseña actual -->
                    <div class="mb-3">
                        <asp:Label ID="lblActualClave" runat="server" Text="Contraseña actual" CssClass="form-label fw-semibold"></asp:Label>
                        <div class="input-group">
                            <asp:TextBox ID="txtActualClave" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            <button type="button" class="btn btn-outline-secondary"
                                onclick="togglePassword('<%= txtActualClave.ClientID %>', 'eyeIcon1')">
                                <i id="eyeIcon1" class="bi bi-eye"></i>
                            </button>
                        </div>
                        <asp:Label ID="lblErrorActual" runat="server" CssClass="text-danger small d-block"></asp:Label>
                    </div>

                    <!-- Nueva contraseña -->
                    <div class="mb-3">
                        <asp:Label ID="lblNuevaClave" runat="server" Text="Nueva contraseña" CssClass="form-label fw-semibold"></asp:Label>
                        <div class="input-group">
                            <asp:TextBox ID="txtNuevaClave" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            <button type="button" class="btn btn-outline-secondary"
                                onclick="togglePassword('<%= txtNuevaClave.ClientID %>', 'eyeIcon2')">
                                <i id="eyeIcon2" class="bi bi-eye"></i>
                            </button>
                        </div>
                        <asp:Label ID="lblErrorNueva" runat="server" CssClass="text-danger small d-block"></asp:Label>
                    </div>

                    <!-- Confirmar contraseña -->
                    <div class="mb-3">
                        <asp:Label ID="lblConfirmarClave" runat="server" Text="Confirmar nueva contraseña" CssClass="form-label fw-semibold"></asp:Label>
                        <div class="input-group">
                            <asp:TextBox ID="txtConfirmarClave" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            <button type="button" class="btn btn-outline-secondary"
                                onclick="togglePassword('<%= txtConfirmarClave.ClientID %>', 'eyeIcon3')">
                                <i id="eyeIcon3" class="bi bi-eye"></i>
                            </button>
                        </div>
                        <asp:Label ID="lblErrorConfirmar" runat="server" CssClass="text-danger small d-block"></asp:Label>
                    </div>

                    <!-- Botón principal -->
                    <div class="mt-4 d-flex gap-2">
                        <asp:Button ID="btnGuardar" runat="server" Text="Actualizar contraseña"
                            CssClass="btn btn-primary" OnClick="btnGuardar_Click" />

                        <asp:Button ID="btnVolver" runat="server" Text="Volver"
                            CssClass="btn btn-secondary" PostBackUrl="~/ConfiguracionMedico.aspx" />
                    </div>

                    <!-- Mensaje general -->
                    <asp:Label ID="lblMensajeGeneral" runat="server" CssClass="fw-semibold mt-3 d-block"></asp:Label>

                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
