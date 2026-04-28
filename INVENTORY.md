# Inventur lokaler Solidity-Materialien

Stand: 2026-04-28

Diese Datei dokumentiert, wo lokal Solidity-Material liegt, das **noch nicht** ins Master-Repo (`blockchain-engineering-lab`) migriert ist. Sie dient als Schatzkarte für die schrittweise Konsolidierung.

## Bereits migriert (in diesem Repo)

- `projects/workflow-pfv/WorkflowPFV.sol` — die 747-Zeilen-Version, deployed auf Sepolia (`0x2aa68e...`), Stand 17.02.2026
- `src/` — 7 Lernübungen (Counter, DonatePause, HelloBox, SafeShop, SafeVault, ToggelLock, VCdeterministic)
- `test/` — Tests zu den Lernübungen
- `forsblock/learningpath.md` — Forsblock-Lernpfad-Dokumentation

## Noch nicht migriert — zu sichten

### ETR-Manuskript-Material (Hauptschatz)
**Pfad:** `~/Documents/bunjeblockchain/02_Projekte/ETR Artikel Blockchain Planfeststellung/`

- `Fussnoten_BlockchainBasics/tests/bunjeblockchain/` — 23+ Lernübungen (Claim.sol, ClaimContract.sol, Allowlist.sol, MiniClub2.sol, Vote2.sol, SimpleVault.sol, PunkteKonto.sol, Toggle Owner.sol, ...)
- `Fussnoten_BlockchainBasics/files/WorkflowPFV.sol` und `WorkflowPFV.t.sol`
- `Fussnoten_BlockchainBasics/WorkflowPFV.sol` und `WorkflowPFV-2.sol`

**Hinweis:** ClaimContract.sol ist hier zu finden — Vorläufer von VerificationConsensus.

### GPT-Lernphase (frühe Remix-Übungen)
**Pfad:** `~/Documents/bunjeblockchain/01_Lernen/`

- `GPT_Übungen/contracts/` — 1_Storage.sol, 2_Owner.sol, 3_Ballot.sol
- `GPT_Übungen/tests/` — owner.sol, Ballot_test.sol
- `remix_test_contracts/` — Dublette der GPT_Übungen
- `foundry-mini-starter/` — Foundry-Kopie der 7 Lernübungen mit Tests

### Foundry-Versuche (Boilerplate + Dubletten)

- `~/bunjeblockchain/` — Origin von WorkflowPFV.sol (bereits migriert), nur noch Counter.sol relevant
- `~/forsblock-site-protocol/` — nur Counter.sol; ClaimWorkflow.sol war leer und wurde gelöscht
- `~/dev/foundry-mini-starter/` — Foundry-Standard-Setup
- `~/dev/bunje-foundry-template/` — leere Vorlage
- `~/Documents/bunjeblockchain/02_Projekte/foundry-mini-starter/` — Dublette
- `~/Documents/bunjeblockchain/01_Lernen/foundry-mini-starter/` — Dublette

## Whitepaper-Material (Konzeptarbeit, kein Code)
**Pfade:** `~/Documents/bunjeblockchain/02_Projekte/bunje.io/forsblock/` und `~/Downloads/`

- ClaimWorkflow Whitepaper v0.4 bis v0.6 (mehrere Iterationen)
- ClaimWorkflow Kapitel Prozess und Architektur.docx
- ClaimWorkflow Ricardian Escrow Strukturvergleich.docx

## Nächste Schritte (für Donnerstag oder später)

1. ETR-Manuskript-Material systematisch sichten — welche Übungen sind didaktisch wertvoll für die 28-Tage-Challenge?
2. WorkflowPFV-Varianten vergleichen (im ETR-Ordner liegen 2-3 Versionen) — welche ist welcher Stand?
3. ClaimContract.sol als Vorläufer von VerificationConsensus inspizieren
4. Foundry-Versuche und Dubletten ins `~/dev/_archive_2026-04-28/` verschieben (erst nach Sichtung)
5. README-Brücke in `plan-approval-logic` schreiben (Option B aus Strategie-Diskussion)

## Pflicht-Aktion erste Donnerstag-Session

**Vor allem anderen:** git pull ausführen!

README.md wurde am 28.04. direkt auf GitHub im Browser repariert (Merge-Konflikt aus Commit 0d2946f aufgelöst, englische Version B als Basis, Repo-Name-Notation und Schreibweise korrigiert). Lokaler Stand ist noch der kaputte. Erst pullen, dann arbeiten:

cd ~/dev/blockchain-engineering-lab
git pull

Falls README_BACKUP_2026-04-28.md noch lokal liegt: prüfen, ob nicht versehentlich getrackt; ggf. löschen oder in .gitignore aufnehmen.

## Strategische Diskussion: Marken-Klärung (eigene Session, nicht beiläufig)

Drei Markennamen zirkulieren parallel:
- bunje — Branding/Marketing-Identität (GitHub-Display-Name, einziges gepinntes Repo)
- bunjeblockchain — Affiliation/Company-Bezeichnung (im GitHub-Profil, jetzt auch im Lab-README)
- Forsblock — Protokoll-/Code-Marke (Alternative zu AQUA, mehrere Whitepaper-Iterationen)

Plus zwei Repo-Identitäten:
- blockchain-engineering-lab — Lab/Lerngeschichte
- plan-approval-logic — ETR-Artikel-Artifact

Frage zur Klärung: Welche Marke trägt was? Wo passt was zu Tim Bansemers Aquaduct-GmbH-Plan? Sollte das Lab-Repo umbenannt werden (z.B. zu bunje)? Konsequenzen für Verlinkungen prüfen.

Diese Diskussion gehört in eine eigene fokussierte Session, idealerweise mit klarem Kopf am Wochenende.
