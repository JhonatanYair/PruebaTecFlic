using AseoSasBackend.Models;
using AseoSasBackend.Repositories;
using AseoSasBackend.Services;
using Microsoft.AspNetCore.Mvc;

namespace AseoSasBackend.Controllers
{
    [Route("/api/[controller]/")]
    public class CategoriaController : ControllerBase
    {
        private readonly AseoSasContext _context;
        private IRepository<Categorias> _repositoryCategoria;
        private ICategoriaService _categoriaService;

        public CategoriaController(AseoSasContext context)
        {
            _context = context;
            _repositoryCategoria = new Repository<Categorias>(context);
            _categoriaService = new CategoriaService(_repositoryCategoria);
        }

        [HttpGet("ListarCategorias/{id?}")]
        public async Task<IActionResult> ListaCategorias(int? id = null)
        {
            Categorias categoriaFilter = new Categorias();
            if (id != null) categoriaFilter.Id = (int)id;

            var listaCategorias = await _categoriaService.ListarCategorias(categoriaFilter);
            return Ok(listaCategorias);
        }
    }
}
