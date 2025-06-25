from cryptography.fernet import Fernet

# Your decryption key
key = b'n-WlVeBzL_oliR5MBwMGoXsCWkopUSxWCbjvHLtX8Wg='
cipher = Fernet(key)

# The encrypted message
encrypted_message = b'gAAAAABnbn8oO0O7Omqtqufcp6Nk5l4484KpgLs6aii8Kz2f_n2XP6Zb3IJfmxOO7iTu_AqYedOy9wpAKVOY5km7sqDJhTdzu2ZBldl8-vwunrvHaL602_ZOsON-koFbo9SUemw4scBmINBESZtjBBPycYIb6uuZ6aWQ70ywnsqYrn8Zyr5Fc2umRkaEghU5JS8eKxU9FA8KSZmMeqweClYM4mm4CyO3nzk7PHwht8usYSpKmNBrQccWCzvGCxFl4T_Q0tTJMk1JIQ_WWhJCcxQMeKMlBJV0oE0AoMd4Aw_o7B3QjTEQorI='

# Decrypt the message
decrypted_message = cipher.decrypt(encrypted_message)

# Print the result
print(decrypted_message.decode())
