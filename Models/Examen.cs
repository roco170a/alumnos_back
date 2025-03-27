using System;

namespace apiAlumnos.Models
{
    public class Examen
    {
        public int Id { get; set; }
        public int ProgramacionId { get; set; }
        public int TipoExamenId { get; set; }
        public DateTime FechaRealizacion { get; set; }
        public string? Observaciones { get; set; }
        public string Estado { get; set; } = string.Empty;
        public bool Activo { get; set; } = true;
        public DateTime FechaCreacion { get; set; } = DateTime.Now;
        
        // Propiedades de navegación
        public ProgramacionExamen? ProgramacionExamen { get; set; }
        public TipoExamen? TipoExamen { get; set; }
        public Materia? Materia { get; set; }
    }
} 