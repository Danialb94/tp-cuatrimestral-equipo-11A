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
                    <b class="bi bi-person me-2" style="color: black;">Información personal</b>
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
                    <!-- Nombre Completo -->
                    <label for="txtNombreCompleto" class="form-label fw-semibold">Nombre Completo</label>
                    <asp:TextBox runat="server" ID="txtNombreCompleto" placeholder="Nombre Apellido" class="bg-dark-subtle border-dark-subtle form-control" ReadOnly="true" />
                </div>
                <div class="d-flex justify-content-between">
                    <div>
                        <!-- TipoDocumento -->
                        <label for="txtTipoDocu" class="form-label fw-semibold">Tipo de Documento</label>
                        <asp:TextBox runat="server" ID="txtTipoDocu" placeholder="Pasaporte/DNI/Otro" class="bg-dark-subtle border-dark-subtle form-control" ReadOnly="true" />
                    </div>
                    <div class="ms-2 w-75">
                        <!-- Nro Documento -->
                        <label for="txtDNI" class="form-label fw-semibold">Documento</label>
                        <asp:TextBox runat="server" ID="txtDNI" placeholder="12159753" class="bg-dark-subtle border-dark-subtle form-control" ReadOnly="true" />
                    </div>
                </div>
                <div>
                    <!-- Fecha de Nacimiento -->
                    <label for="txtNacimiento" class="form-label fw-semibold">Fecha de Nacimiento</label>
                    <asp:TextBox runat="server" ID="txtNacimiento" placeholder="01/01/1990" class="bg-dark-subtle border-dark-subtle form-control" ReadOnly="true" />
                </div>
                <div>
                    <!-- Direccion -->
                    <label for="txtDireccion" class="form-label fw-semibold">Domicilio</label>
                    <asp:TextBox runat="server" ID="txtDireccion" placeholder="Calle Real 1234" class="border-dark-subtle form-control" />
                    <asp:RegularExpressionValidator ErrorMessage="Dirección inválida" ControlToValidate="txtDireccion" ValidationExpression="^([A-Za-z]{4,})+\s+(\d{1,5})$|^([A-Za-z]{4,})+\s+(\d{1,3})+\s+(\d{1,5})$|^([A-Za-z]{2,})+\s+([A-Za-z]{4,})+\s+(\d{1,5})$" CssClass="text-danger" Display="Dynamic" runat="server" />
                </div>
                <div>
                    <!-- Email -->
                    <label for="txtEmail" class="form-label fw-semibold">Email</label>
                    <asp:TextBox runat="server" ID="txtEmail" placeholder="Correo@email.com" class="border-dark-subtle form-control" />
                    <asp:RegularExpressionValidator ErrorMessage="Email inválido" ControlToValidate="txtEmail" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" CssClass="text-danger" Display="Dynamic" runat="server" />
                </div>
                <div>
                    <!-- Teléfono -->
                    <label for="txtTelefono" class="form-label fw-semibold">Teléfono</label>
                    <asp:TextBox runat="server" ID="txtTelefono" placeholder="11 1234-1234" class="border-dark-subtle form-control" />
                    <asp:RegularExpressionValidator ErrorMessage="Teléfono inválido" ControlToValidate="txtTelefono" ValidationExpression="^\s*(?:\+?(\d{1,3}))?([-. (]*(\d{3})[-. )]*)?((\d{3})[-. ]*(\d{2,4})(?:[-.x ]*(\d+))?)\s*$" CssClass="text-danger" Display="Dynamic" runat="server" />
                </div>
                <div>
                    <!-- Cobertura -->
                    <label for="txtCobertura" class="form-label fw-semibold">Obra Social</label>
                    <asp:TextBox runat="server" ID="txtCobertura" placeholder="Cobertura Médica" class="bg-dark-subtle border-dark-subtle form-control" ReadOnly="true" />
                </div>
                <div>
                    <!-- URLFoto -->
                    <label for="txtFoto" class="form-label fw-semibold">Foto de Perfil</label>
                    <asp:TextBox runat="server" ID="txtFoto" placeholder="https://foto.com" class="border-dark-subtle form-control" />
                </div>
            </div>
            <div class="mt-3">
                <asp:LinkButton ID="btnGuardar" runat="server" CssClass="btn btn-primary me-2" OnClick="btnEditar_Click">Guardar cambios</asp:LinkButton>
                <a href="InicioPaciente.aspx" class="btn btn-secondary" >Cancelar</a>
            </div>
        </div>
    </div>

</asp:Content>
