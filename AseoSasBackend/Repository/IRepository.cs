using AseoSasBackend.Models;
using System.Linq.Expressions;

namespace AseoSasBackend.Repositories
{
    public interface IRepository<T>
    {
        Task<List<T>> ListarRegistros(Expression<Func<T, bool>>? predicate = null, params Expression<Func<T, object>>[]? includes);
        Task<T> CrearRegistro(T entidad);
        Task<T> EditarRegistro(T entidad);
        Task<bool> EliminarRegistro(int id);
    }
}
