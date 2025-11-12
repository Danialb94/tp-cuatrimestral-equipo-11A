<%@ Page Title="" Language="C#" MasterPageFile="~/MasterRecepcionista.Master" AutoEventWireup="true" CodeBehind="AltaPaciente.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.AltaPaciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-center">
        <div class="card shadow p-4" style="width: 60rem;">
            <div class="text-center mb-3">
                <h4 class="fw-bold">Registrar Paciente</h4>
            </div>

            <div class="row g-3">
                <div class="col-md-6">
                    <label for="txtNombre">Nombre</label>
                    <asp:TextBox runat="server" ID="txtNombre" placeholder="Nombre" CssClass="form-control border-dark-subtle" />
                    <asp:RequiredFieldValidator ErrorMessage="El nombre es obligatorio" ControlToValidate="txtNombre" Display="Dynamic" CssClass="text-danger" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="No se permiten espacios vacíos" ControlToValidate="txtNombre" ValidationExpression="^\S(.*\S)?$" Display="Dynamic" CssClass="text-danger" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="Solo se permiten letras" ControlToValidate="txtNombre" ValidationExpression="^[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+$" CssClass="text-danger" Display="Dynamic" runat="server" />
                </div>

                <div class="col-md-6">
                    <label for="txtApellido">Apellido</label>
                    <asp:TextBox runat="server" ID="txtApellido" placeholder="Apellido" CssClass="form-control border-dark-subtle" />
                    <asp:RegularExpressionValidator ErrorMessage="Solo se permiten letras" ControlToValidate="txtApellido" ValidationExpression="^[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+$" CssClass="text-danger" Display="Dynamic" runat="server" />
                    <asp:RequiredFieldValidator ErrorMessage="El apellido es obligatorio" ControlToValidate="txtApellido" Display="Dynamic" CssClass="text-danger" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="No se permiten espacios vacíos" ControlToValidate="txtApellido" ValidationExpression="^\S(.*\S)?$" Display="Dynamic" CssClass="text-danger" runat="server" />
                </div>

                <div class="col-md-4">
                    <label for="ddlTipoDocumento">Tipo de Documento</label>
                    <asp:DropDownList ID="ddlTipoDocumento" runat="server"
                        CssClass="form-select border-dark-subtle">
                    </asp:DropDownList>
                </div>

                <div class="col-md-4">
                    <label for="txtDNI">Documento</label>
                    <asp:TextBox runat="server" ID="txtDNI" placeholder="12159753" CssClass="form-control border-dark-subtle" />
                    <asp:RegularExpressionValidator ErrorMessage="No válido" ControlToValidate="txtDNI" ValidationExpression="^\d{7,8}$" CssClass="text-danger" Display="Dynamic" runat="server" />
                    <asp:RequiredFieldValidator ErrorMessage="El documento es obligatorio" ControlToValidate="txtDNI" Display="Dynamic" CssClass="text-danger" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="No se permiten espacios vacíos" ControlToValidate="txtDNI" ValidationExpression="^\S(.*\S)?$" Display="Dynamic" CssClass="text-danger" runat="server" />
                </div>

                <div class="col-md-4">
                    <label for="txtNacimiento">Fecha de Nacimiento</label>
                    <asp:TextBox runat="server" ID="txtNacimiento" TextMode="Date" CssClass="form-control border-dark-subtle" />
                </div>

                <div class="col-md-6">
                    <label for="txtDireccion">Domicilio</label>
                    <asp:TextBox runat="server" ID="txtDireccion" placeholder="Calle Real 1234" CssClass="form-control border-dark-subtle" />
                    <asp:RegularExpressionValidator ErrorMessage="Dirección inválida" ControlToValidate="txtDireccion" ValidationExpression="^([A-Za-z]{4,})+\s+(\d{1,5})$|^([A-Za-z]{4,})+\s+(\d{1,3})+\s+(\d{1,5})$|^([A-Za-z]{2,})+\s+([A-Za-z]{4,})+\s+(\d{1,5})$" CssClass="text-danger" Display="Dynamic" runat="server" />
                    <asp:RequiredFieldValidator ErrorMessage="La dirección es obligatoria" ControlToValidate="txtDireccion" Display="Dynamic" CssClass="text-danger" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="No se permiten espacios vacíos" ControlToValidate="txtDireccion" ValidationExpression="^\S(.*\S)?$" Display="Dynamic" CssClass="text-danger" runat="server" />
                </div>

                <div class="col-md-6">
                    <label for="txtEmail">Email</label>
                    <asp:TextBox runat="server" ID="txtEmail" placeholder="Correo@email.com" CssClass="form-control border-dark-subtle" />
                    <asp:RegularExpressionValidator ErrorMessage="Email inválido" ControlToValidate="txtEmail" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" CssClass="text-danger" Display="Dynamic" runat="server" />
                    <asp:RequiredFieldValidator ErrorMessage="El email es obligatorio" ControlToValidate="txtEmail" Display="Dynamic" CssClass="text-danger" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="No se permiten espacios vacíos" ControlToValidate="txtEmail" ValidationExpression="^\S(.*\S)?$" Display="Dynamic" CssClass="text-danger" runat="server" />
                </div>

                <div class="col-md-6">
                    <label for="txtTelefono">Teléfono</label>
                    <asp:TextBox runat="server" ID="txtTelefono" placeholder="11 1234-1234" CssClass="form-control border-dark-subtle" />
                    <asp:RegularExpressionValidator ErrorMessage="Teléfono inválido" ControlToValidate="txtTelefono" ValidationExpression="^(?:(?:\+54|0)?(11|2[23]\d|3[3-8]\d|9[11]|9[2-3]\d))?\s?\d{4,5}\-?\d{4}$" CssClass="text-danger" Display="Dynamic" runat="server" />
                    <asp:RequiredFieldValidator ErrorMessage="El telefono es obligatorio" ControlToValidate="txtTelefono" Display="Dynamic" CssClass="text-danger" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="No se permiten espacios vacíos" ControlToValidate="txtTelefono" ValidationExpression="^\S(.*\S)?$" Display="Dynamic" CssClass="text-danger" runat="server" />
                </div>

                <div class="col-md-6">
                    <label for="ddlCobertura">Obra Social</label>
                    <asp:DropDownList ID="ddlCobertura" runat="server"
                        CssClass="form-select border-dark-subtle">
                        <asp:ListItem Selected hidden>Obra Social</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="d-flex justify-content-end mt-4">
                <a href="PacientesRecepcionista.aspx" class="btn btn-secondary border-black me-2" style="width: 120px;">Volver</a>
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar"
                    CssClass="btn btn-primary" Style="width: 200px;"
                    OnClick="btnGuardar_Click" />
            </div>
            <asp:Label ID="lblError" runat="server" CssClass="text-danger mt-2" Visible="false"></asp:Label>
        </div>
    </div>
</asp:Content>
