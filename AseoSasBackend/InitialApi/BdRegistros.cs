using AseoSasBackend.Models;
using AseoSasBackend.Repositories;
using AseoSasBackend.Services;
using Bogus;
using log4net;
using System;

namespace AseoSasBackend.InitialApi
{
    public class BdRegistros
    {

        private AseoSasContext _context;
        private readonly ILog _logger = LogManager.GetLogger(typeof(BdRegistros));
        private Faker _faker;

        public BdRegistros(AseoSasContext context)
        {
            _context = context;
            _faker = new Faker();
        }

        public void CrearRegistrosInitial()
        {
            _logger.Debug("IN :: CrearRegistrosInitial();");
            List<Categorias> listaCategoria = _context.Categorias.ToList();

            if (listaCategoria.Count <= 0)
            {
                CrearCategoriasInitial();
                CrearProductosInitial();
            }

            _logger.Debug("OUT :: CrearRegistrosInitial();");
        }

        private void CrearCategoriasInitial()
        {
            _logger.Debug("IN :: CrearCategorias();");
            List<Categorias> listaCategoria = new List<Categorias>();

            for (int i = 0; i < 5; i++)
            {
                Categorias categorias = new Categorias()
                {
                    Nombre = $"Categoría {i}"                
                };
                listaCategoria.Add(categorias);
            }
            _context.Categorias.AddRange(listaCategoria);
            _context.SaveChanges();
            _logger.Debug("OUT :: CrearCategorias();");
        }

        private void CrearProductosInitial()
        {
            _logger.Debug("IN :: CrearProductosInitial();");

            List<Categorias> listaCategoria = _context.Categorias.ToList();
            List<Productos> listaProductos = new List<Productos>();
            Random random = new Random();

            for (int i = 0; i < 20; i++)
            {
                int categoriaId = random.Next(listaCategoria.First().Id, listaCategoria.Last().Id);

                Productos productos = new Productos()
                {
                    Nombre = _faker.Commerce.ProductName(),
                    Cantidad = random.Next(1, 10000),
                    Precio = (float)random.NextDouble() * 100.0f,
                    CategoriaId = categoriaId
                };
                listaProductos.Add(productos);
            }
            _context.Productos.AddRange(listaProductos);
            _context.SaveChanges();
            _logger.Debug("OUT :: CrearProductosInitial();");
        }

    }
}
