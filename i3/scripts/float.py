#!/usr/bin/env python
from i3ipc import Connection, Event
from collections import defaultdict

STATE_LOCATION = os.path.expanduser("~/.config/i3/states/floating")

def floating_ws_on_create(i3, e):
    container = e.container
    new_window_id = container.id
    workspace = i3.get_tree().find_by_id(new_window_id).workspace()
    if workspace is None:
        return
    wsname = workspace.name
    with open(STATE_LOCATION, "r") as f:
        state_dict = defaultdict(lambda: 0)
        for line in f:
            k, v = line.split()
            state_dict[k] = int(v)

    if state_dict[wsname]:
        container.command("floating enable")

if __name__ == "__main__":
    i3 = Connection()
    i3.on(Event.WINDOW_NEW, floating_ws_on_create)
    i3.main()

