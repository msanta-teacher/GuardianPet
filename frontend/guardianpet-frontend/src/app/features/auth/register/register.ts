import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import { AuthService } from '../../../core/services/auth.service';

@Component({
  standalone: true,
  selector: 'app-register',
  imports: [CommonModule, FormsModule, RouterLink],
  template: `
  <div class="container py-5">
    <div class="row justify-content-center">
      <div class="col-12 col-sm-10 col-md-8 col-lg-6">
        <div class="card shadow-sm">
          <div class="card-body p-4">
            <h2 class="h4 mb-4 text-center">Crear cuenta</h2>

            <form (ngSubmit)="onSubmit()" class="vstack gap-3">
              <div>
                <label class="form-label">Cédula</label>
                <!-- usa text si puede tener ceros a la izquierda -->
                <input class="form-control" [(ngModel)]="cedula" name="cedula" type="text" required />
              </div>

              <div>
                <label class="form-label">Nombre</label>
                <input class="form-control" [(ngModel)]="nombre" name="nombre" required />
              </div>

              <div>
                <label class="form-label">Email</label>
                <input class="form-control" [(ngModel)]="email" name="email" type="email" required />
              </div>

              <div>
                <label class="form-label">Teléfono</label>
                <input class="form-control" [(ngModel)]="telefono" name="telefono" />
              </div>

              <div>
                <label class="form-label">Contraseña</label>
                <input class="form-control" [(ngModel)]="contrasena" name="contrasena" type="password" required />
              </div>

              <button class="btn btn-primary w-100" type="submit" [disabled]="loading">
                {{ loading ? 'Registrando…' : 'Registrarme' }}
              </button>
            </form>

            <a routerLink="/login" class="d-block text-center mt-3">Ya tengo cuenta</a>

            <div *ngIf="ok" class="alert alert-success mt-3">
              Cuenta creada, ahora inicia sesión
            </div>
            <div *ngIf="error" class="alert alert-danger mt-3">
              {{ error }}
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  `
})
export class RegisterComponent {
  // modelo
  cedula = '';
  nombre = '';
  email = '';
  telefono = '';
  contrasena = '';

  // estado UI
  loading = false;   // <- faltaba esta propiedad
  ok = false;
  error = '';

  constructor(private auth: AuthService, private router: Router) {}

  onSubmit() {
    if (this.loading) return;
    this.loading = true;
    this.ok = false;
    this.error = '';

    // Mapea 'contrasena' del front a 'contraseña' que espera el backend
    const payload: any = {
      cedula: this.cedula,
      nombre: this.nombre,
      email: this.email,
      telefono: this.telefono,
      contraseña: this.contrasena
    };

    this.auth.registro(payload).subscribe({
      next: () => {
        this.ok = true;
        this.loading = false;
        setTimeout(() => this.router.navigate(['/login']), 700);
      },
      error: (e) => {
        this.error = e?.error?.error || 'Error de registro';
        this.loading = false;
      }
    });
  }
}
