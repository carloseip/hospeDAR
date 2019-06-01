import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { ReactiveFormsModule } from '@angular/forms';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NavbarComponent } from './components/shared/navbar/navbar.component';
import { HomeComponent } from './components/home/home.component';
import { AngelhostComponent } from './components/angelhost/angelhost.component';
import { SendemailComponent } from './components/sendemail/sendemail.component';
import { CardangelComponent } from './components/cardangel/cardangel.component';
import { CardhostComponent } from './components/cardhost/cardhost.component';
import { RegisterhostComponent } from './components/registerhost/registerhost.component';
import { RegisterangelComponent } from './components/registerangel/registerangel.component';

@NgModule({
  declarations: [
    AppComponent,
    NavbarComponent,
    HomeComponent,
    AngelhostComponent,
    SendemailComponent,
    CardangelComponent,
    CardhostComponent,
    RegisterhostComponent,
    RegisterangelComponent
  ],
  imports: [BrowserModule, AppRoutingModule, ReactiveFormsModule],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule {}
