using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using apiAlumnos.DTOs;
using apiAlumnos.Interfaces;
using apiAlumnos.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace apiAlumnos.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ProgramacionExamenesController : ControllerBase
    {
        private readonly IProgramacionExamenRepository _programacionExamenRepository;
        private readonly ILogger<ProgramacionExamenesController> _logger;

        public ProgramacionExamenesController(IProgramacionExamenRepository programacionExamenRepository, ILogger<ProgramacionExamenesController> logger)
        {
            _programacionExamenRepository = programacionExamenRepository;
            _logger = logger;
        }

        // GET: api/ProgramacionExamenes
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ProgramacionExamenDto>>> GetProgramacionExamenes(
            [FromQuery] string? estado, 
            [FromQuery] DateTime? fechaDesde = null, 
            [FromQuery] DateTime? fechaHasta = null)
        {
            try
            {
                var programaciones = await _programacionExamenRepository.ObtenerTodasDtoAsync(estado, fechaDesde, fechaHasta);
                return Ok(programaciones);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error al obtener programaciones de exámenes");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // GET: api/ProgramacionExamenes/detalles
        [HttpGet("detalles")]
        public async Task<ActionResult<IEnumerable<ProgramacionExamenDto>>> GetProgramacionExamenesConDetalles(
            [FromQuery] string? estado, 
            [FromQuery] DateTime? fechaDesde = null, 
            [FromQuery] DateTime? fechaHasta = null)
        {
            try
            {
                var programaciones = await _programacionExamenRepository.ObtenerConDetallesDtoAsync(estado, fechaDesde, fechaHasta);
                return Ok(programaciones);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error al obtener programaciones de exámenes con detalles");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // GET: api/ProgramacionExamenes/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ProgramacionExamenDto>> GetProgramacionExamen(int id)
        {
            try
            {
                var programacion = await _programacionExamenRepository.ObtenerPorIdDtoAsync(id);
                if (programacion == null)
                {
                    return NotFound($"No se encontró la programación de examen con ID: {id}");
                }
                return Ok(programacion);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error al obtener programación de examen con ID: {id}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // GET: api/ProgramacionExamenes/materia/5
        [HttpGet("materia/{materiaId}")]
        public async Task<ActionResult<IEnumerable<ProgramacionExamenDto>>> GetProgramacionExamenesPorMateria(
            int materiaId, 
            [FromQuery] Boolean ? soloActivas = true)
        {
            try
            {
                var programaciones = await _programacionExamenRepository.ObtenerPorMateriaDtoAsync(materiaId, "");
                return Ok(programaciones);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error al obtener programaciones de exámenes de la materia con ID: {materiaId}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // POST: api/ProgramacionExamenes
        [HttpPost]
        public async Task<ActionResult<ProgramacionExamen>> CreateProgramacionExamen(ProgramacionExamen programacionExamen)
        {
            try
            {
                if (programacionExamen == null)
                {
                    return BadRequest("Los datos de la programación de examen son inválidos");
                }

                int id = await _programacionExamenRepository.CreateAsync(programacionExamen);
                if (id == 0)
                {
                    return BadRequest("No se pudo crear la programación de examen");
                }

                programacionExamen.Id = id;
                return CreatedAtAction(nameof(GetProgramacionExamen), new { id }, programacionExamen);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error al crear programación de examen");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // PUT: api/ProgramacionExamenes/5
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateProgramacionExamen(int id, ProgramacionExamen programacionExamen)
        {
            try
            {
                if (id != programacionExamen.Id)
                {
                    return BadRequest("El ID de la programación de examen no coincide con el ID proporcionado");
                }

                var existingProgramacion = await _programacionExamenRepository.ObtenerPorIdDtoAsync(id);
                if (existingProgramacion == null)
                {
                    return NotFound($"No se encontró la programación de examen con ID: {id}");
                }

                var result = await _programacionExamenRepository.UpdateAsync(programacionExamen);
                if (!result)
                {
                    return BadRequest("No se pudo actualizar la programación de examen");
                }

                return NoContent();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error al actualizar programación de examen con ID: {id}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // DELETE: api/ProgramacionExamenes/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteProgramacionExamen(int id)
        {
            try
            {
                var programacion = await _programacionExamenRepository.ObtenerPorIdDtoAsync(id);
                if (programacion == null)
                {
                    return NotFound($"No se encontró la programación de examen con ID: {id}");
                }

                var result = await _programacionExamenRepository.DeleteAsync(id);
                if (!result)
                {
                    return BadRequest($"No se pudo eliminar la programación de examen con ID: {id}");
                }

                return NoContent();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error al eliminar programación de examen con ID: {id}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }
    }
} 