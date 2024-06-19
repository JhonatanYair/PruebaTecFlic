import { Injectable } from '@angular/core';
import { Categoria } from './models/categoria.model';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class CategoriaService {

  private apiUrl = '/api';  // Cambiado para usar el proxy

  constructor(private http: HttpClient) { }

  getCategorias(Id?:number): Observable<Categoria[]> {
    let routeEndpoint: string = "Categoria/ListarCategorias";
    if( Id != null && Id !== 0){
      routeEndpoint += `/${Id}`;
    }
    return this.http.get<Categoria[]>(`${this.apiUrl}/${routeEndpoint}`);
  }

}
