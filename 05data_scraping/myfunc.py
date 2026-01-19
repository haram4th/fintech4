import re

def add(num1, num2):
    """
    Docstring for add
    숫자 2개를 받아서 더해주는 함수

    :param num1: 정수 숫자
    :param num2: 정수 숫자
    """
    return num1 + num2


class Cal():
    def __init__(self, num1, num2):
        self.num1 = num1
        self.num2 = num2
    
    def add(self):
        return self.num1 + self.num2
    
    def sub(self):
        return self.num1 - self.num2
    
    def mul(self):
        return self.num1 * self.num2
    
    def div(self):
        if self.num2 == 0:
            return 0
        else:
            return self.num1 / self.num2


def text_clean(text):
    temp = re.sub(r"</?[^>]+>", "", text)
    temp = re.sub("[^가-힣a-zA-Z09]", " ", temp)
    temp = temp.replace("\n", " ").replace("\t", " ").replace("  ", " ").replace("  ", " ")
    temp = temp.replace("  ", " ").strip()
    return temp