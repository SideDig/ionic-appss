import { Component } from '@angular/core';
import { Observable } from 'rxjs';
import { ApiService } from '../../services/api.service'; 
import { productos } from 'src/app/interfaces';
import { Router } from '@angular/router';
import { UserDataService } from '../../services/user-data.service';
@Component({
  selector: 'app-tab2',
  templateUrl: 'tab2.page.html',
  styleUrls: ['tab2.page.scss']
})
export class Tab2Page {
  productos$: Observable<productos[]>; 
  terminoBusqueda = ''; 

  constructor(private apiService: ApiService, private router: Router, public userDataService: UserDataService, ) {}

  verDetalles(idProducto: number) {
    this.router.navigate(['/info-producto', idProducto]);
  }

  buscar() {
    this.productos$ = this.apiService.buscarProductos(this.terminoBusqueda);
  }
}