#!/bin/bash

commit_types=(
  "feat: a new feature"
  "edit: any change to the code aside from new feature or code formatting"
  "fix: a bug fix"
  "docs: changes to documentation"
  "format: code formatting, missing semi colons, etc; no code change"
  "refactor: refactoring production code, functions, loops, etc"
  "test: adding tests, refactoring test; no production code change"
  "chore: updating build tasks, package manager configs, etc; no production code change"
)

echo "Select a commit type:"
# Display the options for the user
for i in "${!commit_types[@]}"; do
  echo "$((i + 1)). ${commit_types[i]}"
done

read -p "Enter the number for the commit type: " commit_type_index

if ! [[ "$commit_type_index" =~ ^[0-9]+$ ]] || [ "$commit_type_index" -lt 1 ] || [ "$commit_type_index" -gt "${#commit_types[@]}" ]; then
  echo "Invalid selection. Exiting."
  exit 1
fi

# Extract the commit type prefix (e.g., "feat" from "feat: a new feature")
commit_type=$(echo "${commit_types[$((commit_type_index - 1))]}" | cut -d':' -f1)

read -p "Enter the commit message: " commit_message

git commit -m "$commit_type: $commit_message"

# Confirm the commit
echo "Committed with message: $commit_type: $commit_message"
