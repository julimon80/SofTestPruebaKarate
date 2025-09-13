package petstore.users;

import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.AfterEach;

class UsersRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run().relativeTo(getClass()); // corre todos los features en esta carpeta
    }

    @AfterEach
    void waitAfterScenario() throws InterruptedException {
        System.out.println("Esperando 2 segundos...");
        Thread.sleep(2000);
    }

}
