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
    public class MateriasController : ControllerBase
    {
        private readonly IMateriaRepository _materiaRepository;
        private readonly ILogger<MateriasController> _logger;

        public MateriasController(IMateriaRepository materiaRepository, ILogger<MateriasController> logger)
        {
            _materiaRepository = materiaRepository;
            _logger = logger;
        }

        // GET: api/Materias
        [HttpGet]
        public async Task<ActionResult<IEnumerable<MateriaDto>>> GetMaterias([FromQuery] bool soloActivas = true)
        {
            try
            {
                var materias = await _materiaRepository.ObtenerTodasDtoAsync(soloActivas);
                return Ok(materias);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error al obtener materias");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // GET: api/Materias/5
        [HttpGet("{id}")]
        public async Task<ActionResult<MateriaDto>> GetMateria(int id)
        {
            try
            {
                var materia = await _materiaRepository.ObtenerPorIdDtoAsync(id);
                if (materia == null)
                {
                    return NotFound($"No se encontró la materia con ID: {id}");
                }
                return Ok(materia);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error al obtener materia con ID: {id}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // GET: api/Materias/codigo/{codigo}
        [HttpGet("codigo/{codigo}")]
        public async Task<ActionResult<MateriaDto>> GetMateriaPorCodigo(string codigo)
        {
            try
            {
                var materia = await _materiaRepository.ObtenerPorCodigoDtoAsync(codigo);
                if (materia == null)
                {
                    return NotFound($"No se encontró la materia con código: {codigo}");
                }
                return Ok(materia);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error al obtener materia con código: {codigo}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // GET: api/Materias/buscar
        [HttpGet("buscar")]
        public async Task<ActionResult<IEnumerable<MateriaDto>>> BuscarMaterias([FromQuery] string busqueda, [FromQuery] bool soloActivas = true)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(busqueda))
                {
                    return BadRequest("El término de búsqueda no puede estar vacío");
                }

                var materias = await _materiaRepository.BuscarDtoAsync(busqueda, soloActivas);
                return Ok(materias);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error al buscar materias con término: {busqueda}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // POST: api/Materias
        [HttpPost]
        public async Task<ActionResult<Materia>> CreateMateria(Materia materia)
        {
            try
            {
                if (materia == null)
                {
                    return BadRequest("Los datos de la materia son inválidos");
                }

                int id = await _materiaRepository.CreateAsync(materia);
                if (id == 0)
                {
                    return BadRequest("No se pudo crear la materia");
                }

                materia.Id = id;
                return CreatedAtAction(nameof(GetMateria), new { id }, materia);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error al crear materia");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // PUT: api/Materias/5
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateMateria(int id, Materia materia)
        {
            try
            {
                if (id != materia.Id)
                {
                    return BadRequest("El ID de la materia no coincide con el ID proporcionado");
                }

                var existingMateria = await _materiaRepository.GetByIdAsync(id);
                if (existingMateria == null)
                {
                    return NotFound($"No se encontró la materia con ID: {id}");
                }

                var result = await _materiaRepository.UpdateAsync(materia);
                if (!result)
                {
                    return BadRequest("No se pudo actualizar la materia");
                }

                return NoContent();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error al actualizar materia con ID: {id}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }

        // DELETE: api/Materias/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteMateria(int id)
        {
            try
            {
                var materia = await _materiaRepository.GetByIdAsync(id);
                if (materia == null)
                {
                    return NotFound($"No se encontró la materia con ID: {id}");
                }

                var result = await _materiaRepository.DeleteAsync(id);
                if (!result)
                {
                    return BadRequest($"No se pudo eliminar la materia con ID: {id}");
                }

                return NoContent();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error al eliminar materia con ID: {id}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Error interno del servidor al procesar la solicitud");
            }
        }
    }
} 