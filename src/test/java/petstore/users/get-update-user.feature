Feature: Buscar usuario actualizado

  Background:
    * url baseUrl
    * def user = read('classpath:petstore/users/data/user.json')
    * def shortUuid = function(){ return java.util.UUID.randomUUID().toString().substring(0,8) }
    * def userId = function(){ return java.lang.System.currentTimeMillis() }
    * def uuid = shortUuid()
    * def username = 'userEW_' + uuid
    * def email = 'julian.casafus+' + userId() + '@gmail.com'
    * set user.id = userId()
    * set user.username = username
    * set user.email = email

    # Crear usuario
    Given path 'user'
    And request user
    When method post
    Then status 200

    * eval java.lang.Thread.sleep(12000)

    # Actualizar usuario
    * def updatedEmail = 'julianupdated+' + username + '@gmail.com'
    * def updatedFirstName = 'JulianUpdated' + username
    * set user.firstName = updatedFirstName
    * set user.email = updatedEmail

    Given path 'user', username
    And request user
    When method put
    Then status 200
    * eval java.lang.Thread.sleep(12000)

  Scenario: Buscar usuario actualizado
    Given path 'user', username
    When method get
    Then status 200
    And retry until response.username == username
    And match response.username == username
    And match response.email == updatedEmail
    And match response.firstName == updatedFirstName
