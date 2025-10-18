import { Component } from '@angular/core';
import { NgIf } from '@angular/common';
import { RouterOutlet, RouterLink, RouterLinkActive } from '@angular/router';
import { AuthService } from './core/services/auth.service';

@Component({
  selector: 'app-root',
  standalone: true,
  // 👇 agrega RouterLinkActive aquí
  imports: [RouterOutlet, RouterLink, RouterLinkActive, NgIf],
  template: `
    <!-- tu nav aquí (Bootstrap o CSS puro) -->
    <nav class="navbar navbar-expand-lg bg-body-tertiary shadow-sm">
      <div class="container">
        <a class="navbar-brand fw-semibold" routerLink="/home">GuardianPet</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#gpNav">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div id="gpNav" class="collapse navbar-collapse">
          <ul class="navbar-nav me-auto">
            <li class="nav-item" *ngIf="auth.isLoggedIn">
              <a class="nav-link"
                 routerLink="/home"
                 routerLinkActive="active"
                 [routerLinkActiveOptions]="{ exact: true }"
              >Home</a>
            </li>

            <li class="nav-item" *ngIf="!auth.isLoggedIn">
              <a class="nav-link" routerLink="/login" routerLinkActive="active">Login</a>
            </li>
            <li class="nav-item" *ngIf="!auth.isLoggedIn">
              <a class="nav-link" routerLink="/registro" routerLinkActive="active">Registro</a>
            </li>
          </ul>

          <div class="d-flex" *ngIf="auth.isLoggedIn">
            <button class="btn btn-outline-danger" (click)="logout()">Salir</button>
          </div>
        </div>
      </div>
    </nav>

    <router-outlet />
  `
})
export class AppComponent {
  constructor(public auth: AuthService) {}
  logout(){ this.auth.logout(); /* redirige como ya tenías */ }
}
