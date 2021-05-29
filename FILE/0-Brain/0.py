import requests , re , json , os
from bs4 import BeautifulSoup

W  = '\033[0m'  # white (default)
R  = '\033[1;31m' # red
G  = '\033[1;32m' # green bold
O  = '\033[1;33m' # orange
B  = '\033[1;34m' # blue
P  = '\033[1;35m' # purple
C  = '\033[1;36m' # cyan
GR = '\033[1;37m' # gray
os.system('clear')

def banner():
    print (W+"       ,   ,    ")
    print ("      /////|    ")
    print ("     ///// |    ")
    print ("    |~~~|  |    ")
    print ("    |===|  |    "+C+"Brainly Answer Seeker "+O+"v.1.5"+W)
    print ("    |   |  |    "+GR+"https://github.com/N1ght420"+W)
    print ("    |   |  |    ")
    print ("    |   | /     ")
    print ("    |===|/      ")
    print ("    '---'       ")
    print ("")


banner()
a = input(C+" Pertanyaan "+R+"> "+W)
payload = {"query":a}
url = "https://brainly.co.id/api/28/api_tasks/suggester"
scrap = json.loads(requests.get(url, params=payload).text)
try:
    os.system('clear')
    qtion = scrap['data']['tasks']['items'][0]['task']['content']
    qtion = qtion.replace("<br />","\n").replace("<span>","").replace("</span>","")
    banner()
    print (C+" ["+W+" PERTANYAAN "+C+"]\n\n"+W+" ",qtion)
except:
    banner()
    print (C+" ["+W+" 404 "+C+"]"+R+" >"+W+" Soal tidak dapat ditemukan")
    print ("")
    exit()
try:
    for x in range(100):
        ans = scrap['data']['tasks']['items'][0]['responses'][x]['content']
        ans = ans.replace("<br />","\n").replace("<span>","").replace("</span>","")
        print ("")
        print (C+" [ "+W+"Jawaban " + str(x+1) + C+" ]\n\n"+W + ans)
except:
    print ("")
    print (C+" [ "+W+"Hanya dapat mengambil"+C+" ]"+R+" > "+W+ str(x) +" Jawaban")
    print ("")
