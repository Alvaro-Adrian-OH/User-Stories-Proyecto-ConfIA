Feature: EP03–Gestión de Referencias Bibliográficas
  Como estudiante o investigador
  Quiero generar, almacenar, editar y exportar referencias bibliográficas
  Para organizarlas y utilizarlas en mis documentos académicos sin errores de citación

  # User Story 09

  @AT-09 @US-09 @citas-apa 
  Scenario: Cita APA generada con sangría francesa visual
    Given que un usuario solicita generar una cita APA de una fuente validada
    When el sistema procesa la solicitud
    Then retorna la cita con formato APA 7ma edición
    And aplica sangría francesa visual en la presentación de la cita

  @AT-09 @US-09 @citas-apa 
  Scenario: Título de revista en cursiva en cita APA de artículo
    Given que la fuente validada es un artículo de revista académica
    When se genera la cita en formato APA
    Then el título de la revista aparece en cursiva según la normativa APA vigente

  @AT-09 @US-09 @citas-apa 
  Scenario: Cita APA de libro incluye editorial, ciudad y año
    Given que la fuente validada es un libro
    When se genera la cita en formato APA
    Then el título del libro aparece en cursiva
    And la cita incluye la editorial, ciudad y año de publicación

  @AT-09 @US-09 @citas-apa 
  Scenario: Cita APA generada correctamente cuando faltan campos opcionales
    Given que la fuente carece de algún campo bibliográfico obligatorio como autor o año
    When el sistema genera la cita APA
    Then aplica la convención APA correspondiente (n.d. para sin fecha o s.f. en español)
    And informa al usuario del campo faltante detectado

  @AT-09 @US-09 @citas-apa 
  Scenario: Botón de copiado al portapapeles disponible en la cita generada
    Given que se ha generado una cita APA correctamente
    When el usuario visualiza el resultado en pantalla
    Then el sistema ofrece un botón de copiado al portapapeles para facilitar su uso en documentos externos

  # User Story 10

  @AT-10 @US-10 @biblioteca 
  Scenario: Referencia guardada listada correctamente en la biblioteca personal
    Given que un usuario guarda una referencia validada en su cuenta
    When accede a su biblioteca personal de referencias
    Then el sistema lista correctamente la referencia almacenada con título, autores y año

  @AT-10 @US-10 @biblioteca 
  Scenario: Biblioteca con múltiples referencias ofrece búsqueda y filtrado
    Given que un usuario tiene múltiples referencias guardadas en su biblioteca
    When navega por la vista de la biblioteca
    Then el sistema presenta las referencias ordenadas
    And ofrece opciones de búsqueda o filtrado para encontrar entradas específicas

  @AT-10 @US-10 @biblioteca
  Scenario: Advertencia al intentar guardar una referencia duplicada
    Given que un usuario intenta guardar una referencia que ya existe en su biblioteca
    When el sistema detecta la coincidencia
    Then notifica al usuario de la duplicidad
    And ofrece la opción de guardar como nueva entrada o cancelar la acción

  @AT-10 @US-10 @biblioteca 
  Scenario: Referencias accesibles desde cualquier dispositivo
    Given que un usuario accede a la plataforma desde un dispositivo distinto al habitual
    When inicia sesión con sus credenciales
    And accede a su biblioteca de referencias
    Then el sistema recupera todas sus referencias almacenadas sin pérdida de datos

  @AT-10 @US-10 @biblioteca 
  Scenario: Estado vacío con mensaje orientativo en biblioteca sin referencias
    Given que la biblioteca del usuario está vacía
    When accede a la vista de la biblioteca
    Then el sistema muestra un estado vacío con un mensaje orientativo
    And ofrece un acceso directo para iniciar la validación de una nueva fuente

  # User Story 11

  @AT-11 @US-11 @gestion-referencias
  Scenario: Formulario modal pre-cargado al editar una referencia
    Given que un usuario desea corregir los datos de una referencia guardada en su biblioteca
    When hace clic en la opción de editar de esa referencia
    Then el sistema abre un formulario modal con los campos pre-cargados y editables

  @AT-11 @US-11 @gestion-referencias 
  Scenario: Cambios guardados desde modal se reflejan inmediatamente en la biblioteca
    Given que el usuario modifica los datos en el formulario modal de edición
    When guarda los cambios correctamente
    Then el sistema refleja inmediatamente los nuevos datos en la lista de la biblioteca

  @AT-11 @US-11 @gestion-referencias
  Scenario: Confirmación requerida antes de eliminar una referencia
    Given que un usuario desea eliminar una referencia de su biblioteca
    When selecciona la opción de eliminación
    Then el sistema solicita confirmación antes de proceder con el borrado definitivo

  @AT-11 @US-11 @gestion-referencias
  Scenario: Referencia eliminada definitivamente tras confirmación del usuario
    Given que el usuario confirma la eliminación de una referencia
    When el sistema procesa la acción
    Then la referencia desaparece de la lista de la biblioteca
    And se elimina permanentemente de la base de datos

  @AT-11 @US-11 @gestion-referencias
  Scenario: Guardado del modal bloqueado si hay campos obligatorios vacíos
    Given que el usuario intenta guardar el formulario modal de edición con campos obligatorios vacíos
    When intenta confirmar la edición
    Then el sistema bloquea el guardado
    And señala visualmente los campos requeridos que están vacíos

  # User Story 12

  @AT-12 @US-12 @exportar
  Scenario: Exportación exitosa de referencias en el formato seleccionado
    Given que un usuario tiene referencias almacenadas en su biblioteca y solicita la exportación
    When selecciona el formato deseado como .bib o .docx
    Then el sistema genera el archivo descargable con las referencias en el formato correcto

  @AT-12 @US-12 @exportar
  Scenario: Archivo exportado en formato .bib reconocido por Zotero
    Given que el usuario exporta la bibliografía en formato compatible con Zotero (.bib)
    When importa el archivo generado en Zotero
    Then las referencias son reconocidas y cargadas correctamente sin errores de importación

  @AT-12 @US-12 @exportar
  Scenario: Archivo exportado compatible con Microsoft Word en formato APA
    Given que el usuario exporta la bibliografía para uso en Microsoft Word
    When abre el archivo exportado en Word
    Then las referencias aparecen con formato APA correspondiente y listas para insertar en documentos

  @AT-12 @US-12 @exportar
  Scenario: Exportación bloqueada cuando la biblioteca está vacía
    Given que el usuario solicita exportar su bibliografía
    When el sistema detecta que no hay referencias almacenadas
    Then muestra un mensaje informativo indicando que debe agregar al menos una referencia antes de exportar

  @AT-12 @US-12 @exportar
  Scenario: Nombre del archivo exportado incluye datos identificadores
    Given que el sistema genera el archivo de exportación de la bibliografía
    When el usuario descarga el archivo
    Then el nombre del archivo incluye el nombre del usuario o la fecha de generación para facilitar su identificación