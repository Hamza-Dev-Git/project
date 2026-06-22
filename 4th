import pandas as pd

def find_s_algorithm(file_path):
    # Load training data
    data = pd.read_csv(file_path)

    print("Training Data:")
    print(data)

    # Separate attributes and target class
    attributes = data.columns[:-1]
    class_label = data.columns[-1]

    hypothesis = None

    # Process each training example
    for _, row in data.iterrows():
        if row[class_label] == 'Yes':
            # Initialize hypothesis with first positive example
            if hypothesis is None:
                hypothesis = list(row[attributes])
            else:
                # Generalize hypothesis where needed
                for i in range(len(attributes)):
                    if hypothesis[i] != row[attributes[i]]:
                        hypothesis[i] = '?'

    return hypothesis

# Main program
file_path = r"C:\Users\Dell\Desktop\training_data.csv"

final_hypothesis = find_s_algorithm(file_path)

print("\nFinal Hypothesis:")
print(final_hypothesis)
