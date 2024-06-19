using System;
using System.Collections.Generic;

namespace AseoSasBackend.Models;

public partial class Productos
{
    public int Id { get; set; }

    public string? Nombre { get; set; }

    public double? Precio { get; set; }

    public int? Cantidad { get; set; }

    public int? CategoriaId { get; set; }

    public virtual Categorias? Categoria { get; set; }
}
