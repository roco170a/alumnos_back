using apiAlumnos.Data;
using apiAlumnos.Interfaces;
using apiAlumnos.Repositories;
using apiAlumnos.Mappers;

namespace apiAlumnos
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            builder.Services.AddControllers();
            
            // Register database services
            builder.Services.AddSingleton<IDbConnectionFactory, SqlConnectionFactory>();
            
            // Register repositories
            builder.Services.AddScoped<IAlumnoRepository, AlumnoRepository>();
            builder.Services.AddScoped<IInscripcionRepository, InscripcionRepository>();
            builder.Services.AddScoped<IMateriaRepository, MateriaRepository>();
            builder.Services.AddScoped<IProgramacionExamenRepository, ProgramacionExamenRepository>();
            builder.Services.AddScoped<IExamenRepository, ExamenRepository>();
            builder.Services.AddScoped<ITipoExamenRepository, TipoExamenRepository>();
            builder.Services.AddScoped<IAlumnoExamenRepository, AlumnoExamenRepository>();
            
            // Add AutoMapper with mapping profiles
            builder.Services.AddAutoMapper(typeof(MappingProfile));
            
            // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen();

            // Configurar CORS leyendo desde appsettings.json
            var corsOrigins = builder.Configuration.GetSection("Cors:AllowedOrigins").Get<string[]>();
            
            builder.Services.AddCors(options =>
            {
                options.AddPolicy("CorsPolicy", policyBuilder =>
                {
                    if (corsOrigins != null && corsOrigins.Length > 0)
                    {
                        policyBuilder.WithOrigins(corsOrigins)
                            .AllowAnyMethod()
                            .AllowAnyHeader()
                            .AllowCredentials();
                    }
                    else
                    {
                        // Configuración por defecto si no hay orígenes configurados
                        policyBuilder.AllowAnyOrigin()
                            .AllowAnyMethod()
                            .AllowAnyHeader();
                    }
                });
            });

            var app = builder.Build();

            // Configure the HTTP request pipeline.
            //if (app.Environment.IsDevelopment())
            //{
                app.UseSwagger();
                app.UseSwaggerUI();
            //}

            // Usar la política CORS configurada
            app.UseCors("CorsPolicy");

            app.UseAuthorization();

            app.MapControllers();

            app.Run();
        }
    }
}
