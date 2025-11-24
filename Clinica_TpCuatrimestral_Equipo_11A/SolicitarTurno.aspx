<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPaciente.Master" AutoEventWireup="true" CodeBehind="SolicitarTurno.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.SolicitarTurno" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-4">
        <h2 class="fw-bold">Solicitar un nuevo turno</h2>
        <div class="row d-flex">
            <div class="col-8">
                <div class="card shadow-sm border-0 ">
                    <div class="card-body">
                        <div class="justify-content-between mb-3">
                            <h5 class="fw-bold mb-2">Especialidad</h5>
                            <asp:DropDownList ID="ddlEspecialidades" runat="server" class="border-dark-subtle rounded-3 w-100" OnSelectedIndexChanged="ddlEspecialidades_SelectedIndexChanged" AutoPostBack="true">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>

                <div class="card shadow-sm border-0 mt-2" id="CampoProfesional" runat="server">
                    <div class="card-body">
                        <div class="justify-content-between mb-3">
                            <h5 class="fw-bold mb-2">Profesional</h5>
                            <asp:DropDownList ID="ddlProfesionales" runat="server" class="border-dark-subtle rounded-3 w-100" OnSelectedIndexChanged="ddlProfesionales_SelectedIndexChanged" AutoPostBack="true">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>

                <div class="card shadow-sm border-0 mt-2" id="CampoMotivo" runat="server">
                    <div class="card-body">
                        <div class="mb-3">
                            <label class="form-label fw-bold">Motivo de la consulta:</label>
                            <asp:TextBox ID="txtMotivoConsulta" runat="server" CssClass="form-control" placeholder="Ej: Control, Consulta general..." />
                        </div>
                    </div>
                </div>


                <div class="card shadow-sm border-0 mt-2" id="CampoDias" runat="server">
                    <div class="card-body">
                        <div class="col">
                            <h5 class="fw-bold mb-2">Dias disponibles</h5>
                            <%--<table class="table align-middle table-hover">
                                <thead class="table-light">
                                    <tr>
                                        <th>Fecha</th>
                                        <th>Dia de la Semana</th>
                                        <th>Profesional</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>3/11</td>
                                        <td>Lunes</td>
                                        <td>Dr. Carlos Gomez</td>
                                        <td>
                                            <asp:RadioButton Text="" runat="server" GroupName="DiaTurno" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>5/11</td>
                                        <td>Miercoles</td>
                                        <td>Dr. Juan Perez</td>
                                        <td>
                                            <asp:RadioButton Text="" runat="server" GroupName="DiaTurno" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>7/11</td>
                                        <td>Viernes</td>
                                        <td>Dr. José García</td>
                                        <td>
                                            <asp:RadioButton Text="" runat="server" GroupName="DiaTurno" />
                                        </td>
                                    </tr>

                                </tbody>
                            </table>--%>
                            <asp:GridView ID="dgvFechas" runat="server" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:BoundField headertext="Fecha" DataField="FechaHora.Date"/>
                                    
                                    <asp:BoundField headertext="Dia de la Semana" DataField="FechaHora.DayofWeek"/>
                                    
                                    <asp:BoundField headertext="Fecha" DataField="Medico"/>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            <div class="card shadow-sm border-0 mt-2 col" id="CampoHorarios" runat="server">
                <div class="card-body">
                    <div class="justify-content-between mb-3">
                        <h5 class="fw-bold mb-2">Horarios Disponibles</h5>
                        <table class="table align-middle table-hover">
                            <thead class="table-light">
                                <tr>
                                    <th>Horario</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>9:00</td>
                                    <td>
                                        <asp:RadioButton Text="" runat="server" GroupName="Horario" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>10:00</td>
                                    <td>
                                        <asp:RadioButton Text="" runat="server" GroupName="Horario" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>11:00</td>
                                    <td>
                                        <asp:RadioButton Text="" runat="server" GroupName="Horario" />
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="d-flex justify-content-end mt-3" id="Botones" runat="server">
                <a href="InicioPaciente.aspx" class="btn btn-secondery border-black me-2" style="width: 100px;">Volver</a>
                <button type="button" class="btn btn-primary" style="width: 200px;" data-bs-toggle="modal" data-bs-target="#exampleModal">Seleccionar Turno</button>
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
