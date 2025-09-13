// karate-config.js

function fn() {
  var config = {
    baseUrl: 'https://petstore.swagger.io/v2'
  };

  // Esto es una buena práctica para que puedas acceder a 'env' en el futuro
  var env = karate.env;
  if (!env) {
    env = 'dev';
  }
  config.env = env;

  // Lógica de ambiente (headers, etc.)
  if (config.env == 'dev') {
    karate.configure('headers', { api_key: 'special-key' });
  }

  // Llama a la feature de creación de usuario para obtener el ID y el nombre
  var result = karate.callSingle('classpath:petstore/users/create-user.feature', config);

  // Asigna directamente las variables de la respuesta al objeto de configuración
  // Esto hace que userId y username estén disponibles en todas las features
  config.userId = result.response.id;
  config.username = result.response.username;

  // El objeto 'config' ya está completo y listo para ser usado
  return config;
}