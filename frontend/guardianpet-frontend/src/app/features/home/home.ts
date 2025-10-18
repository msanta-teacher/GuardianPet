import { Component, OnInit, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Router } from '@angular/router';
import { AuthService, User } from '../../core/services/auth.service';

@Component({
  standalone: true,
  selector: 'app-home',
  imports: [CommonModule],
  templateUrl: './home.html' // o deja template inline si prefieres
})
export class HomeComponent implements OnInit {
  private authSvc = inject(AuthService);
  private router = inject(Router);

  me?: User;
  loading = true;

  // 👇 agrega las propiedades que el template está usando
  stats?: { mascotas: number; vacunas: number; citas: number };
  recent: string[] = [];

  // expone auth si lo usas en el template con *ngIf="auth.isLoggedIn"
  get auth() { return this.authSvc; }

  ngOnInit() {
    if (!this.authSvc.isLoggedIn) {
      this.router.navigate(['/login']);
      return;
    }

    this.authSvc.me().subscribe({
      next: (u) => {
        this.me = u;
        // Datos de ejemplo (reemplaza con llamadas reales cuando las tengas)
        this.stats = { mascotas: 3, vacunas: 1, citas: 2 };
        this.recent = ['Registraste a “Luna”', 'Actualizaste vacuna de “Rocky”'];
        this.loading = false;
      },
      error: () => {
        this.me = undefined;
        this.stats = undefined;
        this.recent = [];
        this.loading = false;
      }
    });
  }
}
