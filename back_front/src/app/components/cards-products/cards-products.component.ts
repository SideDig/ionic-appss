import { Component, OnInit } from '@angular/core';
import { productos } from '../../interfaces/index';
import { ApiService } from 'src/app/services/api.service';
import { UserDataService } from '../../services/user-data.service';
@Component({
  selector: 'app-cards-products',
  templateUrl: './cards-products.component.html',
  styleUrls: ['./cards-products.component.scss'],
})
export class CardsProductsComponent  implements OnInit {
  public resp: productos[] = [];
  isLoading = false; // Controla el estado de carga
  error: string | null = null; // Almacena un mensaje de error si ocurre
  constructor( private newService: ApiService, public userDataService: UserDataService) { }

  ngOnInit() {
    this.fetchProducts();
  }

  fetchProducts() {
    this.isLoading = true; // Comienza la carga
    this.newService.getTopHeadlines().subscribe({
      next: (resp) => {
        this.isLoading = false; // Detiene la carga cuando los datos son recibidos
        if (Array.isArray(resp)) {
          this.resp = resp;
        } else {
          this.resp = [resp];
        }
      }, error: (error) => {
        this.isLoading = false; // Detiene la carga si ocurre un error
        this.error = "No se pudieron cargar los productos."; // Mensaje de error
        console.error(error);
      }
    });
  }

  eliminarDato(id_producto: number) {
    const confirmacion = confirm("¿Estás seguro de que deseas eliminar este producto?");
    if (!confirmacion) {
      return;
    }
    
    this.newService.eliminarDato(id_producto).subscribe({
      next: (response) => {
        console.log(response);
        this.resp = this.resp.filter(item => item.id_producto !== id_producto);
      },
      error: (error) => {
        console.error("Error al eliminar el registro:", error);
        this.error = "Error al eliminar el producto."; // Asume que tienes una manera de mostrar esto en tu UI
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
