import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, pipe } from 'rxjs';
import { productos } from '../interfaces';
import { User } from '../interfaces';
import { banners } from '../interfaces';
import { map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root',
})
export class ApiService {
  public apiUrl_producto = 'http://127.0.0.1:80/api1/productos'; // Reemplaza con la URL de tu API
  public apiUrl_usuarios = 'http://127.0.0.1:80/api1/usuarios';
  public apiUrl_banners = 'http://127.0.0.1:80/api1/banners';

  constructor(private http: HttpClient) {}

  // Método para obtener los datos
  getTopHeadlines(): Observable<productos> {
    return this.http
      .get<productos>(this.apiUrl_producto)
      .pipe(map((resp) => resp));
  }

  // Método para enviar datos por POST
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

  //banners
  getBanners(): Observable<banners[]> {
    return this.http.get<banners[]>(this.apiUrl_banners);
  }
}
