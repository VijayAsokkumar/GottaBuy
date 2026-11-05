# GottaBuy – Flutter/Dart multi-feature starter (36 Dart files)

An intentional **starter** (not a finished mobile product) for ODIN/code-evaluation tasks. Flutter/Dart mobile UI; FastAPI/Python backend. No Supabase account, paid service, barcode device or OCR required to demonstrate the base path. See [TASKS.md](TASKS.md) for eight independent agent tasks.

## What works now
- `GET /health`, `POST /purchases`, `GET /purchases`, `GET /inventory`, `GET /prices/{product}`, and `GET /recommendations/{product}`.
- Flutter app home, receipt demo submission, inventory, purchase history and receipt-derived historical price listings.
- A runnable in-memory shopping-list demo, a restock calculation demo, and screen shells for barcode lookup and receipt review.
- 2 Flutter unit test files for shopping-list and restock services.
- Unit tests for current business behaviour. **No user auth, persistent DB, live prices, camera/OCR, or consumption tracking yet.**
- `/receipts/parse` explicitly returns 501; camera/OCR is a Dart stub. Data is lost on API restart.

## Start API on Mac/Linux (from project root)
```sh
cd backend
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
uvicorn app.main:app --reload
```
Swagger: http://localhost:8000/docs

Or use Docker: `docker compose up --build` from project root.

## Run backend tests
```sh
cd backend
python -m pytest -q
```

## Quick API demo
```sh
curl -X POST http://localhost:8000/purchases -H 'Content-Type: application/json' \
  -d '{"store_name":"Example Supermarket","purchased_at":"2026-11-04","items":[{"product_name":"Milk","quantity":2,"unit":"L","total_price":6.2}]}'
curl http://localhost:8000/inventory
curl http://localhost:8000/prices/Milk
```

## Run Flutter unit tests
After installing Flutter and running `flutter pub get` in `mobile/`:
```sh
flutter test
```

## Run mobile app
Install the Flutter SDK (not bundled). This starter contains Dart source files and `pubspec.yaml`, but not generated native runner files. **Generate the missing platform runner files first:**
```sh
cd mobile
flutter create --platforms=android,ios .
flutter pub get
flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8000  # Android emulator
```
For iOS simulator, use `--dart-define=API_BASE_URL=http://localhost:8000`. Physical devices need the Mac's LAN IP and a reachable API; HTTP local dev may require platform-specific cleartext transport configuration. For release, use HTTPS and secure credentials. The mobile code was not compiled in this environment because Flutter SDK is unavailable.

## Repository guide
- Backend: `backend/app/main.py`, `models.py`, `store.py`, `services/*`
- Mobile: `mobile/lib/main.dart`, `app.dart`, `models/*`, `services/*`, `screens/*`, `widgets/*`, `utils/*`
- Flutter tests: `mobile/test/*`
- Tests: `backend/tests/*`
- Source code file count: **44** (`36 .dart including 2 Flutter tests + 8 .py`). The repo also includes configs, docs and Dockerfile.

## Flutter feature status
- **Works as a local demo:** shopping-list add/check (in-memory), restock due-date calculation, purchase-history API fetch, receipt demo submission, inventory and historical prices.
- **Stubs for agent tasks:** real barcode lookup, image OCR, Supabase authentication, cloud shopping-list sync, notifications, persistent purchase history model mapping, and editable receipt review.
- **Caution:** the receipt review screen shows extracted lines and allows confirmation, but extraction and editing are still TODOs.

## ODIN use
Commit this baseline to your own repository before assigning a task. Share a pinned `/tree/<commit-sha>` URL to the baseline, **not** the URL of a later fix. Do not imply this starter qualifies for enterprise (>200 files); this is a small personal-scale starter. For an Understand/Assess slot, assign TILE-08; for a Modify slot, use the other tiles. Review task metadata for domain/action/codebase type compatibility.

## Known limitations and honesty
In-memory purchase store, no tenant isolation, no real receipt OCR, no reliable current retailer prices. `cheapest_historical_offer` compares only homogeneous currencies/units. Do not advertise these as implemented functionality. The demo date is fixed for reproducibility.
