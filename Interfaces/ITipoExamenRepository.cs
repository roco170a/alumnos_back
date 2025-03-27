using System.Collections.Generic;
using System.Threading.Tasks;
using apiAlumnos.DTOs;
using apiAlumnos.Models;

namespace apiAlumnos.Interfaces
{
    public interface ITipoExamenRepository : IGenericRepository<TipoExamen>
    {
        // Métodos que llaman directamente a stored procedures
        Task<IEnumerable<TipoExamen>> ObtenerTodosAsync();
        Task<TipoExamen> ObtenerPorIdAsync(int id);
        
        // Métodos que devuelven DTOs
        Task<IEnumerable<TipoExamenDto>> ObtenerTodosDtoAsync();
        Task<TipoExamenDto> ObtenerPorIdDtoAsync(int id);
    }
} 