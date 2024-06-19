import { inject, Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Producto } from './models/producto.model';

//import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ProductoService {

  // private productoSeleccionadoSubject = new BehaviorSubject<Producto>({} as Producto);
  // productoSeleccionado$ = this.productoSeleccionadoSubject.asObservable();
  
  private apiUrl = '/api';  // Cambiado para usar el proxy

  constructor(private http: HttpClient) 
  {

  }

  // setProductoSeleccionado(producto: Producto) {
  //   if (producto) {
  //     this.productoSeleccionadoSubject.next(producto);
  //   }
  // }

  getProductos(Id?:number): Observable<Producto[]> {
    let routeEndpoint: string = "Producto/ListarProductos";
    if( Id != null && Id !== 0){
      routeEndpoint += `/${Id}`;
    }
    return this.http.get<Producto[]>(`${this.apiUrl}/${routeEndpoint}`);
  }

  postProducto(producto:Producto):Observable<Producto>{
    producto.categoria = null;
    console.log(producto);
    debugger;
    return this.http.post<Producto>(`${this.apiUrl}/Producto/CrearProducto`, producto);
  }

  putProducto(producto:Producto):Observable<Producto>{
    return this.http.put<Producto>(`${this.apiUrl}/Producto/EditarProducto/${producto.id}`, producto);
  }

  deleteProducto(id: number): Observable<any> {
    return this.http.delete<any>(`${this.apiUrl}/Producto/EliminarProducto/${id}`);
  }

}
