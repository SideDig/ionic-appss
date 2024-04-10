import { Component } from '@angular/core';
import { NavController } from '@ionic/angular';
import { Router } from '@angular/router';
import { Auth, signInWithEmailAndPassword } from '@angular/fire/auth';
import { UserDataService } from '../../services/user-data.service'; 
import { ApiService } from 'src/app/services/api.service';
@Component({
  selector: 'app-login',
  templateUrl: './login.page.html',
  styleUrls: ['./login.page.scss'],
})
export class LoginPage {
  email: string = '';
  password: string = '';

  constructor(
    public navCntrl: NavController,
    private auth: Auth,
    private router: Router,
    private userDataService: UserDataService, 
    private apiService: ApiService
  ) {}

  async login() {
    try {
      const user = await signInWithEmailAndPassword(this.auth, this.email, this.password);
      console.log("Login con Firebase exitoso:", user);
      // Si es exitoso, navega a '/tabs' o maneja como prefieras
      this.userDataService.setUserData(this.email, user.user?.uid || '');
      this.router.navigate(['/tabs']);
    } catch (firebaseError) {
      console.error("Error de inicio de sesión con Firebase:", firebaseError);
    }
    
    this.apiService.verifyCredentials(this.email, this.password).subscribe({
      next: (response) => {
      
        if (response.user) {
          const userIdRol = response.user.id_rol; 
          this.userDataService.setUserData(response.user.correo, response.user.id_usuario, userIdRol);
          this.router.navigate(['/tabs']);
        } else {
          console.error("La respuesta de la API PHP no contiene datos del usuario");
        }
      },
      error: (error) => {
        console.error("Error de inicio de sesión con la API PHP:", error);
      }
    });
  }
  

  gotoSignup() {
    this.navCntrl.navigateForward('signup');
  }

  navigateToRegister() {
    this.router.navigate(['/register']);
  }
}
