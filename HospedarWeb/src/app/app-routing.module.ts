import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

// Components
import { HomeComponent } from './components/home/home.component';
import { RegisterhostComponent } from './components/registerhost/registerhost.component';

const routes: Routes = [
  { path: '', component: HomeComponent },
  {
    path: 'registerhost',
    component: RegisterhostComponent
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule {}
