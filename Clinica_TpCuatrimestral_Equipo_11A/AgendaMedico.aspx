<%@ Page Title="Agenda Médico" Language="C#" MasterPageFile="~/MasterMedico.Master"
    AutoEventWireup="true" CodeBehind="AgendaMedico.aspx.cs"
    Inherits="Clinica_TpCuatrimestral_Equipo_11A.AgendaMedico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        table.table-bordered th, table.table-bordered td {
            border: 1px solid #dee2e6 !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <h3 class="fw-bold mb-4">Agenda del Médico</h3>

        <!-- Controles -->
        <div class="d-flex align-items-center mb-3 flex-wrap">
            <input type="month" id="txtMes" runat="server" class="form-control w-auto me-2 mb-2" />
            <asp:Button ID="btnBuscarMes" runat="server" Text="Ver Mes" CssClass="btn btn-primary me-2 mb-2" OnClick="btnBuscarMes_Click" />
            <asp:Button ID="btnSemanaAnterior" runat="server" Text="⟵ Semana anterior" CssClass="btn btn-outline-secondary me-2 mb-2" OnClick="btnSemanaAnterior_Click" />
            <asp:Button ID="btnSemanaActual" runat="server" Text="📅 Semana actual" CssClass="btn btn-outline-primary me-2 mb-2" OnClick="btnSemanaActual_Click" />
            <asp:Button ID="btnSemanaSiguiente" runat="server" Text="Semana siguiente ⟶" CssClass="btn btn-outline-secondary mb-2" OnClick="btnSemanaSiguiente_Click" />
        </div>

        <!-- Título de la semana -->
        <h5 class="fw-semibold mb-3 text-muted">
            <asp:Label ID="lblSemanaActual" runat="server" />
        </h5>

        <!-- Tabla -->
        <div class="table-responsive bg-white shadow-sm rounded-3 p-3">
            <table class="table table-bordered align-middle text-center">
                <thead class="table-light">
                    <asp:Literal ID="ltEncabezado" runat="server" />
                </thead>
                <tbody>
                    <asp:Literal ID="ltAgenda" runat="server" />
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
