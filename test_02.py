def convert_to_morse(s: str) -> str:
    # The function should be case insensitive.
    test_string = s.upper()

    # The function should ignore any characters not included in the Morse code alphabet.
    for val in test_string:
        if val not in "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 ":
            test_string = test_string.replace(val, "")

    alphabet_to_morse_dict = {"A": '.-', "B": '-...', "C": '-.-.', "D": '-..',
                              "E": '.', "F": '..-.', "G": '--.', "H": '....',
                              "I": '..', "J": '.---', "K": '-.-', "L": '.-..',
                              "M": '--', "N": '-.', "O": '---', "P": '.--.',
                              "Q": '--.-', "R": '.-.', "S": '...', "T": '-',
                              "U": '..-', "V": '...-', "W": '.--', "X": '-..-',
                              "Y": '-.--', "Z": '--..', "0": '-----', "1": '.----',
                              "2": '..---', "3": '...--', "4": '....-', "5": '.....',
                              "6": '-....', "7": '--...', "8": '---..', "9": '----.'}

    # Build a string, replacing the alphabet value with the morse code it's mapped to
    res = ""
    for val in test_string:
        if val == " ":
            res += " / "
        else:
            res += alphabet_to_morse_dict[val]
            res += " "

    return res


def main() -> None:
    print(convert_to_morse("SOS"))
    print(convert_to_morse("SO;'[S"))
    print(convert_to_morse("I love cheese"))
    print(convert_to_morse("can you read this"))


if __name__ == '__main__':
    main()
