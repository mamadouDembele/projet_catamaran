import numpy as np
import matplotlib.pyplot as plt


def read_values(f):
    f.seek(0)
    column_name = f.readline().split()
    val_nb = len(column_name)
    val_list = [[] for k in range(val_nb)]
    for line in f:
        l = line.split()
        for k in range(val_nb):
            val_list[k].append(float(l[k]))

    print(column_name)
    print(val_list)
    return column_name, val_list

def my_plot(val_list):
    a = val_list[0]
    b = val_list[2]
    fig = plt.figure()
    ax = plt.axes(None, aspect = "equal")
    ax.plot(a, b)
    # plt.plot(a, b)
    fig.show()

if __name__ == "__main__":
    filename = "sim_log.txt"
    f = open(filename, "rt")
    column_name, val_list = read_values(f)
    f.close()
    my_plot(val_list)