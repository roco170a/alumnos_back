using System.Data;

namespace apiAlumnos.Interfaces
{
    public interface IDbConnectionFactory
    {
        IDbConnection CreateConnection();
    }
} 