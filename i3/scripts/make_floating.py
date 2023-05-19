#!/usr/bin/env python
from float import STATE_LOCATION
from collections import defaultdict
from i3ipc import Connection

if __name__ == "__main__":

    i3 = Connection()
    tree = i3.get_tree()
    foc_win = tree.find_focused()
    if foc_win is None:
        raise AttributeError()

    workspace = foc_win.workspace()
    if workspace is None:
        raise AttributeError()

    wsname = workspace.name
    with open(STATE_LOCATION, "r") as f:
        state_dict = defaultdict(lambda: 0)
        for line in f:
            k, v = line.split()
            state_dict[k] = int(v)

    if state_dict[wsname]:
        state_dict[wsname] = 0
        for leaf in workspace.leaves():
            leaf.command("floating disable")
    else:
        state_dict[wsname] = 1
        for leaf in workspace.leaves():
            leaf.command("floating enable")

    with open(STATE_LOCATION, "w") as f:
        for k, v in state_dict.items():
            f.write(f"{k} {v}\n")

