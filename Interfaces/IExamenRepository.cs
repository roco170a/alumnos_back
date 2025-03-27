using System.Collections.Generic;
using System.Threading.Tasks;
using apiAlumnos.Models;
using apiAlumnos.DTOs;

namespace apiAlumnos.Interfaces
{
    public interface IExamenRepository : IGenericRepository<Examen>
    {
        // Métodos que llaman directamente a los stored procedures
        Task<IEnumerable<Examen>> ObtenerTodosAsync(string estado);
        Task<IEnumerable<Examen>> ObtenerConDetallesAsync(int? materiaId, string estado);
        Task<IEnumerable<Examen>> ObtenerPorMateriaEstadoAsync(int? materiaId, string estado);
        Task<Examen> ObtenerPorIdAsync(int id);
        
        // Métodos que devuelven DTOs
        Task<IEnumerable<ExamenDto>> ObtenerTodosDtoAsync(string estado);
        Task<IEnumerable<ExamenDto>> ObtenerConDetallesDtoAsync(int? materiaId, string estado);
        Task<ExamenDto> ObtenerPorIdDtoAsync(int id);
        Task<IEnumerable<ExamenDto>> ObtenerPorMateriaEstadoDtoAsync(int? materiaId, string estado);
    }
} 