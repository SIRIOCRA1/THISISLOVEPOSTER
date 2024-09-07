// Código para Arduino Esplora

#include <Esplora.h>  // Importa la librería Esplora

// Definir el umbral de luz para decidir cuándo mostrar cada imagen
const int THRESHOLD = 500;  // Ajusta este valor según tus necesidades

void setup() {
  Serial.begin(9600);  // Inicia la comunicación serial a 9600 baudios
}

void loop() {
  int lightLevel = Esplora.readLightSensor();  // Lee el valor del sensor de luz

  // Enviar el valor del sensor al puerto serial
  Serial.println(lightLevel);

  delay(100);  // Espera 100 ms antes de leer nuevamente
}
