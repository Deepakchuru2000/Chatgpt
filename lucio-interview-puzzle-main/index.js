const fernet = require('fernet');

const secretKey = "gAAAAABnbn8oO0O7Omqtqufcp6Nk5l4484KpgLs6aii8Kz2f_n2XP6Zb3IJfmxOO7iTu_AqYedOy9wpAKVOY5km7sqDJhTdzu2ZBldl8-vwunrvHaL602_ZOsON-koFbo9SUemw4scBmINBESZtjBBPycYI";

const token = `n-WlVeBzL_oliR5MBwMGoXsCWkopUSxWCbjvHLtX8Wg=`;

try {
    const key = new fernet.Secret(secretKey);
    const decoded = new fernet.Token({ secret: key, token: token, ttl: 0 });

    console.log("Decrypted Text:", decoded.decode());
} catch (error) {
    console.error("Decryption failed:", error.message);
}
