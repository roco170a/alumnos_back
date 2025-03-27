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
    public class TiposExamenController : ControllerBase
    {
        private readonly ITipoExamenRepository _tipoExamenRepository;
        private readonly ILogger<TiposExamenController> _logger;

        public TiposExamenController(ITipoExamenRepository tipoExamenRepository, ILogger<TiposExamenController> logger)
        {
            _tipoExamenRepository = tipoExamenRepository;
            _logger = logger;
        }

        // GET: api/TiposExamen
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TipoExamenDto>>> GetTiposExamen()
        {
            try
            {
                var tiposExamen = await _tipoExamenRepository.ObtenerTodosDtoAsync();
                return Ok(tiposExamen);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error al obtener tipos de examen");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // GET: api/TiposExamen/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TipoExamenDto>> GetTipoExamen(int id)
        {
            try
            {
                var tipoExamen = await _tipoExamenRepository.ObtenerPorIdDtoAsync(id);
                if (tipoExamen == null)
                {
                    return NotFound($"No se encontró el tipo de examen con ID: {id}");
                }
                return Ok(tipoExamen);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error al obtener tipo de examen con ID: {id}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // POST: api/TiposExamen
        [HttpPost]
        public async Task<ActionResult<TipoExamen>> CreateTipoExamen(TipoExamen tipoExamen)
        {
            try
            {
                if (tipoExamen == null)
                {
                    return BadRequest("Los datos del tipo de examen son inválidos");
                }

                int id = await _tipoExamenRepository.CreateAsync(tipoExamen);
                if (id == 0)
                {
                    return BadRequest("No se pudo crear el tipo de examen");
                }

                tipoExamen.Id = id;
                return CreatedAtAction(nameof(GetTipoExamen), new { id }, tipoExamen);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error al crear tipo de examen");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // PUT: api/TiposExamen/5
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateTipoExamen(int id, TipoExamen tipoExamen)
        {
            try
            {
                if (id != tipoExamen.Id)
                {
                    return BadRequest("El ID del tipo de examen no coincide con el ID proporcionado");
                }

                var existingTipoExamen = await _tipoExamenRepository.ObtenerPorIdDtoAsync(id);
                if (existingTipoExamen == null)
                {
                    return NotFound($"No se encontró el tipo de examen con ID: {id}");
                }

                var result = await _tipoExamenRepository.UpdateAsync(tipoExamen);
                if (!result)
                {
                    return BadRequest("No se pudo actualizar el tipo de examen");
                }

                return NoContent();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error al actualizar tipo de examen con ID: {id}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // DELETE: api/TiposExamen/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTipoExamen(int id)
        {
            try
            {
                var tipoExamen = await _tipoExamenRepository.ObtenerPorIdDtoAsync(id);
                if (tipoExamen == null)
                {
                    return NotFound($"No se encontró el tipo de examen con ID: {id}");
                }

                var result = await _tipoExamenRepository.DeleteAsync(id);
                if (!result)
                {
                    return BadRequest($"No se pudo eliminar el tipo de examen con ID: {id}");
                }

                return NoContent();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error al eliminar tipo de examen con ID: {id}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }
    }
} 