<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="RegistrarsePaciente.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.RegistrarsePaciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-center align-items-center vh-100 bg-light">
        <div class="card shadow p-4" style="width: 60rem;">

            <div class="text-center mb-3">
                <img src="https://i.postimg.cc/vT8ZftkZ/photo-2025-10-25-19-40-56.jpg"
                    alt="ClinicApp Logo"
                    class="img-fluid rounded-circle border shadow-sm"
                    style="width: 70px; height: 70px; object-fit: cover;">
            </div>

            <h4 class="text-center mb-4">Ingresá tus datos</h4>


            <div class="g-3 p-3 row row-cols-1 row-cols-md-2">
                <div>
                    <label for="txtNombre">Nombre</label>
                    <asp:TextBox runat="server" ID="txtNombre" placeholder="Nombre" class="border-dark-subtle form-control" />
                    <asp:RequiredFieldValidator ErrorMessage="El nombre es obligatorio" ControlToValidate="txtNombre" Display="Dynamic" CssClass="text-danger" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="No se permiten espacios vacíos" ControlToValidate="txtNombre" ValidationExpression="^\S(.*\S)?$" Display="Dynamic" CssClass="text-danger" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="Solo se permiten letras" ControlToValidate="txtNombre" ValidationExpression="^[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+$" CssClass="text-danger" Display="Dynamic" runat="server" />
                </div>
                <div>
                    <label for="Apellido">Apellido</label>
                    <asp:TextBox runat="server" ID="txtApellido" placeholder="Apellido" class="border-dark-subtle form-control" />
                    <asp:RegularExpressionValidator ErrorMessage="Solo se permiten letras" ControlToValidate="txtApellido" ValidationExpression="^[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+$" CssClass="text-danger" Display="Dynamic" runat="server" />
                    <asp:RequiredFieldValidator ErrorMessage="El apellido es obligatorio" ControlToValidate="txtApellido" Display="Dynamic" CssClass="text-danger" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="No se permiten espacios vacíos" ControlToValidate="txtApellido" ValidationExpression="^\S(.*\S)?$" Display="Dynamic" CssClass="text-danger" runat="server" />
                </div>


                <div>
                    <label for="ddlTipoDocumento">Tipo de Documento</label>
                    <asp:DropDownList ID="ddlTipoDocumento" runat="server"
                        CssClass="form-select border-dark-subtle w-100">
                    </asp:DropDownList>
                </div>
                <div>
                    <label for="txtDNI">Documento</label>
                    <asp:TextBox runat="server" ID="txtDNI" placeholder="12159753" class="border-dark-subtle form-control" />
                    <asp:RegularExpressionValidator ErrorMessage="No válido" ControlToValidate="txtDNI" ValidationExpression="^\d{7,8}$" CssClass="text-danger" Display="Dynamic" runat="server" />
                    <asp:RequiredFieldValidator ErrorMessage="El documento es obligatorio" ControlToValidate="txtDNI" Display="Dynamic" CssClass="text-danger" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="No se permiten espacios vacíos" ControlToValidate="txtDNI" ValidationExpression="^\S(.*\S)?$" Display="Dynamic" CssClass="text-danger" runat="server" />
                </div>

                <div>
                    <label for="txtNacimiento">Fecha de Nacimiento</label>
                    <asp:TextBox runat="server" ID="txtNacimiento" placeholder="01/12/1987" TextMode="Date" CssClass="form-control border-dark-subtle" />

                </div>
                <div>
                    <label for="txtDireccion">Domicilio</label>
                    <asp:TextBox runat="server" ID="txtDireccion" placeholder="Calle Real 1234" class="border-dark-subtle form-control" />
                    <asp:RegularExpressionValidator ErrorMessage="Dirección inválida" ControlToValidate="txtDireccion" ValidationExpression="^([A-Za-z]{4,})+\s+(\d{1,5})$|^([A-Za-z]{4,})+\s+(\d{1,3})+\s+(\d{1,5})$|^([A-Za-z]{2,})+\s+([A-Za-z]{4,})+\s+(\d{1,5})$" CssClass="text-danger" Display="Dynamic" runat="server" />
                    <asp:RequiredFieldValidator ErrorMessage="La dirección es obligatoria" ControlToValidate="txtDireccion" Display="Dynamic" CssClass="text-danger" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="No se permiten espacios vacíos" ControlToValidate="txtDireccion" ValidationExpression="^\S(.*\S)?$" Display="Dynamic" CssClass="text-danger" runat="server" />
                </div>

                <div>
                    <label for="txtEmail">Email</label>
                    <asp:TextBox runat="server" ID="txtEmail" placeholder="Correo@email.com" class="border-dark-subtle form-control" />
                    <asp:RegularExpressionValidator ErrorMessage="Email inválido" ControlToValidate="txtEmail" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" CssClass="text-danger" Display="Dynamic" runat="server" />
                    <asp:RequiredFieldValidator ErrorMessage="El email es obligatorio" ControlToValidate="txtEmail" Display="Dynamic" CssClass="text-danger" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="No se permiten espacios vacíos" ControlToValidate="txtEmail" ValidationExpression="^\S(.*\S)?$" Display="Dynamic" CssClass="text-danger" runat="server" />
                </div>
                <div>
                    <label for="txtTelefono">Teléfono</label>
                    <asp:TextBox runat="server" ID="txtTelefono" placeholder="11 1234-1234" class="border-dark-subtle form-control" />
                    <asp:RegularExpressionValidator ErrorMessage="Teléfono inválido" ControlToValidate="txtTelefono" ValidationExpression="^(?:(?:\+54|0)?(11|2[23]\d|3[3-8]\d|9[11]|9[2-3]\d))?\s?\d{4,5}\-?\d{4}$" CssClass="text-danger" Display="Dynamic" runat="server" />
                    <asp:RequiredFieldValidator ErrorMessage="El telefono es obligatorio" ControlToValidate="txtTelefono" Display="Dynamic" CssClass="text-danger" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="No se permiten espacios vacíos" ControlToValidate="txtTelefono" ValidationExpression="^\S(.*\S)?$" Display="Dynamic" CssClass="text-danger" runat="server" />

                </div>
                <div class="col-12 mb-3 position-relative">
                    <label for="txtPassword" class="form-label">Contraseña</label>

                    <div class="input-group">
                        <asp:TextBox ID="txtPassword" CssClass="form-control" placeholder="Ingresa tu contraseña" TextMode="Password"  oninput="verificarPassword()" runat="server" />
                        <button type="button" class="btn btn-outline-secondary" onclick="togglePassword()">
                            <i id="iconoPassword" class="bi bi-eye"></i>
                        </button>
                    </div>
                    <asp:RequiredFieldValidator ErrorMessage="La contraseña es obligatoria" ControlToValidate="txtPassword" Display="Dynamic" CssClass="text-danger" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="No se permiten espacios vacíos" ControlToValidate="txtPassword" ValidationExpression="^\S(.*\S)?$" Display="Dynamic" CssClass="text-danger" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="No cumple con los requisitos" ControlToValidate="txtPassword" ValidationExpression="^(?=.*[A-Z])(?=.*\d)(?=.*[^A-Za-z0-9]).{8,}$" Display="Dynamic" CssClass="text-danger" runat="server" />
                </div>



                <div>
                    <label for="ddlCobertura">Obra Social</label>
                    <asp:DropDownList ID="ddlCobertura" runat="server" CssClass="form-select border-dark-subtle w-100">
                        <asp:ListItem Selected hidden>Obra Social</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div>
                    <label for="txtFoto">Foto de Perfil</label>
                    <asp:TextBox runat="server" ID="txtFoto" placeholder="https://foto.com" class="border-dark-subtle form-control" />
                    <asp:RegularExpressionValidator ErrorMessage="No se permiten espacios vacíos" ControlToValidate="txtFoto" ValidationExpression="^\S(.*\S)?$" Display="Dynamic" CssClass="text-danger" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="La URL no es válida o supera los 1000 caracteres" ControlToValidate="txtFoto" ValidationExpression="^(?=.{1,1000}$)(https?:\/\/.*\.(png|jpg|jpeg|gif))$" Display="Dynamic" CssClass="text-danger" runat="server" />
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-6">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="chk8" disabled>
                        <label class="form-check-label" for="chk8">Mínimo 8 caracteres</label>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="chkNum" disabled>
                        <label class="form-check-label" for="chkNum">Al menos un número</label>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="chkMayus" disabled>
                        <label class="form-check-label" for="chkMayus">Al menos una letra mayúscula</label>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="chkEspecial" disabled>
                        <label class="form-check-label" for="chkEspecial">Al menos un carácter especial</label>
                    </div>
                </div>
            </div>

            <div class="progress mt-4" role="progressbar" aria-label="Animated striped"
                aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                <div id="passwordProgress" class="progress-bar progress-bar-striped progress-bar-animated" style="width: 0%"></div>
            </div>


            <div class="mt-4">
                <asp:Button ID="btnRegistro" Text="Registrarme" CssClass="btn btn-primary w-100" runat="server" OnClick="btnRegistro_Click" />
            </div>
            <asp:Label ID="lblError" runat="server" CssClass="text-danger mt-2" Visible="false"></asp:Label>

        </div>
    </div>
    <script>
        function verificarPassword() {
            const pass = document.getElementById("<%= txtPassword.ClientID %>").value;
            const chk8 = document.getElementById("chk8");
            const chkNum = document.getElementById("chkNum");
            const chkMayus = document.getElementById("chkMayus");
            const chkEspecial = document.getElementById("chkEspecial");
            const progressBar = document.getElementById("passwordProgress");

            let score = 0;

            if (pass.length >= 8) { chk8.checked = true; score++; } else chk8.checked = false;
            if (/\d/.test(pass)) { chkNum.checked = true; score++; } else chkNum.checked = false;
            if (/[A-Z]/.test(pass)) { chkMayus.checked = true; score++; } else chkMayus.checked = false;
            if (/[^A-Za-z0-9]/.test(pass)) { chkEspecial.checked = true; score++; } else chkEspecial.checked = false;


            const porcentaje = (score / 4) * 100;
            progressBar.style.width = porcentaje + "%";
        }
    </script>

    <script>
        function togglePassword() {
            const passInput = document.getElementById('<%= txtPassword.ClientID %>');
            const icon = document.getElementById('iconoPassword');

            if (passInput.type === "password") {
                passInput.type = "text";
                icon.classList.remove("bi-eye");
                icon.classList.add("bi-eye-slash");
            } else {
                passInput.type = "password";
                icon.classList.remove("bi-eye-slash");
                icon.classList.add("bi-eye");
            }
        }
    </script>
</asp:Content>
