// Código para Processing

import processing.serial.*;

Serial myPort;  // El objeto de comunicación serial
PImage imagen1, imagen2;  // Las dos imágenes a mostrar

void setup() {
  size(500, 730);  // Tamaño de la ventana de visualización
  
  // Cargar las imágenes
  image1 = loadImage("imagen1.jpg");  // Asegúrate de tener 'imagen1.jpg' en la carpeta 'data'
  image2 = loadImage("imagen2.jpg");  // Asegúrate de tener 'imagen2.jpg' en la carpeta 'data'

  // Configurar el puerto serial
  String portName = Serial.list()[0];  // Asegúrate de seleccionar el puerto correcto
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  if (myPort.available() > 0) {
    String input = myPort.readStringUntil('\n');  // Lee la línea del puerto serial
    if (input != null) {
      input = trim(input);  // Elimina espacios en blanco al principio y al final
      int lightLevel = int(input);  // Convierte la entrada a un entero

      // Mostrar una imagen en función del valor del sensor de luz
      if (lightLevel > 500) {  // Ajusta el umbral según sea necesario
        image(image1, 0, 0, width, height);
      } else {
        image(image2, 0, 0, width, height);
      }
    }
  }
}
