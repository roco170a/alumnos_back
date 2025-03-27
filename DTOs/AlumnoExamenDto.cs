using System;

namespace apiAlumnos.DTOs
{
    public class AlumnoExamenDto
    {
        public int Id { get; set; }
        public int AlumnoId { get; set; }
        public int ExamenId { get; set; }
        public DateTime? FechaRealizacion { get; set; }
        public decimal? Calificacion { get; set; }
        public string? Comentarios { get; set; }
        public string Estado { get; set; } = string.Empty;
        public bool Activo { get; set; }
        public DateTime FechaCreacion { get; set; }
        
        // Información adicional para visualización
        public string NombreAlumno { get; set; } = string.Empty;
        public string ApellidosAlumno { get; set; } = string.Empty;
        public string EmailAlumno { get; set; } = string.Empty;
        public string DocumentoAlumno { get; set; } = string.Empty;
        public string TituloExamen { get; set; } = string.Empty;
        public string NombreMateria { get; set; } = string.Empty;
        public string CodigoMateria { get; set; } = string.Empty;
        public string MateriaId { get; set; } = string.Empty;
        public string NombreTipoExamen { get; set; } = string.Empty;
        public decimal PonderacionTipoExamen { get; set; }
        public string FechaExamen { get; set; } = string.Empty;
        public string FechaRealizacionFormateada { get; set; } = string.Empty;
    }
} 