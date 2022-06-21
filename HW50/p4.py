# Rock Paper Scissors
import random

def print_full(l):
    if l == "r" :
        m = "Rock"
    if l == "p" :
        m = "Paper"
    if l == "s" :
        m = "Sciccors"
    return m    

rep = True

while rep :

    print("Please select :")
    u = input("Rock (R) Paper (P) Scissors (S) : ").lower()

    if u in ('r', "p", "s"):
        print("You :", print_full(u))
        c = random.choice(['r', "p", "s"])
        print("Computer :", print_full(c))
        if u == c :
            print("Tie! Let's do it again.")
        elif u == "r" :
            if c == "s" :
                print("Your win!")
            else:
                print("Computer win!")
        elif u == "p" :
            if c == "r" :
                print("Your win!")
            else:
                print("Computer win!")
        elif u == "s" :
            if c == "p" :
                print("Your win!")
            else:
                print("Computer win!")
    else :
        print("Error !")

    rr = True
    while rr :
        r = input("Again? Y/n : ") or "Y" or "y"
        r = r.lower()
        if r != "y" :
            if r == "n" :
                rep = False
                rr = False
            else :
               print("Error !")
        else :
            rr = False



    



    

    #Tie!


   


