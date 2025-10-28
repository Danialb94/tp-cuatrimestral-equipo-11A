<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPaciente.Master" AutoEventWireup="true" CodeBehind="EditarPerfilPaciente.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.EditarPerfilPaciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- 🔹 Barra superior con las opciones -->
    <div class="d-flex justify-content-start align-items-center bg-white p-2 rounded shadow-sm mb-4">
        <ul class="nav nav-pills">

            <!-- Información personal -->
            <li class="nav-item">
                <a class="nav-link"
                    href="EditarPerfilPaciente.aspx">
                    <B class="bi bi-person me-2" style="color: black;">Información personal</B>
                </a>
            </li>

            <!-- Seguridad -->
            <li class="nav-item">
                <a class="nav-link"
                    href="SeguridadPaciente.aspx">
                    <i class="bi bi-lock me-2" style="color: black;"></i>Seguridad
                </a>
            </li>
        </ul>
    </div>

    <div class="row d-flex">
        <div>
            <h3>Información Personal</h3>
            <p class="text-muted">Visualizá y actualizá tus datos personales. Si no puede editar algún dato, comuniquesé con nosotros</p>
            <div class="g-4 p-3 row row-cols-1 row-cols-md-2">
                <div>
                    <label for="txtNombreCompleto" class="form-label fw-semibold">Nombre Completo</label>
                    <asp:TextBox runat="server" ID="txtNombreCompleto" placeholder="Nombre Apellido" class="bg-dark-subtle border-dark-subtle form-control" ReadOnly="true" />
                </div>
                <div class="d-flex justify-content-between">
                    <div>
                        <label for="txtTipoDocu" class="form-label fw-semibold">Tipo de Documento</label>
                        <asp:TextBox runat="server" ID="txtTipoDocu" placeholder="Pasaporte/DNI/Otro" class="bg-dark-subtle border-dark-subtle form-control" ReadOnly="true" />
                    </div>
                    <div class="ms-2 w-75">
                        <label for="txtDNI" class="form-label fw-semibold">Documento</label>
                        <asp:TextBox runat="server" ID="txtDNI" placeholder="12159753" class="bg-dark-subtle border-dark-subtle form-control" ReadOnly="true" />
                    </div>
                </div>
                <div>
                    <label for="txtNacimiento" class="form-label fw-semibold">Fecha de Nacimiento</label>
                    <asp:TextBox runat="server" ID="txtNacimiento" placeholder="01/01/1990" class="bg-dark-subtle border-dark-subtle form-control" ReadOnly="true" />
                </div>
                <div>
                    <label for="txtDireccion" class="form-label fw-semibold">Domicilio</label>
                    <asp:TextBox runat="server" ID="txtDireccion" placeholder="Calle Real 1234" class="border-dark-subtle form-control" />
                </div>
                <div>
                    <label for="txtEmail" class="form-label fw-semibold">Email</label>
                    <asp:TextBox runat="server" ID="txtEmail" placeholder="Correo@email.com" class="border-dark-subtle form-control" />
                </div>
                <div>
                    <label for="txtTelefono" class="form-label fw-semibold">Teléfono</label>
                    <asp:TextBox runat="server" ID="txtTelefono" placeholder="11 1234-1234" class="border-dark-subtle form-control" />
                </div>
                <div>
                    <label for="ddlCobertura" class="form-label fw-semibold">Obra Social</label>
                    <asp:DropDownList ID="ddlCobertura" runat="server" class="w-100 border-dark-subtle d-block p-2 rounded-2" Style="height: 40px;">
                        <asp:ListItem Selected hidden>Obra Social</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div>
                    <label for="txtFoto" class="form-label fw-semibold">Foto de Perfil</label>
                    <asp:TextBox runat="server" ID="txtFoto" placeholder="https://foto.com" class="border-dark-subtle form-control" />
                </div>
            </div>
            <div class="mt-3">
                <button type="submit" class="btn btn-primary me-2">Guardar cambios</button>
                <!-- 🔹 Botón Cancelar que redirige al Inicio del médico -->
                <button type="button" class="btn btn-secondary">Cancelar</button>
            </div>
        </div>
    </div>

</asp:Content>
