import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UserDataService } from '../../services/user-data.service'; // Importa el servicio UserDataService
import { Auth, signOut } from '@angular/fire/auth'; // Importa el servicio de autenticación

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.scss'],
})
export class NavbarComponent implements OnInit { // Implementa la interfaz OnInit
  userEmail: string = ""; // Declara e inicializa la propiedad userEmail
  
  constructor(
    private router: Router,
    private auth: Auth,
    private userDataService: UserDataService
  ) {}

  ngOnInit() {
    // Cuando se inicializa el componente, obtén el correo del usuario del servicio UserDataService
    this.userEmail = this.userDataService.getCorreo();
  }

  printUserData() {
    this.userDataService.printUserData();
  }

  async logout() {
    try {
      await signOut(this.auth);
      // Limpiar datos de usuario en el servicio UserDataService
      this.userDataService.clearUserData();
      // Redirigir al usuario a la página de inicio de sesión
      this.router.navigate(['/login']);
    } catch (error) {
      console.error("Error al cerrar sesión:", error);
    }
  }
}
