from collections import Counter
import re

with open("avatarSpeeches.txt", "r", encoding="utf-8") as f:
    text = f.read().lower()

# I had to look up how to do this part 
words = re.findall(r"\b[a-z]+\b", text)

word_counts = Counter(words)


for word, count in word_counts.most_common(10):
    # Displays in the Gitbash Thingy 
    print(word, count)