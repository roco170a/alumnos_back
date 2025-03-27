using System;

namespace apiAlumnos.Models
{
    public class AlumnoExamen
    {
        public int Id { get; set; }
        public int AlumnoId { get; set; }
        public int ExamenId { get; set; }
        public DateTime? FechaRealizacion { get; set; }
        public decimal? Calificacion { get; set; }
        public string? Comentarios { get; set; }
        public string Estado { get; set; } = "Pendiente"; // Pendiente, Realizado, Calificado, etc.
        public bool Activo { get; set; } = true;
        public DateTime FechaCreacion { get; set; } = DateTime.Now;

        // Propiedades de navegación
        public int MateriaId { get; set; }
        public Alumno? Alumno { get; set; }
        public Examen? Examen { get; set; }
        public Materia? Materia{ get; set; }
    }
} 