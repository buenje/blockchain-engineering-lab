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

## Tag 8 — Inheritance
- `uint256 indexed` außerhalb Event — macht keinen Sinn
- Constructor ohne Klammern: `constructor` statt `constructor()`
- `_;` in Funktion geschrieben statt nur im Modifier
- Modifier komplett vergessen — nur Funktion geschrieben
- Child Contract innerhalb Base Contract verschachtelt — nicht erlaubt
- `_name_` statt `_name` — falscher Variablenname
- Modifier-Syntax weiterhin unsicher

## Tag 9 — Interface
- Erster Versuch war normaler Contract statt Interface — Keyword `interface` vergessen
- Parameter-Anzahl und Reihenfolge unsicher: `_id` = welcher Antrag, `_status` = neuer Wert
- `override` Platzierung unklar — gehört in die implementierende Funktion, nicht ins Interface
- Interface-Konzept teilweise verstanden: keine Logik, nur Signaturen, alle `external`
- Syntaxfluss instabil: geschweifte Klammern, `returns`, Funktionsabschlüsse
- Stärke erkannt: Architektur- und Zustandsdenken ist überdurchschnittlich entwickelt

## Tag 10 — Mapping + Struct
- Semikolon nach `address Name` vergessen
- Erst `string` statt `address` versucht — string macht bei Mapping-Key keinen Sinn
- Geschweifte Klammern bei Mapping-Deklaration: `public{ antragMap;}` statt `public antragMap;`

## Tag 11 — Array
- `push` außerhalb Funktion auf Contract-Ebene geschrieben
- `address public antragsteller` statt `address[] public antragsteller` — eckige Klammern vergessen
- `push` als Zuweisungsoperator: `push = msg.sender` statt `push(msg.sender)`
- Parameter-Klammer mit Funktionskörper verwechselt

## Tag 12 — Constructor mit Parameter
- State Variable `owner` nicht deklariert — `address public owner` vergessen
- `constructor() public` — constructor hat keine Sichtbarkeit ab ^0.7.0
- Parameter `_owner` im Constructor vergessen — kam nicht von außen rein
