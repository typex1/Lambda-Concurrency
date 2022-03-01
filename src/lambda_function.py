import os
import time


def lambda_handler(event, context):
    event_contents=str(event)
    #print("event contents: " + event_contents)
    print("Lambda function memory limits in MB:", context.memory_limit_in_mb)
    if 'Records' in event_contents:
        print("number of messages in event: "+str(len(event['Records'])))
    records=event['Records']
    for record in records:
        body = record['body']
        
        #$RANDOM: random integer in range 0 to 32767 (half of it: 16383)
        
        ##############
        # uncomment the next 3 lines if you want to test how Lambda handles SQS messages which cause an error:
        # value=int((body.split()[2]))
        # if value > 214230:
        #    raise ValueError('value {} too high'.format(value)) 
        ##############
        
    os.system("hostid > /tmp/output.txt")
    fp = open('/tmp/output.txt', "r")
    output = fp.read()
    fp.close()
    print("Hostid and user: "+output)
    time.sleep(10)
    print("Done.")
