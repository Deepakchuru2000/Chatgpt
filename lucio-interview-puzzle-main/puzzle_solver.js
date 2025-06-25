const fernet = require('fernet');

const encryptedText = "gAAAAABnbn8oO0O7Omqtqufcp6Nk5l4484KpgLs6aii8Kz2f_n2XP6Zb3IJfmxOO7iTu_AqYedOy9wpAKVOY5km7sqDJhTdzu2ZBldl8-vwunrvHaL602_ZOsON-koFbo9SUemw4scBmINBESZtjBBPycYIb6uuZ6aWQ70ywnsqYrn8Zyr5Fc2umRkaEghU5JS8eKxU9FA8KSZmMeqweClYM4mm4CyO3nzk7PHwht8usYSpKmNBrQccWCzvGCxFl4T_Q0tTJMk1JIQ_WWhJCcxQMeKMlBJV0oE0AoMd4Aw_o7B3QjTEQorI="

// List of possible keys (try adding more if needed)
const commonKeys = [
    "00FC60FE3D7FEE66857B357017E4EBE65C",
    "The Code Book",
    "The CodeBook",
    "thisisasecret",
    "supersecretkey",
    "encryption-key",
    "Mr.Crypto",
];

for (const keyStr of commonKeys) {
    try {
        const secretKey = Buffer.from(keyStr).toString("base64"); // Convert to Base64
        const key = new fernet.Secret(secretKey);
        const decoded = new fernet.Token({ secret: key, token: encryptedText, ttl: 0 }).decode();
        
        console.log(`✅ Success! Decrypted text using key "${keyStr}":\n`, decoded);
        break; // Stop if successful
    } catch (error) {
        console.log(`❌ Failed with key "${keyStr}"`);
    }
}
