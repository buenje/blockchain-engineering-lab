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
