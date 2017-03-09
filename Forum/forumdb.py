#
# Database access functions for the web forum.
# 

import time
import psycopg2
import bleach

## Get posts from database.
def GetAllPosts():
    '''Get all the posts from the database, sorted with the newest first.

    Returns:
      A list of dictionaries, where each dictionary has a 'content' key
      pointing to the post content, and 'time' key pointing to the time
      it was posted.
    '''
    DB = psycopg2.connect("dbname=forum")
    cursor = DB.cursor()
    cursor.execute("select * from posts order by time desc")
    rows = cursor.fetchall()
    
    posts = [{'content': str(bleach.clean(str(row[1]))), 'time': str(row[0])} for row in rows]
    
    DB.close()
    return posts

## Add a post to the database.
def AddPost(content):
    '''Add a new post to the database.

    Args:
      content: The text content of the new post.
    '''
    DB = psycopg2.connect("dbname=forum")
    t = time.strftime('%c', time.localtime())
    cursor = DB.cursor()
    cleaned = bleach.clean(content)
    cursor.execute("insert into posts values(%s, %s)", (cleaned, t))
    DB.commit()
    DB.close()
