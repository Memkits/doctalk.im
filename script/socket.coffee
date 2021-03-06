
host = location.host
s = io.connect "http://#{host}:8012"

s.on 'ready', -> show 'ready'
s.emit 'ready'

s.on 'err', add_err

s.on 'create-topic', append_topic

s.on 'show-topic', show_topic

s.on 'more-topic', more_topic

s.on 'goto-topic', start_posts

s.on 'add-post', append_post

s.on 'sync-post', sync_post

s.on 'more-posts', more_posts

s.on 'disconnect', ->
  add_err text: 'lose connection', permanent: yes