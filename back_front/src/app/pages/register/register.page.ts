import { Component, OnInit } from '@angular/core';
import { NavController } from '@ionic/angular';
import {Auth, signInWithEmailAndPassword, createUserWithEmailAndPassword, signOut } from '@angular/fire/auth';
import {User} from '../../interfaces/index';
import { ApiService } from 'src/app/services/api.service';
@Component({
  selector: 'app-register',
  templateUrl: './register.page.html',
  styleUrls: ['./register.page.scss'],
})
export class RegisterPage implements OnInit {

  name: string = "";
  email: string = "";
  password: string = "";

  constructor(public navCntrl: NavController, private auth: Auth, private apiService: ApiService ) { 
  }

  ngOnInit() {
  }


  async signup() {
    try {
      const userCredential = await createUserWithEmailAndPassword(
        this.auth,
        this.email,
        this.password
      );
      
      // Guardar datos del usuario en tu base de datos
      const User: User = {
        id_usuario: userCredential.user.uid, 
        usuario: this.name,
        correo: this.email,
        contrasena: this.password,
        rol: 0 
      };
      this.apiService.saveUserData(User).subscribe(response => {
        console.log("Usuario guardado en la base de datos:", response);
      });

      return userCredential;
    } catch (error) {
      console.error("Error al registrar usuario:", error);
      throw error;
    }
  }

  gotoLogin() {
    this.navCntrl.navigateBack('login');
  }
 
}
