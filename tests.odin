package test

import "core:fmt"
import "core:strings"
print :: fmt.println


main :: proc() {

	print(convert_to_morse("SOS", context.temp_allocator))
	print(convert_to_morse("SO;'[S", context.temp_allocator))
	print(convert_to_morse("I love cheese", context.temp_allocator))
	print(convert_to_morse("can you read this", context.temp_allocator))

	free_all(context.temp_allocator)

	// OUTPUT:
	// ... --- ... 
	// ... --- ...
	// ..  / .-.. --- ...- .  / -.-. .... . . ... .
	// -.-. .- -.  / -.-- --- ..-  / .-. . .- -..  / - .... .. ...  

}


convert_to_morse :: proc(s: string, allocator := context.allocator) -> string {
	// The function should be case insensitive.
	test_string := strings.to_upper(s, allocator)
	// print(test_string)

	// The function should ignore any characters not included in the Morse code alphabet.
	b := strings.builder_make(allocator)
	for val in test_string {
		if strings.contains_rune("ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 ", val) {
			strings.write_rune(&b, val)
		}
	}
	final_string := strings.to_string(b)

	alphabet_to_morse_dict := map[rune]string {
		'A' = ".-",
		'B' = "-...",
		'C' = "-.-.",
		'D' = "-..",
		'E' = ".",
		'F' = "..-.",
		'G' = "--.",
		'H' = "....",
		'I' = "..",
		'J' = ".---",
		'K' = "-.-",
		'L' = ".-..",
		'M' = "--",
		'N' = "-.",
		'O' = "---",
		'P' = ".--.",
		'Q' = "--.-",
		'R' = ".-.",
		'S' = "...",
		'T' = "-",
		'U' = "..-",
		'V' = "...-",
		'W' = ".--",
		'X' = "-..-",
		'Y' = "-.--",
		'Z' = "--..",
		'0' = "-----",
		'1' = ".----",
		'2' = "..---",
		'3' = "...--",
		'4' = "....-",
		'5' = ".....",
		'6' = "-....",
		'7' = "--...",
		'8' = "---..",
		'9' = "----.",
	}
	defer delete(alphabet_to_morse_dict)

	// Build a string, replacing the alphabet value with the morse code it's mapped to
	b0 := strings.builder_make(allocator)
	for val in final_string {
		if val == ' ' {
			strings.write_string(&b0, " / ")
		} else {
			strings.write_string(&b0, alphabet_to_morse_dict[val])
			strings.write_string(&b0, " ")
		}
	}
	res := strings.to_string(b0)

	return res
}
