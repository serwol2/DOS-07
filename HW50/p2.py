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

n = input_digit("Enter tree height: ")

i = 1
while i <= n :
    print(("*"*(i*2-1)).center(n*2-1))
    i +=1