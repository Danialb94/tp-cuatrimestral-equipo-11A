<%@ Page Title="Agregar Médico" Language="C#" MasterPageFile="~/MasterRecepcionista.Master" AutoEventWireup="true" CodeBehind="AgregarMedico.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.AgregarMedico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        input[type="hidden"][name*="chk"] {
            display: none !important;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <h3 class="fw-bold mb-3">Agregar nuevo médico</h3>

        <form>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label fw-semibold">Nombre</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ErrorMessage="El nombre es obligatorio" ControlToValidate="txtNombre" Display="Dynamic" CssClass="text-danger" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="No se permiten espacios vacíos" ControlToValidate="txtNombre" ValidationExpression="^\S(.*\S)?$" Display="Dynamic" CssClass="text-danger" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="Solo se permiten letras" ControlToValidate="txtNombre" ValidationExpression="^[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+$" CssClass="text-danger" Display="Dynamic" runat="server" />
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-semibold">Apellido</label>
                    <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" />
                    <asp:RegularExpressionValidator ErrorMessage="Solo se permiten letras" ControlToValidate="txtApellido" ValidationExpression="^[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+$" CssClass="text-danger" Display="Dynamic" runat="server" />
                    <asp:RequiredFieldValidator ErrorMessage="El apellido es obligatorio" ControlToValidate="txtApellido" Display="Dynamic" CssClass="text-danger" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="No se permiten espacios vacíos" ControlToValidate="txtApellido" ValidationExpression="^\S(.*\S)?$" Display="Dynamic" CssClass="text-danger" runat="server" />
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label fw-semibold">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" />
                    <asp:RegularExpressionValidator ErrorMessage="Email inválido" ControlToValidate="txtEmail" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" CssClass="text-danger" Display="Dynamic" runat="server" />
                    <asp:RequiredFieldValidator ErrorMessage="El email es obligatorio" ControlToValidate="txtEmail" Display="Dynamic" CssClass="text-danger" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="No se permiten espacios vacíos" ControlToValidate="txtEmail" ValidationExpression="^\S(.*\S)?$" Display="Dynamic" CssClass="text-danger" runat="server" />
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-semibold">Teléfono</label>
                    <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" />
                    <asp:RegularExpressionValidator ErrorMessage="Teléfono inválido" ControlToValidate="txtTelefono" ValidationExpression="^(?:(?:\+54|0)?(11|2[23]\d|3[3-8]\d|9[11]|9[2-3]\d))?\s?\d{4,5}\-?\d{4}$" CssClass="text-danger" Display="Dynamic" runat="server" />
                    <asp:RequiredFieldValidator ErrorMessage="El telefono es obligatorio" ControlToValidate="txtTelefono" Display="Dynamic" CssClass="text-danger" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="No se permiten espacios vacíos" ControlToValidate="txtTelefono" ValidationExpression="^\S(.*\S)?$" Display="Dynamic" CssClass="text-danger" runat="server" />
                </div>
            </div>

            <div class="row mb-3">


                <div class="col-md-6">
                    <label class="form-label fw-semibold">Especialidad</label>
                    <asp:DropDownList
                        ID="ddlEspecialidades"
                        runat="server"
                        CssClass="form-select"
                        Style="height: 36px; font-size: 14px;">
                    </asp:DropDownList>
                </div>


                <div class="col-md-6">
                    <label class="form-label fw-semibold">Matrícula</label>
                    <asp:TextBox ID="txtMatricula" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ErrorMessage="La matricula es obligatoria" ControlToValidate="txtMatricula" Display="Dynamic" CssClass="text-danger" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="No se permiten espacios vacíos" ControlToValidate="txtMatricula" ValidationExpression="^\S(.*\S)?$" Display="Dynamic" CssClass="text-danger" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="No es un formato válido" ControlToValidate="txtMatricula" ValidationExpression="^((M\.?\s?(P|N)\.?\s?\d{4,6})|\d{4,6})$" Display="Dynamic" CssClass="text-danger" runat="server" />
                </div>

            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label fw-semibold">Franja horaria disponible</label>
                    <asp:TextBox ID="txtFranjaHoraria" runat="server" CssClass="form-control" placeholder="Ej: 08:00 - 14:00" />
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-semibold">Días disponibles</label>
                    <div class="form-check">
                        <asp:CheckBox ID="chkLunes" runat="server" CssClass="form-check-input" />
                        <label class="form-check-label" for="lunes">Lunes</label>
                    </div>
                    <div class="form-check">
                        <asp:CheckBox ID="chkMartes" runat="server" CssClass="form-check-input" />
                        <label class="form-check-label" for="martes">Martes</label>
                    </div>
                    <div class="form-check">
                        <asp:CheckBox ID="chkMiercoles" runat="server" CssClass="form-check-input" />
                        <label class="form-check-label" for="miercoles">Miercoles</label>
                    </div>
                    <div class="form-check">
                        <asp:CheckBox ID="chkJueves" runat="server" CssClass="form-check-input" />
                        <label class="form-check-label" for="jueves">Jueves</label>
                    </div>
                    <div class="form-check">
                        <asp:CheckBox ID="chkViernes" runat="server" CssClass="form-check-input" />
                        <label class="form-check-label" for="viernes">Viernes</label>
                    </div>
                </div>
            </div>
            <div class="mt-3">
                <asp:Button ID="btnAgregarEspecialidad" runat="server" CssClass="btn btn-primary me-2" Text="Agregar especialidad" OnClick="btnAgregarEspecialidad_Click" />
                <asp:Label ID="lblResumenEspecialidades" runat="server" CssClass="text-primary fw-bold mt-3 d-block" Visible="false">
                </asp:Label>

                <div class="mt-3">
                    <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-primary me-2" Text="Guardar médico" OnClick="btnGuardar_Click" />
                    <a href="MedicosRecepcionista.aspx" class="btn btn-secondary">Cancelar</a>

                </div>
        </form>
    </div>
</asp:Content>
