<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPaciente.Master" AutoEventWireup="true" CodeBehind="InicioPaciente.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.InicioPaciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <h2 class="fw-bold">Bienvenido,</h2>
        <div class="card shadow-sm border-0">
            <div class="card-body">
                <div class="d-flex justify-content-between mb-3">
                    <asp:Label ID="lblTitulo" runat="server"
                        Text="Turnos Próximos"
                        CssClass="fw-bold mb-0 h5" />
                </div>

                <%-- TURNOS PROXIMOS DGV --%>
                <asp:GridView ID="gvTurnos" runat="server" AutoGenerateColumns="False" CssClass="table align-middle table-hover">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID" Visible="false" />
                        <asp:BoundField DataField="Hora" HeaderText="Hora" />
                        <asp:BoundField DataField="Fecha" HeaderText="Fecha" />
                        <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" />
                        <asp:BoundField DataField="Medico" HeaderText="Medico" />
                        <asp:TemplateField HeaderText="Acciones">
                            <ItemTemplate>
                                <button type="button"
                                    class="btn btn-primary"
                                    onclick="abrirModal(<%# Eval("Id") %>)">
                                    Cancelar Turno
                                </button>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>


    <asp:HiddenField ID="hdnTurnoId" runat="server" />

    <div class="modal fade" id="modalCancelar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Atención!</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    ¿Estás seguro de cancelar este turno?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                    <asp:Button ID="btnConfirmarCancelar" runat="server"
                        Text="Cancelar"
                        CssClass="btn btn-primary"
                        OnClick="btnConfirmarCancelar_Click" />
                </div>

            </div>
        </div>
    </div>

    <script>
        function abrirModal(turnoId) {
            document.getElementById('<%= hdnTurnoId.ClientID %>').value = turnoId;
            var modal = new bootstrap.Modal(document.getElementById('modalCancelar'));
            modal.show();
        }
    </script>
</asp:Content>
