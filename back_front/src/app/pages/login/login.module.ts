import { IonicModule } from '@ionic/angular';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { LoginComponent } from './login.component';
import { ExploreContainerComponentModule } from '../../explore-container/explore-container.module';

import { LoginComponentRoutingModule } from './login-routing.module';

@NgModule({
  imports: [
    IonicModule,
    CommonModule,
    FormsModule,
    ExploreContainerComponentModule,
    LoginComponentRoutingModule
  ],
  declarations: [LoginComponent]
})
export class LoginComponentModule {}
