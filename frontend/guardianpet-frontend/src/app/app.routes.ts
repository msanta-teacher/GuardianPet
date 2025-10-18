import { Routes } from '@angular/router';


export const routes: Routes = [
{ path: '', redirectTo: 'login', pathMatch: 'full' },
{ path: 'login', loadComponent: () => import('./features/auth/login/login').then(m => m.LoginComponent) },
{ path: 'registro', loadComponent: () => import('./features/auth/register/register').then(m => m.RegisterComponent) },
{ path: 'home', loadComponent: () => import('./features/home/home').then(m => m.HomeComponent) },
{ path: '**', redirectTo: 'login' }
];