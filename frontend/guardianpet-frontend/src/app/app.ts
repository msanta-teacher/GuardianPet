import { Component } from '@angular/core';
import { RouterOutlet, RouterLink } from '@angular/router';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, RouterLink],
  template: `
    <nav class="topbar">
      <a routerLink="/login">Login</a>
      <a routerLink="/registro">Registro</a>
      <a routerLink="/home">Home</a>
    </nav>
    <router-outlet />
  `,
  styles: [`.topbar{display:flex;gap:1rem;padding:.75rem 1rem;border-bottom:1px solid #eee}`]
})
export class AppComponent {}
