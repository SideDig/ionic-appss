import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { Swiper } from 'swiper';
import { banners } from '../../interfaces/index';
import { ApiService } from '../../services/api.service';

@Component({
  selector: 'app-tab1',
  templateUrl: 'tab1.page.html',
  styleUrls: ['tab1.page.scss'],
})
export class Tab1Page implements OnInit {
  @ViewChild('swiper') swiperRef: ElementRef | undefined;
  swiper?: Swiper;
  images: string[] = []; // Array para URLs de imágenes

  constructor(private apiService: ApiService) {}

  ngOnInit() {
    this.loadBanners();
  }

  loadBanners() {
    this.apiService.getBanners().subscribe({
      next: (banners) => {
        // Asignar solo la URL de la imagen a images
        this.images = banners.map((banner) => banner.imagen_banner);
      },
      error: (error) => {
        console.error('Error al obtener banners:', error);
      },
    });
  }

  swiperReady() {
    this.swiper = this.swiperRef?.nativeElement.swiper;
  }

  swiperSlideChanged(e: any) {
    console.log('changed: ', e);
  }
}
