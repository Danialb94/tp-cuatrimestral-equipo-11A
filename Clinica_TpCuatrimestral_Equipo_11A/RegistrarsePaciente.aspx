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
                </div>
                <div>
                    <label for="Apellido">Apellido</label>
                    <asp:TextBox runat="server" ID="txtApellido" placeholder="Apellido" class="border-dark-subtle form-control" />
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
                </div>

                <div>
                    <label for="txtNacimiento">Fecha de Nacimiento</label>
                    <asp:TextBox runat="server" ID="txtNacimiento" TextMode="Date" CssClass="form-control border-dark-subtle" />
                </div>
                <div>
                    <label for="txtDireccion">Domicilio</label>
                    <asp:TextBox runat="server" ID="txtDireccion" placeholder="Calle Real 1234" class="border-dark-subtle form-control" />
                </div>

                <div>
                    <label for="txtEmail">Email</label>
                    <asp:TextBox runat="server" ID="txtEmail" placeholder="Correo@email.com" class="border-dark-subtle form-control" />
                </div>
                <div>
                    <label for="txtTelefono">Teléfono</label>
                    <asp:TextBox runat="server" ID="txtTelefono" placeholder="11 1234-1234" class="border-dark-subtle form-control" />
                </div>
                <div class="col-12 mb-3">
                    <label for="txtPassword" class="form-label">Contraseña</label>
                    <asp:TextBox ID="txtPassword" CssClass="form-control" placeholder="Ingresa tu contraseña" TextMode="Password" runat="server"></asp:TextBox>
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
                </div>


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


            <div class="progress mt-4" role="progressbar" aria-label="Animated striped example" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">
                <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 75%"></div>
            </div>


            <div class="mt-4">
                <asp:Button ID="btnRegistro" Text="Registrarme" CssClass="btn btn-primary w-100" runat="server" OnClick="btnRegistro_Click" />
            </div>
        </div>
    </div>
</asp:Content>
