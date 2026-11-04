from fastapi.testclient import TestClient
from app.main import app
from app.store import reset

client = TestClient(app)

def setup_function():
    reset()

def test_health():
    assert client.get('/health').json() == {'status':'ok'}

def test_purchase_updates_inventory_and_price_history():
    payload = {'store_name':'Store A','purchased_at':'2026-10-25','currency':'NZD',
      'items':[{'product_name':'Milk','quantity':2,'unit':'L','total_price':6.0}]}
    assert client.post('/purchases',json=payload).status_code == 201
    assert client.get('/inventory').json() == [{'product_name':'milk','quantity':2.0,'unit':'L'}]
    result = client.get('/recommendations/milk')
    assert result.status_code == 200
    assert result.json()['unit_price'] == 3.0
    assert result.json()['source'] == 'historical_receipt'

def test_receipt_parser_is_explicitly_unimplemented():
    response = client.post('/receipts/parse',json={'receipt_text':'MILK 2.99'})
    assert response.status_code == 501
