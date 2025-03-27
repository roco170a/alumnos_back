using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using apiAlumnos.Interfaces;
using apiAlumnos.Models;
using apiAlumnos.DTOs;
using AutoMapper;
using Dapper;

namespace apiAlumnos.Repositories
{
    public class AlumnoExamenRepository : GenericRepository<AlumnoExamen>, IAlumnoExamenRepository
    {
        private readonly IMapper _mapper;
        IMateriaRepository _repoMateria;
        IAlumnoRepository _repoAlumno;
        IExamenRepository _repoExamen;

        public AlumnoExamenRepository(IDbConnectionFactory connectionFactory, IMapper mapper, IMateriaRepository repoMateria
            ,IAlumnoRepository repoAlumno, IExamenRepository repoExamen) 
            : base(connectionFactory, "AlumnosExamenes")
        {
            _mapper = mapper;
            _repoMateria = repoMateria;
            _repoExamen = repoExamen;
            _repoAlumno = repoAlumno;
        }

        // Implementación de métodos que ejecutan las operaciones de CRUD
        // -----------------------------------------------------------

        public override async Task<int> CreateAsync(AlumnoExamen entity)
        {
            // SP para crear
            const string sp = "sp_AlumnoExamen_Crear";
            var parameters = new
            {
                AlumnoId = entity.AlumnoId,
                ExamenId = entity.ExamenId,
                FechaRealizacion = entity.FechaRealizacion,
                Estado = entity.Estado
            };

            using var connection = _connectionFactory.CreateConnection();
            var alumnoExamen = await connection.QueryFirstOrDefaultAsync<AlumnoExamen>(sp, parameters, commandType: CommandType.StoredProcedure);
            return alumnoExamen?.Id ?? 0;
        }

        public override async Task<bool> UpdateAsync(AlumnoExamen entity)
        {
            // SP para actualizar
            const string sp = "sp_AlumnoExamen_Actualizar";
            var parameters = new
            {
                Id = entity.Id,
                FechaRealizacion = entity.FechaRealizacion,
                Calificacion = entity.Calificacion,
                Comentarios = entity.Comentarios,
                Estado = entity.Estado
            };

            var result = await ExecuteStoredProcedureAsync(sp, parameters);
            return result > 0;
        }

        public override async Task<bool> DeleteAsync(int id)
        {
            // SP para eliminar
            const string sp = "sp_AlumnoExamen_Eliminar";
            var result = await ExecuteStoredProcedureAsync(sp, new { Id = id });
            return result > 0;
        }

        // Implementación de métodos que ejecutan los procedimientos almacenados
        // -----------------------------------------------------------

        public async Task<IEnumerable<AlumnoExamen>> ObtenerTodasAsync(int? examenId, int? alumnoId, string? estado, string? texto)
        {
            const string sp = "sp_AlumnoExamen_ObtenerTodas";
            var parameters = new
            {
                ExamenId = examenId,
                AlumnoId = alumnoId,
                Estado = estado,
                TerminoBusqueda = texto
            };

            return await QueryStoredProcedureAsync(sp, parameters);
        }



        public override async Task<AlumnoExamen> GetByIdAsync(int id)
        {
            const string sp = "sp_AlumnoExamen_ObtenerPorId";
            var result = await QueryStoredProcedureAsync(sp, new { Id = id });
            return result.FirstOrDefault();
        }

        public async Task<AlumnoExamenDto> GetByIdDtoAsync(int id)
        {
            const string sp = "sp_AlumnoExamen_ObtenerPorId";
            var parameters = new { Id = id };

            using var connection = _connectionFactory.CreateConnection();
            var resultado = await connection.QueryAsync<AlumnoExamenDto>(sp, parameters, commandType: CommandType.StoredProcedure);
            return resultado.FirstOrDefault();
        }



        

        // Implementación de métodos que devuelven las listas de DTOs        
        // -----------------------------------------------------------
        

        public async Task<IEnumerable<AlumnoExamenDto>> ObtenerConDetallesDtoAsync(int? examenId)
        {
            const string sp = "sp_AlumnoExamen_ObtenerConDetalles";
            var parameters = new
            {
                ExamenId = examenId
            };

            using var connection = _connectionFactory.CreateConnection();
            var result = await connection.QueryAsync<AlumnoExamenDto>(sp, parameters, commandType: CommandType.StoredProcedure);
            return result;
        }

        public async Task<IEnumerable<AlumnoExamenDto>> ObtenerPorAlumnoDtoAsync(int? alumnoId)
        {
            const string sp = "sp_AlumnoExamen_ObtenerPorAlumno";
            var parameters = new
            {
                AlumnoId = alumnoId                
            };

            using var connection = _connectionFactory.CreateConnection();
            var result = await connection.QueryAsync<AlumnoExamenDto>(sp, parameters, commandType: CommandType.StoredProcedure);
            return result;
        }

        public async Task<IEnumerable<AlumnoExamenDto>> ObtenerTodasDtoAsync(int? examenId, int? alumnoId, string? estado, string? texto)
        {
            var alumnoExamen = await ObtenerTodasAsync(examenId, alumnoId, estado, texto);

            foreach (var item in alumnoExamen)
            {
                item.Materia = await _repoMateria.GetByIdAsync(item.MateriaId);
                item.Alumno = await _repoAlumno.GetByIdAsync(item.MateriaId);
                item.Examen = await _repoExamen.GetByIdAsync(item.MateriaId);
            }

            var result = _mapper.Map<IEnumerable<AlumnoExamenDto>>(alumnoExamen);
            return result;
        }

        public async Task<IEnumerable<AlumnoExamenDto>> ObtenerPorExamenDtoAsync(int? examenId)
        {
            const string sp = "sp_AlumnoExamen_ObtenerConDetalles";
            var parameters = new
            {
                ExamenId = examenId
            };

            using var connection = _connectionFactory.CreateConnection();
            var result = await connection.QueryAsync<AlumnoExamenDto>(sp, parameters, commandType: CommandType.StoredProcedure);
            return result;
        }
    }
} 