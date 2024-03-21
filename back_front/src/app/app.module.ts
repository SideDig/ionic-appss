import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { RouteReuseStrategy } from '@angular/router';
import { UserDataService } from './services/user-data.service';
import { IonicModule, IonicRouteStrategy } from '@ionic/angular';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';

import { HttpClientModule} from '@angular/common/http';
import { environment } from 'src/environments/environment';

import { provideFirebaseApp, initializeApp } from '@angular/fire/app';
import { getFirestore, provideFirestore } from '@angular/fire/firestore';

import { provideAuth, getAuth } from '@angular/fire/auth';
import { provideStorage, getStorage } from '@angular/fire/storage';

@NgModule({
  declarations: [AppComponent],
  imports: [
    BrowserModule, 
    IonicModule.forRoot(), 
    AppRoutingModule,
    HttpClientModule,
    provideFirebaseApp(() => initializeApp(environment.firebaseConfig)), provideAuth(() => getAuth()),
    provideFirestore(() => getFirestore()),
    provideStorage(() => getStorage()),
    provideFirebaseApp(() => initializeApp({"projectId":"gamingshop-608ed","appId":"1:777806851284:web:81263b9f13433e0965df41","storageBucket":"gamingshop-608ed.appspot.com","apiKey":"AIzaSyAMohkhuVtkyzhAOfn8zudF2Ivml0F7ZWQ","authDomain":"gamingshop-608ed.firebaseapp.com","messagingSenderId":"777806851284"}))
  ],

  providers: [{ provide: RouteReuseStrategy, useClass: IonicRouteStrategy }, UserDataService],
  bootstrap: [AppComponent],
})
export class AppModule {}
