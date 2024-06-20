import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ProductoService } from '../producto.service';
import { Producto } from '../models/producto.model';
import {CommonModule} from '@angular/common';

@Component({
  selector: 'app-lista-productos',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './lista-productos.component.html',
  styleUrl: './lista-productos.component.css'
})
export class ListaProductosComponent implements OnInit {
  listaProductos: Producto[] = [];
  listaProductosRespaldo: Producto[] = [];

  constructor(
    private productoService: ProductoService, 
    private router: Router
  ) 
  {

  }

  ngOnInit(): void {
    this.obtenerProductos();
  }

  obtenerProductos(): void {
    this.productoService.getProductos().subscribe({
      next: (productos) => {
        this.listaProductos = productos;
        this.listaProductosRespaldo = productos;
        console.log(productos);
      },
      error: (e) => console.error(e)
    });
  }

  buscarProductoPorId(idABuscar: number) {
    // Restaurar la lista original si se borra el input
    if (idABuscar === undefined || idABuscar === null || isNaN(idABuscar)) {
      this.listaProductos = this.listaProductosRespaldo;
      return;
    }
  
    // Filtrar la lista de productos por el ID ingresado
    this.listaProductos = this.listaProductosRespaldo.filter(producto => producto.id === idABuscar);
  }
  
  // Manejador de eventos para la pulsación de tecla
  keyUpHandler(event: KeyboardEvent) {
    const input = event.target as HTMLInputElement;
    console.log(input.value);
    let idProducto = parseInt(input.value.trim()); // Parsear y limpiar espacios en blanco
  
    // Llamar a la función para buscar por ID
    this.buscarProductoPorId(idProducto);
  }

  formularioProducto(producto?:Producto): void{
    console.log("formularioProducto");
    //this.productoService.setProductoSeleccionado(producto);
    let ruta: any[] = ['/formulario-producto'];
    if (producto && producto.id) {
      ruta.push(producto.id);
    }
    // Navegar dinámicamente a la ruta construida
    this.router.navigate(ruta);
  }

  eliminarProducto(idProducto:number): void{
    if (confirm('¿Estás seguro de querer eliminar este producto?')) {
      this.productoService.deleteProducto(idProducto).subscribe({
        next: (productos) => {
          this.obtenerProductos(); // Actualizar la lista después de eliminar
          alert("Se elimino el producto correctamente");
        },
        error: (e) => console.error(e)
      });
    }
  }

}
