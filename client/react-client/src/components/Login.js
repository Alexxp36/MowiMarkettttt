import React, { useState } from 'react';

function Login({ onSwitchToRegister }) {
  const [formData, setFormData] = useState({
    email: '',
    password: ''
  });

  const [errors, setErrors] = useState({});

  // Validación de email
  const validateEmail = (email) => {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!email) {
      return 'El correo es requerido';
    }
    if (!emailRegex.test(email)) {
      return 'Ingresa un correo válido';
    }
    return '';
  };

  // Validación de contraseña
  const validatePassword = (password) => {
    if (!password) {
      return 'La contraseña es requerida';
    }
    return '';
  };

  // Manejar cambios en los inputs
  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData({
      ...formData,
      [name]: value
    });

    // Limpiar error al escribir
    if (errors[name]) {
      setErrors({
        ...errors,
        [name]: ''
      });
    }
  };

  // Manejar envío del formulario
  const handleSubmit = (e) => {
    e.preventDefault();

    // Validar todos los campos
    const newErrors = {
      email: validateEmail(formData.email),
      password: validatePassword(formData.password)
    };

    setErrors(newErrors);

    // Verificar si hay errores
    const hasErrors = Object.values(newErrors).some(error => error !== '');

    if (!hasErrors) {
      console.log('Login exitoso:', formData);
      alert('¡Inicio de sesión exitoso! (Conectar con Django backend)');

      // Aquí iría la llamada al backend de Django
      // fetch('/api/login', { method: 'POST', body: JSON.stringify(formData) })
    }
  };

  // Función para cuentas demo
  const handleDemoLogin = (type) => {
    console.log(`Iniciando sesión como ${type}`);
    alert(`Iniciando sesión como ${type}`);
  };

  return (
    <form onSubmit={handleSubmit} className="auth-form">
      <div className="form-group">
        <label>Correo Electrónico</label>
        <input
          type="email"
          name="email"
          value={formData.email}
          onChange={handleChange}
          placeholder="tu@email.com"
          className={errors.email ? 'input-error' : ''}
        />
        {errors.email && <span className="error-text">{errors.email}</span>}
      </div>

      <div className="form-group">
        <label>Contraseña</label>
        <input
          type="password"
          name="password"
          value={formData.password}
          onChange={handleChange}
          placeholder="Tu contraseña"
          className={errors.password ? 'input-error' : ''}
        />
        {errors.password && <span className="error-text">{errors.password}</span>}
      </div>

      <button type="submit" className="submit-button">
        Iniciar Sesión
      </button>

      <a href="#" className="forgot-password">
        ¿Olvidaste tu contraseña?
      </a>

      <div className="demo-section">
        <p className="demo-title">Cuentas de demostración:</p>
        <button
          type="button"
          className="demo-button"
          onClick={() => handleDemoLogin('Cliente')}
        >
          Entrar como Cliente
        </button>
        <button
          type="button"
          className="demo-button"
          onClick={() => handleDemoLogin('Administrador')}
        >
          Entrar como Administrador
        </button>
      </div>
    </form>
  );
}

export default Login;
