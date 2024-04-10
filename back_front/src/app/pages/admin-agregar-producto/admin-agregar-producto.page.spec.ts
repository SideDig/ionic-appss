import { ComponentFixture, TestBed } from '@angular/core/testing';
import { AdminAgregarProductoPage } from './admin-agregar-producto.page';

describe('AdminAgregarProductoPage', () => {
  let component: AdminAgregarProductoPage;
  let fixture: ComponentFixture<AdminAgregarProductoPage>;

  beforeEach(async(() => {
    fixture = TestBed.createComponent(AdminAgregarProductoPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  }));

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
