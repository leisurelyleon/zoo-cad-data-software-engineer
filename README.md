# Zoo — Software Engineer, CAD Data (Demo Project)
 
Welcome to the `zoo-cad-data-software-engineer` repository. This project serves as a **comprehensive demonstration portfolio** to simulate the technical responsibilities and skills required for a **Software Engineer, CAD Data** role at Zoo Design Studio.

It is structured around a mock job description and showcases a curated selection of coding samples, configuration files, shell scripts, and architectural documentation that align with the expectations of enterprise-grade data engineering work.

> 📍 **Note:** This project is not affiliated with or endorsed by Zoo Design Studio. All files and examples are hypothetical and solely for educational purposes.

---

## 📂 Directory Structure

Each folder corresponds to a critical area of expertise listed in the job role:

```
zoo-cad-data-software-engineer/
├─ src/
│ └─ normalize_cad.py # Core CAD metadata normalization logic
├─ data/
│ ├─ raw/ # Input JSON/CSV metadata samples
│ └─ processed/ # Output normalized results
├─ sql/
│ ├─ schema.sql # Warehouse table structure
│ └─ queries.sql # Sample analytical queries
├─ tests/
│ └─ test_normalizer.py # Unit tests for normalization
└─ README.md
```

---

## Core Skills Demonstrated

| Area | Technologies / Practices |
|------|---------------------------|
| **Languages** | Python, C++, Rust, SQL |
| **Data Engineering** | ETL, schema enforcement, warehouse integration |
| **CAD Systems** | Metadata normalization, geometry validation |
| **Version Control** | Git, GitHub workflow, tagging & branching |
| **Dev Practices** | Logging, reproducibility, testing, CI-ready code |

---

## 🔧 Technologies Covered

- CAD metadata with Python  
- Build schema-driven ETL pipelines  
- Geometry computations and data conversions  
- Apply Git, SQL, and warehouse best practices  
- Integrated CAD and analytical systems

---

## Example Implementation

```python
from dataclasses import dataclass, asdict
import hashlib, json, csv, os

@dataclass
class PartRecord:
    part_id: str
    assembly: str
    material: str
    mass_kg: float
    bbox_x: float
    bbox_y: float
    bbox_z: float
    checksum: str

def sha256(path):
    h = hashlib.sha256()
    with open(path, "rb") as f:
        for chunk in iter(lambda: f.read(8192), b""):
            h.update(chunk)
    return h.hexdigest()
```

This script standardizes mass and geometry units, validates required fields, generates checksums, and writes normalized data for ingestion into a warehouse.

---

## SQL Schema Example

```sql
CREATE TABLE cad_parts (
  part_id TEXT NOT NULL,
  assembly TEXT NOT NULL,
  material TEXT,
  mass_kg DOUBLE PRECISION CHECK (mass_kg >= 0),
  bbox_x DOUBLE PRECISION,
  bbox_y DOUBLE PRECISION,
  bbox_z DOUBLE PRECISION,
  checksum CHAR(64) UNIQUE,
  updated_at TIMESTAMPTZ DEFAULT now()
);
```

---

## 📘 Getting Started

To explore the code:

1. Clone this repository:
   ```bash
   git clone https://github.com/leisurelyleon/zoo-cad-data-software-engineer.git
   cd zoo-cad-data-software-engineer
   
2. Open it in Visual Studio Code or your preferred IDE.

3. Browse each folder independently — each has self-contained examples with inline comments or README.md files when needed.

## 🚨 Disclaimer
This repository is intended **strictly for educational and demonstration purposes only.**

No proprietary code, tooling, or architecture from Zoo Design Studio or any affiliated organization is used or reproduced here.

All configurations, scripts, schemas, and designs are **fictional and simplified** placeholders.

This repo was created to demonstrate relevant technical skills and organizational competency for potential future job roles.

⚠️ **Do not interpret any files in this repository as being sourced from Zoo Design Studio or used in production environments.**

## 🏁 License
This repository is licensed under the MIT License. See the LICENSE file for details.
