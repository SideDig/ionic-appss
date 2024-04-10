import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { AdminAgregarProductoPage } from './admin-agregar-producto.page';

const routes: Routes = [
  {
    path: '',
    component: AdminAgregarProductoPage
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class AdminAgregarProductoPageRoutingModule {}
