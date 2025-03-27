using System.Collections.Generic;
using System.Threading.Tasks;
using apiAlumnos.Models;
using apiAlumnos.DTOs;

namespace apiAlumnos.Interfaces
{
    public interface IMateriaRepository : IGenericRepository<Materia>
    {
        // Métodos que llaman directamente a los stored procedures
        Task<IEnumerable<Materia>> ObtenerTodasAsync(bool soloActivas);
        Task<Materia> ObtenerPorIdAsync(int id);
        Task<Materia> ObtenerPorCodigoAsync(string codigo);
        Task<IEnumerable<Materia>> BuscarAsync(string busqueda, bool soloActivas);
        
        // Métodos que devuelven DTOs
        Task<IEnumerable<MateriaDto>> ObtenerTodasDtoAsync(bool soloActivas);
        Task<MateriaDto> ObtenerPorIdDtoAsync(int id);
        Task<MateriaDto> ObtenerPorCodigoDtoAsync(string codigo);
        Task<IEnumerable<MateriaDto>> BuscarDtoAsync(string busqueda, bool soloActivas);
    }
} 