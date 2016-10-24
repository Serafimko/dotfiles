#!/usr/bin/python

import re
import requests
import ntfy
import sqlite3
import json
from vk import API, AuthSession

DB_PATH = '/home/serafim/dotfiles/i3/scripts/music.db'
CRED_PATH = '/home/serafim/dotfiles/i3/scripts/credential.json'
MUSIC_PATH = '/home/serafim/yandex/music/'
SELECT_SQL = 'SELECT * from music where artist=? and title=?'
INSERT_SQL = 'INSERT INTO music(Artist, Title) VALUES (?, ?)'


class MusicFinder:
    def __init__(self):
        credentials = self.get_credentials()
        session = AuthSession(
            app_id=5244210,
            user_login=credentials[0],
            user_password=credentials[1]
        )
        self.api = API(session)

    def get_music(self):
        result = self.api.wall.get(owner_id='-36648726', count=3)
        del result[0]
        del result[0]
        song_count = 0
        for res in result:
            for attachment in res['attachments']:
                if attachment.get('type') == 'audio':
                    artist = attachment['audio'].get('artist')
                    title = attachment['audio'].get('title')
                    if not self.check_song((artist, title)):
                        self.add_to_db((artist, title))
                        url = attachment['audio'].get('url')
                        if 'http' not in url:
                            continue
                        name = ('%s - %s'.replace(" ", "_") % (artist, title))
                        name = self.uglify(name)
                        # print(attachment['audio'].get('url'))
                        self.write_file(MUSIC_PATH, name, url)
                        song_count += 1
                    else:
                        continue
        if song_count != 0:
            message = 'New %s songs available' % song_count
            ntfy.notify(
                message=message,
                config={
                    'backends': ['telegram'],
                },
                title=''
            )

    @staticmethod
    def write_file(directory, name, url):
        path = '' + directory + name + '.mp3'
        response = requests.get(url)
        with open(path, 'wb') as output_file:
            output_file.write(response.content)
        output_file.close()

    @staticmethod
    def uglify(word):
        word = re.sub(r"[^\w\s]", '', word)
        word = re.sub(r"\s+", '-', word)
        return word

    @staticmethod
    def check_song(params):
        connection = sqlite3.connect(DB_PATH)
        cursor = connection.cursor()
        cursor.execute(SELECT_SQL, params)
        if cursor.fetchall():
            cursor.close()
            connection.close()
            return True
        else:
            cursor.close()
            connection.close()
            return False

    @staticmethod
    def add_to_db(params):
        connection = sqlite3.connect(DB_PATH)
        cursor = connection.cursor()
        cursor.execute(INSERT_SQL, params)
        connection.commit()
        cursor.close()
        connection.close()

    @staticmethod
    def get_credentials():
        with open(CRED_PATH, 'r') as data_file:
            data = json.load(data_file)
            login = data['music']['login']
            password = data['music']['password']
        return login, password

if __name__ == '__main__':
    music_finder = MusicFinder()
    music_finder.get_music()
