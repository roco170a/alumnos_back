using System.Collections.Generic;
using System.Threading.Tasks;
using apiAlumnos.Models;
using apiAlumnos.DTOs;

namespace apiAlumnos.Interfaces
{
    public interface IAlumnoExamenRepository : IGenericRepository<AlumnoExamen>
    {
        Task<IEnumerable<AlumnoExamenDto>> ObtenerTodasDtoAsync(int? examenId, int? alumnoId, string? estado, string? texto);
        Task<IEnumerable<AlumnoExamenDto>> ObtenerConDetallesDtoAsync(int? examenId);
        Task<IEnumerable<AlumnoExamenDto>> ObtenerPorAlumnoDtoAsync(int? alumnoId);
        Task<IEnumerable<AlumnoExamenDto>> ObtenerPorExamenDtoAsync(int? examenId);
        Task<AlumnoExamenDto> GetByIdDtoAsync(int id);
    }
} 