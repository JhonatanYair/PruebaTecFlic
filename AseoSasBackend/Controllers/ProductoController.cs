using Microsoft.AspNetCore.Mvc;
using AseoSasBackend.Models;
using AseoSasBackend.Repositories;
using AseoSasBackend.Services;
using AseoSasBackend.InitialApi;

namespace AseoSasBackend.Controllers
{
    [Route("/api/[controller]/")]
    public class ProductoController : ControllerBase
    {
        private readonly AseoSasContext _context;
        private IRepository<Productos> _repositoryProducto;
        private IProductoService _productoService;

        public ProductoController(AseoSasContext context) 
        {
            _context = context;
            _repositoryProducto = new Repository<Productos>(context);
            _productoService = new ProductoService(_repositoryProducto);
        }

        [HttpGet("ListarProductos/{id?}")]
        public async Task<IActionResult> ListarProductos(int? id = null)
        {
            Productos productoFilter = new Productos();
            if(id != null) productoFilter.Id =(int)id;

            var listaProductos = await _productoService.ListarProductos(productoFilter);
            return Ok(listaProductos);
        }

        [HttpPost("CrearProducto")]
        public async Task<IActionResult> CrearProducto([FromBody] Productos productos)
        {
            if (productos == null) return BadRequest("El body mal formado.");
            return Ok(await _productoService.CrearProducto(productos));
        }

        [HttpPut("EditarProducto/{id}")]
        public async Task<IActionResult> EditarProducto(int id, [FromBody] Productos productos)
        {
            if (productos == null) return BadRequest("El body mal formado.");
            return Ok(await _productoService.EditarProducto(id,productos));
        }

        [HttpDelete("EliminarProducto/{id}")]
        public async Task<IActionResult> EliminarProducto(int id)
        {
            return Ok(await _productoService.EliminarProducto(id));
        }
    }
}
