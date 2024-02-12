import { Component } from '@angular/core';
import { ApiService } from 'src/app/services/api.service';
import { productos } from 'src/app/interfaces'; // Importar la clase productos desde index.ts

@Component({
  selector: 'app-tab2',
  templateUrl: 'tab2.page.html',
  styleUrls: ['tab2.page.scss']
})
export class Tab2Page {
  id?: number;
  nombre_producto?: string;
  descripcion_producto?: string;
  precio_producto?: number;
  imagen_producto?: string;
  nombre_categoria?: number;

  constructor(private apiService: ApiService) {}

  enviarDatos() {
    const datos: productos = {
      id: this.id, 
      nombre_producto: this.nombre_producto,
      descripcion_producto: this.descripcion_producto,
      precio_producto: this.precio_producto,
      imagen_producto: this.imagen_producto,
      nombre_categoria: this.nombre_categoria
    };

    this.apiService.postDatos(datos).subscribe(resp => {
      console.log(resp);
      
    });
  }
}
