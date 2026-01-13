# Foundry Mini Starter

Kleines, sauberes Foundry-Setup mit zwei Mini‑Contracts und Tests.
Passt ideal, um in VS Code schnell loszulegen.

## Voraussetzungen
- Foundry installiert (`foundryup`)
- (Empfohlen) VS Code + Solidity-Extension (Juan Blanco) + `rust-analyzer`
- `forge-std` wird als Dev‑Dependency genutzt

## Schnellstart
```bash
# 1) Dependencies holen
forge install foundry-rs/forge-std@v1.9.5

# 2) Build + Tests
forge build
forge test -vv

# 3) Lokale Chain starten (neues Terminal)
anvil

# 4) Deploy-Script ausführen (nutze einen der von Anvil gedruckten Private Keys)
export RPC_URL=http://127.0.0.1:8545
export PK=<PRIVATE_KEY_AUS_ANVIL>
forge script script/DeployCounter.s.sol:DeployCounter \  --rpc-url $RPC_URL --private-key $PK --broadcast -vv
```

## Inhalte
- `src/Counter.sol` – ein Zähler mit `increment()` und `reset()`
- `src/DonatePause.sol` – Minimaler, owner‑gesteuerter Pause‑Schalter mit Spendenfunktion
- `test/Counter.t.sol` – Tests für Counter
- `test/DonatePause.t.sol` – Tests für Pause/Unpause und Spenden
- `script/DeployCounter.s.sol` – Ein simples Deploy‑Script

## Nützliche Forge‑Befehle
- `forge test -vv` – mit Traces
- `forge coverage` – Testabdeckung
- `forge fmt` – Formatierung
- `forge snapshot` – Gas‑Snapshot

Viel Spaß beim Coden! 🚀
