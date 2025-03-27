using System.Collections.Generic;
using System.Threading.Tasks;
using apiAlumnos.Models;
using apiAlumnos.DTOs;

namespace apiAlumnos.Interfaces
{
    public interface IAlumnoRepository : IGenericRepository<Alumno>
    {
        Task<IEnumerable<Alumno>> BuscarPorNombreAsync(string nombre);        
        Task<IEnumerable<Alumno>> ObtenerPorUserIdAsync(string userId);
        
        // Métodos que devuelven DTOs
        Task<IEnumerable<AlumnoDto>> GetAllDtoAsync();
        Task<AlumnoDto> GetByIdDtoAsync(int id);
        Task<AlumnoDto> ObtenerPorUserIdDtoAsync(string userId);
        Task<IEnumerable<AlumnoDto>> BuscarPorNombreDtoAsync(string nombre);
        
    }
} 