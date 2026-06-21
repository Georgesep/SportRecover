// Interacciones: menú responsivo y validación de formularios (español)
(function () {
	// Toggle del navbar (mobile)
	function setupNavbarToggle() {
		const toggles = document.querySelectorAll('.navbar__toggle');
		toggles.forEach(btn => {
			btn.addEventListener('click', () => {
				const navbar = btn.closest('.navbar');
				if (!navbar) return;
				navbar.classList.toggle('open');
				const expanded = navbar.classList.contains('open');
				btn.setAttribute('aria-expanded', expanded ? 'true' : 'false');
			});
		});
	}

	// Validaciones simples
	function isValidEmail(email) {
		return /\S+@\S+\.\S+/.test(email);
	}

	function createError(input, message) {
		clearError(input);
		input.classList.add('input-error');
		const err = document.createElement('div');
		err.className = 'error-message';
		err.textContent = message;
		input.parentNode.insertBefore(err, input.nextSibling);
	}

	function clearError(input) {
		input.classList.remove('input-error');
		const next = input.nextSibling;
		if (next && next.classList && next.classList.contains('error-message')) {
			next.remove();
		}
	}

	function attachInputClear(input) {
		input.addEventListener('input', () => clearError(input));
	}

	function setupRegisterValidation(form) {
		const name = form.querySelector('#name');
		const email = form.querySelector('#email');
		const password = form.querySelector('#password');
		const confirm = form.querySelector('#confirm_password');

		[name, email, password, confirm].forEach(i => i && attachInputClear(i));

		form.addEventListener('submit', (e) => {
			e.preventDefault();
			let ok = true;
			if (!name || name.value.trim().length < 3) {
				createError(name, 'Ingresa tu nombre completo (mínimo 3 caracteres)');
				ok = false;
			}
			if (!email || !isValidEmail(email.value)) {
				createError(email, 'Ingresa un correo válido');
				ok = false;
			}
			if (!password || password.value.length < 6) {
				createError(password, 'La contraseña debe tener al menos 6 caracteres');
				ok = false;
			}
			if (confirm && password && confirm.value !== password.value) {
				createError(confirm, 'Las contraseñas no coinciden');
				ok = false;
			}

			if (!ok) return;

			// Simulación de envío
			alert('Registro validado (simulación). Aquí podrías enviar los datos al servidor.');
			form.reset();
		});
	}

	function setupLoginValidation(form) {
		const email = form.querySelector('#email');
		const password = form.querySelector('#password');
		[email, password].forEach(i => i && attachInputClear(i));

		form.addEventListener('submit', (e) => {
			e.preventDefault();
			let ok = true;
			if (!email || !isValidEmail(email.value)) {
				createError(email, 'Ingresa un correo válido');
				ok = false;
			}
			if (!password || password.value.length < 6) {
				createError(password, 'La contraseña debe tener al menos 6 caracteres');
				ok = false;
			}
			if (!ok) return;
			alert('Inicio de sesión validado (simulación).');
			form.reset();
		});
	}

	function init() {
		setupNavbarToggle();
		const registerForm = document.querySelector('.register-form');
		if (registerForm) setupRegisterValidation(registerForm);
		const loginForm = document.querySelector('.login-form, .register-form');
		if (loginForm && loginForm.querySelector('#password') && loginForm.querySelector('#email')) {
			// If page has a login-like form, attach login validation
			setupLoginValidation(loginForm);
		}
	}

	document.addEventListener('DOMContentLoaded', init);
})();

