# Agent task tiles (assign ONE at a time)

These are intentional missing capabilities. Keep the starter commit unchanged when supplying the agent a pinned repository URL. Each task must have its own acceptance criteria and verification.

## TILE-01 — Receipt OCR (Modify; Flutter)
Implement image selection/camera capture and OCR in `mobile/lib/services/receipt_scanner.dart`; offer an editable review screen before saving. Handle malformed lines and images without receipts. No paid OCR required. **Acceptance:** local mock/image fixture parses common product/price/quantity patterns; confirmation required before save; widget tests cover permission denied and unknown text.

## TILE-02 — Receipt text parsing (Modify; FastAPI)
Implement `backend/app/services/receipt_parser.py` and `/receipts/parse` for deterministic receipt text inputs, including store, date, quantities, units, totals, and ambiguity. **Acceptance:** malformed inputs receive documented 4xx, valid fixture converts to Purchase; no invented products; add tests.

## TILE-03 — Stock consumption (Modify; FastAPI)
Add manual consume/adjust operations, user-visible stock balance, prevention/handling of negative quantities, and unit normalization. **Acceptance:** purchase adds 2L milk, consuming 0.5L gives 1.5L; tests cover duplicates and units.

## TILE-04 — Product identity (Modify; end-to-end)
Create canonical product identity with barcode/pack metadata so variants don't merge by name. **Acceptance:** distinguish 500ml vs 1L bottle, handle missing barcode and ambiguous names; tests.

## TILE-05 — Historical shop comparison (Modify; FastAPI)
Normalize comparable sizes and currencies; exclude stale or incomparable offers; explain recommendation evidence and avoid calling historic prices live. **Acceptance:** 2x500g vs 1kg comparison; currency mismatch not compared; tests.

## TILE-06 — Supabase persistence + auth (Modify; end-to-end)
Replace in-memory data store with authenticated Postgres/Supabase repository and row-level security. Allow fully local integration tests using Postgres or Docker; do not require production credentials. **Acceptance:** different users cannot view one another's purchase data; restart retains records; tests.

## TILE-07 — Price provenance and receipt corrections (Modify; end-to-end)
Track receipt line confidence, corrections, source, and capture time. Do not silently create prices for unresolved products. **Acceptance:** users can correct OCR line and audit original vs corrected values; tests.

## TILE-08 — Assess receipt-to-inventory correctness (Understand / Assess)
Read only. Trace how a receipt becomes stored purchase, inventory, and price history. Identify missing invariant tests, rounding/identity/units risks, and potential data integrity gaps with file references. **No code changes.**
