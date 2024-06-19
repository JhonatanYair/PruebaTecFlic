using AseoSasBackend.Models;
using AseoSasBackend.Repositories;
using System.Linq.Expressions;

namespace AseoSasBackend.Services
{
    public class CategoriaService : ICategoriaService
    {
        private readonly IRepository<Categorias> _repository;

        public CategoriaService(IRepository<Categorias> repository)
        {
            _repository = repository;
        }

        public async Task<List<Categorias>> ListarCategorias(Categorias? categorias = null)
        {
            Expression<Func<Categorias, bool>> query = null;

            if (categorias.Id != 0)
            {
                query = c => c.Id == categorias.Id;
            }

            return await _repository.ListarRegistros(query);
        }

    }

    public interface ICategoriaService 
    {
        Task<List<Categorias>> ListarCategorias(Categorias? categoria = null);
    }
}
