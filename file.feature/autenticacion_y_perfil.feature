Feature: Registro, autenticación y gestión de perfil de usuarios

#US01: Registro de cuenta como deportista

#Scenario 1: Registro exitoso de deportista

    Given que el deportista se encuentra en la pantalla de registro
    And el sistema muestra los campos: nombre, correo, contraseña, tipo de lesión y fecha de lesión
    When el deportista completa todos los campos obligatorios y presiona "Crear cuenta"
    Then el sistema valida los datos ingresados
    And crea la cuenta exitosamente
    And redirige al deportista a su perfil inicial con el mensaje "Cuenta creada con éxito"

#Scenario 2: Registro fallido por correo duplicado
    Given que el deportista intenta registrarse con un correo ya existente
    When presiona "Crear cuenta"
    Then el sistema muestra el mensaje de error "El correo ya está registrado"
    And no permite continuar hasta ingresar un correo diferente

#US02: Inicio de sesión

#Scenario 1: Inicio de sesión exitoso

    Given que el deportista se encuentra en la pantalla de inicio de sesión
    When ingresa su correo y contraseña correctos y presiona "Iniciar sesión"
    Then el sistema autentica las credenciales
    And redirige al deportista al dashboard principal con su nombre de bienvenida

#Scenario 2: Inicio de sesión fallido por credenciales incorrectas
    Given que el deportista ingresa una contraseña incorrecta
    When presiona "Iniciar sesión"
    Then el sistema muestra el mensaje "Credenciales incorrectas"
    And no permite el acceso a la aplicación

#US21: Gestión de perfil del deportista

#Scenario 1: Actualización exitosa del perfil

    Given que el deportista accede a "Mi perfil"
    When modifica campos como peso, talla o deporte practicado y presiona "Guardar cambios"
    Then el sistema actualiza la información
    And confirma los cambios con el mensaje "Perfil actualizado correctamente"

#Scenario 2: Validación de datos fuera de rango

    Given que el deportista ingresa un valor de peso fuera del rango permitido (por ejemplo, 0 kg o 500 kg)
    When intenta guardar el perfil
    Then el sistema muestra el mensaje de validación "Ingresa un valor de peso válido entre 30 y 250 kg"
    And no guarda los cambios hasta ingresar un valor correcto

#US26: Registro de cuenta como fisioterapeuta

#Scenario 1: Registro exitoso de fisioterapeuta

    Given que el fisioterapeuta accede al formulario de registro profesional
    When completa nombre, correo, número de colegiatura, especialidad y contraseña y presiona "Registrarse como profesional"
    Then el sistema valida las credenciales
    And crea la cuenta con rol de fisioterapeuta
    And envía un correo de verificación de cuenta

#Scenario 2: Registro fallido por número de colegiatura inválido

    Given que el fisioterapeuta ingresa un número de colegiatura en formato incorrecto
    When presiona "Registrarse"
    Then el sistema muestra el mensaje "Número de colegiatura inválido"
    And no permite continuar hasta corregir el campo
