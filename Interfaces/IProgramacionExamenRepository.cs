using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using apiAlumnos.Models;
using apiAlumnos.DTOs;

namespace apiAlumnos.Interfaces
{
    public interface IProgramacionExamenRepository : IGenericRepository<ProgramacionExamen>
    {
        // Métodos que llaman directamente a stored procedures
        Task<IEnumerable<ProgramacionExamen>> ObtenerTodasAsync(string estado, DateTime? fechaDesde, DateTime? fechaHasta);
        Task<ProgramacionExamen> ObtenerPorIdAsync(int id);
        Task<IEnumerable<ProgramacionExamen>> ObtenerConDetallesAsync(string estado, DateTime? fechaDesde, DateTime? fechaHasta);
        Task<IEnumerable<ProgramacionExamen>> ObtenerPorMateriaAsync(int materiaId, string estado);
        Task<IEnumerable<ProgramacionExamen>> ObtenerPorExamenAsync(int examenId, bool soloActivas = true);
        Task<IEnumerable<dynamic>> ObtenerEstadisticasPorMateriaAsync();
        
        // Métodos que devuelven DTOs
        Task<IEnumerable<ProgramacionExamenDto>> ObtenerTodasDtoAsync(string estado, DateTime? fechaDesde, DateTime? fechaHasta);
        Task<IEnumerable<ProgramacionExamenDto>> ObtenerConDetallesDtoAsync(string estado, DateTime? fechaDesde, DateTime? fechaHasta);
        Task<IEnumerable<ProgramacionExamenDto>> ObtenerPorMateriaDtoAsync(int materiaId, string estado);
        Task<IEnumerable<ProgramacionExamenDto>> ObtenerPorExamenDtoAsync(int examenId, bool soloActivas = true);
        Task<ProgramacionExamenDto> ObtenerPorIdDtoAsync(int id);
    }
} 