using System;

namespace apiAlumnos.DTOs
{
    public class TipoExamenDto
    {
        public int Id { get; set; }
        public string Nombre { get; set; } = string.Empty;
        public string? Descripcion { get; set; }
        public decimal Ponderacion { get; set; }
        public bool Activo { get; set; }
        public DateTime FechaCreacion { get; set; }
        
        // Información adicional para visualización
        public int CantidadExamenes { get; set; }
    }
} 