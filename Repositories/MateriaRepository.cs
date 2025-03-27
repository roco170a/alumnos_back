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
    public class MateriaRepository : GenericRepository<Materia>, IMateriaRepository
    {
        private readonly IMapper _mapper;

        public MateriaRepository(IDbConnectionFactory connectionFactory, IMapper mapper) 
            : base(connectionFactory, "Materias")
        {
            _mapper = mapper;
        }

        #region Métodos base que sobrescriben IGenericRepository

        public override async Task<IEnumerable<Materia>> GetAllAsync()
        {
            return await ObtenerTodasAsync(true);
        }

        public override async Task<Materia> GetByIdAsync(int id)
        {
            return await ObtenerPorIdAsync(id);
        }

        public override async Task<bool> DeleteAsync(int id)
        {
            const string sp = "sp_Materia_Eliminar";
            var result = await ExecuteStoredProcedureAsync(sp, new { Id = id });
            return result > 0;
        }

        public override async Task<int> CreateAsync(Materia entity)
        {
            const string sp = "sp_Materia_Crear";
            var parameters = new
            {
                Nombre = entity.Nombre,
                Codigo = entity.Codigo,
                Profesor = entity.Profesor,
                Descripcion = entity.Descripcion,
                Creditos = entity.Creditos
            };

            using var connection = _connectionFactory.CreateConnection();
            var materia = await connection.QueryFirstOrDefaultAsync<Materia>(sp, parameters, commandType: CommandType.StoredProcedure);
            return materia?.Id ?? 0;
        }

        public override async Task<bool> UpdateAsync(Materia entity)
        {
            const string sp = "sp_Materia_Actualizar";
            var parameters = new
            {
                Id = entity.Id,
                Nombre = entity.Nombre,
                Codigo = entity.Codigo,
                Profesor = entity.Profesor,
                Descripcion = entity.Descripcion,
                Creditos = entity.Creditos,
                Activa  = entity.Activa
            };

            var result = await ExecuteStoredProcedureAsync(sp, parameters);
            return result > 0;
        }

        #endregion

        #region Métodos que llaman directamente a stored procedures

        public async Task<IEnumerable<Materia>> ObtenerTodasAsync(bool soloActivas)
        {
            const string sp = "sp_Materia_ObtenerTodas";
            return await QueryStoredProcedureAsync(sp, new { SoloActivas = soloActivas });
        }

        public async Task<Materia> ObtenerPorIdAsync(int id)
        {
            const string sp = "sp_Materia_ObtenerPorId";
            var materias = await QueryStoredProcedureAsync(sp, new { Id = id });
            return materias.FirstOrDefault();
        }

        public async Task<Materia> ObtenerPorCodigoAsync(string codigo)
        {
            const string sp = "sp_Materia_ObtenerPorCodigo";
            var materias = await QueryStoredProcedureAsync(sp, new { Codigo = codigo });
            return materias.FirstOrDefault();
        }

        public async Task<IEnumerable<Materia>> BuscarAsync(string busqueda, bool soloActivas)
        {
            const string sp = "sp_Materia_Buscar";
            return await QueryStoredProcedureAsync(sp, new { Busqueda = busqueda, SoloActivas = soloActivas });
        }

        #endregion

        #region Métodos que devuelven DTOs

        public async Task<IEnumerable<MateriaDto>> ObtenerTodasDtoAsync(bool soloActivas)
        {
            var materias = await ObtenerTodasAsync(soloActivas);
            return _mapper.Map<IEnumerable<MateriaDto>>(materias);
        }

        public async Task<MateriaDto> ObtenerPorIdDtoAsync(int id)
        {
            var materia = await ObtenerPorIdAsync(id);
            return _mapper.Map<MateriaDto>(materia);
        }

        public async Task<MateriaDto> ObtenerPorCodigoDtoAsync(string codigo)
        {
            var materia = await ObtenerPorCodigoAsync(codigo);
            return _mapper.Map<MateriaDto>(materia);
        }

        public async Task<IEnumerable<MateriaDto>> BuscarDtoAsync(string busqueda, bool soloActivas)
        {
            var materias = await BuscarAsync(busqueda, soloActivas);
            return _mapper.Map<IEnumerable<MateriaDto>>(materias);
        }

        #endregion
    }
} 