import http.client
import json

conn = http.client.HTTPSConnection("cdn-api.co-vin.in")
payload = ''
headers = {
  'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6IlNzWnNCTmhaY0YzUTlTNHRycFFCVEJ5TlJSSSIsImtpZCI6IlNzWnNCTmhaY0YzUTlTNHRycFFCVEJ5TlJSSSJ9.eyJhdWQiOiJodHRwczovL25ld2hlYWx0aGVudi5henVyZWhlYWx0aGNhcmVhcGlzLmNvbSIsImlzcyI6Imh0dHBzOi8vc3RzLndpbmRvd3MubmV0L2E0OTNkYzQ5LTk4ODctNDExMS1hZTU3LWEwNDgwYmI4YzY2Mi8iLCJpYXQiOjE1OTQwMDg4NTYsIm5iZiI6MTU5NDAwODg1NiwiZXhwIjoxNTk0MDEyNzU2LCJhY3IiOiIxIiwiYWlvIjoiQVZRQXEvOFFBQUFBRy9WZ2Y4UE1jeHZva09vQmVyWlE1NmdvSWxvMjk5a2hjakhBQ1V1WGtLSEcxcjN3c25mbGpOdkdFRlFoMkJJdDRlb3crQ1FkbWdqWG5mNDZaQWZnUEJmeE50RU0zZmt3Z0tqL0kxYmE5VVE9IiwiYW1yIjpbInB3ZCJdLCJhcHBpZCI6IjRlMjE3YzBjLTUzNTAtNGQxYy1iMTY5LTAyOGE1MmJjN2M1NSIsImFwcGlkYWNyIjoiMSIsImVtYWlsIjoic21hcnR2aXNpb25haTFAb3V0bG9vay5jb20iLCJmYW1pbHlfbmFtZSI6IktoYW4iLCJnaXZlbl9uYW1lIjoiQXJiYWIiLCJpZHAiOiJsaXZlLmNvbSIsImlwYWRkciI6IjE1Ny4zNy4yMjQuMTE2IiwibmFtZSI6IkFyYmFiIEtoYW4iLCJvaWQiOiJhNGEzNzI0Ni1iYjJhLTQ4NzQtYWYxZi1mYmJkYzZiOTEzMjciLCJzY3AiOiJ1c2VyX2ltcGVyc29uYXRpb24iLCJzdWIiOiIwM2FBTG5namJUcVJuVzU1TlNtT3ZiZUpqdWdLYkY5clFST082QlE5ZFE0IiwidGlkIjoiYTQ5M2RjNDktOTg4Ny00MTExLWFlNTctYTA0ODBiYjhjNjYyIiwidW5pcXVlX25hbWUiOiJsaXZlLmNvbSNzbWFydHZpc2lvbmFpMUBvdXRsb29rLmNvbSIsInV0aSI6ImlTeEVya1BzdDB1UWVRYWRuZ2htQUEiLCJ2ZXIiOiIxLjAifQ.DBiVQ9bHpBQetPvMUGbow77Jqw4g3H7nDcG6k4TXvInhg3zwJjMgsyOxnZTx8-5le2HP5sSXCFkum-WXEI_eG7LCcymKrx7GfYprcSiAl6EOi-SNX9ugKei26TSeX-gc7j7uFIfCb9o1OSVUh9D27Php_wgwIO84DvkyIFdELa0QawIrKMuGBVrgSFxd1ANlPT3hoUvcbtwqC3UL-ByXJndBpr94FTCt2RK_qFryRsXRVpp7lfxRLz4M0lSHqPGUVIW2wwvtD1eBiMyjSMVkM5lVOhILveMhIYUt0ikhpkpDF5kP_S6DkN8x4V3446tHYEeFajzafRoBuPy4Uht2FA'
}

Distt_list = {}

def send_request(method,url,payload,headers):
    conn.request(method,url,payload,headers)
    res = conn.getresponse()
    data = res.read()
    str_data = json.loads(data.decode("utf-8"))
    return str_data

state_url = '/api/v2/admin/location/states'
district_url = '/api/v2/admin/location/districts/'
states = send_request("GET",state_url,payload,headers)
for state in states['states']:
    url = district_url+str(state['state_id'])
    distt = send_request('GET',url,payload,headers)
    Distt_list[state['state_name']] = distt['districts']

data = json.dumps(Distt_list)
with open('district_info.txt','w') as outfile:
    json.dump(data,outfile)



