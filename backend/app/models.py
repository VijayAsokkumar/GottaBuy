from pydantic import BaseModel, Field

class PurchaseLine(BaseModel):
    product_name: str = Field(min_length=1)
    quantity: float = Field(gt=0)
    unit: str = "each"
    total_price: float = Field(ge=0)
    barcode: str | None = None

class Purchase(BaseModel):
    store_name: str = Field(min_length=1)
    purchased_at: str = "2026-01-01"
    currency: str = "NZD"
    items: list[PurchaseLine] = Field(min_length=1)

class InventoryItem(BaseModel):
    product_name: str
    quantity: float
    unit: str

class PriceOffer(BaseModel):
    product_name: str
    store_name: str
    unit_price: float
    unit: str
    purchased_at: str
    currency: str
    source: str = "historical_receipt"

class ReceiptParseRequest(BaseModel):
    receipt_text: str = Field(min_length=1)
