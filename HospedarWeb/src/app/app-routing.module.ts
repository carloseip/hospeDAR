import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

// Components
import { HomeComponent } from './components/home/home.component';
import { RegisterhostComponent } from './components/registerhost/registerhost.component';
import { GuideComponent } from './components/guide/guide.component';
import { AngelhostComponent } from './components/angelhost/angelhost.component';
import { HostComponent } from './components/host/host.component';

const routes: Routes = [
  { path: 'home', component: HomeComponent },
  { path: 'guide', component: GuideComponent },
  { path: 'angelhost', component: AngelhostComponent },
  { path: 'host', component: HostComponent },
  {
    path: 'registerhost',
    component: RegisterhostComponent
  },
  { path: '', pathMatch: 'full', redirectTo: 'home' },
  { path: '**', pathMatch: 'full', redirectTo: 'home' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule {}
