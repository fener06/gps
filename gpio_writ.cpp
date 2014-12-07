// WiringPi-Api einbinden
#include <wiringPi.h>

// C-Standardbibliothek einbinden
#include <stdio.h>
int i = 0;
int main() {

  // Starte die WiringPi-Api (wichtig)
  if (wiringPiSetup() == -1)
    return 1;

  // Schalte GPIO 17 (=WiringPi Pin 0) auf Ausgang
  // Wichtig: Hier wird das WiringPi Layout verwendet (Tabelle oben)
  pinMode(0, OUTPUT);

  // Dauerschleife
  while(i<5) {
    // LED an
    digitalWrite(0, 1);

    // Warte 100 ms
    delay(100);
    i++;
    // LED aus
    digitalWrite(0, 0);

    // Warte 100 ms
    delay(100);
  }
}
