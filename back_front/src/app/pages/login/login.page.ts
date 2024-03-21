import { Component } from '@angular/core';
import { NavController } from '@ionic/angular';
import { Router } from '@angular/router';
import { Auth, signInWithEmailAndPassword } from '@angular/fire/auth';
import { UserDataService } from '../../services/user-data.service'; // Asegúrate de importar correctamente el servicio

@Component({
  selector: 'app-login',
  templateUrl: './login.page.html',
  styleUrls: ['./login.page.scss'],
})
export class LoginPage{
  email: string = "";
  password: string = "";
  
  constructor(
    public navCntrl: NavController,
    private auth: Auth,
    private router: Router,
    private userDataService: UserDataService // Inyecta el servicio UserDataService
  ) {}

  async login() {
    try {
      const user = await signInWithEmailAndPassword(
        this.auth,
        this.email,
        this.password
      );
      console.log(user);
      // Guardar datos del usuario en el almacenamiento de sesión
      this.userDataService.setUserData(this.email, user.user?.uid || ''); // Suponiendo que user.user?.uid contiene el token
      this.router.navigate(['/tabs']);
    } catch (error) {
      console.error("Error de inicio de sesión:", error);
    }
  }

  gotoSignup() {
    this.navCntrl.navigateForward('signup');
  }
}
