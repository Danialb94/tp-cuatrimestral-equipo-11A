<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ReestablecerPass.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.ReestablecerPass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="d-flex justify-content-center align-items-center vh-100 bg-light">

        <div class="card shadow p-4" style="width: 28rem;">

           
            <div class="mb-3 text-center">
                <img src="https://i.postimg.cc/vT8ZftkZ/photo-2025-10-25-19-40-56.jpg"
                     alt="ClinicApp Logo"
                     class="img-fluid rounded-circle border shadow-sm"
                     style="width: 100px; height: 100px; object-fit: cover;">
            </div>

            <h4 class="text-center mb-4">Reestablecé la contraseña de tu cuenta</h4>

            <div class="form-text mb-3">
                Por razones de seguridad, debés establecer una nueva contraseña para tu cuenta.
            </div>

          
            <div class="mb-3">
                <label class="form-label fw-bold">Nueva contraseña</label>
                <div class="input-group">
                    <asp:TextBox ID="txtNewPassword" CssClass="form-control"
                        placeholder="Ingresá la nueva contraseña"
                        TextMode="Password" runat="server"
                        oninput="verificarPasswordNueva()">
                    </asp:TextBox>

                    <button type="button" class="input-group-text bg-white border-start-0"
                        onclick="togglePassword('<%= txtNewPassword.ClientID %>', 'iconNewPass')"
                        style="cursor: pointer; width: 45px;">
                        <i id="iconNewPass" class="bi bi-eye fs-5 text-dark"></i>
                    </button>
                </div>

                <asp:RequiredFieldValidator ErrorMessage="La contraseña es obligatoria"
                    ControlToValidate="txtNewPassword" CssClass="text-danger" Display="Dynamic" runat="server" />

                <asp:RegularExpressionValidator ErrorMessage="No se permiten espacios vacíos"
                    ControlToValidate="txtNewPassword" ValidationExpression="^\S(.*\S)?$"
                    CssClass="text-danger" Display="Dynamic" runat="server" />

                <asp:RegularExpressionValidator ErrorMessage="Debe tener mayúscula, número y símbolo"
                    ControlToValidate="txtNewPassword" ValidationExpression="^(?=.*[A-Z])(?=.*\d)(?=.*[^A-Za-z0-9]).{8,}$"
                    CssClass="text-danger" Display="Dynamic" runat="server" />
            </div>

           
            <div class="mb-3">
                <label class="form-label fw-bold">Confirmar contraseña</label>
                <div class="input-group">
                    <asp:TextBox ID="txtConfirmPassword" CssClass="form-control"
                        placeholder="Repetí la contraseña"
                        TextMode="Password" runat="server">
                    </asp:TextBox>

                    <button type="button" class="input-group-text bg-white border-start-0"
                        onclick="togglePassword('<%= txtConfirmPassword.ClientID %>', 'iconConfirmPass')"
                        style="cursor: pointer; width: 45px;">
                        <i id="iconConfirmPass" class="bi bi-eye fs-5 text-dark"></i>
                    </button>
                </div>

                <asp:RequiredFieldValidator ErrorMessage="La contraseña es obligatoria"
                    ControlToValidate="txtConfirmPassword" CssClass="text-danger" Display="Dynamic" runat="server" />

                <asp:RegularExpressionValidator ErrorMessage="No se permiten espacios vacíos"
                    ControlToValidate="txtConfirmPassword" ValidationExpression="^\S(.*\S)?$"
                    CssClass="text-danger" Display="Dynamic" runat="server" />

                <asp:RegularExpressionValidator ErrorMessage="Debe tener mayúscula, número y símbolo"
                    ControlToValidate="txtConfirmPassword" ValidationExpression="^(?=.*[A-Z])(?=.*\d)(?=.*[^A-Za-z0-9]).{8,}$"
                    CssClass="text-danger" Display="Dynamic" runat="server" />
            </div>

            
            <asp:Label ID="lblError" CssClass="text-danger mt-2" Visible="false" runat="server"></asp:Label>

            
            <div class="progress my-3" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 0%"></div>
            </div>

            
            <div class="row mb-2">
                <div class="col-6">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox1" disabled>
                        <label class="form-check-label">Mínimo 8 caracteres</label>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox2" disabled>
                        <label class="form-check-label">Al menos un número</label>
                    </div>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-6">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox3" disabled>
                        <label class="form-check-label">Una mayúscula</label>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox4" disabled>
                        <label class="form-check-label">Un carácter especial</label>
                    </div>
                </div>
            </div>

            
            <asp:Button ID="btnSubmit" CssClass="btn btn-primary w-100" Text="Guardar contraseña" runat="server" OnClick="btnSubmit_Click" />

            <div class="text-center mt-3">
                <a href="Default.aspx" class="text-decoration-none">Volver al inicio</a>
            </div>

        </div>
    </div>

    <script>
        function togglePassword(inputId, iconId) {
            const input = document.getElementById(inputId);
            const icon = document.getElementById(iconId);

            if (input.type === "password") {
                input.type = "text";
                icon.classList.replace("bi-eye", "bi-eye-slash");
            } else {
                input.type = "password";
                icon.classList.replace("bi-eye-slash", "bi-eye");
            }
        }
    </script>

   
    <script>
        function verificarPasswordNueva() {
            const pass = document.getElementById("<%= txtNewPassword.ClientID %>").value;
            const chk8 = document.getElementById("inlineCheckbox1");
            const chkNum = document.getElementById("inlineCheckbox2");
            const chkMayus = document.getElementById("inlineCheckbox3");
            const chkEspecial = document.getElementById("inlineCheckbox4");
            const bar = document.querySelector(".progress-bar");

            let score = 0;

            if (pass.length >= 8) { chk8.checked = true; score++; } else chk8.checked = false;
            if (/\d/.test(pass)) { chkNum.checked = true; score++; } else chkNum.checked = false;
            if (/[A-Z]/.test(pass)) { chkMayus.checked = true; score++; } else chkMayus.checked = false;
            if (/[^A-Za-z0-9]/.test(pass)) { chkEspecial.checked = true; score++; } else chkEspecial.checked = false;

            bar.style.width = (score / 4) * 100 + "%";
        }
    </script>

</asp:Content>
