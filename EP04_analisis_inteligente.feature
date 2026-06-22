Feature: EP04–Análisis Inteligente de Documentos
  Como estudiante o investigador
  Quiero obtener resúmenes, palabras clave y citas relevantes de documentos
  Para comprender rápidamente su contenido y utilizarlo como soporte en mis investigaciones

  # User Story 13

  @AT-13 @US-13 @resumen
  Scenario: Resumen automático generado con un máximo de 300 palabras
    Given que un usuario solicita el resumen automático de un artículo o documento cargado
    When la IA finaliza el procesamiento del documento
    Then retorna un texto resumen de no más de 300 palabras

  @AT-13 @US-13 @resumen
  Scenario: Resumen redactado en tono académico neutral
    Given que el sistema genera el resumen automático de un documento
    When el usuario visualiza el resultado
    Then el texto está redactado en tono académico neutral sin incluir opiniones, sesgos ni lenguaje informal

  @AT-13 @US-13 @resumen
  Scenario: Resumen generado en el idioma del documento o en el configurado
    Given que el documento analizado está en inglés
    When el usuario solicita el resumen automático
    Then el sistema genera el resumen en el mismo idioma del documento o en español según la preferencia configurada por el usuario

  @AT-13 @US-13 @resumen
  Scenario: Resumen cubre los puntos principales del documento
    Given que el resumen automático es generado correctamente
    When el usuario lo lee
    Then el texto cubre los puntos principales del documento incluyendo objetivo, metodología, hallazgos y conclusión cuando apliquen

  @AT-13 @US-13 @resumen
  Scenario: Botón de copia al portapapeles disponible en el resumen generado
    Given que el usuario visualiza el resumen generado por la IA
    When desea utilizarlo en otro documento
    Then el sistema ofrece la opción de copiar el texto al portapapeles con un solo clic

  # User Story 14

  @AT-14 @US-14 @palabras-clave
  Scenario: Palabras clave presentadas como etiquetas en la interfaz
    Given que el usuario solicita la extracción de palabras clave de un documento
    When el algoritmo NLP finaliza el procesamiento
    Then retorna los términos centrales del documento presentados como etiquetas (tags) en la interfaz

  @AT-14 @US-14 @palabras-clave
  Scenario: Las etiquetas representan con precisión los temas principales del documento
    Given que el sistema extrae las palabras clave de un documento académico
    When el usuario visualiza los resultados
    Then las etiquetas representan con precisión los temas principales
    And no incluyen términos genéricos o irrelevantes

  @AT-14 @US-14 @palabras-clave
  Scenario: Términos técnicos especializados preservados en la extracción
    Given que el documento contiene términos técnicos específicos del área académica
    When el sistema extrae las palabras clave
    Then preserva los términos especializados sin simplificarlos incorrectamente

  @AT-14 @US-14 @palabras-clave
  Scenario: Etiqueta utilizada como criterio de búsqueda académica
    Given que el usuario visualiza las etiquetas generadas para un documento
    When hace clic en una de las etiquetas
    Then el sistema utiliza esa etiqueta como criterio de búsqueda en el módulo de búsqueda académica

  @AT-14 @US-14 @palabras-clave
  Scenario: Extracción de palabras clave completada sin degradar el rendimiento en documentos extensos
    Given que el documento analizado es extenso
    When el sistema extrae las palabras clave
    Then el proceso se completa sin superar el tiempo de espera definido
    And sin degradar el rendimiento general de la plataforma

  # User Story 15

  @AT-15 @US-15 @citas-relevantes 
  Scenario: Citas extraídas con referencia al número de página original
    Given que el usuario solicita la extracción de citas relevantes de un PDF
    When el sistema finaliza el análisis del documento
    Then retorna las citas identificadas con referencia explícita al número de página del PDF original

  @AT-15 @US-15 @citas-relevantes
  Scenario: Cada cita muestra texto, número de página y autor referenciado
    Given que el sistema extrae citas del documento analizado
    When el usuario visualiza los resultados
    Then cada cita muestra el texto original, el número de página y el autor referenciado dentro del texto cuando esté disponible

  @AT-15 @US-15 @citas-relevantes
  Scenario: Citas en múltiples idiomas respetadas en su idioma original
    Given que el PDF analizado contiene citas en múltiples idiomas
    When el sistema las extrae
    Then las presenta respetando el idioma original sin alterar el contenido de ninguna cita

  @AT-15 @US-15 @citas-relevantes 
  Scenario: Notificación cuando no se encuentran citas extraíbles en el documento
    Given que el sistema no puede identificar citas formales en un documento
    When completa el análisis de extracción
    Then notifica al usuario que no se encontraron citas extraíbles bajo los patrones reconocidos

  @AT-15 @US-15 @citas-relevantes 
  Scenario: Cita extraída añadida directamente a la biblioteca de referencias
    Given que el usuario visualiza las citas extraídas de un documento
    When selecciona una cita específica
    Then el sistema ofrece la opción de agregarla directamente a su biblioteca de referencias con la fuente asociada
