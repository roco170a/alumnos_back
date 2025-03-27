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
    public class AlumnoRepository : GenericRepository<Alumno>, IAlumnoRepository
    {
        private readonly IMapper _mapper;

        public AlumnoRepository(IDbConnectionFactory connectionFactory, IMapper mapper) 
            : base(connectionFactory, "Alumnos")
        {
            _mapper = mapper;
        }

        // Implementación de métodos que ejecutan las operaciones de CRUD
        // -----------------------------------------------------------

        public override async Task<int> CreateAsync(Alumno entity)
        {
            const string sp = "sp_Alumno_Crear";
            var parameters = new
            {
                Nombre = entity.Nombre,
                ApellidoPaterno = entity.ApellidoPaterno,
                ApellidoMaterno = entity.ApellidoMaterno,
                FechaNacimiento = entity.FechaNacimiento,
                Email = entity.Email,
                Telefono = entity.Telefono,
                Direccion = entity.Direccion,
                UserId = entity.UserId
            };

            using var connection = _connectionFactory.CreateConnection();
            // El SP retorna el alumno creado, por lo que obtenemos el Id
            var alumno = await connection.QueryFirstOrDefaultAsync<Alumno>(sp, parameters, commandType: CommandType.StoredProcedure);
            return alumno?.Id ?? 0;
        }

        public override async Task<bool> UpdateAsync(Alumno entity)
        {
            const string sp = "sp_Alumno_Actualizar";
            var parameters = new
            {
                Id = entity.Id,
                Nombre = entity.Nombre,
                ApellidoPaterno = entity.ApellidoPaterno,
                ApellidoMaterno = entity.ApellidoMaterno,
                FechaNacimiento = entity.FechaNacimiento,
                Email = entity.Email,
                Telefono = entity.Telefono,
                Direccion = entity.Direccion,
                UserId = entity.UserId ?? ""
            };

            var result = await ExecuteStoredProcedureAsync(sp, parameters);
            return result > 0;
        }

        public override async Task<bool> DeleteAsync(int id)
        {
            const string sp = "sp_Alumno_Eliminar";
            var result = await ExecuteStoredProcedureAsync(sp, new { Id = id });
            return true;
        }

        // Implementación de métodos que ejecutan los procedimientos almacenados
        // -----------------------------------------------------------

        public override async Task<IEnumerable<Alumno>> GetAllAsync()
        {
            const string sp = "sp_Alumno_ObtenerTodos";
            return await QueryStoredProcedureAsync(sp, new { SoloActivos = true });
        }

        public override async Task<Alumno> GetByIdAsync(int id)
        {
            const string sp = "sp_Alumno_ObtenerPorId";
            var alumnos = await QueryStoredProcedureAsync(sp, new { Id = id });
            return alumnos.FirstOrDefault();
        }

        

        public async Task<IEnumerable<Alumno>> BuscarPorNombreAsync(string nombre)
        {
            const string sp = "sp_Alumno_BuscarPorNombre";
            return await QueryStoredProcedureAsync(sp, new { Nombre = nombre, SoloActivos = true });
        }

        public async Task<IEnumerable<Alumno>> BuscarGeneralAsync(string texto)
        {
            const string sp = "sp_Alumno_Buscar";
            return await QueryStoredProcedureAsync(sp, new { Busqueda = texto, SoloActivos = true });
        }

        public async Task<IEnumerable<Alumno>> ObtenerPorUserIdAsync(string userId)
        {
            const string sp = "sp_Alumno_ObtenerPorUserId";
            return await QueryStoredProcedureAsync(sp, new { UserId = userId });
        }

        // Implementación de métodos que devuelven las listas de DTOs        
        // -----------------------------------------------------------  

        public async Task<IEnumerable<AlumnoDto>> GetAllDtoAsync()
        {
            var alumnos = await GetAllAsync();
            return _mapper.Map<IEnumerable<AlumnoDto>>(alumnos);
        }

        public async Task<AlumnoDto> GetByIdDtoAsync(int id)
        {
            var alumnos = await GetByIdAsync(id);
            return _mapper.Map<AlumnoDto>(alumnos);
        }

        public async Task<AlumnoDto> ObtenerPorUserIdDtoAsync(string userId)
        {
            var alumnos = await ObtenerPorUserIdAsync(userId);
            return _mapper.Map<AlumnoDto>(alumnos.FirstOrDefault());
        }

        public async Task<IEnumerable<AlumnoDto>> BuscarPorNombreDtoAsync(string nombre)
        {
            var alumnos = await BuscarPorNombreAsync(nombre);
            return _mapper.Map<IEnumerable<AlumnoDto>>(alumnos);
        }

        public Task<IEnumerable<Alumno>> BuscarPorDocumentoAsync(string documento)
        {
            throw new NotImplementedException();
        }
    }
} 