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

input_digit("Enter your age: ")

ccup = input_digit("I just asked it, for fun :)  How much coffee do you want? :")

if ccup >= 6:
    print("You get", (ccup // 6), "bonus cups of coffee")
else :
    print('No bonuses. Goodbye!')