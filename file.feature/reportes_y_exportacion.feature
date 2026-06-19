Feature: Generación y exportación de informes clínicos e históricos
#US32: Generación de informe de progreso del paciente
  Scenario 1: Generación exitosa de informe de progreso
    Given que el fisioterapeuta accede al perfil de un paciente y selecciona "Generar informe"
    When configura el rango de fechas y las métricas que desea incluir
    Then el sistema genera un informe con las sesiones completadas, métricas de progreso, adherencia y evolución del paciente
    And permite descargar el informe en formato PDF
  Scenario 2: Generación de informe sin datos disponibles
    Given que el fisioterapeuta selecciona un rango de fechas sin actividad registrada
    When solicita generar el informe
    Then el sistema muestra el mensaje "No existen datos registrados en el período seleccionado"
    And sugiere seleccionar otro rango de fechas
#US42: Exportación del historial del paciente
  Scenario 1: Exportación exitosa del historial clínico
    Given que el fisioterapeuta accede al perfil de un paciente
    When selecciona la opción "Exportar historial" y confirma la acción
    Then el sistema genera un archivo con el historial clínico completo del paciente
    And permite descargarlo o compartirlo mediante correo electrónico
  Scenario 2: Exportación sin registros disponibles
    Given que el fisioterapeuta selecciona un rango de fechas sin información registrada
    When intenta exportar el historial
    Then el sistema muestra el mensaje "No hay datos disponibles para exportar"
    And ofrece la opción de modificar el rango de fechas seleccionado
