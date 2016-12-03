import yaml

tag_template = '''<span>{tag}</span>'''

entry_template = '''\
  <div class="entry">
    <div class="timestamp">{timestamp} {tags}</div>
    <div class="log">
      {log}
    </div>
  </div>

'''
output_template = '''\
<div class="worklog">
  <h2>Worklog</h2>

{entries}

</div>
'''

def generate():
    with open('worklog.json') as f:
        data = yaml.safe_load(f)

    entries = ''
    for entry in data:
        tags = ''
        for tag in entry['tags']:
            tags += tag_template.format(tag=tag)
        entries += entry_template.format(tags=tags,
                                  timestamp=entry['timestamp'],
                                  log=entry['log'])

    output = output_template.format(entries=entries)

    with open('publish/worklog.html', 'w+') as f:
        f.write(output)
    print('Worklog generated.')


if __name__ == '__main__':
    generate()
