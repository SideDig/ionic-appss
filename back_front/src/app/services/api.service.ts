import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, pipe } from 'rxjs';
import { productos } from '../interfaces';
import { map } from 'rxjs/operators';


@Injectable({
  providedIn: 'root'
})
export class ApiService {
  public apiUrl = 'http://127.0.0.1:80/api1/productos'; // Reemplaza con la URL de tu API

  constructor(private http: HttpClient) {}

  // Método para obtener los datos
  getTopHeadlines(): Observable<productos> {
    return this.http.get<productos>(this.apiUrl).pipe(
      map(resp => resp)
    );
  }

  // Método para enviar datos por POST
  postDatos(datos: any): Observable<any> {
    return this.http.post<any>(this.apiUrl, datos, {responseType: "text" as "json"});
  }

  eliminarDato(id: number): Observable<{}> {
    return this.http.delete<any>(`${this.apiUrl}?id=${id}`, {responseType: "text" as "json"});
  }
}



