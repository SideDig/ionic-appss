import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class UserDataService {
  constructor() { }

  setUserData(correo: string, token: string, id_rol?: number) {
    console.log('Guardando id_rol:', id_rol);
    sessionStorage.setItem('correo', correo);
    sessionStorage.setItem('token', token);
    if (id_rol !== undefined) {
      sessionStorage.setItem('rol', id_rol.toString());
    }
  }

  getCorreo(): string {
    return sessionStorage.getItem('correo') || '';
  }

  getToken(): string {
    return sessionStorage.getItem('token') || '';
  }

  getRol(): number {
    const rolStr = sessionStorage.getItem('rol');  
    const rol = rolStr ? parseInt(rolStr, 10) : 0;
    return rol;
  }

  clearUserData() {
    sessionStorage.removeItem('correo');
    sessionStorage.removeItem('token');
  }

  printUserData() {
    const correo = this.getCorreo();
    const token = this.getToken();
    const rol = this.getRol();
    console.log('Correo del usuario:', correo);
    console.log('Token del usuario:', token);
    console.log('ROL del usuario:', rol);
  }
}
