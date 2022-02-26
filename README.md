# File sorter
This is a simple program for linux that sorts your files in a directory and groups them in specified folders depending on the file's type. It's aimed to be simple, easy-to-use and widely configurable.

## Building instructions
Building process is simple. In order to build the program you only need package `nim` which is the compiler for Nim Programming Language.
1. Extraxt the files into desired directory
2. Open terminal in src directory
3. Run command `nim c archive.nim`
4. Add directory of binary `archive` file to $PATH (optional)

#### To-do features:
- ⚙️ Configuration file 
  - Custom messeges
  - Custom file groups
  - Multiple config profiles
- 🚩 Command flags
  - Force flag ✔️
  - Help flag
  - Debug flag
  - Load config profile flag
  - No output flag ✔️
- 📁 Specifying directory to sort files in
- 🗂️ Automatic file group's folders creation ✔️

###### Note: this program is in a very very early development so there may be many bugs. Have fun using it :3
