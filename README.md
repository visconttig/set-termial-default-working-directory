# 💀 _“cd Until It Works™”_

A tale of persistence, frustration, and glory.

> 🐢 Tired of opening Hyper and typing the same `cd` command like a cave-dwelling bash gremlin?  
> 🐉 Want your terminal to _know where the party is_ the moment it spawns?  
> 🧼 Do you love scripts that clean up after themselves (literally with `clear`)?

**Say hello to your new Hyper butler.**  
This AutoHotKey v1 script will _automagically_ teleport your terminal to your project folder **the first time** you open it — like a ninja, but less stabby and more directory-changey.

---

## 🛠 What It Does (aka: “The Sorcery Explained”)

This script:

1. Waits patiently in the background like a loyal house elf.
2. Detects when **Hyper Terminal** opens.
3. Sneaks in, whispers `cd C:\Users\<you>\OneDrive\Desktop\html-projects` into the shell.
4. _Tidy up aisle 3!_ Sends a `clear` too.
5. **Only does this once per launch** – doesn’t spam like an overeager intern.

---

## 🚀 Setup Instructions

### 1. Save this as `hyper-launcher.ahk` or something equally cool.

### 2. Stick it in the **Startup folder** to run on boot:

The script does this _itself_! Right here:

```ahk
FileCreateShortcut, %A_ScriptFullPath%, %A_Startup%\%A_ScriptName%.lnk, %A_ScriptDir%
```

No extra clicks. Just run it once, and boom – you're a productivity god.

---

## 🧬 How It Works

```ahk
targetDir := A_UserName "\\OneDrive\\Desktop\\html-projects"
fullPath := "C:\\Users\\" . targetDir
```

It builds a dynamic path so it works **on ANY computer**, as long as your project lives in the sacred OneDrive > Desktop > html-projects temple.

---

## 🪛 Customize It

Want to open a different directory? Change this line:

```ahk
targetDir := A_UserName "\\OneDrive\\Desktop\\html-projects"
```

To something else, like:

```ahk
targetDir := A_UserName "\\Documents\\WorldDominationPlans"
```

Live your dreams. We support you.

---

## 🔥 Bonus Spells

Want it to run other commands on open? Add more lines here:

```ahk
SendInput, cd %fullPath%{Enter}
SendInput, clear{Enter}
SendInput, nvim index.html{Enter} ; Just for flair
```

Go wild. Open `nvim`, run `npm start`, ask it how its day is going.

---

## ❄️ Cool Things This Script _Doesn't_ Do (Yet)

- Detect when you’re emotionally lost and suggest a directory metaphor.
- Brew coffee.
- Fix your CSS.

---

## 👏 Credits

Painstakingly slapped together by someone who googles “how to center a div” _weekly_. 💀  
Tested on one (1) machine, powered by caffeine and sheer desperation.

> **Disclaimer:** This script is provided "as is", with zero warranty, support, or emotional stability.  
> Any resemblance to working code is purely coincidental. Side effects may include spontaneous debugging,  
> existential dread, and excessive satisfaction when it actually works.

If it bricks your computer, it was probably already on the way out. 🧃

---

## 🦄 License

MIT, probably. But like, don’t sell it to evil corporations who hate `clear`.
