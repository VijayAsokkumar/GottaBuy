from fastapi import FastAPI, HTTPException
from .models import Purchase, InventoryItem, PriceOffer, ReceiptParseRequest
from .store import PURCHASES
from .services.inventory import inventory_from_purchases
from .services.prices import historical_offers, cheapest_historical_offer
from .services.receipt_parser import parse_receipt_text

app = FastAPI(title="GottaBuy Starter API", version="0.1.0")

@app.get("/health")
def health() -> dict[str, str]:
    return {"status": "ok"}

@app.post("/purchases", response_model=Purchase, status_code=201)
def add_purchase(purchase: Purchase) -> Purchase:
    PURCHASES.append(purchase)
    return purchase

@app.get("/purchases", response_model=list[Purchase])
def list_purchases() -> list[Purchase]:
    return PURCHASES

@app.get("/inventory", response_model=list[InventoryItem])
def inventory() -> list[InventoryItem]:
    return inventory_from_purchases(PURCHASES)

@app.get("/prices/{product_name}", response_model=list[PriceOffer])
def prices(product_name: str) -> list[PriceOffer]:
    return historical_offers(PURCHASES, product_name)

@app.get("/recommendations/{product_name}", response_model=PriceOffer)
def recommend(product_name: str) -> PriceOffer:
    best = cheapest_historical_offer(historical_offers(PURCHASES, product_name))
    if best is None:
        raise HTTPException(status_code=404, detail="No comparable historical prices")
    return best

@app.post("/receipts/parse", response_model=Purchase)
def parse_receipt(payload: ReceiptParseRequest) -> Purchase:
    return parse_receipt_text(payload.receipt_text)
