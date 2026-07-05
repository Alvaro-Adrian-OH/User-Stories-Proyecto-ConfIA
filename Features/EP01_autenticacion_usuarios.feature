Feature: EP01-Autenticación y Gestión de Usuarios
  Como usuario de ConfIA
  Quiero poder registrarme, iniciar sesión y gestionar mi perfil
  Para acceder de forma segura a mis análisis y referencias bibliográficas

  # User Story 01

  @AT-01 @US-01 @registro
  Scenario: Registro exitoso con datos válidos
    Given que un nuevo usuario accede al formulario de registro
    When completa todos los campos requeridos con datos válidos y una contraseña de al menos 8 caracteres
    Then el sistema crea la cuenta exitosamente
    And redirige al usuario al panel principal

  @AT-01 @US-01 @registro
  Scenario: Registro rechazado por contraseña demasiado corta
    Given que un usuario intenta registrarse en ConfIA
    When ingresa una contraseña con menos de 8 caracteres
    Then el sistema rechaza el formulario
    And muestra un mensaje de error indicando el requisito mínimo de longitud de la contraseña

  @AT-01 @US-01 @registro
  Scenario: El JWT generado al registrarse expira en 24 horas
    Given que un usuario completa el registro correctamente
    When el sistema genera el token de autenticación JWT
    Then el token tiene una vigencia máxima de 24 horas antes de expirar

  @AT-01 @US-01 @registro @negativo
  Scenario: Registro rechazado por correo duplicado
    Given que un usuario intenta registrarse con un correo electrónico ya existente en el sistema
    When envía el formulario de registro
    Then el sistema muestra un mensaje de error indicando que el correo ya está en uso

  @AT-01 @US-01 @registro @negativo
  Scenario: Registro bloqueado por campos obligatorios vacíos
    Given que un usuario deja campos obligatorios vacíos en el formulario de registro
    When intenta enviar el formulario
    Then el sistema bloquea el envío
    And resalta visualmente los campos faltantes

  #User Story 02

  @AT-02 @US-02 @login
  Scenario: Inicio de sesión exitoso con credenciales correctas
    Given que un usuario registrado ingresa su correo y contraseña correctos en el formulario de inicio de sesión
    When envía las credenciales
    Then el sistema autentica al usuario
    And genera un JWT con vigencia de 24 horas
    And redirige al usuario al dashboard

  @AT-02 @US-02 @login
  Scenario: Inicio de sesión rechazado por contraseña incorrecta
    Given que un usuario registrado ingresa su correo correcto pero una contraseña incorrecta
    When intenta iniciar sesión
    Then el sistema rechaza el acceso
    And muestra un mensaje de error genérico sin revelar si el correo existe o no

  @AT-02 @US-02 @login
  Scenario: Inicio de sesión rechazado por contraseña menor a 8 caracteres
    Given que un usuario ingresa una contraseña con menos de 8 caracteres en el campo de inicio de sesión
    When envía el formulario
    Then el sistema bloquea el intento
    And notifica el incumplimiento del requisito mínimo de longitud

  @AT-02 @US-02 @login
  Scenario: Sesión expirada tras 24 horas invalida el JWT
    Given que el JWT de un usuario ha expirado después de 24 horas
    When el usuario intenta realizar una operación autenticada
    Then el sistema retorna un error de autorización
    And solicita que el usuario inicie sesión nuevamente

  @AT-02 @US-02 @login
  Scenario: Inicio de sesión rechazado por correo no registrado
    Given que un usuario intenta iniciar sesión con un correo no registrado en el sistema
    When envía el formulario de inicio de sesión
    Then el sistema muestra un mensaje de error indicando credenciales inválidas
    And no especifica cuál campo es el erróneo

  # User Story 03

  @AT-03 @US-03 @perfil
  Scenario: Visualización correcta de datos del perfil
    Given que un usuario autenticado accede a la pantalla de perfil
    When la vista se carga correctamente
    Then el sistema muestra su nombre, carrera y ciclo actual almacenados en la base de datos

  @AT-03 @US-03 @perfil
  Scenario: Actualización inmediata del perfil con datos válidos
    Given que un usuario autenticado edita su nombre, carrera o ciclo en el formulario de perfil
    When guarda los cambios con datos válidos
    Then el sistema persiste la actualización en la base de datos de forma inmediata
    And refleja los nuevos datos en la interfaz sin recargar la página

  @AT-03 @US-03 @perfil
  Scenario: Guardado de perfil bloqueado por campos obligatorios vacíos
    Given que un usuario intenta guardar cambios en el perfil con campos obligatorios vacíos
    When confirma la acción de guardado
    Then el sistema bloquea el guardado
    And señala visualmente los campos requeridos que están vacíos

  @AT-03 @US-03 @perfil
  Scenario: Notificación de éxito al actualizar el perfil
    Given que un usuario autenticado actualiza su información de perfil con datos válidos
    When los cambios se guardan correctamente
    Then el sistema muestra una notificación de éxito al usuario

  @AT-03 @US-03 @perfil
  Scenario: Actualización de correo rechazada por duplicidad
    Given que un usuario intenta actualizar su correo electrónico a uno ya registrado por otro usuario
    When envía el formulario de actualización
    Then el sistema rechaza el cambio
    And muestra un mensaje de error indicando duplicidad de correo electrónico
