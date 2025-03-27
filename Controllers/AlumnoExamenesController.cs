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
    public class AlumnoExamenesController : ControllerBase
    {
        private readonly IAlumnoExamenRepository _alumnoExamenRepository;
        private readonly ILogger<AlumnoExamenesController> _logger;

        public AlumnoExamenesController(IAlumnoExamenRepository alumnoExamenRepository, ILogger<AlumnoExamenesController> logger)
        {
            _alumnoExamenRepository = alumnoExamenRepository;
            _logger = logger;
        }

        
        [HttpGet("examen/{examenId}")]
        public async Task<ActionResult<IEnumerable<AlumnoExamenDto>>> GetAlumnosPorExamen(int? examenId = null)
        {
            try
            {
                var alumnosExamen = await _alumnoExamenRepository.ObtenerPorExamenDtoAsync(examenId);
                return Ok(alumnosExamen);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error al obtener alumnos para el examen con ID: {examenId}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<AlumnoExamenDto>>> GetAlumnosExamenTodas(int? examenId = null, int? alumnoId = null, string estado = "", string texto = "")
        {
            try
            {
                var alumnosExamen = await _alumnoExamenRepository.ObtenerTodasDtoAsync(examenId, alumnoId, estado, texto);
                return Ok(alumnosExamen);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error al obtener alumnos para el examen con ID: {examenId}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // GET: api/AlumnoExamenes/examen/{examenId}/detalles
        [HttpGet("examen/{examenId}/detalles")]
        public async Task<ActionResult<IEnumerable<AlumnoExamenDto>>> GetAlumnosPorExamenConDetalles(int examenId)
        {
            try
            {
                var alumnosExamen = await _alumnoExamenRepository.ObtenerConDetallesDtoAsync(examenId);
                return Ok(alumnosExamen);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error al obtener alumnos con detalles para el examen con ID: {examenId}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // GET: api/AlumnoExamenes/alumno/{alumnoId}
        [HttpGet("alumno/{alumnoId}")]
        public async Task<ActionResult<IEnumerable<AlumnoExamenDto>>> GetExamenesPorAlumno(int alumnoId)
        {
            try
            {
                var examenes = await _alumnoExamenRepository.ObtenerPorAlumnoDtoAsync(alumnoId);
                return Ok(examenes);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error al obtener exámenes del alumno con ID: {alumnoId}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // GET: api/AlumnoExamenes/5
        [HttpGet("{id}")]
        public async Task<ActionResult<AlumnoExamenDto>> GetAlumnoExamen(int id)
        {
            try
            {
                var alumnoExamen = await _alumnoExamenRepository.GetByIdDtoAsync(id);
                if (alumnoExamen == null)
                {
                    return NotFound($"No se encontró la relación alumno-examen con ID: {id}");
                }
                return Ok(alumnoExamen);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error al obtener relación alumno-examen con ID: {id}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // POST: api/AlumnoExamenes
        [HttpPost]
        public async Task<ActionResult<AlumnoExamen>> CreateAlumnoExamen(AlumnoExamen alumnoExamen)
        {
            try
            {
                if (alumnoExamen == null)
                {
                    return BadRequest("Los datos de la relación alumno-examen son inválidos");
                }

                int id = await _alumnoExamenRepository.CreateAsync(alumnoExamen);
                if (id == 0)
                {
                    return BadRequest("No se pudo crear la relación alumno-examen");
                }

                alumnoExamen.Id = id;
                return CreatedAtAction(nameof(GetAlumnoExamen), new { id }, alumnoExamen);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error al crear relación alumno-examen");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // PUT: api/AlumnoExamenes/5
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateAlumnoExamen(int id, AlumnoExamen alumnoExamen)
        {
            try
            {
                if (id != alumnoExamen.Id)
                {
                    return BadRequest("El ID de la relación alumno-examen no coincide con el ID proporcionado");
                }

                var existingAlumnoExamen = await _alumnoExamenRepository.GetByIdDtoAsync(id);
                if (existingAlumnoExamen == null)
                {
                    return NotFound($"No se encontró la relación alumno-examen con ID: {id}");
                }

                var result = await _alumnoExamenRepository.UpdateAsync(alumnoExamen);
                if (!result)
                {
                    return BadRequest("No se pudo actualizar la relación alumno-examen");
                }

                return NoContent();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error al actualizar relación alumno-examen con ID: {id}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // DELETE: api/AlumnoExamenes/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteAlumnoExamen(int id)
        {
            try
            {
                var alumnoExamen = await _alumnoExamenRepository.GetByIdDtoAsync(id);
                if (alumnoExamen == null)
                {
                    return NotFound($"No se encontró la relación alumno-examen con ID: {id}");
                }

                var result = await _alumnoExamenRepository.DeleteAsync(id);
                if (!result)
                {
                    return BadRequest($"No se pudo eliminar la relación alumno-examen con ID: {id}");
                }

                return NoContent();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error al eliminar relación alumno-examen con ID: {id}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }
    }
} 