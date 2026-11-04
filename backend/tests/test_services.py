from app.models import Purchase, PurchaseLine
from app.services.prices import cheapest_historical_offer, historical_offers
from app.services.inventory import inventory_from_purchases

def test_cheapest_historical_price():
    a = Purchase(store_name='Shop A', items=[PurchaseLine(product_name='Eggs',quantity=1,unit='pack',total_price=8)])
    b = Purchase(store_name='Shop B', items=[PurchaseLine(product_name='Eggs',quantity=1,unit='pack',total_price=6)])
    best = cheapest_historical_offer(historical_offers([a,b],'eggs'))
    assert best is not None and best.store_name == 'Shop B'

def test_mixed_units_are_not_compared():
    a = Purchase(store_name='A', items=[PurchaseLine(product_name='Rice',quantity=1,unit='kg',total_price=4)])
    b = Purchase(store_name='B', items=[PurchaseLine(product_name='Rice',quantity=1,unit='pack',total_price=3)])
    assert cheapest_historical_offer(historical_offers([a,b],'Rice')) is None

def test_inventory_accumulates_purchases():
    p = Purchase(store_name='A',items=[PurchaseLine(product_name='Milk',quantity=2,total_price=5)])
    assert inventory_from_purchases([p])[0].quantity == 2
