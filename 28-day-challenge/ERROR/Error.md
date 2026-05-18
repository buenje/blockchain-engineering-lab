# Error Logbook — 28-Day Solidity Challenge

## Wiederkehrende Fehler
| Fehler | Zuerst gesehen | Zuletzt gesehen |
|--------|----------------|-----------------|
| SPDX mit Semikolon oder fehlendem Leerzeichen | Tag 1 | Tag 6 |
| `return` statt `returns (Typ)` | Tag 1 | Tag 2 |

## Tag 1 — SimpleStorage
- SPDX-Header Tippfehler (Semikolon am Ende)
- Fehlende schließende geschweifte Klammer
- `return` statt `returns (uint256)` im Funktionskopf

## Tag 2 — MemoCalldata
- SPDX Semikolon (wiederholt)
- `^0.8.024` ungültige Semver → korrekt: `^0.8.0`
- `string name` ohne Data Location → korrekt: `string memory name`
- `return` statt `returns (string memory)` (wiederholt!)
- `return string name` → korrekt: nur `return name`

## Tag 3 — Mapping
- SPDX Leerzeichen fehlt
- `SetAddress` Großbuchstabe → korrekt: `setAddress`

## Tag 4 — Struct
- `/ SPDX` statt `// SPDX` (einmaliger Rückfall)
- Struct-Instanz (`Antrag public antrag`) Konzept unklar — Vorlage vs. Instanz
- Setter-Körper: `status.id=status` statt `antrag.id = id`

## Tag 5 — Enum
- Semikolon nach letztem Enum-Wert (`Completed;`) — falsch
- `status public currentStatus` überflüssig — Mapping reicht
- `status` statt `statuses` verwechselt — Variablenname vs. Typ
- SPDX Leerzeichen fehlt wieder (`//SPDX` statt `// SPDX`)

## Tag 6 — Modifier
- SPDX Leerzeichen vor Doppelpunkt: `Identifier :MIT`
- Contract ohne Namen geschrieben
- Constructor nicht korrekt geschlossen
- `_;` im Modifier vergessen — Pflicht
- `public view` bei schreibender Funktion — `view` entfernen
- Modifier-Syntax insgesamt unsicher — mehr Wiederholung nötig

## Tag 7 — Events
- Event-Syntax unklar: Parameter gehören in die Event-Definition, nicht als State Variables darunter
- `emit` und `enum` verwechselt — emit = aussenden, enum = Aufzählung
- `address applicant` als Funktionsparameter statt `msg.sender` — Adresse kommt automatisch
- Grundprinzip Event/emit nicht verstanden — viel KI-Hilfe nötig
- `indexed` selbst hinzugefügt und korrekt verwendet — positiv
