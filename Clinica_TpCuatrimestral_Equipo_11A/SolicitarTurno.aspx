<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPaciente.Master" AutoEventWireup="true" CodeBehind="SolicitarTurno.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.SolicitarTurno" %>

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
                            <h5 class="fw-bold mb-2">Dias disponibles</h5>
                            <asp:GridView ID="dgvFechas" runat="server" AutoGenerateColumns="false" CssClass="table table-striped">
                                <Columns>
                                    <asp:BoundField HeaderText="Fecha" DataField="Fecha" />
                                    <asp:BoundField HeaderText="Día de la Semana" DataField="DiaSemana" />
                                    <asp:BoundField HeaderText="Hora" DataField="Hora" />

                                    <asp:TemplateField HeaderText="Acción">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnSeleccionar"
                                                runat="server"
                                                CssClass="btn btn-sm btn-primary"
                                                Text="Seleccionar"
                                                CommandName="SeleccionarTurno"
                                                CommandArgument='<%# Eval("FechaCompleta") %>'
                                                data-bs-toggle="modal"
                                                data-bs-target="#exampleModal">
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
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Turno</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                El turno se asignó con éxito!
                            </div>
                            <div class="modal-footer">
                                <a type="button" class="btn btn-primary" href="InicioPaciente.aspx">OK</a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
</asp:Content>
