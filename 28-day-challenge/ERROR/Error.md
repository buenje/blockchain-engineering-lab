# Error Logbook — 28-Day Solidity Challenge

## Wiederkehrende Fehler
| Fehler | Zuerst gesehen | Zuletzt gesehen |
|--------|----------------|-----------------|
| SPDX mit Semikolon | Tag 1 | Tag 2 |
| `return` statt `returns (Typ)` | Tag 1 | Tag 2 |

## Tag 1 — SimpleStorage
- SPDX-Header Tippfehler (Semikolon am Ende)
- Fehlende schließende geschweifte Klammer
- `return` statt `returns (uint256)` im Funktionskopf

## Tag 2 — MemoCalldata
- SPDX Semikolon (wiederholt)
- `^0.8.024` ungültige Semver → korrekt: `^0.8.0`
- `string name` ohne Data Location → korrekt: `string memory name`
- `return` statt `

## Tag 4 — Struct
- `/ SPDX` statt `// SPDX` (einmaliger Rückfall)
- Struct-Instanz (`Antrag public antrag`) Konzept unklar — Vorlage vs. Instanz
- Setter-Körper: `status.id=status` statt `antrag.id = id`

## Tag 5 — Enum
- Semikolon nach letztem Enum-Wert (`Completed;`) — falsch, kein Semikolon
- `status public currentStatus` überflüssig — Mapping reicht
- Setter-Körper Syntax unklar am Anfang
- SPDX Leerzeichen fehlt wieder (`//SPDX` statt `// SPDX`)
- `status` statt `statuses` verwechselt — Variablenname vs. Typ
- Contract ohne Namen geschrieben
- Constructor nicht korrekt geschlossen
- `_;` im Modifier vergessen — Pflicht, sonst wird Funktion nie ausgeführt
- Modifier-Syntax insgesamt unsicher — mehr Wiederholung nötig
