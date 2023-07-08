import random

#Creating a random PASSWORD column for the USERS table
def createPASSWORD():
    num = '1234567890'
    letter = 'qwertyuıopğüasdfghjklşi'
    pm = ',.!?-'
    for _ in range(5):
        password = "".join([random.choice(num), random.choice(letter), random.choice(letter),
                           random.choice(pm), random.choice(letter), random.choice(letter),
                           random.choice(pm), random.choice(num), random.choice(letter),
                           random.choice(pm), random.choice(num), random.choice(pm)])
        print(password)
createPASSWORD()

##########################################################################################

#Creating a random Birthdate column for the USERS table
def createBIRTHDATE():
    for _ in range(5):
        year = random.randint(1940, 2000)
        month = random.randint(1, 12)
        day = random.randint(1, 30)
        print(f"{year}-{month:02d}-{day:02d}")
createBIRTHDATE()

##########################################################################################

#Creating a random Createdate column for the USERS table
def createCREATEDATE():
    for _ in range (5):
        year = (random.randint(2014, 2023))
        month = random.randint(1, 12)
        day = random.randint(1, 30)
        print(f"{year}-{month:02d}-{day:02d}")
createCREATEDATE()

##########################################################################################

#Creating a random TELNR1 column for the USERS table
def createTELNR1():
    for _ in range(5):
        a = random.randint(501, 555)
        bcd = "".join(str(random.randint(0, 9)) for _ in range(3))
        efgh = "".join(str(random.randint(0, 9)) for _ in range(4))
        print(f"{a}-{bcd}-{efgh}")
createTELNR1()

##########################################################################################

#Creating a random ITEMCODE column for the ITEMS table
def createITEMCODE():
    for _ in range(5):
        num = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0']
        a = "".join(random.choices(num, k=6))
        print("71923", a,sep="")
createITEMCODE()

##########################################################################################

#Creating a random STOCK column for the ITEMS table
def createSTOCK():
    for _ in range(5):
        stock = random.randint(50,1000)
        print(stock)
createSTOCK()

##########################################################################################

#Creating a random PRICE column for the ITEMS table
def createPRICE():
    a = ['100', '125', '150', '175', '200', '225', '250', '275', '300', '325', '350', '375', '400']
    for _ in range(5):
        price = random.choice(a)
        print(price)
createPRICE()

##########################################################################################

#Creating a random ITEMNAME column for the ITEMS table
def createITEMNAME():
    a = ['Shirt','Skirt','SweatShirt','T-Shirt','Pants','Shoes','Knit-Sweater','Socks','Canvas-Pants','Shorts','Coats','Jacket','Suit','Bag','Belt','Underwear','Lingerie','Sunglass','Sea-Short','Perfume','Slipper','Wallet','Hat','SuitCase','Jeans','Jeans-Short','Canvas-Short','Rain-Coat','Leather-Jacket',
         'Dress']
    for _ in range(5):
        item = random.choice(a)
        print(item)
createITEMNAME()

##########################################################################################

#Creating a random CATEGORY1 column for the ITEMS table
def createCATEGORY1():
    a = ['Man', 'Woman', 'Boy', 'Girl', 'Unisex']
    for _ in range(5):
        category = random.choice(a)
        print(category)
createCATEGORY1()

##########################################################################################

#Creating a random CATEGORY2 column for the ITEMS table
def createCATEGORY2():
    a = ['Old Collection', 'New Collection']
    for _ in range(5):
        category2 = random.choice(a)
        print(category2)
createCATEGORY2()

##########################################################################################

#Creating a random MADEIN column for the ITEMS table
def createMADEIN():
    country = ['China', 'Turkey', 'Bangladesh', 'Egypt']
    for _ in range(5):
        countries = random.choice(country)
        print(countries)
createMADEIN()

##########################################################################################

#Creating a random COLOR column for the ITEMS table
def createCOLOR():
    color = ['Blue', 'Navy-Blue', 'Red', 'White', 'Black', 'Orange', 'Brown', 'Green']
    for _ in range(5):
        colors = random.choice(color)
        print(colors)
createCOLOR()
