Feature: Actualizar un usuario en PetStore


  Background:
    * url baseUrl
    * def user = read('classpath:petstore/users/data/user.json')
    * def shortUuid = function(){ return java.util.UUID.randomUUID().toString().substring(0,8) }
    * def userId = function(){ return java.lang.System.currentTimeMillis()}
    * def uuid = shortUuid()
    * def username = 'userEW_' + uuid
    * def email = 'julian.casafus+' + userId() + '@gmail.com'
    * set user.id = userId()
    * set user.username = username
    * set user.email = email


    # Primero crear el usuario para poder hacer el GET
    Given path 'user'
    And request user
    When method post
    Then status 200
    * eval java.lang.Thread.sleep(12000)

  Scenario: Actualizar usuario
    * set user.firstName = 'JulianUpdated' + username
    * set user.email = 'julianupdated+' + username + '@gmail.com'
    Given path 'user', username
    And request user
    When method put
    Then status 200