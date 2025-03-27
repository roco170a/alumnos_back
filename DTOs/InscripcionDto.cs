using System;

namespace apiAlumnos.DTOs
{
    public class InscripcionDto
    {
        public int Id { get; set; }
        public int AlumnoId { get; set; }
        public int MateriaId { get; set; }
        public DateTime FechaInscripcion { get; set; }
        public string PeriodoAcademico { get; set; } = string.Empty;
        public string? Estado { get; set; }
        public decimal? NotaFinal { get; set; }
        
        // Información adicional para visualización
        public string NombreAlumno { get; set; } = string.Empty;
        public string ApellidosAlumno { get; set; } = string.Empty;
        public string NombreMateria { get; set; } = string.Empty;
        public string CodigoMateria { get; set; } = string.Empty;
    }
} 