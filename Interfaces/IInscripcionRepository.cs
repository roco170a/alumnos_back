using System.Collections.Generic;
using System.Threading.Tasks;
using apiAlumnos.Models;
using apiAlumnos.DTOs;

namespace apiAlumnos.Interfaces
{
    public interface IInscripcionRepository : IGenericRepository<Inscripcion>
    {
        // Métodos que llaman directamente a stored procedures
        Task<IEnumerable<Inscripcion>> ObtenerTodasAsync(string periodoAcademico, bool soloActivas);
        Task<Inscripcion> ObtenerPorIdAsync(int id);
        Task<IEnumerable<Inscripcion>> ObtenerConDetallesAsync(string periodoAcademico, bool soloActivas);
        Task<IEnumerable<Inscripcion>> ObtenerPorAlumnoAsync(int alumnoId, string periodoAcademico, bool soloActivas);
        Task<IEnumerable<Inscripcion>> ObtenerPorMateriaAsync(int materiaId, string periodoAcademico, bool soloActivas);
        
        // Métodos que devuelven DTOs
        Task<IEnumerable<InscripcionDto>> ObtenerTodasDtoAsync(string periodoAcademico, bool soloActivas);
        Task<IEnumerable<InscripcionDto>> ObtenerConDetallesDtoAsync(string periodoAcademico, bool soloActivas);
        Task<InscripcionDto> ObtenerPorIdDtoAsync(int id);
        Task<IEnumerable<InscripcionDto>> ObtenerPorAlumnoDtoAsync(int alumnoId, string periodoAcademico, bool soloActivas);
        Task<IEnumerable<InscripcionDto>> ObtenerPorMateriaDtoAsync(int materiaId, string periodoAcademico, bool soloActivas);
    }
} 