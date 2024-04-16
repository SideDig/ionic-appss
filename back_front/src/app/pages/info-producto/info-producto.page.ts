import { Component, OnInit } from '@angular/core';
import { ApiService } from '../../services/api.service';
import { UserDataService } from '../../services/user-data.service';
import { ActivatedRoute, Router } from '@angular/router';
import { productos } from 'src/app/interfaces';

@Component({
  selector: 'app-info-producto',
  templateUrl: './info-producto.page.html',
  styleUrls: ['./info-producto.page.scss'],
})
export class InfoProductoPage implements OnInit {

  producto: productos;
  isLoading = true;

  constructor(
    private apiService: ApiService, 
    public userDataService: UserDataService, 
    private router: Router,
    private route: ActivatedRoute  // Añadir ActivatedRoute aquí
  ) { }

  ngOnInit() {
    this.route.paramMap.subscribe(params => {
      const idProducto = +params.get('id');
      if (idProducto) {
        this.apiService.productosPorId(idProducto).subscribe({
          next: (data) => {
            this.producto = data;
            this.isLoading = false;
          },
          error: (error) => {
            console.error('Error cargando el producto', error);
            this.isLoading = false;
          }
        });
      }
    });
  }
  
}
