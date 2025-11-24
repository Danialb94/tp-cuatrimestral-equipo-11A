<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ReestablecerPass.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.ReestablecerPass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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

            <div class="mb-3">
                <div class="form-text">Por razones de seguridad, debés establecer una nueva contraseña para tu cuenta.</div>
                <label for="txtPassword" class="form-label">Nueva contraseña</label>
                <asp:TextBox ID="txtNewPassword" CssClass="form-control" placeholder="Ingresa la nueva contraseña" TextMode="Password" runat="server" oninput="verificarPasswordNueva()"></asp:TextBox>
                <asp:RequiredFieldValidator ErrorMessage="La contraseña es obligatoria" ControlToValidate="txtNewPassword" Display="Dynamic" CssClass="text-danger" runat="server" />
                <asp:RegularExpressionValidator ErrorMessage="No se permiten espacios vacíos" ControlToValidate="txtNewPassword" ValidationExpression="^\S(.*\S)?$" Display="Dynamic" CssClass="text-danger" runat="server" />
                <asp:RegularExpressionValidator ErrorMessage="No cumple con los requisitos" ControlToValidate="txtNewPassword" ValidationExpression="^(?=.*[A-Z])(?=.*\d)(?=.*[^A-Za-z0-9]).{8,}$" Display="Dynamic" CssClass="text-danger" runat="server" />

            </div>

            <div class="mb-3">
                <label for="txtPassword" class="form-label">Nueva contraseña</label>
                <asp:TextBox ID="txtConfirmPassword" CssClass="form-control" placeholder="Ingresa la nueva contraseña" TextMode="Password" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ErrorMessage="La contraseña es obligatoria" ControlToValidate="txtConfirmPassword" Display="Dynamic" CssClass="text-danger" runat="server" />
                <asp:RegularExpressionValidator ErrorMessage="No se permiten espacios vacíos" ControlToValidate="txtConfirmPassword" ValidationExpression="^\S(.*\S)?$" Display="Dynamic" CssClass="text-danger" runat="server" />
                <asp:RegularExpressionValidator ErrorMessage="No cumple con los requisitos" ControlToValidate="txtConfirmPassword" ValidationExpression="^(?=.*[A-Z])(?=.*\d)(?=.*[^A-Za-z0-9]).{8,}$" Display="Dynamic" CssClass="text-danger" runat="server" />

            </div>
            <asp:Label ID="lblError" CssClass="text-danger mt-2" Visible="false" runat="server"></asp:Label>
            <div class="progress" role="progressbar" aria-label="Animated striped example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 0%"></div>
            </div>
            <div class="row mt-3">
                <div class="col-6">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox1" disabled>
                        <label class="form-check-label" for="inlineCheckbox1">Mínimo 8 caracteres</label>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox2" disabled>
                        <label class="form-check-label" for="inlineCheckbox2">Al menos un número</label>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-6">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox3" disabled>
                        <label class="form-check-label" for="inlineCheckbox3">Al menos una letra mayúscula</label>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox4" disabled>
                        <label class="form-check-label" for="inlineCheckbox4">Al menos un carácter especial</label>
                    </div>
                </div>
            </div>

            <asp:Button ID="btnSubmit" Text="Guardar contraseña" CssClass="btn btn-primary w-100" runat="server" OnClick="btnSubmit_Click" />
            <div class="text-center mt-3">
                <a href="Default.aspx" class="text-decoration-none">Volver al inicio</a>
            </div>

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
