# arXiv Research Agent

## Project Overview
The **arXiv Research Agent** is designed to enable users to search and query arXiv papers using AI. The focus is on providing accurate and user-friendly access to recent AI papers, leveraging hybrid search techniques and Retrieval-Augmented Generation (RAG) for answering questions.

### Core Features
- **Ingestion**: Fetch papers via the arXiv API, download PDFs, and extract text.
- **Processing**: Chunk text and generate embeddings for efficient search.
- **Storage**: Store metadata in PostgreSQL and embeddings in Chroma (a local vector database).
- **Search & RAG**: Perform hybrid retrieval (keyword + semantic) and generate answers using the Ollama model.
- **User Interface**: Provide an intuitive interface for querying, built with Gradio or Streamlit.

---

## Setup Instructions

### Prerequisites
Ensure the following are installed on your system:
- **Docker** and **Docker Compose**
- **Python 3.9+**
- **Git**

### Installation Steps

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/niravShenoy/arxiv-research-agent.git
   cd arxiv-research-agent
   ```

2. **Set Up Docker Services**:
   - Start the required services using Docker Compose:
     ```bash
     docker compose up -d
     ```
   - This will start the following services:
     - `postgres`: PostgreSQL database for metadata storage.
     - `ollama`: Ollama model server for generating answers.
     - `app`: The main Python application.

3. **Install Python Dependencies**:
   - Create a virtual environment and install dependencies:
     ```bash
     uv venv --python=python3.10
     source venv/bin/activate  # On Windows: .venv\Scripts\activate
     uv pip install -r requirements.txt
     ```

4. **Run the Application**:
   - Start the Python application:
     ```bash
     python main.py
     ```

5. **Access the User Interface**:
   - Open your browser and navigate to:
     ```
     http://localhost:8000
     ```

---

## Architecture

### Basic Workflow
1. **Ingestion**:
   - Fetches recent AI papers from arXiv using the arXiv API.
   - Downloads PDFs and extracts text for processing.

2. **Processing**:
   - Splits the extracted text into chunks.
   - Generates embeddings for semantic search.

3. **Storage**:
   - Metadata is stored in PostgreSQL.
   - Embeddings are stored in Chroma, a lightweight vector database.

4. **Search & RAG**:
   - Combines keyword-based and semantic search for hybrid retrieval.
   - Uses the Ollama model to generate answers based on retrieved documents.

5. **User Interface**:
   - Provides a simple and intuitive interface for querying and exploring results.

---

## Docker Compose Services

### `postgres`
- **Image**: `postgres:16`
- **Purpose**: Stores metadata about arXiv papers.
- **Ports**: `5432:5432`
- **Volume**: `postgres_data` for persistent storage.

### `ollama`
- **Image**: `ollama/ollama:latest`
- **Purpose**: Hosts the Ollama model for generating answers.
- **Ports**: `11434:11434`
- **Volume**: `ollama_data` for persistent storage.

### `app`
- **Build Context**: Current directory (`.`).
- **Purpose**: Runs the main Python application.
- **Ports**: `8000:8000`
- **Dependencies**: Waits for `postgres` and `ollama` to be healthy before starting.

---

## Contributing

1. Fork the repository and create a new branch for your feature or bug fix.
2. Commit your changes and submit a pull request.
3. Ensure all tests pass before submitting.

---

## License
This project is licensed under the MIT License. See the `LICENSE` file for details.
