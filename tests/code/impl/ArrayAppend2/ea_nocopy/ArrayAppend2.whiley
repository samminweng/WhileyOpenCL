import whiley.lang.*
// Use Array.append to build up the string
public method main(System.Console console):
    ASCII.string r = ""
    r = Array.append(r," This is a test ")
    console.out.println_s(r)