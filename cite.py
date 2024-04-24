import re
import sys
import subprocess

input_file = sys.argv[1]
output_file = input_file.replace('.tex', '.bib')

with open(input_file, "r") as f:
    content = f.read()

# Find all DOI references within \cite{}
dois = re.findall(r"\\cite\{(10[\w./]+)\}", content)

bibs = ""

for doi in dois:
    # Run doi2bib command
    doi2bib_output = subprocess.check_output(["doi2bib", doi]).decode('utf-8').strip()
    print(doi)
    print(doi2bib_output)

    if doi2bib_output:
        # Extract the citation key from the doi2bib output
        citation_key = re.search(r"@[\w]+{([\w:_/]+),", doi2bib_output).group(1)
        bibs += doi2bib_output
    else:
        print("Failed to replace " + doi)
        continue

    print(citation_key)

    # Replace \cite{$doi} with the citation key
    content = content.replace("\\cite{" + doi + "}", "\\cite{" + citation_key + "}")


with open(input_file, 'w') as f:
    f.write(content)

with open(output_file, "a") as f:
    f.write(bibs)
