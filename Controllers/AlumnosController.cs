using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using apiAlumnos.Interfaces;
using apiAlumnos.Models;
using apiAlumnos.DTOs;
using Microsoft.AspNetCore.Mvc;

namespace apiAlumnos.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AlumnosController : ControllerBase
    {
        private readonly IAlumnoRepository _alumnoRepository;

        public AlumnosController(IAlumnoRepository alumnoRepository)
        {
            _alumnoRepository = alumnoRepository ?? throw new ArgumentNullException(nameof(alumnoRepository));
        }

        // GET: api/Alumnos
        // Utiliza sp_Alumno_ObtenerTodos
        [HttpGet]
        public async Task<ActionResult<IEnumerable<AlumnoDto>>> GetAlumnos()
        {
            var alumnos = await _alumnoRepository.GetAllDtoAsync();
            return Ok(alumnos);
        }

        // GET: api/Alumnos/5
        // Utiliza sp_Alumno_ObtenerPorId
        [HttpGet("{id}")]
        public async Task<ActionResult<AlumnoDto>> GetAlumno(int id)
        {
            var alumno = await _alumnoRepository.GetByIdDtoAsync(id);
            if (alumno == null)
            {
                return NotFound();
            }
            return Ok(alumno);
        }

        // GET: api/Alumnos/usuario/{userId}
        // Utiliza sp_Alumno_ObtenerPorUserId
        [HttpGet("usuario/{userId}")]
        public async Task<ActionResult<AlumnoDto>> GetAlumnoPorUserId(string userId)
        {
            var alumno = await _alumnoRepository.ObtenerPorUserIdDtoAsync(userId);
            if (alumno == null)
            {
                return NotFound();
            }
            return Ok(alumno);
        }

        // GET: api/Alumnos/nombre/{nombre}
        // Utiliza sp_Alumno_BuscarPorNombre
        [HttpGet("nombre/{nombre}")]
        public async Task<ActionResult<IEnumerable<AlumnoDto>>> GetAlumnosPorNombre(string nombre)
        {
            var alumnos = await _alumnoRepository.BuscarPorNombreDtoAsync(nombre);
            return Ok(alumnos);
        }

        // POST: api/Alumnos
        // Utiliza sp_Alumno_Crear
        [HttpPost]
        public async Task<ActionResult<Alumno>> PostAlumno(Alumno alumno)
        {
            if (alumno == null)
            {
                return BadRequest();
            }

            var id = await _alumnoRepository.CreateAsync(alumno);
            
            return CreatedAtAction(nameof(GetAlumno), new { id }, alumno);
        }

        // PUT: api/Alumnos/5
        // Utiliza sp_Alumno_Actualizar
        [HttpPut("{id}")]
        public async Task<IActionResult> PutAlumno(int id, Alumno alumno)
        {
            if (id != alumno.Id)
            {
                return BadRequest();
            }

            var result = await _alumnoRepository.UpdateAsync(alumno);
            if (!result)
            {
                return NotFound();
            }

            return NoContent();
        }

        // DELETE: api/Alumnos/5
        // Utiliza sp_Alumno_Eliminar
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteAlumno(int id)
        {
            var result = await _alumnoRepository.DeleteAsync(id);
            if (!result)
            {
                return NotFound();
            }

            return NoContent();
        }
    }
} 