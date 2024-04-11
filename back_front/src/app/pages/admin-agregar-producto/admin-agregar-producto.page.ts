import { Component, OnInit } from '@angular/core';
import { ApiService } from 'src/app/services/api.service';
import { productos } from 'src/app/interfaces';
import { Router } from '@angular/router';
import { UserDataService } from '../../services/user-data.service'; 

@Component({
  selector: 'app-admin-agregar-producto',
  templateUrl: './admin-agregar-producto.page.html',
  styleUrls: ['./admin-agregar-producto.page.scss'],
})
export class AdminAgregarProductoPage implements OnInit {
  id_producto?: number;
  nombre_producto?: string;
  descripcion_producto?: string;
  precio_producto?: number;
  imagen_producto?: string;
  nombre_categoria?: number;
  nombre_plataforma?: number;

  public resp: productos[] = [];
  isLoading = false; 
  error: string | null = null; 

  constructor(private apiService: ApiService, public userDataService: UserDataService, private router: Router) {}

  ngOnInit() {
    this.fetchProducts();
  }

  fetchProducts() {
    this.isLoading = true;
    this.apiService.getTopHeadlines().subscribe({
      next: (resp) => {
        this.isLoading = false; 
        if (Array.isArray(resp)) {
          this.resp = resp;
        } else {
          this.resp = [resp];
        }
      },
      error: (error) => {
        this.isLoading = false;
        this.error = "No se pudieron cargar los productos."; 
        console.error(error);
      }
    });
  }

  enviarDatos() {
    if (this.isLoading) return; 

    const datos: productos = {
      id_producto: this.id_producto,
      nombre_producto: this.nombre_producto,
      descripcion_producto: this.descripcion_producto,
      precio_producto: this.precio_producto,
      imagen_producto: this.imagen_producto,
      nombre_categoria: this.nombre_categoria,
      nombre_plataforma: this.nombre_plataforma
    };

    this.isLoading = true; 
    this.apiService.postDatos(datos).subscribe({
      next: (resp) => {
        console.log(resp);
        this.fetchProducts(); 
        this.isLoading = false; 
        
      },
      error: (error) => {
        console.error(error);
        this.isLoading = false; 
        this.error = "Error al enviar el producto."; 
      }
    });
  }

  eliminarDato(id_producto: number) {
    const confirmacion = confirm("¿Estás seguro de que deseas eliminar este producto?");
    if (!confirmacion) {
      return;
    }
    
    this.apiService.eliminarDato(id_producto).subscribe({
      next: (response) => {
        console.log(response);
        this.resp = this.resp.filter(item => item.id_producto !== id_producto);
      },
      error: (error) => {
        console.error("Error al eliminar el registro:", error);
        this.error = "Error al eliminar el producto."; 
      }
    });
  }
  
  confirmarEliminacion(id_producto: number) {
    const confirmacion = confirm("¿Estás seguro de que deseas eliminar este producto?");
    if (confirmacion && id_producto !== undefined) {
      this.eliminarDato(id_producto);
    }
  }
}
