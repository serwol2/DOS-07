def nums_v_letter1(strr):
    n = 0
    for i in strr:
        if i in 'aeiouy':
            n += 1
    return n

    # glasn = set("aeiouy")
    # alls = list(strr)
    # return sum(1 in glasn for glasn in strr)
    #en(alls.intersection(glasn))


def nums_v_letter2(strr):
    return len([0 for i in strr if i in 'aeiouy'])


strochka = input("\nEnter a string of small letters: ")

print(nums_v_letter1(strochka), "\n")
print(nums_v_letter2(strochka), "\n")