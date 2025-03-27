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
    public class ExamenesController : ControllerBase
    {
        private readonly IExamenRepository _examenRepository;
        private readonly ILogger<ExamenesController> _logger;

        public ExamenesController(IExamenRepository examenRepository, ILogger<ExamenesController> logger)
        {
            _examenRepository = examenRepository;
            _logger = logger;
        }

        // GET: api/Examenes
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ExamenDto>>> GetExamenes(string activos)           
        {
            try
            {
                var examenes = await _examenRepository.ObtenerTodosDtoAsync(activos);
                return Ok(examenes);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error al obtener exámenes");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // GET: api/Examenes
        [HttpGet("porMateria")]
        public async Task<ActionResult<IEnumerable<ExamenDto>>> GetExamenes(
            [FromQuery] int? materiaId = null, [FromQuery] string? estado = "Activo")
        {
            try
            {
                var examenes = await _examenRepository.ObtenerPorMateriaEstadoDtoAsync(materiaId,estado);
                return Ok(examenes);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error al obtener exámenes");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // GET: api/Examenes/detalles
        [HttpGet("detalles")]
        public async Task<ActionResult<IEnumerable<ExamenDto>>> GetExamenesConDetalles(
            [FromQuery] int? materiaId = null, [FromQuery] string? estado = "Activo")
        {
            try
            {
                var examenes = await _examenRepository.ObtenerPorMateriaEstadoDtoAsync(materiaId, estado);
                return Ok(examenes);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error al obtener exámenes con detalles");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // GET: api/Examenes/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ExamenDto>> GetExamen(int id)
        {
            try
            {
                var examen = await _examenRepository.ObtenerPorIdDtoAsync(id);
                if (examen == null)
                {
                    return NotFound($"No se encontró el examen con ID: {id}");
                }
                return Ok(examen);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error al obtener examen con ID: {id}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // POST: api/Examenes
        [HttpPost]
        public async Task<ActionResult<Examen>> CreateExamen(Examen examen)
        {
            try
            {
                if (examen == null)
                {
                    return BadRequest("Los datos del examen son inválidos");
                }

                int id = await _examenRepository.CreateAsync(examen);
                if (id == 0)
                {
                    return BadRequest("No se pudo crear el examen");
                }

                examen.Id = id;
                return CreatedAtAction(nameof(GetExamen), new { id }, examen);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error al crear examen");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // PUT: api/Examenes/5
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateExamen(int id, Examen examen)
        {
            try
            {
                if (id != examen.Id)
                {
                    return BadRequest("El ID del examen no coincide con el ID proporcionado");
                }

                var existingExamen = await _examenRepository.ObtenerPorIdDtoAsync(id);
                if (existingExamen == null)
                {
                    return NotFound($"No se encontró el examen con ID: {id}");
                }

                var result = await _examenRepository.UpdateAsync(examen);
                if (!result)
                {
                    return BadRequest("No se pudo actualizar el examen");
                }

                return NoContent();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error al actualizar examen con ID: {id}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // DELETE: api/Examenes/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteExamen(int id)
        {
            try
            {
                var examen = await _examenRepository.ObtenerPorIdDtoAsync(id);
                if (examen == null)
                {
                    return NotFound($"No se encontró el examen con ID: {id}");
                }

                var result = await _examenRepository.DeleteAsync(id);
                if (!result)
                {
                    return BadRequest($"No se pudo eliminar el examen con ID: {id}");
                }

                return NoContent();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error al eliminar examen con ID: {id}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }
    }
} 