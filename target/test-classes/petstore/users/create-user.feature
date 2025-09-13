Feature: Crear un usuario en PetStore


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

  Scenario: Crear usuario exitosamente

    Given path 'user'
    And request user
    When method post
    Then status 200
    And match response.message == user.id.toString()
    * def result = { id: userId, username: username }