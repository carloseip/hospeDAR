import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';

@Component({
  selector: 'app-registerhost',
  templateUrl: './registerhost.component.html',
  styleUrls: ['./registerhost.component.css']
})
export class RegisterhostComponent implements OnInit {
  formulario: FormGroup;
  constructor() {}

  ngOnInit() {
    this.formulario = new FormGroup({
      name: new FormControl('user1'),
      email: new FormControl(''),
      password: new FormControl('')
    });
  }
}
