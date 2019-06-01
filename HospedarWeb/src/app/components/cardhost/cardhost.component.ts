import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'app-cardhost',
  templateUrl: './cardhost.component.html',
  styleUrls: ['./cardhost.component.css']
})
export class CardhostComponent implements OnInit {
  @Input() indeximage: number;
  url = `https://github.com/carloseip/hospeDAR/blob/pablo/utils/img%20pablo/hospedante-1.jpg?raw=true`;
  constructor() {}

  ngOnInit() {}
}
