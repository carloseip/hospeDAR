import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, FormBuilder } from '@angular/forms';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  title = 'HospedarWeb';
  // email = new FormControl('');
  formulario: FormGroup;

  constructor(private formBuilder: FormBuilder) {}
  public ngOnInit() {}
  private buildForm() {
    this.formBuilder.group({
      name: 'user1',
      email: 'use1@gmail.com'
    });
  }
}
