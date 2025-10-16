CREATE TABLE cad_files (
  file_id        BIGSERIAL PRIMARY KEY,
  source_path    TEXT NOT NULL,
  sha256         CHAR(64) NOT NULL UNIQUE,
  bytes          BIGINT NOT NULL CHECK (bytes > 0),
  ingested_at    TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE cad_parts (
  part_id        TEXT NOT NULL,
  assembly       TEXT NOT NULL,
  version        TEXT NOT NULL,
  updated_at     TIMESTAMPTZ NOT NULL,
  material       TEXT NOT NULL,
  mass_kg        DOUBLE PRECISION NOT NULL CHECK (mass_kg >= 0),
  bbox_x         DOUBLE PRECISION NOT NULL,
  bbox_y         DOUBLE PRECISION NOT NULL,
  bbox_z         BIGINT NOT NULL REFERENCES cad_files(file_id),
  PRIMARY KEY (part_id, version)
);

-- Helpful indexes
CREATE INDEX cad_parts_aassembly_idx ON cad_parts (assembly);
CREATE INDEX cad_parts_updated_idx ON cad_parts (updated_at);
