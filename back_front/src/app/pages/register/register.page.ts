import { Component, OnInit } from '@angular/core';
import { NavController } from '@ionic/angular';
import {Auth, signInWithEmailAndPassword, createUserWithEmailAndPassword, signOut } from '@angular/fire/auth';
@Component({
  selector: 'app-register',
  templateUrl: './register.page.html',
  styleUrls: ['./register.page.scss'],
})
export class RegisterPage implements OnInit {

  name: string = "";
  email: string = "";
  password: string = "";

  constructor(public navCntrl: NavController, private auth: Auth ) { 
  }

  ngOnInit() {
  }


  async signup() {
    const user = await createUserWithEmailAndPassword(
      this.auth,
      this.email,
      this.password
    );
    return user;
  }

  gotoLogin() {
    this.navCntrl.navigateBack('login');
  }
 
}
