using System;
using AutoMapper;
using apiAlumnos.Models;
using apiAlumnos.DTOs;

namespace apiAlumnos.Mappers
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            // Mapeo de Alumno a AlumnoDto
            CreateMap<Alumno, AlumnoDto>()
                .ForMember(dest => dest.NombreCompleto,
                           opt => opt.MapFrom(src => $"{src.Nombre} {src.ApellidoPaterno} {src.ApellidoMaterno}".Trim()))
                .ForMember(dest => dest.Edad,
                           opt => opt.MapFrom(src => CalcularEdad(src.FechaNacimiento)));
                
                           
            // Mapeo de AlumnoDto a Alumno
            CreateMap<AlumnoDto, Alumno>();

            // Mapeo de Inscripcion a InscripcionDto
            CreateMap<Inscripcion, InscripcionDto>()
                .ForMember(dest => dest.NombreMateria,
                    opt => opt.MapFrom(src => $"{src.Materia.Nombre}".Trim()))
                .ForMember(dest => dest.CodigoMateria,
                    opt => opt.MapFrom(src => $"{src.Materia.Codigo}".Trim()))
                .ForMember(dest => dest.NombreAlumno,
                    opt => opt.MapFrom(src => $"{src.Alumno.Nombre}".Trim()))
                .ForMember(dest => dest.ApellidosAlumno,
                    opt => opt.MapFrom(src => $"{src.Alumno.ApellidoPaterno} {src.Alumno.ApellidoMaterno}".Trim()));
            
            // Mapeo de InscripcionDto a Inscripcion
            CreateMap<InscripcionDto, Inscripcion>();
            
            // Mapeo de Materia a MateriaDto
            CreateMap<Materia, MateriaDto>();
            
            // Mapeo de MateriaDto a Materia
            CreateMap<MateriaDto, Materia>();
            
            // Mapeo de ProgramacionExamen a ProgramacionExamenDto
            CreateMap<ProgramacionExamen, ProgramacionExamenDto>()
                .ForMember(dest => dest.NombreTipoExamen,
                           opt => opt.MapFrom(src => $"{src.TipoExamen.Nombre}".Trim()))
                .ForMember(dest => dest.CodigoMateria,
                           opt => opt.MapFrom(src => $"{src.Materia.Codigo}".Trim()))
                .ForMember(dest => dest.NombreMateria,
                           opt => opt.MapFrom(src => $"{src.Materia.Nombre}".Trim())); 

            // Mapeo de ProgramacionExamenDto a ProgramacionExamen
            CreateMap<ProgramacionExamenDto, ProgramacionExamen>();

            // Mapeo de Examen a ExamenDto
            CreateMap<Examen, ExamenDto>()
                .ForMember(dest => dest.FechaRealizacionFormateada,
                           opt => opt.MapFrom(src => src.FechaRealizacion.ToString("dd/MM/yyyy")))
                .ForMember(dest => dest.ProfesorMateria,
                    opt => opt.MapFrom(src => $"{src.Materia.Profesor}".Trim()))
                .ForMember(dest => dest.NombreTipoExamen,
                    opt => opt.MapFrom(src => $"{src.TipoExamen.Nombre}".Trim()))
                .ForMember(dest => dest.NombreMateria,
                    opt => opt.MapFrom(src => $"{src.Materia.Nombre}".Trim()))
                .ForMember(dest => dest.CodigoMateria,
                    opt => opt.MapFrom(src => $"{src.Materia.Codigo}".Trim()));

            // Mapeo de ExamenDto a Examen
            CreateMap<ExamenDto, Examen>();
            
            // Mapeo de TipoExamen a TipoExamenDto
            CreateMap<TipoExamen, TipoExamenDto>();
            
            // Mapeo de TipoExamenDto a TipoExamen
            CreateMap<TipoExamenDto, TipoExamen>();
            
            // Mapeo de AlumnoExamen a AlumnoExamenDto
            CreateMap<AlumnoExamen, AlumnoExamenDto>()
                .ForMember(dest => dest.FechaRealizacionFormateada, 
                           opt => opt.MapFrom(src => src.FechaRealizacion.HasValue ? src.FechaRealizacion.Value.ToString("dd/MM/yyyy") : "No realizado"))
                .ForMember(dest => dest.NombreAlumno,
                    opt => opt.MapFrom(src => $"{src.Alumno.Nombre}".Trim()))
                .ForMember(dest => dest.ApellidosAlumno,
                    opt => opt.MapFrom(src => $"{src.Alumno.ApellidoPaterno} {src.Alumno.ApellidoMaterno}".Trim()))
                .ForMember(dest => dest.NombreMateria,
                    opt => opt.MapFrom(src => $"{src.Materia.Nombre}".Trim()))
                .ForMember(dest => dest.CodigoMateria,
                    opt => opt.MapFrom(src => $"{src.Materia.Codigo}".Trim()))
                .ForMember(dest => dest.MateriaId,
                    opt => opt.MapFrom(src => $"{src.Materia.Id}".Trim()));
            
            // Mapeo de AlumnoExamenDto a AlumnoExamen
            CreateMap<AlumnoExamenDto, AlumnoExamen>();
        }
        
        private int CalcularEdad(DateTime fechaNacimiento)
        {
            var hoy = DateTime.Today;
            var edad = hoy.Year - fechaNacimiento.Year;
            
            if (fechaNacimiento.Date > hoy.AddYears(-edad))
                edad--;
                
            return edad;
        }
    }
} 