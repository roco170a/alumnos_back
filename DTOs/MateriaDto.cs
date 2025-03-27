using System;

namespace apiAlumnos.DTOs
{
    public class MateriaDto
    {
        public int Id { get; set; }
        public string Nombre { get; set; } = string.Empty;
        public string Codigo { get; set; } = string.Empty;
        public string Profesor { get; set; } = string.Empty;
        public string? Descripcion { get; set; }
        public int Creditos { get; set; }
        public bool Activa { get; set; }
        public DateTime FechaCreacion { get; set; }
        
        // Información adicional para la vista
        public int CantidadInscripciones { get; set; }
        public int CantidadExamenes { get; set; }
    }
} 