import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ExploreContainerComponentModule } from '../../explore-container/explore-container.module';
import { IonicModule } from '@ionic/angular';
import { SharedModule } from 'src/app/shared/shared.module';
import { AdminAgregarProductoPageRoutingModule } from './admin-agregar-producto-routing.module';
import { AdminAgregarProductoPage } from './admin-agregar-producto.page';

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    ExploreContainerComponentModule,
    AdminAgregarProductoPageRoutingModule,
    SharedModule
  ],
  declarations: [AdminAgregarProductoPage]
})
export class AdminAgregarProductoPageModule {}
