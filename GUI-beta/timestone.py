import tkinter
from tkinter import * 
from tkinter.ttk import Progressbar
from tkinter import filedialog
import os 
import threading
import time







master=tkinter.Tk()
master.title("Time Stone Back Up Tool")
master.geometry("600x100")


def got_clicked():
  os.system("./install.sh")
button1=tkinter.Button(master, text="Install Tool", command=got_clicked)
button1.grid(row=1,column=0)

def back_up():
  os.system("./backup.sh")
button2=tkinter.Button(master, text="Back up files", command=back_up)   
button2.grid(row=1,column=2)

def restore():
  os.system("./restore.sh")
button3=tkinter.Button(master, text="Restore from back up", command=restore)
button3.grid(row=1,column=3)

def update():
  os.system("./install.sh")
button4=tkinter.Button(master, text="Update tool", command=update)
button4.grid(row=1,column=4)

def uninstall():
  os.system("./uninstall.sh")
button5=tkinter.Button(master, text="Uninstall tool", command=uninstall)
button5.grid(row=1,column=5)


master.mainloop()







