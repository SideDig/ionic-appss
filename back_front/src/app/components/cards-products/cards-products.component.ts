import { Component, OnInit, Input } from '@angular/core';
import { productos } from '../../interfaces/index';
import { ApiService } from 'src/app/services/api.service';
import { UserDataService } from '../../services/user-data.service';
import { Router } from '@angular/router';
import { AlertController } from '@ionic/angular';
@Component({
  selector: 'app-cards-products',
  templateUrl: './cards-products.component.html',
  styleUrls: ['./cards-products.component.scss'],
})
export class CardsProductsComponent implements OnInit {
  @Input() categoriaId: number;
  public resp: productos[] = [];
  isLoading = false;
  error: string | null = null;
  constructor(
    private apiService: ApiService,
    public userDataService: UserDataService,
    private router: Router,
    private alertController: AlertController
  ) {}

  ngOnInit() {
    this.fetchProducts();
  }

  verDetalles(idProducto: number) {
    this.router.navigate(['/info-producto', idProducto]);
  }

  fetchProducts() {
    this.isLoading = true;
    let requestObservable;

    if (this.categoriaId) {
      requestObservable = this.apiService.productoPorCategoria(
        this.categoriaId
      );
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
        this.error = 'No hay productos disponibles';
        console.error(error);
      },
    });
  }

  eliminarDato(id_producto: number) {
    this.apiService.eliminarDato(id_producto).subscribe({
      next: (response) => {
        console.log('Producto eliminado:', response);
        // Filtramos la lista de productos para eliminar el producto de la vista
        this.resp = this.resp.filter(
          (item) => item.id_producto !== id_producto
        );
      },
      error: (error) => {
        console.error('Error al eliminar el registro:', error);
        // Manejar el error mostrando un mensaje en la interfaz de usuario
        this.error = 'Error al eliminar el producto.';
      },
    });
  }

  async confirmarEliminacion(id_producto: number) {
    const alert = await this.alertController.create({
      header: 'Confirmar Eliminación',
      message: '¿Estás seguro de que deseas eliminar este producto?',
      buttons: [
        {
          text: 'Cancelar',
          role: 'cancel',
          handler: () => {
            console.log('Eliminación cancelada');
          },
        },
        {
          text: 'Confirmar',
          handler: () => {
            this.eliminarDato(id_producto);
          },
        },
      ],
    });

    await alert.present();
  }
}
