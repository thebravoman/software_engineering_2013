msg = str(input("Input message: "))
n = int(input("Input n: "))
e = int(input("Input e: "))
d = int(input("Input d: "))

def encription(msg,n,e):
	enc_msg = ""
	st = "";
	enc_msgL = []
	for char in msg:
		st = (str((ord(char)**e)%n)).rjust(len(str(n)),'0')
		enc_msg += st
		enc_msgL.append(int(st))
	return(int(enc_msg),enc_msgL)

def decription(enc_msg,d,n):
	dec_msg = ""
	clist = enc_msg[1]
	for c in clist:
		dec_msg +=(str((c**d)%n)).rjust(len(str(n)),'0')
	return(int(dec_msg))

enc_msg = encription(msg,n,e)
dec_msg = decription(enc_msg,d,n)

if __name__ == "__main__":
	print enc_msg[0]
	print dec_msg