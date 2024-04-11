import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UserDataService } from '../../services/user-data.service'; 
import { Auth, signOut } from '@angular/fire/auth'; 

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.scss'],
})
export class NavbarComponent implements OnInit { 
  userEmail: string = "";
  
  constructor(
    private router: Router,
    private auth: Auth,
    private userDataService: UserDataService
  ) {}

  ngOnInit() {
    this.userEmail = this.userDataService.getCorreo();
  }

  printUserData() {
    this.userDataService.printUserData();
  }

  async logout() {
    try {
      await signOut(this.auth);
      this.userDataService.clearUserData(); 
      this.router.navigate(['/login']);
    } catch (error) {
      console.error("Error al cerrar sesión:", error);
    }
  }
}
