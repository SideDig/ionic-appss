import { Component, OnInit, Input  } from '@angular/core';
import { productos } from '../../interfaces/index';
import { ApiService } from 'src/app/services/api.service';
import { UserDataService } from '../../services/user-data.service';
@Component({
  selector: 'app-cards-products',
  templateUrl: './cards-products.component.html',
  styleUrls: ['./cards-products.component.scss'],
})
export class CardsProductsComponent  implements OnInit {
  @Input() categoriaId: number;
  public resp: productos[] = [];
  isLoading = false; 
  error: string | null = null; 
  constructor( private apiService: ApiService, public userDataService: UserDataService) { }

  ngOnInit() {
    this.fetchProducts();
  }

  fetchProducts() {
    this.isLoading = true;
    let requestObservable;
  
    if (this.categoriaId) {
      
      requestObservable = this.apiService.productoPorCategoria(this.categoriaId);
    } else {
    
      requestObservable = this.apiService.getTopHeadlines();
    }
  
    requestObservable.subscribe({
      next: (resp) => {
        this.isLoading = false;
        this.resp = Array.isArray(resp) ? resp : [resp];
      },
      error: (error) => {
        this.isLoading = false;
        this.error = "No hay productos disponibles";
        console.error(error);
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
