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
- submit() setzte Status auf Submitted statt auf Underreview — kein echter Zustandsübergang
- Logikfehler: submit() und startReview() waren redundant — gleiche Funktion doppelt
- Lösung: enum braucht None als Initialzustand damit submit() sinnvoll prüfen kann

## Tag 18 — Mapping + Enum
- `msg.sender` vs `status[msg.sender]` verwechselt — msg.sender ist die Adresse, status[msg.sender] ist der Wert im Mapping
- `currentStatus` verwendet obwohl kein currentStatus deklariert — Mapping vergessen
- `require(msg.sender == Status.None)` — Adresse mit Enum-Wert verglichen, falsche Typen
- Syntax wiederholt holprig — mapping Zugriff noch nicht automatisch

## Tag 19 — State Machine + Events
- Event-Parameter falsch verstanden: Enum-Werte statt Typen in Event-Definition
- Enum und Event gleich benannt — Namenskonflikt
- `require` Syntax wieder unsicher: `(require[...]` statt `require(...)`
- `Status.` Präfix vor Enum-Wert vergessen
- Klammern weiterhin ein Thema — öffnen/schließen nicht konsistent
- Grundprinzip Event/emit erst spät verstanden
- Logik zähfließend — Ingenieursdenken hilft bei Architektur, aber Syntax braucht mehr Wiederholung

## Tag 20 — Modifier + Rollen
- Schließende Klammer bei onlyOwner vergessen
- `user == msg.sender` statt `role[msg.sender] == Role.User` — Variable existiert nicht
- `Admin == msg.sender` gleicher Fehler — Mapping-Zugriff vergessen
- Positiv: Verknüpfung von Tag 6 und Tag 16 erstaunlich gut gelungen
- Grundstruktur Modifier + Enum + Mapping selbst aufgebaut

## Tag 21 — Reentrancy / CEI Pattern
- `msg.value` statt `msg.sender` als Mapping-Key — msg.value ist Betrag, msg.sender ist Adresse
- `uint 256` mit Leerzeichen — korrekt: `uint256`
- CEI Pattern Logik zunächst unklar — erst nach Erklärung verstanden
- `balance[msg.sender] = 0` Zweck unklar — ist explizite Forderungslöschung, passiert nicht automatisch
- `transfer` deprecated — moderner: `call{value: amount}("")`

## Tag 21 — Reentrancy / CEI Pattern
- `msg.value` statt `msg.sender` als Mapping-Key — msg.value ist Betrag, msg.sender ist Adresse
- `uint 256` mit Leerzeichen — korrekt: `uint256`
- CEI Pattern Logik zunächst unklar — erst nach Erklärung verstanden
- `balance[msg.sender] = 0` Zweck unklar — ist explizite Forderungslöschung, passiert nicht automatisch
- `transfer` deprecated — moderner: `call{value: amount}("")`

## Tag 22 — Events + CEI
- `msg.sender` in Event-Definition statt Parametername: `address indexed msg.sender` → `address indexed user`
- `emit deposit` statt `emit Deposit` — Groß/Kleinschreibung muss exakt übereinstimmen
- `emit` nach `transfer` — gehört davor
- Nur ein Event für deposit und withdraw — zwei separate Events sauberer: `Deposited` und `Withdrawn`
- `indexed` Bedeutung unklar — macht Parameter durchsuchbar für externe Apps
- Withdrawal Event nicht deklariert — emit Deposit für beide Funktionen verwendet, semantisch falsch
- `payable` Bedeutung unklar: erlaubt Funktion Ether zu empfangen, erlaubt Adresse Ether zu empfangen
- Unterschied deposit/withdraw Events unklar: deposit = Ether rein, withdraw = Ether raus + transfer

## Tag 23 — Mapping + Enum + State Machine + Events
- Enum Reihenfolge falsch: Returned vor Completed — logisch sollte Completed der Abschluss sein
- `statuses[id]` UND `currentStatus` parallel geführt — redundant, ein Designfehler
- Warum beide? Mapping speichert Status pro Antrag-ID, currentStatus ist global — können widersprechen
- Lösung: entweder nur Mapping (jeder Antrag eigener Status) oder nur currentStatus (ein globaler Status)

## Tag 24 — State Machine sauber (ohne currentStatus)
- GovStatus statt GovMachine — Namenskonsistenz nicht durchgehalten
- statuses/stauses statt GovMachines — Mapping-Name vergessen
- Semikolon nach address public owner vergessen
- Schließende Klammer bei approval() vergessen
- Positiv: kein currentStatus mehr — Designfehler von Tag 23 erkannt und korrigiert

## Tag 25 — Constructor mit Rollen
- `address public owner` doppelt deklariert
- State Variables nach Constructor geschrieben — falsche Reihenfolge
- Constructor nicht geschlossen — `}` vor Modifier vergessen
- `_;` im Modifier vergessen
- `require` ohne Semikolon
- `role[msg.sender]` statt `role[_owner]` — Constructor setzt Rolle für Deployer statt übergebene Adresse
- Constructor + Rollen Kombination noch nicht sicher abrufbar — braucht mehr Wiederholung

## Tag 26 — Constructor + Rollen + State Machine
- Nur ein Enum für Rollen — Status Enum fehlte zunächst
- Modifier nur für Owner — onlyUser und onlyAdmin fehlten zunächst
- `role` klein geschrieben als Parameter — verwechslung mit Enum `Role` — besser `_role` oder `newRole`
- Status Mapping nicht genutzt — nur deklariert, keine Funktionen für Zustandsübergänge
- Positiv: Grundstruktur claimworkflow selbst entwickelt
