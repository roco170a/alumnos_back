using System;

namespace apiAlumnos.DTOs
{
    public class ProgramacionExamenDto
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
        public bool Activo { get; set; }
        public DateTime FechaCreacion { get; set; }
        public DateTime? FechaModificacion { get; set; }
        
        // Información adicional para visualización
        public string NombreMateria { get; set; } = string.Empty;
        public string CodigoMateria { get; set; } = string.Empty;
        public string NombreTipoExamen { get; set; } = string.Empty;
        public decimal PonderacionTipoExamen { get; set; }
        public string FechaFormateada { get; set; } = string.Empty;
        public int CantidadExamenes { get; set; }
        
    }
} 