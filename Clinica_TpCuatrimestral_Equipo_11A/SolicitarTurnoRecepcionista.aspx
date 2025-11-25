<%@ Page Title="" Language="C#" MasterPageFile="~/MasterRecepcionista.Master" AutoEventWireup="true" CodeBehind="SolicitarTurnoRecepcionista.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.SolicitarTurnoRecepcionista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="container mt-4">
        <h2 class="fw-bold">Solicitar un nuevo turno</h2>
        <div class="row d-flex">
            <div class="">
                <div class="card shadow-sm border-0 ">
                    <div class="card-body d-flex">
                        <div class="col-3 justify-content-between me-3">
                            <h5 class="fw-bold mb-2">Especialidad</h5>
                            <asp:DropDownList ID="ddlEspecialidades" runat="server" class="border-dark-subtle rounded-3 w-100 h-50" OnSelectedIndexChanged="ddlEspecialidades_SelectedIndexChanged" AutoPostBack="true">
                            </asp:DropDownList>
                        </div>
                        <div class="col-3 justify-content-between me-3" id="CampoProfesional" runat="server">
                            <h5 class="fw-bold mb-2">Profesional</h5>
                            <asp:DropDownList ID="ddlProfesionales" runat="server" class="border-dark-subtle rounded-3 w-100 h-50" OnSelectedIndexChanged="ddlProfesionales_SelectedIndexChanged" AutoPostBack="true">
                            </asp:DropDownList>
                        </div>
                        <div class="col" id="CampoMotivo" runat="server">
                            <label class="form-label fw-bold">Motivo de la consulta:</label>
                            <asp:TextBox ID="txtMotivoConsulta" runat="server" class="h-50 form-control" placeholder="Ej: Control, Consulta general..." />
                        </div>
                    </div>
                </div>


                <div class="card shadow-sm border-0 mt-2" id="CampoDias" runat="server">
                    <div class="card-body">
                        <div class="col">
                            <div>
                                <h5 class="fw-bold mb-2">Dias disponibles</h5>
                                <div class="d-flex align-items-center">
                                    <span class="fw-bold me-3">Seleccionar fecha:</span>
                                    <asp:TextBox ID="txtFecha" runat="server" CssClass="form-control w-auto" />
                                    <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn btn-primary ms-3" OnClick="btnBuscar_Click" />

                                </div>
                                <div class="mb-3">
                                    <asp:Label Text="" runat="server" ID="aviso" class="text-danger"/>

                                </div>
                            </div>
                            <asp:GridView ID="dgvFechas" runat="server" AutoGenerateColumns="false"
                                CssClass="table table-striped"
                                OnRowCommand="dgvFechas_RowCommand">
                                <Columns>
                                    <asp:BoundField HeaderText="Especialidad" DataField="Especialidad" />
                                    <asp:BoundField HeaderText="Profesional" DataField="Medico" />
                                    <asp:BoundField HeaderText="Fecha" DataField="Fecha" />
                                    <asp:BoundField HeaderText="Día de la Semana" DataField="DiaSemana" />
                                    <asp:BoundField HeaderText="Hora" DataField="Hora" />

                                    <asp:TemplateField HeaderText="Acción">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnSeleccionar" runat="server"
                                                CssClass="btn btn-sm btn-primary"
                                                Text="Seleccionar"
                                                CommandName="SeleccionarTurno"
                                                CommandArgument='<%# Eval("FechaCompleta") %>'>
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Confirmar el Turno</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <p><strong>Especialidad:</strong> <%: ddlEspecialidades.SelectedItem != null ? ddlEspecialidades.SelectedItem.Text : "" %></p>
                                <p><strong>Profesional:</strong> <%: ddlProfesionales.SelectedItem != null ? ddlProfesionales.SelectedItem.Text : "" %></p>
                                <p><strong>Fecha:</strong> <%: FechaSeleccionada ?? "" %></p>
                                <p><strong>Día:</strong> <%: DiaSeleccionado ?? "" %></p>
                                <p><strong>Hora:</strong> <%: HoraSeleccionada ?? "" %></p>
                                <p><strong>Motivo:</strong> <%: txtMotivoConsulta.Text %></p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="border-dark-subtle btn" data-bs-dismiss="modal">Cancelar</button>
                                <asp:Button ID="btnConfirmarTurno" runat="server"
                                    Text="Confirmar Turno"
                                    CssClass="btn btn-primary"
                                    OnClick="btnConfirmarTurno_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function abrirModal() {
                var modal = new bootstrap.Modal(document.getElementById('exampleModal'));
                modal.show();
                return false;
            }
        </script>
</asp:Content>
