
# TokenTrove: Exploring the Lexical Landscape of C

This project uses FLEX to tokenize the lexemes of given C code, allowing for the categorization of keywords, identifiers, functions, numbers, strings, and more. It provides insights into the distribution and occurrence of different language elements within the code.




## Table of Contents
- Introduction
- Usage
- Features
- Results
- Contributing
- License


## Introduction

The FLEX C Code Tokenizer is designed to analyze C code and identify various language elements within it. It categorizes these elements into keywords, identifiers, functions, operators, numbers, and strings, providing a comprehensive overview of the code's structure.
## Usage
To use the FLEX C Code Tokenizer, follow these steps:

- Clone the repository: git clone https://github.com/Salman1804102/Compiler-Design-Flex-Project.git
- Navigate to the project directory: cd flex-c-tokenizer
- Compile the FLEX lexer: flex c_tokenizer.l
- Compile the generated C code: gcc lex.yy.c -o lexer
- Run the tokenizer on your C code: lexer.exe or lexer.exe < input
## Feature
- **Categorization:** The tokenizer categorizes various language elements, including keywords, identifiers, functions, operators, numbers, and strings.
- **Occurrence Count:** It provides an occurrence count for each categorized element, allowing you to see how frequently they appear in the code.
- **Detailed Results:** The README provides a clear breakdown of the occurrences of different elements, making it easier to analyze the code's structure.
## Results

The tokenizer provides detailed results for the given C code. The following output demonstrates the occurrence count for each category.
![Image 1](https://github.com/Salman1804102/Compiler-Design-Flex-Project/raw/main/Output/img1.PNG)
![Image 2](https://github.com/Salman1804102/Compiler-Design-Flex-Project/raw/main/Output/img2.PNG)
![Image 3](https://github.com/Salman1804102/Compiler-Design-Flex-Project/raw/main/Output/img3.PNG)
## Contributing
Contributions to the FLEX C Code Tokenizer project are welcome! If you find any issues or want to enhance the functionality, feel free to submit a pull request. For major changes, please open an issue to discuss your ideas first
## License

This project is licensed under the [MIT](https://choosealicense.com/licenses/mit/), which means you are free to use and modify the code according to the terms specified in the license.
