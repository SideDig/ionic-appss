import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, pipe } from 'rxjs';
import { productos } from '../interfaces';
import { categoria } from '../interfaces';
import { User } from '../interfaces';
import { banners } from '../interfaces';
import { map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root',
})
export class ApiService {
  public apiUrl_producto = 'http://127.0.0.1:80/api1/productos';
  public apiUrl_usuarios = 'http://127.0.0.1:80/api1/usuarios';
  public apiUrl_banners = 'http://127.0.0.1:80/api1/banners';
  public apiUrl_categoria = 'http://127.0.0.1:80/api1/categorias';

  constructor(private http: HttpClient) {}

  // Productos
  getTopHeadlines(): Observable<productos> {
    return this.http
      .get<productos>(this.apiUrl_producto)
      .pipe(map((resp) => resp));
  }

  postDatos(datos: any): Observable<any> {
    return this.http.post<any>(this.apiUrl_producto, datos, {
      responseType: 'text' as 'json',
    });
  }

  eliminarDato(id_producto: any): Observable<any> {
    const httpOptions = {
      headers: new HttpHeaders({ 'Content-Type': 'application/json' }),
      body: { id_producto: id_producto },
      responseType: 'text' as 'json',
    };
    return this.http.delete<any>(this.apiUrl_producto, { ...httpOptions });
  }

  buscarProductos(query: string): Observable<productos[]> {
    return this.http.get<productos[]>(`${this.apiUrl_producto}/buscar`, {
      params: { buscar: query },
    });
  }

  productoPorCategoria(query: number): Observable<productos[]> {
    return this.http.get<productos[]>(`${this.apiUrl_producto}/id_categoria`, {
      params: { id_categoria: query },
    });
  }

  productosPorId(query: number): Observable<productos> {
    return this.http.get<productos>(`${this.apiUrl_producto}/${query}`);
  }

  //Usuarios
  saveUserData(user: User): Observable<any> {
    const httpOptions = {
      headers: new HttpHeaders({ 'Content-Type': 'application/json' }),
      responseType: 'text' as 'json',
    };
    return this.http.post<any>(`${this.apiUrl_usuarios}`, user, {
      ...httpOptions,
    });
  }

  verifyCredentials(email: string, password: string): Observable<any> {
    const credentials = {
      correo: email,
      contrasena: password,
      action: 'verifyCredentials',
    };
    const httpOptions = {
      headers: new HttpHeaders({ 'Content-Type': 'application/json' }),
    };
    return this.http.post<any>(this.apiUrl_usuarios, credentials, httpOptions);
  }

  //banners
  getBanners(): Observable<banners[]> {
    return this.http.get<banners[]>(this.apiUrl_banners);
  }

  //categorias
  ObtenerCategorias(): Observable<categoria> {
    return this.http
      .get<categoria>(this.apiUrl_categoria)
      .pipe(map((resp) => resp));
  }
}
