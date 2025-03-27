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
    public class ExamenRepository : GenericRepository<Examen>, IExamenRepository
    {
        private readonly IMapper _mapper;
        private readonly ITipoExamenRepository _repoTipoExamen;
        private readonly IProgramacionExamenRepository _repoProgExamen;
        private readonly IMateriaRepository _repoMateria;

        public ExamenRepository(IDbConnectionFactory connectionFactory, IMapper mapper, 
            ITipoExamenRepository repoTipoExamen, IProgramacionExamenRepository repoProgExam, IMateriaRepository repoMateria) 
            : base(connectionFactory, "Examenes")
        {
            _mapper = mapper;
            _repoTipoExamen = repoTipoExamen;
            _repoProgExamen = repoProgExam;
            _repoMateria = repoMateria;
        }

        #region Métodos base que sobrescriben IGenericRepository

        public override async Task<IEnumerable<Examen>> GetAllAsync()
        {
            return await ObtenerTodosAsync("Activo");
        }

        public override async Task<Examen> GetByIdAsync(int id)
        {
            return await ObtenerPorIdAsync(id);
        }

        public override async Task<int> CreateAsync(Examen entity)
        {
            const string sp = "sp_Examen_Crear";
            var parameters = new
            {
                ProgramacionId = entity.ProgramacionId,
                TipoExamenId = entity.TipoExamenId,
                FechaRealizacion = entity.FechaRealizacion,
                Observaciones = entity.Observaciones,
                Estado = entity.Estado
            };

            using var connection = _connectionFactory.CreateConnection();
            var id = await connection.QuerySingleOrDefaultAsync<int>(sp, parameters, commandType: CommandType.StoredProcedure);
            return id;
        }

        public override async Task<bool> UpdateAsync(Examen entity)
        {
            const string sp = "sp_Examen_Actualizar";
            var parameters = new
            {
                Id = entity.Id,
                FechaRealizacion = entity.FechaRealizacion,
                Observaciones = entity.Observaciones,
                Estado = entity.Estado
            };

            var result = await ExecuteStoredProcedureAsync(sp, parameters);
            return result > 0;
        }

        public override async Task<bool> DeleteAsync(int id)
        {
            const string sp = "sp_Examen_Eliminar";
            var result = await ExecuteStoredProcedureAsync(sp, new { Id = id });
            return result > 0;
        }

        #endregion

        #region Métodos que llaman directamente a stored procedures

        public async Task<IEnumerable<Examen>> ObtenerTodosAsync(string estado)
        {
            const string sp = "sp_Examen_ObtenerTodos";
            var parameters = new
            {            
                Estado = estado
            };
            return await QueryStoredProcedureAsync(sp, parameters);
        }

        public async Task<IEnumerable<Examen>> ObtenerConDetallesAsync(int? materiaId, string estado)
        {
            const string sp = "sp_Examen_ObtenerConDetalles";
            var parameters = new
            {
                MateriaId = materiaId,
                Estado = estado
            };
            return await QueryStoredProcedureAsync(sp, parameters);
        }

        public async Task<IEnumerable<Examen>> ObtenerPorMateriaEstadoAsync(int? materiaId, string estado)
        {
            const string sp = "sp_Examen_ObtenerPorMateriaEstado";
            var parameters = new
            {
                MateriaId = materiaId,
                Estado = estado
            };
            return await QueryStoredProcedureAsync(sp, parameters);
        }

        public async Task<Examen> ObtenerPorIdAsync(int id)
        {
            const string sp = "sp_Examen_ObtenerPorId";
            var result = await QueryStoredProcedureAsync(sp, new { Id = id });
            return result.FirstOrDefault();
        }

        #endregion

        #region Métodos que devuelven DTOs
        
        public async Task<IEnumerable<ExamenDto>> ObtenerTodosDtoAsync(string estado)
        {
            var examenes = await ObtenerTodosAsync(estado);

            foreach (var item in examenes)
            {
                item.ProgramacionExamen = await _repoProgExamen.GetByIdAsync(item.ProgramacionId);
                item.TipoExamen = await _repoTipoExamen.GetByIdAsync(item.TipoExamenId);
                item.Materia = await _repoMateria.GetByIdAsync(item.ProgramacionExamen.MateriaId);
            }
            var dtoExamenes = _mapper.Map<IEnumerable<ExamenDto>>(examenes);
            return dtoExamenes;
        }

        public async Task<IEnumerable<ExamenDto>> ObtenerConDetallesDtoAsync(int? materiaId, string estado)
        {
            var examenes = await ObtenerConDetallesAsync(materiaId, estado);

            foreach (var item in examenes)
            {
                item.ProgramacionExamen = await _repoProgExamen.GetByIdAsync(item.ProgramacionId);
                item.TipoExamen = await _repoTipoExamen.GetByIdAsync(item.TipoExamenId);
                item.Materia = await _repoMateria.GetByIdAsync(item.ProgramacionExamen.MateriaId);
            }
            var dtoExamenes = _mapper.Map<IEnumerable<ExamenDto>>(examenes);
            return dtoExamenes;
        }
        
        public async Task<ExamenDto> ObtenerPorIdDtoAsync(int id)
        {
            var examen = await ObtenerPorIdAsync(id);

            examen.ProgramacionExamen = await _repoProgExamen.GetByIdAsync(examen.ProgramacionId);
            examen.TipoExamen = await _repoTipoExamen.GetByIdAsync(examen.TipoExamenId);
            examen.Materia = await _repoMateria.GetByIdAsync(examen.ProgramacionExamen.MateriaId);

            return _mapper.Map<ExamenDto>(examen);
        }
        
        public async Task<IEnumerable<ExamenDto>> ObtenerPorMateriaEstadoDtoAsync(int? materiaId, string estado)
        {
            var examenes = await ObtenerPorMateriaEstadoAsync(materiaId, estado);

            foreach (var item in examenes)
            {
                item.ProgramacionExamen = await _repoProgExamen.GetByIdAsync(item.ProgramacionId);
                item.TipoExamen = await _repoTipoExamen.GetByIdAsync(item.TipoExamenId);
                item.Materia = await _repoMateria.GetByIdAsync(item.ProgramacionExamen.MateriaId);
            }
            var dtoExamenes = _mapper.Map<IEnumerable<ExamenDto>>(examenes);
            return dtoExamenes;
        }

        #endregion
    }
}