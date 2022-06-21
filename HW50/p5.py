def even_or_odd (x,y):
    if x % 2 == 0 and y % 2 == 0 :
        print("both numbers are even")
        return
    if x % 2 != 0 and y % 2 != 0 :
        print("both numbers are odd")
        return
    else :
        print("number difference: ", abs(x-y))
        return   


even_or_odd (2,3)
even_or_odd (4,8)
even_or_odd (7,15)
even_or_odd (35,6)