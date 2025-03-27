using System;

namespace apiAlumnos.Models
{
    public class Inscripcion
    {
        public int Id { get; set; }
        public int AlumnoId { get; set; }
        public int MateriaId { get; set; }
        public DateTime FechaInscripcion { get; set; } = DateTime.Now;
        public string PeriodoAcademico { get; set; } = string.Empty;
        public string? Estado { get; set; }
        public decimal? NotaFinal { get; set; }
        
        // Propiedades de navegación (no se mapean directamente a la BD)
        public Alumno? Alumno { get; set; }
        public Materia? Materia { get; set; }
    }
} 