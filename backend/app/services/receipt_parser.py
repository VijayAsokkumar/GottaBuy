from fastapi import HTTPException
from ..models import Purchase


def parse_receipt_text(receipt_text: str) -> Purchase:
    """Agent task: implement OCR-text parsing incl. ambiguous products, totals and shops."""
    # TODO: robust parsing with provenance and confidence; do not invent line items.
    raise HTTPException(status_code=501,
        detail="Receipt parsing is a stub. Implement this TODO in the agent task.")
