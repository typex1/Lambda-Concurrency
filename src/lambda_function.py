import os
import time

def lambda_handler(event, context):
    print("event contents: " + str(event))
    # print("number of messages in event: "+str(len(event['Records'])))
    os.system("hostid > /tmp/output.txt")
    os.system("whoami >> /tmp/output.txt")
    fp = open('/tmp/output.txt', "r")
    output = fp.read()
    fp.close()
    print("XXX Hostid: "+output)
    time.sleep(3)
    print("Done.")

