# #!/usr/bin/env python
import time
from datetime import datetime
from selenium import webdriver
from selenium.webdriver.chrome.options import Options as ChromeOptions
from selenium.webdriver.common.by import By

datenow = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

login_url = 'https://www.saucedemo.com/'
inventory_url = 'https://www.saucedemo.com/inventory.html'
cart_url = 'https://www.saucedemo.com/cart.html'

def create_driver():
    print (f'{datenow} Starting the browser...')
    options = ChromeOptions()
    options.add_argument("--headless") 
    driver = webdriver.Chrome(options=options)
    driver.implicitly_wait(10)  # Add an implicit wait to give time for elements to load
    return driver
    

# Start the browser and login with standard_user
def test_login(driver, user, password):
    print(f'{datenow} Test: login. Navigating to the demo page to login {login_url}')
    driver.get(login_url)
    print(f'{datenow} Login attempt, user: {user}, password: {password}')
    
    # Use implicit wait to wait for elements to load
    user_element = driver.find_element(By.ID, 'user-name')
    password_element = driver.find_element(By.ID, 'password')
    login_button_element = driver.find_element(By.ID, 'login-button')

    user_element.send_keys(user)
    password_element.send_keys(password)
    login_button_element.click()

    assert inventory_url in driver.current_url
    print(f'{datenow} Test Login Success.')
    

def test_add_items_to_cart(driver):
    items_in_cart = []
    print (f'{datenow} Test: adding items to cart')
    elements = driver.find_elements(By.CLASS_NAME, 'inventory_item')
    for item in elements:
        item_name = item.find_element(By.CLASS_NAME, 'inventory_item_name').text
        items_in_cart.append(item_name)
        item.find_element(By.CLASS_NAME, 'btn_inventory').click()
        print(f'{datenow} Added {item_name} to cart')
        
    cart_element = driver.find_element(By.CLASS_NAME, 'shopping_cart_badge')
    assert int(cart_element.text) == len(elements)
    driver.find_element(By.CLASS_NAME, 'shopping_cart_link').click()
    assert cart_url in driver.current_url
    for item in driver.find_elements(By.CLASS_NAME, 'inventory_item_name'):
        assert item.text in items_in_cart
    print (f'{datenow} Test Add Items in cart Success.')

def test_remove_items_from_cart(driver):
    print (f'{datenow} Test: removing items from cart')
    driver.find_element(By.CLASS_NAME, 'shopping_cart_link').click()
    assert cart_url in driver.current_url

    print(f"{datenow} Items in Cart: {len(driver.find_elements(By.CLASS_NAME, 'cart_item'))}")
    
    for item in driver.find_elements(By.CLASS_NAME, 'cart_item'):
        item_name = item.find_element(By.CLASS_NAME, 'inventory_item_name').text
        item.find_element(By.CLASS_NAME, 'cart_button').click()
        print(f'{datenow} Removed {item_name} from cart')

    assert len(driver.find_elements(By.CLASS_NAME, 'cart_item')) == 0
    print (f'{datenow} Test Remove Items from cart Success.')


def run_ui_tests():
    driver = create_driver()
    #print("Browser started successfully.")
    print(f"{datenow} UI Tests started")
    test_login(driver, 'standard_user', 'secret_sauce')
    test_add_items_to_cart(driver)
    test_remove_items_from_cart(driver)

    print(f"{datenow} UI Tests completed.")
    driver.quit()

if __name__ == "__main__":
    run_ui_tests()
