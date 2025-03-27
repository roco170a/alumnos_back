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
    public class TipoExamenRepository : GenericRepository<TipoExamen>, ITipoExamenRepository
    {
        private readonly IMapper _mapper;

        public TipoExamenRepository(IDbConnectionFactory connectionFactory, IMapper mapper) 
            : base(connectionFactory, "TiposExamen")
        {
            _mapper = mapper;
        }

        #region Métodos base que sobrescriben IGenericRepository
        
        public override async Task<IEnumerable<TipoExamen>> GetAllAsync()
        {
            return await ObtenerTodosAsync();
        }

        public override async Task<TipoExamen> GetByIdAsync(int id)
        {
            return await ObtenerPorIdAsync(id);
        }

        public override async Task<bool> DeleteAsync(int id)
        {
            const string sp = "sp_TipoExamen_Eliminar";
            var result = await ExecuteStoredProcedureAsync(sp, new { Id = id });
            return result > 0;
        }

        public override async Task<int> CreateAsync(TipoExamen entity)
        {
            const string sp = "sp_TipoExamen_Crear";
            var parameters = new
            {
                Nombre = entity.Nombre,
                Descripcion = entity.Descripcion,
                Ponderacion = entity.Ponderacion
            };

            using var connection = _connectionFactory.CreateConnection();
            var tipoExamen = await connection.QueryFirstOrDefaultAsync<TipoExamen>(sp, parameters, commandType: CommandType.StoredProcedure);
            return tipoExamen?.Id ?? 0;
        }

        public override async Task<bool> UpdateAsync(TipoExamen entity)
        {
            const string sp = "sp_TipoExamen_Actualizar";
            var parameters = new
            {
                Id = entity.Id,
                Nombre = entity.Nombre,
                Descripcion = entity.Descripcion,
                Ponderacion = entity.Ponderacion
            };

            var result = await ExecuteStoredProcedureAsync(sp, parameters);
            return result > 0;
        }
        
        #endregion

        #region Métodos que llaman directamente a stored procedures
        
        public async Task<IEnumerable<TipoExamen>> ObtenerTodosAsync()
        {
            const string sp = "sp_TipoExamen_ObtenerTodos";
            return await QueryStoredProcedureAsync(sp);
        }

        public async Task<TipoExamen> ObtenerPorIdAsync(int id)
        {
            const string sp = "sp_TipoExamen_ObtenerPorId";
            var result = await QueryStoredProcedureAsync(sp, new { Id = id });
            return result.FirstOrDefault();
        }
        
        #endregion

        #region Métodos que devuelven DTOs
        
        public async Task<IEnumerable<TipoExamenDto>> ObtenerTodosDtoAsync()
        {
            var tiposExamen = await ObtenerTodosAsync();
            return _mapper.Map<IEnumerable<TipoExamenDto>>(tiposExamen);
        }

        public async Task<TipoExamenDto> ObtenerPorIdDtoAsync(int id)
        {
            var tipoExamen = await ObtenerPorIdAsync(id);
            return tipoExamen != null ? _mapper.Map<TipoExamenDto>(tipoExamen) : null;
        }
        
        #endregion
    }
} 