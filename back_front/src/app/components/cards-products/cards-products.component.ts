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
  isLoading = false; 
  error: string | null = null; 
  constructor( private newService: ApiService, public userDataService: UserDataService) { }

  ngOnInit() {
    this.fetchProducts();
  }

  fetchProducts() {
    this.isLoading = true;
    this.newService.getTopHeadlines().subscribe({
      next: (resp) => {
        this.isLoading = false; 
        if (Array.isArray(resp)) {
          this.resp = resp;
        } else {
          this.resp = [resp];
        }
      }, error: (error) => {
        this.isLoading = false;
        this.error = "No se pudieron cargar los productos."; 
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
