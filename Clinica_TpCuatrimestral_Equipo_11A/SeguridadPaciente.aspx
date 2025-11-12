<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPaciente.Master" AutoEventWireup="true" CodeBehind="SeguridadPaciente.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.SeguridadPaciente" %>

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

    <!-- 🔹 Barra superior con las opciones -->
    <div class="d-flex justify-content-start align-items-center bg-white p-2 rounded shadow-sm mb-4">
        <ul class="nav nav-pills">

            <!-- Información personal -->
            <li class="nav-item">
                <a class="nav-link"
                    href="EditarPerfilPaciente.aspx" style="color: black;">
                    <i class="bi bi-lock me-2"></i>Información personal
                </a>
            </li>

            <!-- Seguridad -->
            <li class="nav-item">
                <a class="nav-link"
                    href="SeguridadPaciente.aspx">
                    <b class="bi bi-person me-2" style="color: black;">Seguridad</b>
                </a>
            </li>
        </ul>
    </div>


    <div class="bg-white p-4 rounded shadow-sm">
        <h3 class="fw-bold mb-3">Seguridad</h3>
        <p class="text-muted">
            Actualiza tu contraseña regularmente para mantener tu cuenta segura.
        </p>

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
            <asp:RegularExpressionValidator ErrorMessage="Contraseña Inválida" ControlToValidate="txtNuevaClave" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$" CssClass="text-danger" Display="Dynamic" runat="server" />
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
            <asp:RegularExpressionValidator ErrorMessage="Contraseña Inválida" ControlToValidate="txtConfirmarClave" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$" CssClass="text-danger" Display="Dynamic" runat="server" />
            <asp:Label ID="lblErrorConfirmar" runat="server" CssClass="text-danger small d-block"></asp:Label>
        </div>

        <!-- Botones -->
        <div class="mt-3">
            <asp:Button ID="btnGuardar" runat="server" Text="Actualizar contraseña"
                CssClass="btn btn-primary me-2" OnClick="btnGuardar_Click" />
            <a href="InicioPaciente.aspx" class="btn btn-secondary">Cancelar</a>
        </div>
    </div>
    <!-- Mensaje general -->
    <asp:Label ID="lblMensajeGeneral" runat="server" CssClass="fw-semibold mt-3 d-block"></asp:Label>



</asp:Content>