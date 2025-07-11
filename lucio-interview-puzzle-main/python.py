import base64

# Base64 encoded message from the puzzle
encoded_message = """
VGhpcyB3YXMgZWFzeS4gTGV0J3MgdHJ5IHNvbWV0aGluZyBoYXJkZXIuIE1yIENyeX
B0byBuZWVkcyB5b3VyIGhlbHAgdG8gdW5kZXJzdGFuZCB0aGlzIHRleHQ6IAoKZ0FBQU
FBQm5ibjhvTzBPN09tcXRxdWZjcDZOazVsNDQ4NEtwZ0xzNmFpaThLejJmX24yWFA2W
mIzSUpmbXhPTzdpVHVfQXFZZWRPeTl3cEFLVk9ZNWttN3NxREpoVGR6dTJaQmxkbDg
tdnd1bnJ2SGFMNjAyX1pPc09OLWtvRmJvOVNVZW13NHNjQm1JTkJFU1p0akJCUHljW
UliNnV1WjZhV1E3MHl3bnNxWXJuOFp5cjVGYzJ1bVJrYUVnaFU1SlM4ZUt4VTlGQThLU
1ptTWVxd2VDbFlNNG1tNEN5TzNuems3UEh3aHQ4dXNZU3BLbU5CclFjY1dDenZHQ3h
GbDRUX1EwdFRKTWsxSklRX1dXaEpDY3hRTWVLTWxCSlYwb0UwQW9NZDRBd19vN0Iz
UWpURVFvckk9CgpIZSB0ZWxscyB5b3UgJ1NvbWV0aW1lcywgbWFjaGluZXMgaGF2ZS
BuYW1lcyB0aGF0IGh1bWFucyBjYW4ndCByZWFkIHNvIHlvdSBuZWVkIGEgYm9vayB0by
Bsb29rIHVwIHRoZWlyIG5hbWVzLiBDaGVjayB0aGUgcHViJ3MgcmVjb3JkcyBpbiB0aGU
gYm9vayBhbmQgeW91J2xsIGZpbmQgc29tZXRoaW5nIHRoYXQgbWlnaHQgYmUgdXNl
ZnVsLic=
"""

# Normalize the input (remove newlines and extra spaces)
encoded_message = encoded_message.replace("\n", "").replace(" ", "")

# Decode the Base64 message
decoded_text = base64.b64decode(encoded_message).decode('utf-8')

# Print the decoded message
print("Decoded Message:\n", decoded_text)
