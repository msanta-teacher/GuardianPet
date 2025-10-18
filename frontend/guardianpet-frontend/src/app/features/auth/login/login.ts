import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import { OnInit } from '@angular/core';
import { AuthService } from '../../../core/services/auth.service';


@Component({
  standalone: true,
  selector: 'app-login',
  imports: [CommonModule, FormsModule, RouterLink],
  template: `
  <div class="container py-5">
    <div class="row justify-content-center">
      <div class="col-12 col-sm-8 col-md-6 col-lg-5">
        <div class="card shadow-sm">
          <div class="card-body p-4">
            <h2 class="h4 mb-4 text-center">Iniciar sesión</h2>

            <form (ngSubmit)="onSubmit()" class="vstack gap-3">
              <div>
                <label class="form-label">Email</label>
                <input class="form-control" [(ngModel)]="email" name="email" type="email" required>
              </div>

              <div>
                <label class="form-label">Contraseña</label>
                <input class="form-control" [(ngModel)]="contrasena" name="contrasena" type="contrasena" required>
              </div>

              <button class="btn btn-primary w-100" type="submit" [disabled]="loading">Entrar</button>
            </form>

            <a routerLink="/registro" class="d-block text-center mt-3">Crear cuenta</a>
            <div *ngIf="error" class="alert alert-danger mt-3">{{ error }}</div>
          </div>
        </div>
      </div>
    </div>
  </div>`,
  styles:[`.card{max-width:380px;margin:4rem auto;padding:1.5rem;border:1px solid #eee;border-radius:12px} .error{color:#c62828}`]
})
export class LoginComponent implements OnInit {
  email = '';
  contrasena = '';     
  loading = false;
  error = '';

  constructor(private auth: AuthService, private router: Router) {}
  ngOnInit(){ if (this.auth.isLoggedIn) this.router.navigate(['/home']); }

  onSubmit(){
    if (this.loading) return;
    this.loading = true;
    this.error = '';

    // Enviamos la propiedad que espera el backend:
    this.auth.login({ email: this.email, contrasena: this.contrasena }).subscribe({
      next: () => this.router.navigate(['/home']),
      error: (e) => { this.error = e?.error?.error || 'Error de login'; this.loading = false; }
    });
  }
}
