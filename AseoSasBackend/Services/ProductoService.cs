using AseoSasBackend.Common;
using AseoSasBackend.Models;
using AseoSasBackend.Repositories;
using System.Linq.Expressions;

namespace AseoSasBackend.Services
{
    public class ProductoService : IProductoService
    {
        private readonly IRepository<Productos> _repository;

        public ProductoService(IRepository<Productos> repository) 
        {
            _repository = repository;
        }

        public async Task<List<Productos>> ListarProductos(Productos? producto = null)
        {
            Expression<Func<Productos, bool>> query = null;

            if (producto.Id != 0)
            {
                query = p => p.Id == producto.Id;
            }

            Expression<Func<Productos, object>> includeCategoria = p => p.Categoria;
            return await _repository.ListarRegistros(query, includeCategoria);
        }

        public async Task<Productos> CrearProducto(Productos producto)
        {
            return await _repository.CrearRegistro(producto);
        }

        public async Task<ResponseApi> EditarProducto(int id, Productos producto)
        {
            ResponseApi responseApi = new ResponseApi();
            Productos productoEdit = new Productos();
            Expression<Func<Productos, bool>> query = p => p.Id == id;

            var ProductosFind = await _repository.ListarRegistros(query);
            var productoPut = ProductosFind[0];
            responseApi.Response = "Error no se encontró el producto.";

            if (ProductosFind.Count >0)
            {
                responseApi.Response = "El producto fue editado correctamente.";
                productoPut.Id = id;
                productoPut.Nombre = producto.Nombre;
                productoPut.Precio = producto.Precio;
                productoPut.CategoriaId = producto.CategoriaId;

                productoEdit = await _repository.EditarRegistro(productoPut);
                responseApi.ResponseObject = producto;
            }
            return responseApi;
        }

        public async Task<ResponseApi> EliminarProducto(int id)
        {
            ResponseApi responseApi = new ResponseApi();
            Expression<Func<Productos, bool>> query = p => p.Id == id;
            bool eliminadoProducto = false;

            var ProductoFind = await _repository.ListarRegistros(query);
            responseApi.Response = "Error no se encontró el producto.";

            if (ProductoFind.Count >0)
            {
                eliminadoProducto = await _repository.EliminarRegistro(id);
                responseApi.Response = "El producto fue eliminado.";
            }
            return responseApi;
        }

    }

    public interface IProductoService
    {
        Task<List<Productos>> ListarProductos(Productos? producto = null);
        Task<Productos> CrearProducto(Productos producto);
        Task<ResponseApi> EditarProducto(int id, Productos producto);
        Task<ResponseApi> EliminarProducto(int id);
    }

}
