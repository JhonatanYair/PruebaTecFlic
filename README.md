# Prueba Técnica con Angular, SQL y .NET

Este repositorio contiene una prueba técnica que utiliza Angular para el frontend, SQL Server para la base de datos y .NET para el backend. Para desplegar y probar la aplicación, sigue los pasos detallados a continuación.

## Despliegue de la Aplicación

1. **Requisitos Previos:**
   Asegúrate de tener Docker instalado en tu máquina. Puedes descargarlo desde [Docker Hub](https://www.docker.com/get-started).

2. **Ejecución de la Aplicación:**
   En la raíz del proyecto, ejecuta el siguiente comando para iniciar los contenedores Docker en segundo plano:

   ```bash
   docker-compose up -d
   ```

   Esto iniciará los contenedores de Angular, SQL Server y .NET necesarios para la aplicación.

4. **Acceder a la Aplicación:**
   Una vez que los contenedores estén en ejecución, puedes acceder a la aplicación Angular desde `http://localhost:4300`.

## Endpoints de la API (CRUD de Productos)

La API proporciona endpoints para realizar operaciones CRUD (Crear, Leer, Actualizar, Eliminar) sobre los productos. A continuación se detallan los endpoints disponibles junto con ejemplos de cómo realizar las peticiones utilizando Postman:

### Obtener Todos los Productos

- **Método:** GET
- **URL:** `http://localhost:8083/api/Producto/ListarProductos`
- **Descripción:** Obtiene todos los productos almacenados en la base de datos.

### Obtener un Producto por ID

- **Método:** GET
- **URL:** `http://localhost:8083/api/Producto/ListarProductos/{id}`
- **Descripción:** Obtiene un producto específico mediante su ID.

### Crear un Nuevo Producto

- **Método:** POST
- **URL:** `http://localhost:8083/api/Producto/CrearProducto`
- **Descripción:** Crea un nuevo producto en la base de datos.

  **Body:**
  ```json
    {
        "nombre": "Nuevo Producto",
        "precio": 29.99,
        "cantidad": 23330,
        "categoriaId": {categoriaId:int}
    }
  ```

### Actualizar un Producto Existente

- **Método:** PUT
- **URL:** `http://localhost:8083/api/Producto/EditarProducto/{id}`
- **Descripción:** Actualiza un producto existente en la base de datos.

  **Body:**
  ```json
    {
        "nombre": "Editar Producto",
        "precio": 29.99,
        "cantidad": 23330,
        "categoriaId": {categoriaId:int}
    }
  ```

### Eliminar un Producto

- **Método:** DELETE
- **URL:** `http://localhost:8083/api/Producto/EliminarProducto/{id}`
- **Descripción:** Elimina un producto existente de la base de datos.

### Obtener Todos las Categorías

- **Método:** GET
- **URL:** `http://localhost:8083/api/Categoria/ListarCategorias`
- **Descripción:** Obtiene todas las categorías almacenados en la base de datos.

---

Este `README.md` proporciona una guía para desplegar la aplicación y utilizar los endpoints de la API CRUD para productos, usando ejemplos específicos de peticiones HTTP que se pueden realizar con Postman. Asegúrate de ajustar los detalles según las necesidades específicas y configuraciones de tu proyecto.