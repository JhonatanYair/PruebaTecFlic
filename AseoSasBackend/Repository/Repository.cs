﻿using AseoSasBackend.Models;
using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;

namespace AseoSasBackend.Repositories
{
    public class Repository<T> : IRepository<T> where T : class
    {
        private readonly AseoSasContext _context;

        public Repository(AseoSasContext context)
        {
            _context = context;
        }

        public async Task<List<T>> ListarRegistros(Expression<Func<T, bool>>? predicate = null, params Expression<Func<T, object>>[] includes)
        {
            IQueryable<T> query = _context.Set<T>();
            if (predicate != null)
            {
                query = query.Where(predicate);
            }

            if (includes != null)
            {
                query = includes.Aggregate(query, (current, include) => current.Include(include));
            }

            return await query.ToListAsync();
        }

        public async Task<T> CrearRegistro(T entidad)
        {
            _context.Set<T>().Add(entidad);
            await _context.SaveChangesAsync();
            return entidad;
        }

        public async Task<T> EditarRegistro(T entidad)
        {
            _context.Set<T>().Update(entidad);
            await _context.SaveChangesAsync();
            return entidad;
        }

        public async Task<bool> EliminarRegistro(int id)
        {
            var entidad = await _context.Set<T>().FindAsync(id);
            if (entidad == null)
            {
                return false;
            }

            _context.Set<T>().Remove(entidad);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
