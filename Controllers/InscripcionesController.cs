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
    public class InscripcionesController : ControllerBase
    {
        private readonly IInscripcionRepository _inscripcionRepository;
        private readonly ILogger<InscripcionesController> _logger;

        public InscripcionesController(IInscripcionRepository inscripcionRepository, ILogger<InscripcionesController> logger)
        {
            _inscripcionRepository = inscripcionRepository;
            _logger = logger;
        }

        // GET: api/Inscripciones
        [HttpGet]
        public async Task<ActionResult<IEnumerable<InscripcionDto>>> GetInscripciones([FromQuery] string periodoAcademico, [FromQuery] bool soloActivas = true)
        {
            if (periodoAcademico == "TODOS")
                periodoAcademico = "";

            try
            {
                var inscripciones = await _inscripcionRepository.ObtenerTodasDtoAsync(periodoAcademico, soloActivas);
                return Ok(inscripciones);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error al obtener inscripciones");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // GET: api/Inscripciones/detalles
        [HttpGet("detalles")]
        public async Task<ActionResult<IEnumerable<InscripcionDto>>> GetInscripcionesConDetalles([FromQuery] string periodoAcademico="", [FromQuery] bool soloActivas = true)
        {
            if (periodoAcademico == "TODOS")
                periodoAcademico = "";

            try
            {
                var inscripciones = await _inscripcionRepository.ObtenerConDetallesDtoAsync(periodoAcademico, soloActivas);
                return Ok(inscripciones);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error al obtener inscripciones con detalles");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // GET: api/Inscripciones/5
        [HttpGet("{id}")]
        public async Task<ActionResult<InscripcionDto>> GetInscripcion(int id)
        {
            try
            {
                var inscripcion = await _inscripcionRepository.ObtenerPorIdDtoAsync(id);
                if (inscripcion == null)
                {
                    return NotFound($"No se encontró la inscripción con ID: {id}");
                }
                return Ok(inscripcion);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error al obtener inscripción con ID: {id}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // GET: api/Inscripciones/alumno/5
        [HttpGet("alumno/{alumnoId}")]
        public async Task<ActionResult<IEnumerable<InscripcionDto>>> GetInscripcionesPorAlumno(int alumnoId, [FromQuery] string periodoAcademico, [FromQuery] bool soloActivas = true)
        {
            if (periodoAcademico == "TODOS")
                periodoAcademico = "";

            try
            {
                var inscripciones = await _inscripcionRepository.ObtenerPorAlumnoDtoAsync(alumnoId, periodoAcademico, soloActivas);
                return Ok(inscripciones);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error al obtener inscripciones del alumno con ID: {alumnoId}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // GET: api/Inscripciones/materia/5
        [HttpGet("materia/{materiaId}")]
        public async Task<ActionResult<IEnumerable<InscripcionDto>>> GetInscripcionesPorMateria(int materiaId, [FromQuery] string periodoAcademico, [FromQuery] bool soloActivas = true)
        {
            if (periodoAcademico == "TODOS")
                periodoAcademico = "";

            try
            {
                var inscripciones = await _inscripcionRepository.ObtenerPorMateriaDtoAsync(materiaId, periodoAcademico, soloActivas);
                return Ok(inscripciones);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error al obtener inscripciones de la materia con ID: {materiaId}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // POST: api/Inscripciones
        [HttpPost]
        public async Task<ActionResult<Inscripcion>> CreateInscripcion(Inscripcion inscripcion)
        {
            try
            {
                if (inscripcion == null)
                {
                    return BadRequest("Los datos de la inscripción son inválidos");
                }

                int id = await _inscripcionRepository.CreateAsync(inscripcion);
                if (id == 0)
                {
                    return BadRequest("No se pudo crear la inscripción");
                }

                inscripcion.Id = id;
                return CreatedAtAction(nameof(GetInscripcion), new { id }, inscripcion);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error al crear inscripción");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // PUT: api/Inscripciones/5
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateInscripcion(int id, Inscripcion inscripcion)
        {
            try
            {
                if (id != inscripcion.Id)
                {
                    return BadRequest("El ID de la inscripción no coincide con el ID proporcionado");
                }

                var existingInscripcion = await _inscripcionRepository.ObtenerPorIdDtoAsync(id);
                if (existingInscripcion == null)
                {
                    return NotFound($"No se encontró la inscripción con ID: {id}");
                }

                var result = await _inscripcionRepository.UpdateAsync(inscripcion);
                if (!result)
                {
                    return BadRequest("No se pudo actualizar la inscripción");
                }

                return NoContent();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error al actualizar inscripción con ID: {id}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // DELETE: api/Inscripciones/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteInscripcion(int id)
        {
            try
            {
                var inscripcion = await _inscripcionRepository.ObtenerPorIdDtoAsync(id);
                if (inscripcion == null)
                {
                    return NotFound($"No se encontró la inscripción con ID: {id}");
                }

                var result = await _inscripcionRepository.DeleteAsync(id);
                if (!result)
                {
                    return BadRequest($"No se pudo eliminar la inscripción con ID: {id}");
                }

                return NoContent();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error al eliminar inscripción con ID: {id}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }
    }
} 