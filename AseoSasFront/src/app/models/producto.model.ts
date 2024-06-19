import { Categoria } from './categoria.model'; // Importa la interfaz Categoria

export class Producto {
    id: number = 0;
    nombre: string = "";
    precio: number = 0;
    cantidad:number = 0;
    categoriaId:number = 0;
    categoria: Categoria | null;
    constructor(){
      this.categoria = new Categoria(); 
    }
  }