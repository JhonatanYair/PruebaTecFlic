import { Routes } from '@angular/router';
import { ListaProductosComponent } from './lista-productos/lista-productos.component';
import { FormularioProductoComponent } from './formulario-producto/formulario-producto.component';

export const routes: Routes = [
    {path: '', redirectTo: 'lista-productos', pathMatch: 'full'},
    { path: 'lista-productos', component: ListaProductosComponent },
    { path: 'formulario-producto/:idProducto', component: FormularioProductoComponent },
    { path: 'formulario-producto', component: FormularioProductoComponent },
    { 
        path: 'lista-productos',
        loadChildren: () => import('./lista-productos/lista-productos.component').then(m => m.ListaProductosComponent)
    },
    { 
        path: 'formulario-producto',
        loadChildren: () => import('./formulario-producto/formulario-producto.component').then(m => m.FormularioProductoComponent)
    },
    { 
        path: 'formulario-producto/:idProducto',
        loadChildren: () => import('./formulario-producto/formulario-producto.component').then(m => m.FormularioProductoComponent)
    }
];
