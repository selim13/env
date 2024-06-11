#!/usr/bin/env python3

import http.client
import json
import os
import textwrap

cache_path = os.path.expanduser('~') + '/.local/share/trello-tasks.txt'
list_id = '5ae8475b82b46c79a5855b82'
key = '1ca1768fba8de78c36143b9d3b45a7ef'
token = 'baf60994733bf20c9bab2a0fe52067199471900914582474a3cf76b2fc17b4c2'

def write_cache(body):
    with open(cache_path, mode='w', encoding='utf-8') as f:
        f.write(body)

def read_cache():
    with open(cache_path, mode='r', encoding='utf-8') as f:
        return f.read()

conn = http.client.HTTPSConnection('api.trello.com')
conn.request('GET', f'/1/lists/{list_id}/cards?fields=name&key={key}&token={token}')
res = conn.getresponse()

print('Tasks: ', end='')

if res.status == 200:
    body = res.read().decode('UTF-8')
    write_cache(body)
else:
    body = read_cache()
    print('${color red}${alignr}outdated ' + str(res.status) + '${color}', end='')

print()


try:
    cards = json.loads(body)
except:
    cards = []

def format_card(name):
    return '\n'.join(textwrap.wrap(name, width=40, subsequent_indent='  '))

for card in cards:
    print(f'• {format_card(card["name"])}')

