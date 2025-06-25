# 🧩 Lucio AI – Tricky Puzzle Decryption Challenge

This repository contains the solution to the **Lucio AI Company Tricky Puzzle**, a cryptographic challenge that tests problem-solving, encryption, and reverse-engineering skills using `Fernet`, `Base64`, and logic-based decoding.

## 📜 Challenge Summary

A challenging logic-based puzzle designed to test problem-solving skills, analytical thinking, and algorithmic creativity — inspired by real-world scenarios at Lucio AI.

The challenge begins with a cryptic Base64-encoded string and an encrypted Fernet token. The puzzle hints that something is hidden behind layers of encoding and encryption – your task is to unveil it.

---

## 🛠 Technologies & Tools

- 🔐 **Fernet (Python / Node.js)** – Secure symmetric encryption
- 🧬 **Base64 Decoding**
- 📜 **JavaScript / Python** for decryption and automation
- 🔎 **Brute-force / Dictionary attacks** to guess keys
- 📘 Book reference for the key: `"The Code Book"`

---

## 🧩 Files Overview

| File              | Description |
|-------------------|-------------|
| `decode.js`       | Base64 decoder using Node.js |
| `index.js`        | Fernet decryption using a known key |
| `key.py`          | SHA-256 hash generator and Fernet key converter |
| `puzzle_solver.js`| Brute-force decryption attempts using a wordlist |
| `puzzle.py`       | Clean decryption script with final key |
| `python.py`       | Full Base64 decoding and final message reveal |

---

## 🧠 How We Solved It

1. **Step 1: Base64 Decode the Given Message**
   - Revealed a clue about Mr. Crypto and needing help.
   - Included an encrypted Fernet token.

2. **Step 2: Identify Key Source**
   - Used `"The Code Book"` as the base for generating the Fernet key.

3. **Step 3: Generate Fernet Key**
   - Used SHA-256 + Base64 conversion in `key.py`.

4. **Step 4: Decrypt Message**
   - Successfully decrypted the final Fernet token using both Python and Node.js.

---

## 📡 DNS Record Hint

The puzzle description hinted:  
> “Sometimes, machines have names that humans can't read – so you need a book to look up their names.”

🧠 This implies checking **Lucio AI's DNS record** (e.g., with `dig`, `nslookup`, or using tools like [whatsmydns.net](https://www.whatsmydns.net/)) to find potential clues such as TXT records or subdomain keys.

Example:
```bash
dig TXT lucio.ai
```

---

## ✅ Final Decryption Result

```bash
This was easy. Let's try something harder. Mr Crypto needs your help to understand this text...
```
---

### 🤝 Contributing

If you’ve solved other similar puzzles or want to enhance this solution (e.g., add a UI), feel free to fork and contribute.