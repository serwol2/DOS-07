def find_pos(str_0, sym_0):
    i = 0
    poss = []
    for l in str_0:
        if l == sym_0 :
            poss.append(i+1)
        i += 1
    return poss            

string1 = input("Enter sting 1 : ")
string2 = input("Enter sting 2 : ")
common_letters = (set(string1) & set(string2))

for a in common_letters :
    print(a, "-", string1, "=", find_pos(string1, a), string2, "=", find_pos(string2, a))