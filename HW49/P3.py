
import math

def input_float_digit(text_u):
    while True :
        digi_u = input(text_u)
        try:
            digi_u = float(digi_u)
            return(digi_u)
        except ValueError:
            print("Error !!")
    

ax = input_float_digit('Enter Ax : ')
ay = input_float_digit('Enter Ay : ')
bx = input_float_digit('Enter Bx : ')
by = input_float_digit('Enter Ax : ')

# AB = √((xb — xa)**2 + (yb — ya)**2)
# https://www.fxyz.ru/%D1%84%D0%BE%D1%80%D0%BC%D1%83%D0%BB%D1%8B_%D0%BF%D0%BE_%D0%BC%D0%B0%D1%82%D0%B5%D0%BC%D0%B0%D1%82%D0%B8%D0%BA%D0%B5/%D0%B0%D0%BD%D0%B0%D0%BB%D0%B8%D1%82%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B0%D1%8F_%D0%B3%D0%B5%D0%BE%D0%BC%D0%B5%D1%82%D1%80%D0%B8%D1%8F/%D0%BD%D0%B0_%D0%BF%D0%BB%D0%BE%D1%81%D0%BA%D0%BE%D1%81%D1%82%D0%B8/%D1%82%D0%BE%D1%87%D0%BA%D0%B8_%D0%B8_%D0%BF%D1%80%D1%8F%D0%BC%D1%8B%D0%B5_%D0%B2_%D0%BF%D1%80%D1%8F%D0%BC%D0%BE%D1%83%D0%B3%D0%BE%D0%BB%D1%8C%D0%BD%D0%BE%D0%B9_%D1%81%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B0%D1%82/%D1%80%D0%B0%D1%81%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5_%D0%BC%D0%B5%D0%B6%D0%B4%D1%83_%D0%B4%D0%B2%D1%83%D0%BC%D1%8F_%D1%82%D0%BE%D1%87%D0%BA%D0%B0%D0%BC%D0%B8/

print (round(math.sqrt(pow((bx - ax),2) + pow((by - ay),2)),3))

