import os
import time

def lambda_handler(event, context):
    event_contents=str(event)
    print("event contents: " + event_contents)
    if 'Records' in event_contents:
        print("number of messages in event: "+str(len(event['Records'])))
    os.system("hostid > /tmp/output.txt")
    os.system("whoami >> /tmp/output.txt")
    fp = open('/tmp/output.txt', "r")
    output = fp.read()
    fp.close()
    print("Hostid and user: "+output)
    time.sleep(3)
    print("Done.")

