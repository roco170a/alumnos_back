using System;
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
    public class ProgramacionExamenRepository : GenericRepository<ProgramacionExamen>, IProgramacionExamenRepository
    {
        private readonly IMapper _mapper;
        private readonly IMateriaRepository _repoMateria;
        private readonly ITipoExamenRepository _repoTipoExamen;        

        public ProgramacionExamenRepository(IDbConnectionFactory connectionFactory, IMapper mapper
            , IMateriaRepository repoMateria, ITipoExamenRepository repoTipoExamen) 
            : base(connectionFactory, "ProgramacionExamenes")
        {
            _mapper = mapper;
            _repoMateria = repoMateria;
            _repoTipoExamen = repoTipoExamen;            
        }

        #region Métodos base que sobrescriben IGenericRepository
        
        public override async Task<IEnumerable<ProgramacionExamen>> GetAllAsync()
        {
            return await ObtenerTodasAsync(null, null, null);
        }

        public override async Task<ProgramacionExamen> GetByIdAsync(int id)
        {
            return await ObtenerPorIdAsync(id);
        }

        public override async Task<bool> DeleteAsync(int id)
        {
            const string sp = "sp_ProgramacionExamen_Eliminar";
            var result = await ExecuteStoredProcedureAsync(sp, new { Id = id });
            return result > 0;
        }

        public override async Task<int> CreateAsync(ProgramacionExamen entity)
        {
            const string sp = "sp_ProgramacionExamen_Crear";
            var parameters = new
            {
                MateriaId = entity.MateriaId,
                ExamenId = entity.ExamenId,
                FechaProgramada = entity.FechaProgramada,
                DuracionMinutos = entity.DuracionMinutos,
                Aula = entity.Aula,
                Instrucciones = entity.Instrucciones,
                MaterialRequerido = entity.MaterialRequerido,
                Estado = entity.Estado
            };

            using var connection = _connectionFactory.CreateConnection();
            var result = await connection.QueryFirstOrDefaultAsync<ProgramacionExamen>(sp, parameters, commandType: CommandType.StoredProcedure);
            return result?.Id ?? 0;
        }

        public override async Task<bool> UpdateAsync(ProgramacionExamen entity)
        {
            const string sp = "sp_ProgramacionExamen_Actualizar";
            var parameters = new
            {
                Id = entity.Id,
                MateriaId = entity.MateriaId,
                ExamenId = entity.ExamenId,
                FechaProgramada = entity.FechaProgramada,
                DuracionMinutos = entity.DuracionMinutos,
                Aula = entity.Aula,
                Instrucciones = entity.Instrucciones,
                MaterialRequerido = entity.MaterialRequerido,
                Estado = entity.Estado
            };

            var result = await ExecuteStoredProcedureAsync(sp, parameters);
            return result > 0;
        }
        
        #endregion

        #region Métodos que llaman directamente a stored procedures
        
        public async Task<IEnumerable<ProgramacionExamen>> ObtenerTodasAsync(string estado, DateTime? fechaDesde, DateTime? fechaHasta)
        {
            const string sp = "sp_ProgramacionExamen_ObtenerTodas";
            var parameters = new
            {
                Estado = estado,
                FechaDesde = fechaDesde,
                FechaHasta = fechaHasta
            };

            return await QueryStoredProcedureAsync(sp, parameters);
        }

        public async Task<ProgramacionExamen> ObtenerPorIdAsync(int id)
        {
            const string sp = "sp_ProgramacionExamen_ObtenerPorId";
            var programaciones = await QueryStoredProcedureAsync(sp, new { Id = id });
            return programaciones.FirstOrDefault();
        }
        
        public async Task<IEnumerable<ProgramacionExamen>> ObtenerConDetallesAsync(string estado, DateTime? fechaDesde, DateTime? fechaHasta)
        {
            const string sp = "sp_ProgramacionExamen_ObtenerConDetalles";
            var parameters = new
            {
                Estado = estado,
                FechaDesde = fechaDesde,
                FechaHasta = fechaHasta
            };

            return await QueryStoredProcedureAsync(sp, parameters);
        }
        
        public async Task<IEnumerable<ProgramacionExamen>> ObtenerPorMateriaAsync(int materiaId, string estado)
        {
            const string sp = "sp_ProgramacionExamen_ObtenerPorMateria";
            var parameters = new
            {
                MateriaId = materiaId,
                Estado = estado
            };

            return await QueryStoredProcedureAsync(sp, parameters);
        }
        
        public async Task<IEnumerable<ProgramacionExamen>> ObtenerPorExamenAsync(int examenId, bool soloActivas = true)
        {
            const string sp = "sp_ProgramacionExamen_ObtenerPorExamen";
            var parameters = new
            {
                ExamenId = examenId,
                SoloActivas = soloActivas
            };

            return await QueryStoredProcedureAsync(sp, parameters);
        }
        
        public async Task<IEnumerable<dynamic>> ObtenerEstadisticasPorMateriaAsync()
        {
            const string sp = "sp_ProgramacionExamen_EstadisticasPorMateria";
            using var connection = _connectionFactory.CreateConnection();
            return await connection.QueryAsync(sp, commandType: CommandType.StoredProcedure);
        }

        public async Task<Examen> ObtenerExamenPorIdAsync(int id)
        {
            const string sp = "sp_Examen_ObtenerPorId";            

            using var connection = _connectionFactory.CreateConnection();
            var examen = await connection.QueryAsync<Examen>($"SELECT * FROM Examen WHERE id = " + id.ToString());

            return examen.FirstOrDefault();
        }


        #endregion

        #region Métodos que devuelven DTOs

        public async Task<IEnumerable<ProgramacionExamenDto>> ObtenerTodasDtoAsync(string estado, DateTime? fechaDesde, DateTime? fechaHasta)
        {
            var programaciones = await ObtenerTodasAsync(estado, fechaDesde, fechaHasta);

            foreach (var item in programaciones)
            {
                item.Materia = await _repoMateria.GetByIdAsync(item.MateriaId);
                item.Examen = await this.ObtenerExamenPorIdAsync(item.ExamenId);
                if (item.Examen != null)
                    item.TipoExamen = await _repoTipoExamen.GetByIdAsync(item.Examen.TipoExamenId);
            }
            var programacionesDto = _mapper.Map<IEnumerable<ProgramacionExamenDto>>(programaciones);
            return programacionesDto;
        }

        public async Task<IEnumerable<ProgramacionExamenDto>> ObtenerConDetallesDtoAsync(string estado, DateTime? fechaDesde, DateTime? fechaHasta)
        {
            var programaciones = await ObtenerConDetallesAsync(estado, fechaDesde, fechaHasta);
            foreach (var item in programaciones)
            {
                item.Materia = await _repoMateria.GetByIdAsync(item.MateriaId);
                item.Examen = await this.ObtenerExamenPorIdAsync(item.ExamenId);
                if (item.Examen != null)
                    item.TipoExamen = await _repoTipoExamen.GetByIdAsync(item.Examen.TipoExamenId);
            }
            var programacionesDto = _mapper.Map<IEnumerable<ProgramacionExamenDto>>(programaciones);
            return programacionesDto;
        }

        public async Task<ProgramacionExamenDto> ObtenerPorIdDtoAsync(int id)
        {
            var programacion = await ObtenerPorIdAsync(id);

            programacion.Materia = await _repoMateria.GetByIdAsync(programacion.MateriaId);
            programacion.Examen = await this.ObtenerExamenPorIdAsync(programacion.ExamenId);
            if (programacion.Examen != null)
                programacion.TipoExamen = await _repoTipoExamen.GetByIdAsync(programacion.Examen.TipoExamenId);

            return programacion != null ? _mapper.Map<ProgramacionExamenDto>(programacion) : null;
        }

        public async Task<IEnumerable<ProgramacionExamenDto>> ObtenerPorMateriaDtoAsync(int materiaId, string estado)
        {
            var programaciones = await ObtenerPorMateriaAsync(materiaId, estado);
            foreach (var item in programaciones)
            {
                item.Materia = await _repoMateria.GetByIdAsync(item.MateriaId);
                item.Examen = await this.ObtenerExamenPorIdAsync(item.ExamenId);
                item.TipoExamen = await _repoTipoExamen.GetByIdAsync(item.Examen.TipoExamenId);
            }
            var programacionesDto = _mapper.Map<IEnumerable<ProgramacionExamenDto>>(programaciones);
            return programacionesDto;
        }
        
        public async Task<IEnumerable<ProgramacionExamenDto>> ObtenerPorExamenDtoAsync(int examenId, bool soloActivas = true)
        {
            var programaciones = await ObtenerPorExamenAsync(examenId, soloActivas);
            foreach (var item in programaciones)
            {
                item.Materia = await _repoMateria.GetByIdAsync(item.MateriaId);
                item.Examen = await this.ObtenerExamenPorIdAsync(item.ExamenId);
                if (item.Examen != null)
                    item.TipoExamen = await _repoTipoExamen.GetByIdAsync(item.Examen.TipoExamenId);
            }
            var programacionesDto = _mapper.Map<IEnumerable<ProgramacionExamenDto>>(programaciones);
            return programacionesDto;
        }
        
        #endregion
    }
} 