Feature: Obtener un usuario en PetStore

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

  Scenario: Obtener usuario exitosamente
    * configure retry = { count: 10, interval: 2000 }
    Given path 'user', user.username
    And retry until response.username == user.username
    When method get
    Then status 200
    And match response.username == user.username
    And match response.email == user.email
