using System;
using System.Web.UI;
using dominio;
using negocio;
namespace Clinica_TpCuatrimestral_Equipo_11A
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Usuario usuario;
            UsuarioNegocio negocio = new UsuarioNegocio();

            try
            {
                usuario = new Usuario(txtEmail.Text, txtPassword.Text);
                int logueo = negocio.Loguear(usuario);
                //corrobora contra BBDD que exista el usuario con mail y contraseña y devuelve un código de Error o el IdUsuario
                //ERRORES:
                //-1 - el mail no existe en base de datos
                //-2 - la contraseña es incorrecta
                //-3 - el usuario fue dado de baja
                if (logueo != -1)
                {
                    //cargamos el id usuario en la sesion
                    usuario.IdUsuario = logueo;
                    Session.Add("usuario", usuario);

                    if (Session["usuario"] != null && ((dominio.Usuario)Session["usuario"]).TipoUsuario == dominio.TipoUsuario.PACIENTE)
                    {   
                        var usuarioPaciente = (Usuario)Session["usuario"];

                        PacienteNegocio pacienteNegocio = new PacienteNegocio();
                        Paciente paciente = new Paciente();

                        paciente = pacienteNegocio.BuscarPorIdUsuario(usuarioPaciente.IdUsuario);

                        // Guardamos el objeto médico completo para usar en MasterMedico y otras páginas
                        Session["Paciente"] = paciente;

                        Response.Redirect("InicioPaciente.aspx", false);
                    }
                    else if (Session["usuario"] != null && ((dominio.Usuario)Session["usuario"]).TipoUsuario == dominio.TipoUsuario.RECEPCIONISTA)
                    {
                        Response.Redirect("InicioRecepcionista.aspx", false);
                    }
                    else if (Session["usuario"] != null && ((dominio.Usuario)Session["usuario"]).TipoUsuario == dominio.TipoUsuario.MEDICO)
                    {
                        // Cargar datos completos del médico (nombre, apellido, matrícula, especialidades, etc.)
                        var usuarioMedico = (Usuario)Session["usuario"];
                        MedicoNegocio medicoNegocio = new MedicoNegocio();
                        Medico medico = medicoNegocio.BuscarPorIdUsuario(usuarioMedico.IdUsuario);

                        // Guardamos el objeto médico completo para usar en MasterMedico y otras páginas
                        Session["Medico"] = medico;
                        Response.Redirect("InicioMedico.aspx", false);
                    }

                    else if (Session["usuario"] != null && ((dominio.Usuario)Session["usuario"]).TipoUsuario == dominio.TipoUsuario.ADMIN)
                    {
                        Response.Redirect("InicioRecepcionista.aspx", false);
                    }
                    else
                    {
                        Session.Add("Error", "Usuario o contraseña incorrectos");
                        Response.Redirect("Error.aspx", false);
                    }
                }
                else if(logueo == -1)
                {
                    //-1 - el mail no existe en base de datos
                }
                else if (logueo == -2)
                {
                    //-2 - la contraseña es incorrecta
                }
                else if(logueo == -3)
                {
                    //-3 - el usuario fue dado de baja
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);

            }
           
        }
    }
}
