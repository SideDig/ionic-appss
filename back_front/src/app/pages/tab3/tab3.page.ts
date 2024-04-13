import { Component, OnInit } from '@angular/core';
import { categoria } from '../../interfaces/index';
import { ApiService } from '../../services/api.service';
import { UserDataService } from '../../services/user-data.service';

@Component({
  selector: 'app-tab3',
  templateUrl: 'tab3.page.html',
  styleUrls: ['tab3.page.scss'],
})
export class Tab3Page implements OnInit {
  public resp_categorias: categoria[] = [];
  isLoading = false;
  error: string | null = null;
  constructor(
    private apiService: ApiService,
    public userDataService: UserDataService
  ) {}

  ngOnInit() {
    this.fetchCategorias();
  }

  fetchCategorias() {
    this.isLoading = true;
    this.apiService.ObtenerCategorias().subscribe({
      next: (resp_categorias) => {
        this.isLoading = false;
        if (Array.isArray(resp_categorias)) {
          this.resp_categorias = resp_categorias;
        } else {
          this.resp_categorias = [resp_categorias];
        }
      },
      error: (error) => {
        this.isLoading = false;
        this.error = 'No se pudieron cargar las categorias.';
        console.error(error);
      },
    });
  }
}
