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
        console.log(productos);
      },
      error: (e) => console.error(e)
    });
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
