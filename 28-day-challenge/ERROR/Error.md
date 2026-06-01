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

## Tag 13 — require / revert
- `!finished` nicht verstanden — `!` bedeutet "nicht", also "noch nicht abgeschlossen"
- Umweg über `if` statt direkt `require` — require ist die sauberere Lösung
- `public view` vergessen — Funktion liest nur, verändert nichts

## Tag 14 — payable / msg.value
- `payable` Keyword vergessen — Funktion kann ohne `payable` keinen Ether empfangen
- `msg.value` falsch angeordnet — gehört in `require`, nicht als separate Variable
- Semikolon innerhalb `require` — nach Fehlerstring, nicht nach schließender Klammer
- Zweimal KI-Korrektur nötig — Konzept payable/msg.value noch nicht sicher

## Tag 15 — block.timestamp
- `block.timestamp` Konzept unklar — Blackout beim ersten Versuch
- Deadline-Logik nicht selbst entwickelt — Erklärung nötig
- `public view` wieder vergessen — Funktion liest nur, verändert nichts
- Wiederholung block.timestamp notwendig

## Tag 16 — Access Control
- Von altem X-Post gespickt im ersten Versuch — Cheat Code
- Contract Name `Role` kollidiert mit Enum `Role` — Namen müssen verschieden sein
- Pragma vergessen
- `role[msg.sender] = Role.Owner` nicht verstanden:
  - `role[msg.sender]` = "trag für diese Adresse einen Wert ins Mapping ein"
  - `Role.Owner` = "der Wert ist der erste Enum-Eintrag"
  - Zusammen: "der Deployer bekommt die Owner-Rolle"

## Tag 17 — State Machine
- Semikolon im Enum (wiederholt)
- `State` statt `Status` als Typ für currentStatus
- Groß/Kleinschreibung inkonsistent: `Status.underreview` statt `Status.Underreview`
- Unicode-Zeichen in String: `geprüft` verursacht ParserError — nur ASCII in Strings
- Enum-Wert `UnderReview` vs `Underreview` — Schreibweise nicht festgelegt und durchgehalten
- Logische Abfolge der State Machine holprig:
  - submit() setzt Status auf Submitted obwohl er schon Submitted ist — sinnlos
  - reject() prüft UnderReview korrekt, aber Fehlermeldung "zurueckgewiesen" ist irreführend
  - Rejected kann nicht von UnderReview kommen wenn approve() schon Approved gesetzt hat — kein Schutz dagegen
- Ablauflogik muss vor dem Coden durchdacht werden
