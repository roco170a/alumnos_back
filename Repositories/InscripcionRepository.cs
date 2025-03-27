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
    public class InscripcionRepository : GenericRepository<Inscripcion>, IInscripcionRepository
    {
        private readonly IMapper _mapper;
        private readonly IAlumnoRepository _repoAlumnos;
        private readonly IMateriaRepository _repoMateria;

        public InscripcionRepository(IDbConnectionFactory connectionFactory, IMapper mapper, IAlumnoRepository repoAlumnos, IMateriaRepository repoMarerias) 
            : base(connectionFactory, "Inscripciones")
        {
            _mapper = mapper;
            _repoAlumnos = repoAlumnos;
            _repoMateria = repoMarerias;
        }

        #region Métodos base que sobrescriben IGenericRepository
        
        public override async Task<IEnumerable<Inscripcion>> GetAllAsync()
        {
            return await ObtenerTodasAsync(null, false);
        }

        public override async Task<Inscripcion> GetByIdAsync(int id)
        {
            return await ObtenerPorIdAsync(id);
        }

        public override async Task<bool> DeleteAsync(int id)
        {
            const string sp = "sp_Inscripcion_Eliminar";
            var result = await ExecuteStoredProcedureAsync(sp, new { Id = id });
            return result > 0;
        }

        public override async Task<int> CreateAsync(Inscripcion entity)
        {
            const string sp = "sp_Inscripcion_Crear";
            var parameters = new
            {
                AlumnoId = entity.AlumnoId,
                MateriaId = entity.MateriaId,
                FechaInscripcion = entity.FechaInscripcion,
                PeriodoAcademico = entity.PeriodoAcademico,
                Estado = entity.Estado
            };

            using var connection = _connectionFactory.CreateConnection();
            var inscripcion = await connection.QueryFirstOrDefaultAsync<Inscripcion>(sp, parameters, commandType: CommandType.StoredProcedure);
            return inscripcion?.Id ?? 0;
        }

        public override async Task<bool> UpdateAsync(Inscripcion entity)
        {
            const string sp = "sp_Inscripcion_Actualizar";
            var parameters = new
            {
                Id = entity.Id,
                Estado = entity.Estado,
                NotaFinal = entity.NotaFinal
            };

            var result = await ExecuteStoredProcedureAsync(sp, parameters);
            return result > 0;
        }
        
        #endregion

        #region Métodos que llaman directamente a stored procedures
        
        public async Task<IEnumerable<Inscripcion>> ObtenerTodasAsync(string periodoAcademico, bool soloActivas)
        {
            const string sp = "sp_Inscripcion_ObtenerTodas";
            var parameters = new
            {
                PeriodoAcademico = periodoAcademico,
                SoloActivas = soloActivas
            };

            return await QueryStoredProcedureAsync(sp, parameters);
        }

        public async Task<Inscripcion> ObtenerPorIdAsync(int id)
        {
            const string sp = "sp_Inscripcion_ObtenerPorId";
            var inscripciones = await QueryStoredProcedureAsync(sp, new { Id = id });
            return inscripciones.FirstOrDefault();
        }
        
        public async Task<IEnumerable<Inscripcion>> ObtenerConDetallesAsync(string periodoAcademico, bool soloActivas)
        {
            const string sp = "sp_Inscripcion_ObtenerConDetalles";
            var parameters = new
            {
                PeriodoAcademico = periodoAcademico,
                SoloActivas = soloActivas
            };

            return await QueryStoredProcedureAsync(sp, parameters);
        }
        
        public async Task<IEnumerable<Inscripcion>> ObtenerPorAlumnoAsync(int alumnoId, string periodoAcademico, bool soloActivas)
        {
            const string sp = "sp_Inscripcion_ObtenerPorAlumno";
            var parameters = new
            {
                AlumnoId = alumnoId,
                PeriodoAcademico = periodoAcademico,
                SoloActivas = soloActivas
            };

            return await QueryStoredProcedureAsync(sp, parameters);
        }
        
        public async Task<IEnumerable<Inscripcion>> ObtenerPorMateriaAsync(int materiaId, string periodoAcademico, bool soloActivas)
        {
            const string sp = "sp_Inscripcion_ObtenerPorMateria";
            var parameters = new
            {
                MateriaId = materiaId,
                PeriodoAcademico = periodoAcademico,
                SoloActivas = soloActivas
            };

            return await QueryStoredProcedureAsync(sp, parameters);
        }
        
        #endregion

        #region Métodos que devuelven DTOs
        
        public async Task<IEnumerable<InscripcionDto>> ObtenerTodasDtoAsync(string periodoAcademico, bool soloActivas)
        {
            var inscripciones = await ObtenerTodasAsync(periodoAcademico, soloActivas);
            return _mapper.Map<IEnumerable<InscripcionDto>>(inscripciones);
        }

        public async Task<IEnumerable<InscripcionDto>> ObtenerConDetallesDtoAsync(string periodoAcademico, bool soloActivas)
        {
            var inscripciones = await ObtenerConDetallesAsync( periodoAcademico, soloActivas);

            foreach (var item in inscripciones)
            {
                item.Materia = await _repoMateria.GetByIdAsync(item.MateriaId);
                item.Alumno = await _repoAlumnos.GetByIdAsync(item.AlumnoId);
            }
            var dtoInscripciones = _mapper.Map<IEnumerable<InscripcionDto>>(inscripciones);
            return dtoInscripciones;
        }

        public async Task<InscripcionDto> ObtenerPorIdDtoAsync(int id)
        {
            var inscripcion = await ObtenerPorIdAsync(id);

            inscripcion.Materia = await _repoMateria.GetByIdAsync(inscripcion.MateriaId);
            inscripcion.Alumno = await _repoAlumnos.GetByIdAsync(inscripcion.AlumnoId);


            return inscripcion != null ? _mapper.Map<InscripcionDto>(inscripcion) : null;
        }

        public async Task<IEnumerable<InscripcionDto>> ObtenerPorAlumnoDtoAsync(int alumnoId, string periodoAcademico, bool soloActivas)
        {
            var inscripciones = await ObtenerPorAlumnoAsync(alumnoId, periodoAcademico, soloActivas);

            foreach (var item in inscripciones)
            {
                item.Materia = await _repoMateria.GetByIdAsync(item.MateriaId);
                item.Alumno = await _repoAlumnos.GetByIdAsync(item.AlumnoId);
            }
            var dtoInscripciones = _mapper.Map<IEnumerable<InscripcionDto>>(inscripciones);
            return dtoInscripciones;
        }

        public async Task<IEnumerable<InscripcionDto>> ObtenerPorMateriaDtoAsync(int materiaId, string periodoAcademico, bool soloActivas)
        {
            var inscripciones = await ObtenerPorMateriaAsync(materiaId, periodoAcademico, soloActivas);

            foreach (var item in inscripciones)
            {
                item.Materia = await _repoMateria.GetByIdAsync(item.MateriaId);
                item.Alumno = await _repoAlumnos.GetByIdAsync(item.AlumnoId);
            }
            var dtoInscripciones = _mapper.Map<IEnumerable<InscripcionDto>>(inscripciones);
            return dtoInscripciones;
        }
        
        #endregion
    }
} 