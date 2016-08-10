import json


def generate():
    with open('worklog.json') as f:
        data = json.load(f)

    output = []

    counter = 1
    for log in data:
        output.append({
            'id': counter,
            'start': log['start'],
            'content': log['log']
        })
        if 'end' in log:
            output[-1]['end'] = log['end']
        counter += 1

    with open('publish/worklog.json', 'w+') as f:
        json.dump(output, f)
    print('Worklog generated.')


if __name__ == '__main__':
    generate()
