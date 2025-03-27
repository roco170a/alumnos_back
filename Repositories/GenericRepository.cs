using System;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;
using apiAlumnos.Interfaces;
using apiAlumnos.Models;
using Dapper;

namespace apiAlumnos.Repositories
{
    public abstract class GenericRepository<T> : IGenericRepository<T> where T : class
    {
        protected readonly IDbConnectionFactory _connectionFactory;
        protected readonly string _tableName;

        protected GenericRepository(IDbConnectionFactory connectionFactory, string tableName)
        {
            _connectionFactory = connectionFactory ?? throw new ArgumentNullException(nameof(connectionFactory));
            _tableName = tableName ?? throw new ArgumentNullException(nameof(tableName));
        }

        public virtual async Task<IEnumerable<T>> GetAllAsync()
        {
            using var connection = _connectionFactory.CreateConnection();
            return await connection.QueryAsync<T>($"SELECT * FROM {_tableName}");
        }

        public abstract Task<int> CreateAsync(T entity);
        public abstract Task<bool> UpdateAsync(T entity);

        public virtual async Task<bool> DeleteAsync(int id)
        {
            using var connection = _connectionFactory.CreateConnection();
            var result = await connection.ExecuteAsync($"DELETE FROM {_tableName} WHERE Id = @Id", new { Id = id });
            return result > 0;
        }

        // Método para ejecutar stored procedures
        protected async Task<IEnumerable<T>> QueryStoredProcedureAsync(string storedProcedure, object parameters = null)
        {
            using var connection = _connectionFactory.CreateConnection();
            return await connection.QueryAsync<T>(storedProcedure, parameters, commandType: CommandType.StoredProcedure);
        }

        // Método para ejecutar stored procedures que no devuelven resultados
        protected async Task<int> ExecuteStoredProcedureAsync(string storedProcedure, object parameters = null)
        {
            using var connection = _connectionFactory.CreateConnection();
            var execRes = await connection.ExecuteAsync(storedProcedure, parameters, commandType: CommandType.StoredProcedure);
            return 1;
        }

        public virtual async Task<T> GetByIdAsync(int id)
        {
            using var connection = _connectionFactory.CreateConnection();
            var result = await connection.QueryAsync<T>($"SELECT * FROM {_tableName} WHERE Id = @Id", new { Id = id });
            return result.FirstOrDefault();
        }
    }
} 