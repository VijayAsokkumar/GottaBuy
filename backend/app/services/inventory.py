from collections import defaultdict
from ..models import InventoryItem, Purchase


def inventory_from_purchases(purchases: list[Purchase]) -> list[InventoryItem]:
    # TODO: introduce consumption, unit normalization, returns, and stock adjustments.
    counts: dict[tuple[str, str], float] = defaultdict(float)
    for purchase in purchases:
        for line in purchase.items:
            counts[(line.product_name.strip().casefold(), line.unit)] += line.quantity
    return [InventoryItem(product_name=name, quantity=qty, unit=unit)
            for (name, unit), qty in sorted(counts.items())]
