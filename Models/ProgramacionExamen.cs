using System;

namespace apiAlumnos.Models
{
    public class ProgramacionExamen
    {
        public int Id { get; set; }
        public int MateriaId { get; set; }
        public int ExamenId { get; set; }
        public DateTime FechaProgramada { get; set; }
        public int DuracionMinutos { get; set; }
        public string Aula { get; set; } = string.Empty;
        public string? Instrucciones { get; set; }
        public string? MaterialRequerido { get; set; }
        public string Estado { get; set; } = "Programado";
        public bool Activo { get; set; } = true;
        public DateTime FechaCreacion { get; set; } = DateTime.Now;
        public DateTime? FechaModificacion { get; set; }

        // Propiedades de navegación
        public Materia? Materia { get; set; }
        public TipoExamen? TipoExamen { get; set; }
        public Examen? Examen { get; set; }
    }
} 