def input_digit(text_u):
    t = False
    while not t :
        digi_u = input(text_u)
        t = digi_u.isdigit()
        if not t : 
            print("Error !!")
        else:
            digi_u = int(digi_u)
    return digi_u  

n = input_digit("Enter the number: ")

for i in range(n+1):
    if i % 2 == 0:
        print(i,"is EVEN")
    else:
        print(i,"is ODD")