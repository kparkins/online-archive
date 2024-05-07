import json

# File paths (customize as needed)
input_file_path = 'student_grades.json'
output_file_path = 'output.json'

# Open the input file and load the data
with open(input_file_path, 'r') as input_file:
    data = json.load(input_file)

# Write each object to a new line in the output file
with open(output_file_path, 'w') as output_file:
    for obj in data:
        output_file.write(json.dumps(obj) + '\n')

print(f"Processed {len(data)} JSON objects and wrote them to '{output_file_path}'.")

