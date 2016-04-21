__author__ = 'hira'
import sys
import json
import urllib3

def main():
    identifier = sys.argv[1]
    url = 'http://localhost:8000/api/add?debug=true'

    post_data = json.dumps({
        'identifier': identifier,
        'attention_body': '投稿テスト',
        'place_name':  '新宿駅東南口',
        'latitude': 35.6899585624,
        'longitude': 139.7004931789
    })

    headers = {
        'Content-Type': 'application/json'
    }

    http = urllib3.PoolManager()

    http.request('POST', url, headers=headers, body=post_data)


if __name__ == '__main__':
    main()
