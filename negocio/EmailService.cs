using System;
using System.Net;
using System.Net.Mail;

namespace negocio
{
    public class EmailService
    {
        private MailMessage email;
        private SmtpClient server;

        
        public EmailService(string usuario, string pass)
        {
            server = new SmtpClient();
            server.Credentials = new NetworkCredential(usuario, pass);
            server.EnableSsl = true;
            server.Port = 587;
            server.Host = "smtp.gmail.com";
        }


        public void ArmarCorreo(string emailDestino, string nombre, string apellido)
        {
            email = new MailMessage();
            email.From = new MailAddress("programacionpruebamail@gmail.com");
            email.To.Add(emailDestino);
            email.Subject = "Registro exitoso!";
            email.Body = "<h1>Tu registro fue exitoso!</h1>" +
                         "<br> Hola, " + nombre + " " + apellido +
                         "!<br> <br>Gracias por registrarte en ClinicApp!";
            email.IsBodyHtml = true;
        }

        public void EnviarCorreo()
        {
            try
            {
                server.Send(email);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        public void EnviarCorreoPersonalizado(MailMessage mensaje)
        {
            try
            {
                server.Send(mensaje);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void ArmarCorreoPassTemporal(string emailDestino, string claveTemporal)
        {
            email = new MailMessage();
            email.From = new MailAddress("programacionpruebamail@gmail.com");
            email.To.Add(emailDestino);
            email.Subject = "Recuperación de contraseña - ClinicApp";

            email.Body = "<h2>Recuperación de contraseña</h2>" +
                         "<p>Esta es tu clave temporal:</p>" +
                         "<h3 style='color:blue;'>" + claveTemporal + "</h3>" +
                         "<p>Ingresá al sistema con esa clave y te pedirá crear una nueva.</p>";
            email.IsBodyHtml = true;
        }

    }
}