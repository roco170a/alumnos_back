using System;

namespace apiAlumnos.DTOs
{
    public class ExamenDto
    {
        public int Id { get; set; }
        public int ProgramacionId { get; set; }
        public int TipoExamenId { get; set; }
        public DateTime FechaRealizacion { get; set; }
        public string? Observaciones { get; set; }
        public string Estado { get; set; } = string.Empty;
        public bool Activo { get; set; }
        public DateTime FechaCreacion { get; set; }
        
        // Información adicional para visualización
        public string NombreMateria { get; set; } = string.Empty;
        public string CodigoMateria { get; set; } = string.Empty;
        public string NombreTipoExamen { get; set; } = string.Empty;
        public decimal PonderacionTipoExamen { get; set; }
        public string FechaRealizacionFormateada { get; set; } = string.Empty;
        public int CantidadInscripciones { get; set; }
        public string ProfesorMateria { get; set; } = string.Empty;
        public string NombreProgramacion { get; set; } = string.Empty;
        public DateTime FechaProgramada { get; set; }
        public string Aula { get; set; } = string.Empty;
        public int DuracionMinutos { get; set; }
    }
} 