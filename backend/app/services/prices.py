from ..models import PriceOffer, Purchase


def historical_offers(purchases: list[Purchase], product_name: str) -> list[PriceOffer]:
    """Compare recorded prices for the *same unit*. Never claim prices are live."""
    matches: list[PriceOffer] = []
    for purchase in purchases:
        for item in purchase.items:
            if item.product_name.casefold().strip() != product_name.casefold().strip():
                continue
            matches.append(PriceOffer(product_name=item.product_name,
                store_name=purchase.store_name,
                unit_price=round(item.total_price / item.quantity, 2),
                unit=item.unit, purchased_at=purchase.purchased_at,
                currency=purchase.currency))
    return sorted(matches, key=lambda item: (item.currency, item.unit, item.unit_price))


def cheapest_historical_offer(offers: list[PriceOffer]) -> PriceOffer | None:
    # TODO: compare pack sizes, normalized units, freshness, location and availability.
    # Only compare a homogeneous currency and unit; otherwise reject ambiguity.
    if not offers:
        return None
    if len({(o.currency, o.unit) for o in offers}) != 1:
        return None
    return min(offers, key=lambda o: o.unit_price)
