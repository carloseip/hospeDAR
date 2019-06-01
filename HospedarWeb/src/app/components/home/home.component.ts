import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
  hosts: Host[];
  constructor() {
    this.hosts = this.loadHosts();
  }

  ngOnInit() {}

  loadHosts() {
    const arrHosts: Host[] = [];

    for (let i = 0; i < 4; i++) {
      arrHosts.push({
        nombre: `name${i}`,
        dni: 44444440 + i,
        edad: i + 20,
        phone: 999999900 + i,
        email: `email${i}`,
        direccion: `direccion${i}`,
        ayuda: `ayuda${i}`,
        tipo_hospedaje: `tipo_hospedaje${i}`,
        usuario: `usuario${i}`,
        password: `password${i}`
      });
    }
    return arrHosts;
  }
}

interface Host {
  nombre: string;
  dni: number;
  edad: number;
  phone: number;
  email: string;
  direccion: string;
  ayuda: string;
  tipo_hospedaje: string;
  usuario: string;
  password: string;
}
