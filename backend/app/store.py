from .models import Purchase

# Demo-only in-memory storage. TODO: persist with Supabase/Postgres and user isolation.
PURCHASES: list[Purchase] = []

def reset() -> None:
    PURCHASES.clear()
