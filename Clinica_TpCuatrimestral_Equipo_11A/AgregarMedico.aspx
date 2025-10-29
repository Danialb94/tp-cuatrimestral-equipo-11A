<%@ Page Title="Agregar Médico" Language="C#" MasterPageFile="~/Recepcionista.Master" AutoEventWireup="true" CodeBehind="AgregarMedico.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.AgregarMedico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <h3 class="fw-bold mb-3">Agregar nuevo médico</h3>

        <form>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label fw-semibold">Nombre</label>
                    <input type="text" class="form-control" />
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-semibold">Apellido</label>
                    <input type="text" class="form-control" />
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label fw-semibold">Email</label>
                    <input type="email" class="form-control" />
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-semibold">Teléfono</label>
                    <input type="text" class="form-control" />
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label fw-semibold">Especialidad</label>
                    <asp:DropDownList ID="ddlEspecialidades" runat="server" CssClass="form-select"></asp:DropDownList>

                </div>
                <div class="col-md-6">
                    <label class="form-label fw-semibold">Matrícula</label>
                    <input type="text" class="form-control" />
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label fw-semibold">Franja horaria disponible</label>
                    <input type="text" class="form-control" placeholder="Ej: 08:00 - 14:00" />
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-semibold">Días disponibles</label>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="lunes">
                        <label class="form-check-label" for="lunes">Lunes</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="martes">
                        <label class="form-check-label" for="martes">Martes</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="miercoles">
                        <label class="form-check-label" for="miercoles">Miercoles</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="jueves">
                        <label class="form-check-label" for="jueves">Jueves</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="viernes">
                        <label class="form-check-label" for="viernes">Viernes</label>
                    </div>
                </div>
            </div>

            <div class="mt-3">
                <button type="submit" class="btn btn-primary me-2">Guardar médico</button>
                <a href="MedicosRecepcionista.aspx" class="btn btn-secondary">Cancelar</a>
            </div>
        </form>
    </div>
</asp:Content>
