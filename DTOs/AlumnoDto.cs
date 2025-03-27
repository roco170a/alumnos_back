using System;

namespace apiAlumnos.DTOs
{
    public class AlumnoDto
    {
        public int Id { get; set; }
        public string Nombre { get; set; } = string.Empty;
        public string ApellidoPaterno { get; set; } = string.Empty;
        public string ApellidoMaterno { get; set; } = string.Empty;        
        public string NombreCompleto { get; set; } = string.Empty;        
        public DateTime FechaNacimiento { get; set; }
        public int Edad { get; set; }
        public string Email { get; set; } = string.Empty;
        public string? Telefono { get; set; }
        public string? Direccion { get; set; }
        public string? UserId { get; set; }
        public bool Activo { get; set; }
    }
} 