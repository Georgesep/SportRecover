Feature: Comunicación entre usuarios, notificaciones y programación de sesiones
#US14: Chat de consulta con fisioterapeuta
  Scenario 1: Envío y recepción de mensajes en el chat
    Given que el deportista accede al módulo de chat con su fisioterapeuta asignado
    When redacta un mensaje y presiona "Enviar"
    Then el mensaje se envía en tiempo real
    And el deportista puede ver el estado del mensaje (enviado, entregado, leído)
  Scenario 2: Recepción de respuesta del fisioterapeuta
    Given que el fisioterapeuta responde al mensaje del deportista
    When la respuesta es enviada
    Then el deportista recibe una notificación push
    And puede ver el mensaje en el hilo del chat
#US15: Modificación de horario de sesiones
  Scenario 1: Configuración exitosa del horario de sesiones
    Given que el deportista accede a la sección "Configurar horario"
    When selecciona los días y horas preferidos para sus sesiones
    And presiona "Guardar horario"
    Then el sistema actualiza el calendario de sesiones
    And programa las notificaciones de recordatorio en los nuevos horarios
  Scenario 2: Conflicto de horario con sesión ya registrada
    Given que el deportista intenta configurar un horario que coincide con una sesión ya completada del día
    When guarda el nuevo horario
    Then el sistema muestra una advertencia indicando el conflicto
    And solicita confirmación antes de sobrescribir la programación
#US34: Comunicación por chat con pacientes
  Scenario 1: Envío de mensaje al paciente
    Given que el fisioterapeuta accede al chat de un paciente
    When redacta y envía un mensaje
    Then el mensaje se entrega en tiempo real al paciente
    And el fisioterapeuta puede ver el estado del mensaje (enviado, entregado, leído)
  Scenario 2: Envío de archivo adjunto en el chat
    Given que el fisioterapeuta desea enviar una imagen o PDF de referencia al paciente
    When adjunta el archivo en el chat y presiona "Enviar"
    Then el sistema procesa y entrega el archivo al paciente
    And el paciente puede visualizarlo o descargarlo desde el chat
#US38: Programación de sesión de revisión virtual
  Scenario 1: Programación exitosa de sesión virtual
    Given que el fisioterapeuta accede al calendario del paciente
    When selecciona una fecha y hora disponibles y presiona "Agendar sesión virtual"
    Then el sistema registra la sesión en el calendario del paciente y del fisioterapeuta
    And envía una notificación de recordatorio a ambas partes con el enlace de la sesión
  Scenario 2: Reprogramación de sesión virtual
    Given que el fisioterapeuta necesita cambiar la fecha de una sesión virtual agendada
    When selecciona la sesión y elige una nueva fecha y hora
    Then el sistema actualiza el registro
    And notifica al paciente sobre el cambio con la nueva fecha y hora
#US53: Búsqueda y selección de fisioterapeuta
  Scenario 1: Búsqueda y selección de fisioterapeuta exitosa
    Given que el deportista accede a la sección "Buscar fisioterapeuta"
    And el sistema muestra un listado de profesionales disponibles con nombre, especialidad, calificación y modalidad de atención (chat o videollamada)
    When el deportista aplica filtros por especialidad o disponibilidad y selecciona un profesional
    Then el sistema muestra el perfil completo del fisioterapeuta con su experiencia y horarios disponibles
    And permite al deportista enviar una solicitud de atención
  Scenario 2: Búsqueda sin resultados disponibles
    Given que el deportista realiza una búsqueda con filtros muy específicos que no coinciden con ningún profesional disponible
    When el sistema procesa la búsqueda
    Then muestra el mensaje "No encontramos fisioterapeutas disponibles con esos criterios"
    And sugiere ampliar los filtros o intentar en otro horario
