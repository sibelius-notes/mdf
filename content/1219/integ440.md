---
title: "INTEG 440: Computational Social Science"
prof: "John McLevey"
subjects: "INTEG"
---

**Instructor:** John McLevey (PhD Sociology, McMaster 2013). McLevey is a computational social scientist and network scientist whose research uses large-scale social media data to study disinformation campaigns and the diffusion of misinformation online. His lab (NETLAB) has produced open-source Python packages including `metaknowledge`, `pdpp`, and `Nate`. The textbook for this course — *Doing Computational Social Science* (SAGE, pre-print) — was written by McLevey himself.

**Course description:** The explosion of digital data is revolutionizing the way we learn about the world. This course focuses on the knowledge and skills necessary for doing high-quality social scientific research with digital data. Students learn to collect and analyze digital data using computational methods with the programming language Python.


---

## Module 1: Introduction to Computational Social Science

### What Is Computational Social Science?

Computational social science is an emerging field that applies computational methods — programming, data collection at scale, machine learning, network analysis, and natural language processing — to the questions and concerns of the social sciences. The "explosion of digital data" produced by the web, social media, sensors, and digitized archives has made it possible to study social phenomena at scales and with a granularity that was previously impossible. At the same time, the tools required to work with these data — Python, statistical packages, machine learning libraries — have become dramatically more accessible.

The textbook for this course, *Doing Computational Social Science* by John McLevey, is designed to take a reader from no prior programming experience to working with sophisticated machine learning and network models. The book is carefully scaffolded so that content from later chapters builds on earlier ones. You do not need to have mastered every chapter before moving on, but you should have a working understanding of the material.

### Learning Computational Social Science Effectively

McLevey recommends thinking about learning computational social science not as completing a checklist, but as a process of **enculturation** into a scientific community. The specific skills — Python syntax, Pandas operations, network centrality measures — matter less than internalizing the principles of transparent, auditable, and reproducible scientific computing. That means writing all data collection, cleaning, and analysis code in well-organized scripts or notebooks; managing projects using virtual environments and version control; and executing analyses from the command line.

A useful framework for monitoring your own progress is Bloom's taxonomy of learning outcomes, which distinguishes between *understanding*, *explanation*, and *application*. When you encounter a new concept, first focus on understanding what is going on. Then work on being able to explain it clearly in your own words. Only then should you push toward competent, independent application.

McLevey also advises reading each chapter twice: once for understanding, then again while typing out code at the computer, changing parameters and observing the results. This active engagement with the material accelerates learning.

### Datasets Used in This Course

The book draws on several recurring datasets:

- **V-Dem (Varieties of Democracy):** Country-level measures of democratic qualities, including electoral democracy, liberal democracy, participatory democracy, deliberative democracy, and egalitarian democracy. Useful for structured data analysis and regression.
- **UK Hansard speeches:** Transcripts of speeches delivered in the British House of Commons, labeled by political party affiliation. Used for text analysis and neural network classification.
- **SocioPatterns face-to-face contacts:** A network dataset of physical co-presence among French high school students in Marseille, 2013, collected via contact diaries. Used for network analysis.
- **Freedom House "Freedom on the Net" data:** Country-level measures of internet freedom, combined with V-Dem data for supervised learning examples.

### Setting Up Your Open Source Scientific Computing Environment

Computational social science requires working from the **command line** — a Command Line Interface (CLI) that allows you to interact with your computer's operating system by typing commands into a terminal. This may feel unfamiliar compared to graphical user interfaces, but it unlocks a vast world of open-source tools and enables best practices for scientific computing including remote work, reproducible analyses, and collaborative version control.

**The shell** is the program that interprets your commands. Linux and macOS use Unix-based shells (typically Bash or Zsh). Windows users need to install a terminal emulator (Cmder is widely used) and a package manager (Chocolatey).

**Key shell commands:**
- `pwd` — print working directory (show where you are)
- `ls` — list files in current directory; `ls -lh` for detailed output
- `cd path/to/directory` — change directory; `cd ..` to go up one level
- `mkdir new_folder` — create a new directory
- `cp source destination` — copy files; `mv source destination` — move/rename

**Anaconda** is the Python distribution of choice for scientific computing. It comes bundled with Python, Jupyter Notebook/Lab, and a large number of scientific packages. Crucially, Anaconda includes `conda`, the package and environment manager.

**Virtual environments** solve the problem of conflicting package dependencies across projects. Each environment contains its own Python interpreter and packages, isolated from other environments. The workflow is:

```bash
conda create -n myenv python=3.9    # create environment
conda activate myenv                 # activate it
conda install numpy pandas           # install packages
```

**Git and version control** allow you to track changes to your project files over time. Every change is recorded in a commit; you can inspect the history, revert mistakes, and collaborate with others. Basic workflow:

```bash
git init                    # initialize a new repository
git add filename.py         # stage a file for commit
git commit -m "Add analysis"  # commit with a message
git push origin main        # push to a remote (GitHub)
```

**Jupyter Notebook/Lab** is an interactive development environment that combines code, output, and prose in a single document (`.ipynb` file). Cells can contain Python code or Markdown text. You run a cell with Shift+Enter. Jupyter is the standard tool for exploratory data analysis in the Python ecosystem.

---

## Module 2: Python Programming

### The Python Programming Language

Python is a high-level, general-purpose programming language that has become the dominant language for data science and computational social science. Its appeal lies in its readability, extensive standard library, and a rich ecosystem of third-party packages. You do not need to master Python before moving on to later topics; the skills introduced here will become more natural with practice.

### Basic Data Types

Python has four fundamental data types:

- **Strings** (`str`): sequences of characters, e.g., `"Hello, world!"`
- **Integers** (`int`): whole numbers, e.g., `42`
- **Floats** (`float`): decimal numbers, e.g., `3.14`
- **Booleans** (`bool`): `True` or `False`

You assign a value to a variable using the `=` operator:

```python
name = "Tokyo"
population = 37468000
is_megacity = True
```

### String Methods

Strings are objects in Python and come with many useful methods. Methods are called using dot notation: `string.method()`. Common string methods include `.upper()`, `.lower()`, `.strip()` (removes leading/trailing whitespace), `.split()`, `.join()`, and f-strings for embedding variables:

```python
city = "  New York  "
city.strip()          # "New York"
f"Population of {city.strip()}: {8336817}"
```

### Comparison and Control Flow

Control flow allows your program to make decisions. The `if`/`elif`/`else` structure executes code conditionally:

```python
population = 5000000
if population > 10000000:
    print("Megacity")
elif population > 1000000:
    print("Large city")
else:
    print("Smaller city")
```

**Comparison operators:** `==` (equal), `!=` (not equal), `>`, `<`, `>=`, `<=`. **Boolean connectives:** `and`, `or`, `not`.

`while` loops execute a block of code as long as a condition remains `True`. Be careful: a `while` loop whose condition is never broken will run indefinitely.

### Tracebacks and Error Handling

When Python encounters an error, it prints a **traceback** — a description of the error and where it occurred. Common errors include `NameError` (using an undefined variable), `TypeError` (wrong type), and `IndexError` (accessing beyond list bounds). Read tracebacks from the bottom up: the bottom line identifies the error type and message; the lines above show the chain of function calls that led to it.

`try`/`except` blocks handle exceptions gracefully without crashing the program:

```python
try:
    result = 10 / 0
except ZeroDivisionError:
    print("Cannot divide by zero")
```

### Data Structures: Lists, Tuples, and Dictionaries

**Lists** are ordered, mutable sequences, written with square brackets. Lists can contain any mix of data types:

```python
megacities = ["Tokyo", "Delhi", "Shanghai"]
populations = [37468000, 28514000, 25582000]

megacities.append("São Paulo")         # add to end
megacities.remove("Delhi")              # remove by value
megacities.sort()                        # sort in place
megacities_copy = megacities.copy()     # shallow copy
```

Beware: assigning a list with `=` creates a reference to the same object, not a new copy. Use `.copy()` (shallow) or `copy.deepcopy()` (deep) to create independent copies.

**Iterating over lists** with `for` loops and **list comprehensions**:

```python
# For loop
char_counts = []
for country in ["Japan", "India", "China"]:
    char_counts.append(len(country))

# List comprehension (equivalent)
char_counts = [len(country) for country in ["Japan", "India", "China"]]
```

The `zip()` function pairs items from multiple lists by index, and `enumerate()` provides both the index and value during iteration.

**Tuples** are ordered and *immutable* — they cannot be modified after creation. Written with parentheses: `coords = (48.8566, 2.3522)`. Use tuples for data that should not change.

**Dictionaries** store key-value pairs and are the primary way to represent structured data in Python:

```python
city_data = {
    "name": "Tokyo",
    "country": "Japan",
    "population": 37468000
}
city_data["continent"] = "Asia"   # add new key
city_data["name"]                  # "Tokyo"
```

### Custom Functions

Functions allow you to encapsulate reusable logic. A function is defined with `def`, takes parameters, and returns a value with `return`:

```python
def format_population(city, pop):
    """Return a formatted string describing city population."""
    return f"The population of {city} is {pop:,}"

format_population("Tokyo", 37468000)
# "The population of Tokyo is 37,468,000"
```

### Reading and Writing Files

Working with files is fundamental to data collection and analysis:

```python
# Reading a text file
with open("data.txt", "r") as infile:
    content = infile.read()

# Writing a text file
with open("output.txt", "w") as outfile:
    outfile.write("Hello, world!")

# JSON (for structured data)
import json
with open("data.json", "w") as f:
    json.dump(my_dict, f)

with open("data.json", "r") as f:
    data = json.load(f)
```

The `with open(...)` syntax ensures the file is properly closed when you're done, even if an error occurs.

---

## Module 3: Collecting Data from the Web

### Application Programming Interfaces (APIs)

An **Application Programming Interface (API)** is a documented protocol that allows programs to communicate with one another. Web APIs allow researchers to collect data from online platforms programmatically rather than manually. The most common type is the **REST API** (Representational State Transfer), which exchanges data over HTTP.

The mental model for REST APIs: you send a **request** (specifying what data you want) to an **endpoint** (a URL), and the server sends back a **response** containing the data in a structured format, typically JSON.

**Key API concepts:**
- **API key/token:** A secret identifier that authenticates your requests. Store API keys as environment variables, never in your code.
- **Parameters:** Arguments that filter or shape the data you receive (e.g., date range, keyword).
- **Rate limiting:** Most APIs restrict how many requests you can make per minute or hour. Respect these limits; add `time.sleep()` between requests if needed.
- **HTTP status codes:** `200` = success; `4xx` = client error (bad request, unauthorized); `5xx` = server error.

The Python `requests` package simplifies making HTTP requests:

```python
import requests

ENDPOINT = "https://content.guardianapis.com/search"
PARAMS = {
    "api-key": "YOUR_KEY",
    "q": "coronavirus",
    "from-date": "2020-04-10",
    "to-date": "2020-04-10",
    "lang": "en",
    "show-fields": "wordcount,body,byline",
    "page-size": 50
}

response = requests.get(ENDPOINT, params=PARAMS)
response_dict = response.json()["response"]
```

To collect all pages of results, use a `while` loop that checks the total number of pages and increments the `page` parameter dynamically. Always add rate-limiting delays and save data to disk to avoid redundant API calls.

### Web Scraping

When data is not available through an API, researchers can **scrape** it directly from websites by parsing their HTML source code. The golden rule: study the source code before writing any scraping code.

<strong>HTML basics:</strong> Websites are built with HTML tags. `<h1>` is a top-level heading; `<p>` is a paragraph; `<a href="url">` is a link; `<div id="name">` and `<span class="name">` are containers. The <strong>Document Object Model (DOM)</strong> is the tree structure of these elements.

The Python `BeautifulSoup` package parses HTML:

```python
from bs4 import BeautifulSoup
import requests

response = requests.get("https://example.com/article")
soup = BeautifulSoup(response.content, "lxml")

# Find elements
headline = soup.find(id="headline").get_text()
intro = " ".join(
    segment for segment in soup.find(id="intro").stripped_strings
)
```

To scrape multiple pages, identify the pattern in the URLs (page numbers, date strings, unique IDs) and iterate programmatically:

```python
scraped = []
current_number = 30000
target_records = 30

while len(scraped) < target_records:
    url = base_url.format(current_number)
    try:
        output = scrape_function(url)
        if output is not None:
            scraped.append(output)
    except AttributeError:
        pass
    current_number += 1
```

<strong>Ethical and legal considerations:</strong> Always check a website's Terms of Service before scraping. Do not scrape at a rate that could overwhelm the server (be a good digital citizen). Academic researchers should apply the same ethical standards they use for observational fieldwork: just because data is technically accessible does not mean it is ethically appropriate to collect. There is no single agreed-upon standard, but a useful heuristic is to treat only clearly public content as fair game, and to limit collection to what is genuinely needed.

---

## Module 4: Data Processing

### Working with Pandas

<strong>Pandas</strong> is the foundational Python package for working with structured (tabular) data. It provides two main data structures: the <strong>Series</strong> (a one-dimensional labeled array) and the <strong>DataFrame</strong> (a two-dimensional table with labeled rows and columns). Pandas is built on top of <strong>NumPy</strong>, a lower-level package for efficient numerical computation.

```python
import pandas as pd
import numpy as np

# Loading data
df = pd.read_csv("data.csv", low_memory=False)

# Inspecting
df.head()                   # first 5 rows
df.tail()                   # last 5 rows
df.sample(10)               # random 10 rows
df.info()                   # column names, dtypes, null counts
df.describe()               # descriptive statistics
df.shape                    # (rows, columns)
```

### Selecting and Filtering

<strong>Selecting columns</strong> returns a Series (single column) or DataFrame (multiple columns):

```python
df["country_name"]                          # Series
df[["country_name", "v2x_polyarchy"]]       # DataFrame
```

<strong>Filtering rows</strong> uses boolean conditions:

```python
democracies = df[df["v2x_polyarchy"] > 0.7]
recent = df[df["year"] >= 2018]
subset = df.query("year == 2019 and v2x_regime == 3")
```

### Grouping and Aggregation

`groupby()` splits data into groups and applies aggregation functions:

```python
# Mean democracy index by region, for each year
df.groupby(["region", "year"])["v2x_polyarchy"].mean()

# Multiple aggregations
df.groupby("region").agg(
    mean_democracy=("v2x_polyarchy", "mean"),
    count=("country_name", "count")
)
```

### Datetime Objects

Pandas has strong support for time-series data. Convert a column to datetime with `pd.to_datetime()`, then extract components (`.dt.year`, `.dt.month`) or resample:

```python
df["date"] = pd.to_datetime(df["date"])
df["year"] = df["date"].dt.year
monthly = df.resample("M", on="date")["value"].sum()
```

### Combining DataFrames

<strong>Concatenation</strong> stacks DataFrames vertically (rows) or horizontally (columns):

```python
combined = pd.concat([df_2018, df_2019, df_2020], ignore_index=True)
```

<strong>Merging</strong> joins DataFrames on shared keys:

```python
merged = pd.merge(vdem_df, freedom_house_df,
                  on=["country_name", "year"],
                  how="left")
```

### Record Linkage

<strong>Record linkage</strong> is the process of connecting records from different datasets that refer to the same entity (e.g., the same country or person). This is enormously powerful but also fraught: different datasets use different names for the same entity ("United States" vs. "USA" vs. "US"), and imprecise matching can introduce serious errors. Always validate linked records carefully.

---

## Module 5: Visualization, Exploratory Data Analysis, and Latent Factors

### Box's Loop and Iterative Research Workflows

Good data analysis is not linear. George Box famously said that "all models are wrong, but some are useful," and the iterative research workflow known as <strong>Box's Loop</strong> formalizes this: you move repeatedly between data, exploratory analysis, model specification, model critique, and model revision. Exploratory Data Analysis (EDA) is not a preliminary step before "real" analysis; it is intimately woven into the entire modeling process.

### Principles of Effective Data Visualization

Effective visualizations communicate the structure of data clearly and honestly. A few guiding principles:

1. <strong>Match the visualization to the data type.</strong> Histograms for distributions; scatter plots for relationships between continuous variables; bar charts for categorical comparisons; line plots for time series.
2. <strong>Reduce chartjunk.</strong> Decorative elements that don't encode data (3D effects, heavy grid lines, gratuitous color) distract from the message.
3. <strong>Use color purposefully.</strong> Color can distinguish categories (qualitative palette) or represent a gradient (sequential/diverging palette).
4. <strong>Label everything.</strong> Axes, units, and titles should be self-explanatory.

Python's <strong>Seaborn</strong> library (built on top of Matplotlib) provides high-level functions for attractive statistical visualizations:

```python
import seaborn as sns
import matplotlib.pyplot as plt

# Distribution
sns.histplot(df["v2x_polyarchy"], kde=True)

# Scatter with regression
sns.regplot(data=df, x="v2x_libdem", y="v2x_polyarchy")

# Joint distribution (2D KDE + marginals)
sns.jointplot(data=df, x="v2x_egaldem", y="v2x_polyarchy", kind="scatter")

# All pairwise relationships
high_level = ["v2x_polyarchy", "v2x_libdem", "v2x_partipdem",
              "v2x_delibdem", "v2x_egaldem"]
sns.pairplot(df[high_level])
plt.show()
```

### Latent Variables and the Curse of Dimensionality

Many concepts in social science are <strong>latent variables</strong> — abstract constructs that cannot be directly observed. Political ideology, social capital, well-being, deliberative democracy: we cannot measure these directly. Instead, we measure their *dimensions* (indicator variables) and combine them into estimates of the latent construct.

The <strong>curse of dimensionality</strong> refers to the proliferation of problems that arise as the number of variables in a dataset grows. With many variables, the data becomes sparse (observations are spread thin across the high-dimensional space), many statistical models require exponentially more data to work well, and the risk of spurious correlations increases. Dimensionality reduction mitigates these problems.

### Exploratory Factor Analysis (EFA)

<strong>Exploratory Factor Analysis</strong> is a theory-driven approach to measuring latent variables. Given a set of indicator variables (e.g., items on a political ideology survey), EFA estimates the underlying factors that account for the correlations among those items. The key steps are:
1. <strong>Specification:</strong> Define the latent construct and its measurable dimensions.
2. <strong>Measurement model:</strong> Fit a factor model that links indicators to latent factors.
3. <strong>Validation:</strong> Assess reliability (e.g., Cronbach's alpha) and validity (confirmatory factor analysis).

EFA is appropriate when the researcher has *theoretical* reasons to believe certain variables cluster together into a latent construct.

### Principal Component Analysis (PCA)

<strong>Principal Component Analysis (PCA)</strong> is a data-driven method for dimensionality reduction. Rather than starting from theory, PCA finds the directions of maximum variance in the data and projects observations onto a lower-dimensional subspace. The first principal component (PC1) captures the most variance; PC2 captures the most residual variance, and so on.

PCA is appropriate when:
- You have a high-dimensional dataset and want to reduce it to a manageable number of features.
- You want to visualize high-dimensional data in 2D or 3D.
- You want to remove correlated variables before modeling.

```python
from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import PCA

# Standardize first (PCA is sensitive to scale)
X = df[indicators].to_numpy()
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

# Fit PCA
pca = PCA()
pca.fit(X_scaled)

# Variance explained
explained_variance_ratio = pca.explained_variance_ratio_
cumulative_variance = explained_variance_ratio.cumsum()

# Transform to lower dimension
X_pca = pca.transform(X_scaled)
```

K-means clustering can then be applied to the PCA-reduced data to identify groups of countries with similar democratic profiles.

---

## Module 6: Natural Language Processing and Exploratory Text Analysis

### Text Analysis Pipelines and Workflows

Text analysis in computational social science is not a single method but a *pipeline* of interconnected steps: data collection, cleaning and normalization, quantitative representation, exploratory analysis, and modeling. The key insight is that exploration and modeling are iterative — you move back and forth between the data and your models. At every stage, <strong>close reading</strong> of actual texts is essential. Computers identify patterns; humans interpret and evaluate those patterns.

<strong>Computational Grounded Theory</strong> (Nelson 2017) formalizes this human-computer collaboration into three steps:
1. <strong>Pattern detection:</strong> Use computational methods (topic models, clustering, SVD) to discover latent themes.
2. <strong>Guided deep reading:</strong> Systematically read texts representative of discovered patterns to develop interpretive understanding.
3. <strong>Pattern confirmation:</strong> Operationalize the interpretive insights as a supervised classification task and validate computationally.

### Natural Language Processing with spaCy

<strong>spaCy</strong> is the standard Python package for NLP tasks. Loading a language model creates a processing pipeline:

```python
import spacy
nlp = spacy.load("en_core_web_sm",
                 disable=["ner", "textcat", "parser"])

abstract = "The explosion of digital data is revolutionizing..."
doc = nlp(abstract)
```

spaCy represents text as nested objects: the <strong>Doc</strong> (full text), <strong>Tokens</strong> (individual words/punctuation), and <strong>Spans</strong> (contiguous sequences). Key token attributes:
- `token.text` — raw surface form
- `token.lemma_` — lemmatized form (base word)
- `token.pos_` — part-of-speech (NOUN, VERB, ADJ, etc.)
- `token.is_stop` — whether it's a stop word
- `token.is_punct` — whether it's punctuation

<strong>Normalization</strong> reduces vocabulary size and improves downstream analysis:
- *Lemmatization* maps inflected forms to their base: "running" → "run", "studies" → "study"
- *Stemming* strips suffixes heuristically; lemmatization is generally preferred
- Removing stop words (common words like "the", "and") reduces noise

<strong>Part-of-speech filtering</strong> allows you to extract only content words:

```python
lemmas = [tok.lemma_ for tok in doc
          if not tok.is_stop and not tok.is_punct
          and tok.pos_ in ["NOUN", "VERB", "ADJ"]]
```

Subject-verb-object triplets (`doc.noun_chunks`, `token.dep_`) provide compact summaries of sentence content.

### Document-Term Matrices and Bag of Words

The <strong>bag-of-words</strong> representation ignores word order and treats a document as a collection of word frequencies. The <strong>Document-Term Matrix (DTM)</strong> encodes these counts for an entire corpus: rows are documents, columns are vocabulary terms, and cells contain term frequencies (or weights).

DTMs are *long and sparse*: vocabularies may contain tens of thousands of terms, but each individual document uses only a small fraction, so most cells are zero.

<strong>TF-IDF (Term Frequency–Inverse Document Frequency)</strong> weights words to emphasize those that are informative about a particular document relative to the rest of the corpus. Words that appear frequently across *all* documents (like "the") get down-weighted; words that appear frequently in *one* document but rarely elsewhere get up-weighted.

\[ \text{TF-IDF}(w, d) = \text{TF}(w, d) \times \log\left(\frac{N}{\text{DF}(w)}\right) \]

where *N* is the total number of documents and DF(*w*) is the number of documents containing word *w*.

Sklearn's `TfidfVectorizer` handles this automatically:

```python
from sklearn.feature_extraction.text import TfidfVectorizer

vectorizer = TfidfVectorizer(
    strip_accents="unicode",
    stop_words="english",
    min_df=0.01
)
dtm = vectorizer.fit_transform(lemmatized_speeches)
feature_names = vectorizer.get_feature_names_out()
```

### Singular Value Decomposition and Latent Semantic Analysis

<strong>Latent Semantic Analysis (LSA)</strong> uses Singular Value Decomposition (SVD) to project documents into a lower-dimensional *latent semantic space*, where documents that use similar words (even if they don't share exact terms) are represented as nearby vectors. SVD is the text-analysis analog of PCA.

```python
from sklearn.decomposition import TruncatedSVD

svd = TruncatedSVD(n_components=50, random_state=42)
X_lsa = svd.fit_transform(dtm)
```

<strong>Cosine similarity</strong> measures the similarity between two document vectors regardless of document length:

\[ \text{cosine}(A, B) = \frac{A \cdot B}{\|A\| \|B\|} \]

Values near 1 indicate high similarity; values near 0 indicate near-orthogonality (very different content).

---

## Module 7: Network Analysis

### Social Networks and Relational Thinking

Traditional quantitative social science focuses on the *attributes* of independent individuals — their income, education, attitudes. <strong>Social network analysis</strong> (SNA) focuses instead on *relationships* between entities and how those relationships structure social outcomes. The core insight is that your position in a social network — who you know, how you are connected to others — affects what resources you can access, what information you receive, and how much influence you have.

Network analysis distinguishes four ways of conceptualizing social ties:
1. <strong>Affective ties / sentiment:</strong> patterns of liking, trust, or hostility
2. <strong>Access and opportunity structures:</strong> resource flows (information, support, capital)
3. <strong>Socially constructed role relations:</strong> durable positions (boss/employee, parent/child)
4. <strong>Behavioral interactions:</strong> observed acts (co-presence, email, collaboration)

Each conceptualization implies different data collection strategies and analytical concerns.

### Network Data Structures

<strong>Nodes</strong> (vertices) represent entities (people, organizations, countries). <strong>Edges</strong> (links, ties) represent relationships. Networks can be:

- <strong>Directed</strong> (edges have a source and target: A→B) or <strong>undirected</strong> (edges are symmetric: A–B)
- <strong>Weighted</strong> (edges carry a numeric weight, e.g., interaction frequency) or <strong>unweighted</strong>
- <strong>Signed</strong> (edges can be positive or negative) or <strong>unsigned</strong>
- <strong>Unipartite</strong> (one type of node) or <strong>bipartite</strong> (two types of node, e.g., people and events)

In modern practice, network data is stored as <strong>edgelists</strong> and <strong>nodelists</strong> in CSV files. An edgelist has at minimum two columns (source, target); additional columns encode edge attributes. A nodelist has one row per node with node attribute data.

<strong>NetworkX</strong> is the standard Python package for network analysis:

```python
import networkx as nx
import pandas as pd

edges = pd.read_csv("contact_diaries.csv", sep=" ")
G = nx.from_pandas_edgelist(edges, "i", "j",
                             create_using=nx.Graph())
G.name = "Reported Contacts (Diary Data)"
print(nx.info(G))
```

### Walk Structure and Network Flow

A <strong>walk</strong> is any sequence of adjacent nodes and edges. A <strong>trail</strong> is a walk where edges do not repeat. A <strong>path</strong> is a walk where *nodes* do not repeat. A <strong>cycle</strong> is a closed path (starts and ends at the same node). The <strong>length</strong> of a walk/path is the number of edges it traverses.

If there exists a path between two nodes, they are <strong>reachable</strong> from each other. The <strong>shortest path</strong> between two nodes is the path of minimum length. Most social network analysis involves reasoning about how contagions — information, resources, diseases — can flow along walks and paths through a network.

### Community Detection and Cohesive Subgroups

Networks often decompose into internally dense, externally sparse groups called <strong>communities</strong> or <strong>cohesive subgroups</strong>. These can be detected by several approaches:

<strong>Bottom-up approaches:</strong>
- <strong>k-clique communities:</strong> Build communities from overlapping cliques of size ≥ *k*. Allows nodes to belong to multiple communities.
- <strong>Louvain / Leiden community detection:</strong> Optimize <strong>modularity</strong> — the difference between observed edge density within communities and the expected density under a random graph model. Leiden is an improvement on Louvain that avoids poorly connected communities.

<strong>Top-down approaches:</strong>
- <strong>k-core decomposition:</strong> The *k*-core is the largest subgraph in which every node has at least *k* neighbors within that subgraph. Progressively removing lower-degree nodes reveals the core structure.
- <strong>k-component analysis:</strong> Finds maximally connected subgraphs where removing fewer than *k* nodes cannot disconnect them (structural cohesion).

```python
import community as community_louvain  # python-louvain

partition = community_louvain.best_partition(G)
# partition is a dict: {node: community_id}
```

### Centrality Analysis

<strong>Centrality</strong> measures quantify a node's importance, influence, or power in the network. Each measure operationalizes a different theoretical conception of centrality:

<strong>Degree centrality</strong> counts direct connections. A node with many ties is "popular" or "active." In directed networks, distinguish in-degree (ties received) from out-degree (ties sent).

<strong>Betweenness centrality</strong> counts how often a node lies on the shortest path between all other pairs of nodes. High betweenness = broker position = ability to control information flow.

\[ C_B(v) = \sum_{s \neq v \neq t} \frac{\sigma_{st}(v)}{\sigma_{st}} \]

<strong>Eigenvector centrality</strong> gives higher scores to nodes connected to other high-scoring nodes. Being connected to important nodes matters, not just having many connections. Google's PageRank is a variant of eigenvector centrality.

<strong>Bonacich power centrality</strong> distinguishes situations where connection to powerful others is beneficial (positive beta) versus situations where connection to powerful others is dangerous (negative beta, e.g., dependency relations).

```python
degree_centrality = nx.degree_centrality(G)
betweenness_centrality = nx.betweenness_centrality(G)
eigenvector_centrality = nx.eigenvector_centrality(G)
```

Always interpret centrality measures in relation to the *type of relationship* encoded in the edges. Betweenness centrality means something very different in a trust network versus a physical co-presence network.

---

## Module 8: Epidemic Spread, Diffusion on Social Networks, and Research Ethics

### Simple Contagions and Network Epidemic Models

A <strong>simple contagion</strong> spreads through a network by any single contact: a pathogen, a piece of information, a rumor. The key feature is that exposure to one infected neighbor is sufficient to become "infected."

The classic epidemic model is <strong>SIR</strong>: every node can be Susceptible, Infected, or Recovered/Removed. Traditional SIR models use differential equations that assume random mixing (every individual is equally likely to contact every other). Network-based SIR models are more realistic: they restrict spread to observed edges, meaning that network structure (density, clustering, presence of hubs) profoundly shapes epidemic outcomes.

<strong>NDlib</strong> is the Python package for agent-based epidemic simulations on networks:

```python
import ndlib.models.ModelConfig as mc
import ndlib.models.epidemics as ep

model = ep.SIRModel(G)
cfg = mc.Configuration()
cfg.add_model_parameter("beta", 0.01)   # infection probability
cfg.add_model_parameter("gamma", 0.005) # recovery probability
cfg.add_model_parameter("fraction_infected", 0.05)
model.set_initial_status(cfg)

iterations = model.iteration_bunch(200)
```

Running many simulations and aggregating results (averaging across stochastic realizations) gives a picture of typical epidemic behavior on the network.

### Complex Contagions

Using the analogy of infectious disease to describe the spread of *behaviors* and *beliefs* is a "highly-consequential mistake" (McLevey). Unlike simple contagions, <strong>complex contagions</strong> require reinforcement from *multiple independent* sources before adoption. Adopting a risky or socially deviant behavior (quitting a job to join a protest, converting to a new religion, embracing a radical political ideology) requires social proof from multiple independent contacts, not just a single exposure.

Complex contagions spread more slowly and via different network pathways than simple ones:

- Simple contagions spread fastest through <strong>weak ties</strong> (bridges between densely connected clusters), because these weak ties carry the contagion to new communities quickly.
- Complex contagions spread fastest through <strong>wide bridges</strong> — cohesive clusters with many redundant connections — because confirmation from multiple independent sources is needed.

<strong>Threshold models</strong> capture complex contagion dynamics: a node adopts a behavior when the fraction of its neighbors who have already adopted exceeds some threshold *θ*. NDlib implements various threshold models including the Watts threshold model.

### Research Ethics, Politics, and Practices in Computational Social Science

Computational social science involves power that our ethical standards have not yet fully caught up with. The rapid development of computational methods has outpaced the development of ethical norms and guidelines. McLevey argues forcefully that researchers must be *proactive* rather than reactive — anticipating potential harms before they materialize, rather than scrambling to address them after the fact.

<strong>Informed consent</strong> presents new challenges. Social media data is technically public, but users cannot reasonably anticipate all the ways their data will be combined, analyzed, and interpreted. The ability to <strong>re-identify</strong> nominally anonymized data is greater than most people realize: in the famous AOL search log leak of 2006, a New York Times reporter identified a specific individual from their search history within days. Researchers can de-anonymize individuals without realizing it by linking multiple datasets.

<strong>Algorithmic bias</strong> occurs when machine learning models trained on biased data encode and amplify existing social inequalities. Training data reflects the social world with all its biases; models trained on this data can systematically disadvantage already-marginalized groups (in hiring algorithms, loan approval, criminal recidivism prediction, facial recognition). The harm done by biased systems is often invisible to the people who built them.

<strong>The "I won't build it" list</strong> (Rachael Tatman) is a practical ethical framework: articulate explicitly what types of systems you will and will not build, before the pressure to build them arises. Normalizing explicit refusal — as a professional norm, not just personal preference — raises the cost of building harmful systems.

Making your normative values explicit and visible in your research is not a sign of bias; it produces better, more transparent, and more accountable science.

---

## Module 9: Supervised Machine Learning

### Overview of Machine Learning Paradigms

<strong>Machine learning</strong> is the study of algorithms that improve their performance through experience (data). The field is organized around three major paradigms:

<strong>Symbolic learning</strong> draws inspiration from rules-based reasoning, abstraction, and analogy. Models learn explicit rules or boundaries (decision trees, linear regression, k-nearest neighbors). These models tend to be interpretable — you can inspect the rules or coefficients — but may struggle with complex, unstructured data.

<strong>Connectionist learning</strong> draws inspiration from biological neural networks. Complex networks of artificial neurons are arranged in layers and learn distributed representations of data. Neural networks are extremely powerful but opaque ("black box") and require large amounts of data.

<strong>Probabilistic machine learning</strong> is closest to classical statistics. Models encode uncertainty explicitly through probability distributions. Bayesian models belong here. They are highly interpretable and principled but computationally demanding.

<strong>Supervised vs. unsupervised learning:</strong>
- *Supervised* learning trains on labeled data (each observation has a known outcome). Goal: predict the outcome for new observations. Examples: regression, classification.
- *Unsupervised* learning finds structure in unlabeled data. Examples: clustering, dimensionality reduction, topic modeling.

### The Supervised Learning Workflow

All supervised learning follows a standard workflow:

1. <strong>Split data</strong> into training and test sets.
2. <strong>Train</strong> the model on the training set.
3. <strong>Evaluate</strong> performance on the held-out test set.
4. <strong>Report</strong> metrics honestly — metrics computed on training data are inflated.

The train-test split prevents the model from simply memorizing the data rather than learning generalizable patterns:

```python
from sklearn.model_selection import train_test_split

X = vdem_df[["v2x_polyarchy", "v2x_libdem", "v2x_partipdem",
             "v2x_delibdem", "v2x_egaldem"]]
y = freedom_house_df[["Total Score"]]

X_train, X_test, y_train, y_test = train_test_split(
    X, y, shuffle=True, random_state=23
)
```

### Cross-Validation

A single train-test split may produce misleading results if the data happens to be ordered or clustered. <strong>k-fold cross-validation</strong> addresses this by repeatedly splitting the data: the dataset is divided into *k* equally-sized folds, and the model is trained and evaluated *k* times, each time holding out one fold for validation. The *k* evaluation scores are then examined together, or averaged.

`ShuffleSplit` randomizes the order of observations before folding, improving stability:

```python
from sklearn.model_selection import cross_val_score, ShuffleSplit

shuffle_split = ShuffleSplit(n_splits=5, test_size=0.2, random_state=42)
cv_scores = cross_val_score(model, X_train, y_train, cv=shuffle_split)
```

### Linear and Logistic Regression

<strong>Ordinary Least Squares (OLS)</strong> regression finds the hyperplane (coefficients) that minimizes mean squared error between predicted and observed values. The R² score measures the proportion of variance explained (0 = no explanatory power; 1 = perfect fit).

```python
from sklearn.linear_model import LinearRegression

ols = LinearRegression()
ols.fit(X_train, y_train)
print("R²:", ols.score(X_train, y_train))
```

A very high R² on training data (e.g., 0.80) may indicate overfitting. The cross-validated score is more informative.

<strong>Ridge regression</strong> adds an L2 regularization penalty that shrinks coefficient magnitudes, reducing overfitting:

\[ J(\theta) = \text{MSE}(\theta) + \alpha \sum_{j=1}^{n} \theta_j^2 \]

<strong>Lasso regression</strong> uses an L1 penalty that forces some coefficients to exactly zero, performing automatic feature selection.

<strong>Logistic regression</strong> predicts binary outcomes. Instead of a continuous prediction, it models the log-odds of the positive class as a linear function of the features. The output is a probability between 0 and 1:

\[ P(y = 1) = \frac{1}{1 + e^{-(\beta_0 + \beta_1 x_1 + \cdots + \beta_n x_n)}} \]

### Tree-Based Methods

<strong>Decision trees</strong> learn a hierarchy of binary splits on feature values that partition the data into increasingly homogeneous groups. At each node, the algorithm selects the feature and threshold that best separates the classes.

Decision trees are prone to <strong>overfitting</strong> — a deep tree can perfectly classify training data by memorizing it. Pruning (limiting tree depth) mitigates this.

<strong>Random forests</strong> aggregate many decision trees trained on bootstrapped subsamples of the data and random subsets of features. The predictions are averaged (regression) or voted (classification). The ensemble is much more stable and accurate than any individual tree.

<strong>Gradient Boosted Machines (GBMs)</strong> (XGBoost, LightGBM) train trees sequentially, each one correcting the errors of the previous. GBMs often achieve the best performance among non-neural methods on structured data.

### Model Evaluation Metrics

For regression: <strong>MSE</strong> (mean squared error), <strong>RMSE</strong> (root MSE), <strong>R²</strong>.

For classification:
- <strong>Accuracy:</strong> fraction correctly classified (misleading when classes are imbalanced)
- <strong>Precision:</strong> of predicted positives, how many are truly positive
- <strong>Recall (sensitivity):</strong> of true positives, how many were correctly predicted
- <strong>F1 score:</strong> harmonic mean of precision and recall
- <strong>Confusion matrix:</strong> full breakdown of true positives, false positives, true negatives, false negatives

The <strong>ROC curve</strong> plots true positive rate vs. false positive rate as the classification threshold varies; the <strong>AUC</strong> (area under the curve) summarizes this as a single number (1 = perfect; 0.5 = random).

---

## Module 10: Neural Networks and Deep Learning

### From Perceptrons to Deep Networks

The history of neural networks begins with the <strong>perceptron</strong> (Rosenblatt 1957), a single artificial neuron that takes a weighted sum of its inputs, applies a step function, and outputs a binary prediction. The perceptron is the simplest model in the connectionist paradigm and provides the conceptual foundation for more complex architectures.

A <strong>multilayer perceptron (MLP)</strong> stacks multiple layers of neurons:
1. <strong>Input layer:</strong> raw feature values enter here; each unit represents one feature
2. <strong>Hidden layers:</strong> intermediate representations; each unit takes a weighted sum of the previous layer's activations and applies an activation function
3. <strong>Output layer:</strong> final prediction; for classification, typically uses softmax to produce a probability distribution over classes

The <strong>activation function</strong> introduces non-linearity, allowing the network to learn complex decision boundaries. Common choices:
- <strong>ReLU (Rectified Linear Unit):</strong> max(0, *x*). Simple, fast, avoids vanishing gradient. Standard for hidden layers.
- <strong>Sigmoid:</strong> squashes output to (0, 1). Used in binary output layers.
- <strong>Softmax:</strong> normalizes outputs to sum to 1. Used in multi-class output layers.

### Training Neural Networks

Training adjusts the network's *weights* to minimize a <strong>loss function</strong> that measures prediction error:
- <strong>Mean squared error</strong> for regression
- <strong>Cross-entropy loss</strong> for classification

<strong>Forward propagation:</strong> an input passes through the network layer by layer, producing a prediction.

<strong>Backpropagation:</strong> the error signal flows backward through the network, computing the gradient of the loss with respect to each weight using the chain rule.

<strong>Gradient descent</strong> updates weights in the direction that reduces loss:

\[ w \leftarrow w - \eta \frac{\partial L}{\partial w} \]

where *η* is the <strong>learning rate</strong>. Too large: training is unstable. Too small: training is slow.

<strong>Stochastic gradient descent (SGD)</strong> computes gradients on small random <strong>batches</strong> of training data, making each update noisier but faster.

### Overfitting and Regularization

Neural networks with many parameters easily overfit: they memorize training data rather than learning generalizable patterns. The signature of overfitting is that training loss decreases while validation loss increases (or stagnates).

Strategies to combat overfitting:
- <strong>Reduce model size:</strong> fewer layers or neurons
- <strong>Dropout:</strong> randomly zero out a fraction of activations during training, forcing the network to learn redundant representations
- <strong>Early stopping:</strong> stop training when validation loss stops improving
- <strong>Weight decay (L2 regularization):</strong> penalize large weights

### Building Neural Networks with Keras and TensorFlow

<strong>TensorFlow</strong> is Google's tensor-processing library; <strong>Keras</strong> is its high-level Python API. The typical workflow:

```python
import tensorflow as tf
from tensorflow import keras

# 1. Define model architecture
model = keras.models.Sequential()
model.add(keras.layers.InputLayer(words))       # input dimension
model.add(keras.layers.Dense(400, activation="relu"))
model.add(keras.layers.Dense(400, activation="relu"))
model.add(keras.layers.Dense(400, activation="relu"))
model.add(keras.layers.Dropout(0.3))
model.add(keras.layers.Dense(5, activation="softmax"))  # 5 classes

# 2. Compile (select loss, optimizer, metrics)
model.compile(
    loss="categorical_crossentropy",
    optimizer="adam",
    metrics=["accuracy"]
)
model.summary()

# 3. Train
history = model.fit(
    X_train, y_train,
    epochs=50,
    batch_size=32,
    validation_data=(X_valid, y_valid)
)

# 4. Evaluate
model.evaluate(X_test, y_test)
```

<strong>Learning curves</strong> (plotting training and validation loss over epochs) are the primary diagnostic tool. A <strong>confusion matrix</strong> shows per-class performance.

### Advanced Architectures (Overview)

<strong>Convolutional Neural Networks (CNNs)</strong> apply learned filters across spatial or sequential data (images, audio). They dramatically reduce parameter count compared to fully-connected networks by sharing filter weights across positions.

<strong>Recurrent Neural Networks (RNNs)</strong> and <strong>LSTMs</strong> process sequences by maintaining hidden state that carries information from earlier timesteps. Largely superseded by Transformers for NLP tasks.

<strong>Transformer models</strong> (BERT, GPT, etc.) use attention mechanisms to relate every position in a sequence to every other, enabling long-range dependency modeling. They are the foundation of modern NLP.

Ethical concerns for deep learning include encoded biases, lack of interpretability, amplification of surveillance capabilities, and the concentration of resources required for training large models.

---

## Module 11: Generative Modelling and Probabilistic Programming

### Statistics vs. Machine Learning

Statistical models and machine learning models are different tools for different goals:

- <strong>Inference</strong> (statistics): understand the relationship between variables; estimate parameters with uncertainty; test hypotheses. Prioritizes interpretability and calibrated uncertainty.
- <strong>Prediction</strong> (machine learning): accurately predict outcomes for new observations. Prioritizes predictive accuracy, sometimes at the cost of interpretability.

These goals are not mutually exclusive — the best work in computational social science often uses both. A good pipeline might use unsupervised ML for exploration, followed by a statistical model for inference.

### Frequentist vs. Bayesian Interpretations of Probability

<strong>Frequentist statistics</strong> interprets probability as the long-run frequency of an event across many repetitions of an experiment. Parameters are fixed (not random); data is random. Uncertainty is expressed through confidence intervals and p-values.

<strong>Bayesian statistics</strong> treats probability as a degree of belief, updated in light of evidence. *Parameters* are random variables with probability distributions; data is fixed. This is formalized in <strong>Bayes' theorem</strong>:

\[ P(\theta \mid D) = \frac{P(D \mid \theta) \cdot P(\theta)}{P(D)} \]

- \(P(\theta)\) — <strong>prior:</strong> belief about parameters *before* seeing data
- \(P(D \mid \theta)\) — <strong>likelihood:</strong> probability of data given parameters
- \(P(\theta \mid D)\) — <strong>posterior:</strong> updated belief about parameters *after* seeing data
- \(P(D)\) — <strong>evidence (marginal likelihood):</strong> normalizing constant

Bayesian inference replaces point estimates with full <strong>posterior distributions</strong>, which naturally express uncertainty.

### Discriminative vs. Generative Models

<strong>Discriminative models</strong> learn the boundary between classes: they model P(y | x), the conditional probability of the output given the input. Logistic regression and neural classifiers are discriminative.

<strong>Generative models</strong> learn the joint distribution P(x, y) — how the data was generated. They can generate new synthetic data. Bayesian hierarchical models and latent Dirichlet allocation (LDA) are generative.

### Probability Theory Primer

<strong>Random variables</strong> represent quantities that can take different values according to a probability distribution.

<strong>Discrete distributions</strong> assign probability to countable outcomes:
- <strong>Bernoulli(p):</strong> a single trial with probability *p* of success
- <strong>Binomial(n, p):</strong> number of successes in *n* independent Bernoulli trials
- <strong>Poisson(λ):</strong> number of events in a fixed interval when events occur at rate λ

<strong>Continuous distributions</strong> assign probability density:
- <strong>Normal(μ, σ):</strong> the bell curve; arises from the Central Limit Theorem
- <strong>Exponential(λ):</strong> time until first event in a Poisson process; always positive
- <strong>Beta(α, β):</strong> constrained to (0, 1); useful for probabilities and proportions

<strong>Marginal probability</strong> P(A): probability of A, ignoring everything else.
<strong>Joint probability</strong> P(A, B): probability of both A and B occurring.
<strong>Conditional probability</strong> P(A | B): probability of A, given that B has occurred.

\[ P(A \mid B) = \frac{P(A, B)}{P(B)} \]

### Approximate Posterior Inference: MCMC

Computing the posterior analytically is usually impossible for complex models. <strong>Markov Chain Monte Carlo (MCMC)</strong> methods approximate the posterior by sampling from it.

A <strong>Markov Chain</strong> is a sequence of states where transitions depend only on the current state ("memoryless"). Markov chains converge to a stationary distribution — which we set to be our target posterior.

The <strong>Metropolis-Hastings algorithm</strong> proposes a candidate parameter value, then accepts or rejects it based on the ratio of the posterior probabilities at the candidate and current positions. This biased random walk eventually visits regions of parameter space proportional to their posterior probability.

<strong>Hamiltonian Monte Carlo (HMC)</strong> is more efficient: it uses gradient information (from backpropagation through the model) to guide proposals using physics-inspired momentum. The No-U-Turn Sampler (NUTS) is an adaptive variant of HMC that avoids wasted computation from U-turns. PyMC3 uses NUTS by default.

<strong>Variational inference</strong> is an alternative to MCMC: it approximates the posterior with a simpler, analytically tractable distribution by minimizing the KL divergence between them. Faster than MCMC but less accurate.

<strong>Diagnosing MCMC:</strong> The <strong>trace plot</strong> shows sampled parameter values over iterations. Healthy chains look like "fuzzy caterpillars" — mixing well across parameter space with no trends. A chain that drifts or gets "stuck" indicates a problem. Run multiple chains from different starting points and check that they converge to the same distribution.

---

## Module 12: Bayesian Regression Models

### Specifying a Bayesian Linear Regression

Bayesian regression embeds a familiar linear model inside a probabilistic framework, replacing point estimates with full posterior distributions over all parameters. The model is specified layer by layer using the "What's that?" game:

\[
\text{Wealth}_i \sim \text{Normal}(\mu_i, \sigma)
\]
\[
\mu_i = \alpha + \beta \cdot \text{Latitude}_i
\]
\[
\alpha \sim \text{Normal}(0, 10)
\]
\[
\beta \sim \text{Normal}(0, 10)
\]
\[
\sigma \sim \text{Exponential}(1)
\]

Every unobserved quantity (α, β, σ) requires a <strong>prior distribution</strong>. Choose priors that are:
- Consistent with the domain (σ must be positive → Exponential or HalfNormal)
- Not unnecessarily restrictive (don't assign zero probability to plausible values)

<strong>Prior predictive checks</strong> simulate outcomes from the prior before seeing data, allowing you to assess whether your priors produce plausible values. If your priors imply that negative wealth is possible for equatorial countries, revise them.

### Implementing Bayesian Regression with PyMC3

<strong>PyMC3</strong> uses Python's context manager (`with`) to define a probabilistic model:

```python
import pymc3 as pm
import arviz as az

with pm.Model() as linear_model:
    # Priors
    alpha = pm.Normal("alpha", mu=0, sigma=10)
    beta = pm.Normal("beta", mu=0, sigma=10)
    sigma = pm.Exponential("sigma", lam=1)

    # Linear model
    mu = alpha + beta * latitude

    # Likelihood
    wealth = pm.Normal("wealth", mu=mu, sigma=sigma, observed=wealth_obs)

    # Sample from posterior
    trace = pm.sample(2000, tune=1000, target_accept=0.9, return_inferencedata=True)
```

### Interpreting the Posterior

The posterior gives a <strong>distribution</strong> over plausible parameter values, not a single number. Key summaries:

- <strong>HDI (Highest Density Interval):</strong> the narrowest interval containing X% of posterior probability. More interpretable than frequentist confidence intervals because it directly expresses probability about parameters.
- <strong>Posterior predictive check:</strong> simulate new data from the posterior and compare to observed data. Does the model produce data that looks like reality?

```python
with linear_model:
    ppc = pm.sample_posterior_predictive(trace)

az.plot_ppc(az.from_pymc3(trace, posterior_predictive=ppc))
```

### Hierarchical (Multilevel) Regression Models

Standard linear regression assumes all observations come from the same underlying process with the same coefficients. This is often unrealistic for social science data: voters in different states may respond differently to the same predictor; students in different schools may have different baselines.

<strong>Hierarchical models</strong> allow parameters to vary across groups, constrained by a shared hyperprior. This is a form of <strong>partial pooling</strong> — a middle ground between:

- <strong>Complete pooling:</strong> one model for everyone, ignores group differences
- <strong>No pooling:</strong> separate models for each group, ignores information from other groups
- <strong>Partial pooling:</strong> group-level estimates informed by the overall distribution

\[
\text{VotingRate}_{i,s} \sim \text{Normal}(\mu_{i,s}, \sigma)
\]
\[
\mu_{i,s} = \alpha_s + \beta \cdot \text{Spending}_{i,s}
\]
\[
\alpha_s \sim \text{Normal}(\bar{\alpha}, \tau_\alpha)
\]
\[
\bar{\alpha} \sim \text{Normal}(0, 10), \quad \tau_\alpha \sim \text{Exponential}(1)
\]

Each state gets its own intercept α_s, but these intercepts are drawn from a shared Normal distribution with estimated mean and standard deviation. The model simultaneously estimates the group-level variation and the within-group effects.

Hierarchical models are, McLevey argues, a more natural and appropriate default for social science data than standard linear regression — because virtually all social science data has nested structure (students in classrooms, employees in firms, citizens in countries). The apparent complexity of hierarchical models reflects the genuine complexity of the social world, not an unnecessary complication.

```python
with pm.Model() as hierarchical_model:
    # Hyperpriors
    alpha_bar = pm.Normal("alpha_bar", mu=0, sigma=10)
    tau_alpha = pm.Exponential("tau_alpha", lam=1)

    # Group-level intercepts (non-centered parameterization)
    alpha_offset = pm.Normal("alpha_offset", mu=0, sigma=1,
                              shape=n_states)
    alpha = pm.Deterministic("alpha", alpha_bar + tau_alpha * alpha_offset)

    # Shared slope
    beta = pm.Normal("beta", mu=0, sigma=1)
    sigma = pm.Exponential("sigma", lam=1)

    # Linear model and likelihood
    mu = alpha[state_idx] + beta * spending
    y = pm.Normal("y", mu=mu, sigma=sigma, observed=voting_rate)

    trace = pm.sample(2000, tune=1000, target_accept=0.95)
```

<strong>Non-centered parameterization</strong> (as above) separates the group-level offset from the hyperparameters, which often improves MCMC mixing in hierarchical models.

The posterior trace plot for a hierarchical model shows one chain per parameter. Healthy traces mix well and are stationary. The <strong>forest plot</strong> from ArviZ compares posterior estimates across groups, giving an immediate visual summary of group-level heterogeneity.

---

## Key Concepts Summary

| Concept | Module | Definition |
|---------|--------|------------|
| Computational Social Science | 1 | Application of computational methods to social science questions |
| Virtual environment | 1 | Isolated Python installation with specific package versions |
| List comprehension | 2 | Compact Python syntax for constructing lists |
| REST API | 3 | Web interface for programmatic data collection |
| Web scraping | 3 | Extracting data from HTML source code |
| Pandas DataFrame | 4 | Two-dimensional labeled data structure |
| Record linkage | 4 | Connecting records from different datasets |
| Latent variable | 5 | Unobservable theoretical construct measured via indicators |
| PCA | 5 | Data-driven dimensionality reduction via orthogonal projections |
| Bag of words | 6 | Vector representation of text as word counts |
| TF-IDF | 6 | Word weighting that emphasizes informative, document-specific terms |
| Walk / path | 7 | Sequence of nodes and edges in a network (path: no node repeats) |
| Betweenness centrality | 7 | Fraction of shortest paths through a node |
| Simple contagion | 8 | Spread requiring only one contact (infection, information) |
| Complex contagion | 8 | Spread requiring multiple independent exposures (behavior, belief) |
| Supervised learning | 9 | ML with labeled training data |
| Cross-validation | 9 | Repeated train-validation splits to estimate generalization |
| Regularization | 9–10 | Penalty on model complexity to reduce overfitting |
| Backpropagation | 10 | Algorithm for computing gradients in neural networks |
| Dropout | 10 | Randomly deactivating neurons during training to prevent overfitting |
| Posterior distribution | 11 | Updated probability distribution over parameters after seeing data |
| MCMC | 11 | Markov Chain Monte Carlo: sampling-based posterior approximation |
| Hierarchical model | 12 | Multilevel model with group-specific parameters drawn from shared prior |
| Partial pooling | 12 | Borrowing strength across groups in a hierarchical model |
