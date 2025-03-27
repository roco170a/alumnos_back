using System;

namespace apiAlumnos.Models
{
    public class Materia
    {
        public int Id { get; set; }
        public string Nombre { get; set; } = string.Empty;
        public string Codigo { get; set; } = string.Empty;
        public string Profesor { get; set; } = string.Empty;
        public string? Descripcion { get; set; }
        public int Creditos { get; set; }
        public bool Activa { get; set; }
        public DateTime FechaCreacion { get; set; } = DateTime.Now;
    }
} 