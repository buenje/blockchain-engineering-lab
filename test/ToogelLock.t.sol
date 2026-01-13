// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ToggleLockContract {
    // State Variable für den Sperrzustand
    bool private isLocked = false; 

    // Die Adresse, die den Vertrag besitzt (für die Verwaltung)
    address public owner;

    // Ereignisse zur Protokollierung von Zustandsänderungen
    event LockedStatusChanged(bool newStatus);

    constructor() {
        owner = msg.sender;
    }

    // Modifier, um nur den Eigentümer zuzulassen
    modifier onlyOwner() {
        require(msg.sender == owner, "Nur der Eigentuemer darf diese Funktion aufrufen.");
        _; // Führt die eigentliche Funktion aus
    }

    // Modifier, um zu pruefen, ob der Vertrag NICHT gesperrt ist
    modifier notLocked() {
        require(isLocked == false, "Funktion ist gesperrt (Locked).");
        _;
    }

    // Funktion, die gesperrt werden soll
    function performCriticalAction() public notLocked returns (string memory) {
        // Hier passiert die wichtige Logik, z.B. eine Token-Überweisung
        return "Kritische Aktion erfolgreich ausgefuehrt.";
    }

    // Die Funktion zum Umschalten (Toggle) des Sperrzustands
    function toggleLock() public onlyOwner {
        isLocked = !isLocked; // Schaltet von true auf false, oder umgekehrt
        emit LockedStatusChanged(isLocked);
    }

    // Funktion zum Auslesen des aktuellen Zustands
    function getLockedStatus() public view returns (bool) {
        return isLocked;
         }
}