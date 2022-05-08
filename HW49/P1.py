def nums_v_letter1(strr):
    n = 0
    for i in strr:
        if i in 'aeiouy':
            n += 1
    return n

    
def nums_v_letter2(strr):
    return len([i for i in strr if i in 'aeiouy'])


strochka = input("\nEnter a string of small letters: ")

print(nums_v_letter1(strochka), "\n")
print(nums_v_letter2(strochka), "\n")