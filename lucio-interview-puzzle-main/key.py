import base64
import hashlib
from cryptography.fernet import Fernet

# Step 1: Generate a SHA-256 hash of the book name
book_name = "The Code Book"
hashed_key = hashlib.sha256(book_name.encode()).digest()

# Step 2: Convert to a Base64-encoded 32-byte Fernet key
fernet_key = base64.urlsafe_b64encode(hashed_key)[:32]

print("Generated Fernet Key:", fernet_key.decode())

# Step 3: Use the Fernet key to decrypt the message
fernet = Fernet(base64.urlsafe_b64encode(fernet_key))

# Encrypted message
encrypted_message = b"gAAAAABnbn8oO0O7Omqtqufcp6Nk5l4484KpgLs6aii8Kz2f_n2XP6Zb3IJfmxOO7iTu_AqYedOy9wpAKVOY5km7sqDJhTdzu2ZBldl8-vwunrvHaL602_ZOsON-koFbo9SUemw4scBmINBESZtjBBPycYIb6uuZ6aWQ70ywnsqYrn8Zyr5Fc2umRkaEghU5JS8eKxU9FA8KSZmMeqweClYM4mm4CyO3nzk7PHwht8usYSpKmNBrQccWCzvGCxFl4T_Q0tTJMk1JIQ_WWhJCcxQMeKMlBJV0oE0AoMd4Aw_o7B3QjTEQorI="

# Step 4: Try decrypting the message
try:
    decrypted_message = fernet.decrypt(encrypted_message).decode()
    print("Decrypted Message:", decrypted_message)
except Exception as e:
    print("Decryption failed:", e)
