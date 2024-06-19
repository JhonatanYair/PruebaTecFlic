import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Producto } from '../models/producto.model';
import { ProductoService } from '../producto.service';
import {CommonModule} from '@angular/common';
import { FormsModule,ReactiveFormsModule } from '@angular/forms';
import { Categoria } from '../models/categoria.model';
import { CategoriaService } from '../categoria.service';


@Component({
  selector: 'app-formulario-producto',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule
  ],
  templateUrl: './formulario-producto.component.html',
  styleUrl: './formulario-producto.component.css'
})
export class FormularioProductoComponent implements OnInit {

  producto: Producto = new Producto(); 
  listaCategorias: Categoria[] = [] 
  modoEdicion = false;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private productoService: ProductoService,
    private categoriaService: CategoriaService
  ) {}

  ngOnInit(): void {
    // Aquí puedes poner el código que quieres ejecutar al inicializar el componente
    console.log('FormularioProductoComponent inicializado');
    // this.productoService.productoSeleccionado$.subscribe(producto => {
    //   this.producto = producto;
    //   console.log("Producto ha editar.");
    //   console.log(producto);
    // });
    this.obtenerCategorias();
    let idParam = Number(this.route.snapshot.paramMap.get('idProducto'));
    if (idParam) {
      this.modoEdicion = true;
      this.obtenerProducto(idParam);
    }
  }

  obtenerProducto(id:number): void {
    console.log("obtener producto()");
    this.productoService.getProductos(id).subscribe({
      next: (productos) => {
        console.log("Productos recibidos:", productos);
        this.producto = productos[0];
      },
      error: (error) => {
        console.error("Error al obtener el producto:", error);
      }
    });
  }

  obtenerCategorias():void{
    console.log("obtener categorias()");
    this.categoriaService.getCategorias().subscribe({
      next: (categorias) => {
        console.log("Categorias recibidos:", categorias);
        this.listaCategorias = categorias;
      },
      error: (error) => {
        console.error("Error al obtener el producto:", error);
      }
    });
  }

  guardarCambios() {
    if (this.modoEdicion) {
      this.editarProducto();
    } else {
      this.crearProducto();
    }
  }

  crearProducto():void{
    // this.productoService.postProducto(this.producto).subscribe(() => {
    //   this.router.navigate(['/lista-productos']);
    // });
    this.productoService.postProducto(this.producto).subscribe({
      next: (producto) => {
        console.log("Producto recibido:", producto);
        this.producto = producto;
        alert("Se creo el producto correctamente.");
        this.router.navigate(['/lista-productos']);
      },
      error: (error) => {
        console.error("Error al obtener el producto:", error);
      }
    });
  }

  editarProducto():void{
    this.productoService.putProducto(this.producto).subscribe({
      next: (producto) => {
        console.log("Producto recibido:", producto);
        this.producto = producto;
        alert("Se edito el producto correctamente.");
        this.router.navigate(['/lista-productos']);
      },
      error: (error) => {
        console.error("Error al obtener el producto:", error);
      }
    });
  }

  cancelarCambio():void{
    this.router.navigate(['/lista-productos']);
  }

}