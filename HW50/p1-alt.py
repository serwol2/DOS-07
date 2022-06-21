str1 = "sergey"
str2 = "aleshkevich"
print(set(str1))

def indexes(str, substr):
    res = [i+1 for i in range(len(str)) if str.startswith(substr, i)]
    print(res)
    return(f"In string '{str}' - {substr}{res}")

for i in set(str1):
    if i in str1 and i in str2:
        print(indexes(str1, i))
        print(indexes(str2, i))