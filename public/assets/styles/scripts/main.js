(function () {

    // --- Navbar toggle (móvil) ---
    function setupNavbarToggle() {
        const toggles = document.querySelectorAll('.barra-nav__boton');
        toggles.forEach(btn => {
            btn.addEventListener('click', () => {
                const barra-nav = btn.closest('.barra-nav');
                if (!barra-nav) return;
                barra-nav.classList.toggle('abierto');
                btn.setAttribute('aria-expanded', barra-nav.classList.contains('abierto') ? 'true' : 'false');
            });
        });
    }

    // --- Toggle mostrar/ocultar contraseña ---
    function setupPasswordToggle() {
        const toggleBtns = document.querySelectorAll('.contrasena__boton');
        toggleBtns.forEach(btn => {
            btn.addEventListener('click', () => {
                const wrapper = btn.closest('.contrasena__contenedor');
                const input = wrapper ? wrapper.querySelector('input[type="password"], input[type="text"]') : null;
                if (!input) return;
                const isPassword = input.type === 'password';
                input.type = isPassword ? 'text' : 'password';
                btn.setAttribute('aria-label', isPassword ? 'Ocultar contraseña' : 'Mostrar contraseña');
            });
        });
    }

    // --- Validaciones ---
    function isValidEmail(email) {
        return /\S+@\S+\.\S+/.test(email);
    }

    function createError(input, message) {
        clearError(input);
        input.classList.add('entrada-error');
        const err = document.createElement('div');
        err.className = 'mensaje-error';
        err.style.cssText = 'color:#d32f2f;font-size:0.85rem;margin-top:0.25rem;';
        err.textContent = message;
        input.closest('.contrasena__contenedor')
            ? input.closest('.contrasena__contenedor').insertAdjacentElement('afterend', err)
            : input.insertAdjacentElement('afterend', err);
    }

    function clearError(input) {
        input.classList.remove('entrada-error');
        const wrapper = input.closest('.contrasena__contenedor') || input;
        const next = wrapper.nextElementSibling;
        if (next && next.classList.contains('mensaje-error')) next.remove();
    }

    function attachInputClear(input) {
        input.addEventListener('input', () => clearError(input));
    }

    // --- Formulario de registro ---
    function setupRegisterValidation(form) {
        const name     = form.querySelector('#name');
        const email    = form.querySelector('#email');
        const password = form.querySelector('#password');

        [name, email, password].forEach(i => i && attachInputClear(i));

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
            if (!password || password.value.length < 8) {
                createError(password, 'La contraseña debe tener al menos 8 caracteres');
                ok = false;
            }
            if (!ok) return;

            alert('¡Registro exitoso! (simulación). Aquí se enviarían los datos al servidor.');
            form.reset();
        });
    }

    // --- Formulario de login ---
    function setupLoginValidation(form) {
        const email    = form.querySelector('#email');
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

            alert('¡Inicio de sesión exitoso! (simulación).');
            form.reset();
        });
    }

    // --- Init ---
    function init() {
        setupNavbarToggle();
        setupPasswordToggle();

        const registerForm = document.querySelector('#registerForm');
        if (registerForm) setupRegisterValidation(registerForm);

        const loginForm = document.querySelector('#loginForm');
        if (loginForm) setupLoginValidation(loginForm);
    }

    document.addEventListener('DOMContentLoaded', init);
})();
